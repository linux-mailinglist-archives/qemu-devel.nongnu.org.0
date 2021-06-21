Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50ED3AF542
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:41:53 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOro-0007F2-To
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvOpW-0006LG-MH
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:39:31 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvOpQ-0004iK-JF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:39:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j21-20020a05600c1c15b02901dde2accccbso648384wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S+WBbz66V/eLgmYvRXEUyUIsztzJvfswNCsSC2LooIg=;
 b=tFuINHAkIJ9CnCU8TwYIwVTvLPL9tWQZy2/zyxT4qIromZdGjV7LUBLVne/bO0ytBr
 ubGU6CsaTHyFL0YJSDOcEq7+8hA6hiRn7tR429ulZ2iiflk/7u7V4bFN8PbeKkUF2ERD
 xPEQ3aoS4fP+ymF1mXj45HghCOTUcb1Y7xabp3QF5l963HYmafrxUhNxenuKfM06syyn
 V0wAYvT3emuB18c+N2u1A2AoHQNAWZBMuDJQkMIwn+JAX2epEiOGjU1DM3VRUPehq2hA
 +ftWzMGjgZO2of+9MHlSIiWUfnAqcwutt5aBVkM8LNYsVdH95Yzuh3NFKg9IlOPec0jw
 C/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S+WBbz66V/eLgmYvRXEUyUIsztzJvfswNCsSC2LooIg=;
 b=LhRKHxC1UcS0jmdKfdF2J4DYv1sZcupYC/BLyALDLNmeQZC8b9FGKN6rTKRaV6+xHq
 t0PtgRoeISKEFUT/575jq/FXgNYhIusU534fx9GFio8ZJxsfyiYZliKCwXlu/oZA9x7i
 /nXRNElWu1WNa1s9GnKedNoxcm69pBGl13zIMnInVC4TF4Y+8doMnkbgZ99BZmWlXuAY
 pGrJpC1HeD6zqj4tbA/Spv9hJe3CMAxMuykNQrITqDduzafcQY5Aa5bolyNZKq3/x82y
 s5T6ajTGY+luJeXre6J/mwNmCMzfG+6x4460RHTO+fgYSSdczfgjZr0H791/dk2YbQLN
 exIg==
X-Gm-Message-State: AOAM5324RLlYlnRtTj5iNSqxlQ1/gjXesN3mAYO/0xv3dapdN/ZB8H3y
 h1uPf0QHwcrpfeyLKL/gWm20ww==
X-Google-Smtp-Source: ABdhPJxudXVSsQ+M4TYgabtPsXMiM5+VqUSiRU8ARitKpgl602Gh+a3E78I2i5nBKT2ZHoIvwJ8BVQ==
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr27828618wmo.32.1624300762474; 
 Mon, 21 Jun 2021 11:39:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v8sm19675407wrc.29.2021.06.21.11.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 11:39:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7D861FF7E;
 Mon, 21 Jun 2021 19:39:20 +0100 (BST)
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-5-alex.bennee@linaro.org>
 <8d588c37-0cd1-4a23-b7cb-8b7afd603696@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 4/5] configs: rename default-configs to configs and
 reorganise
Date: Mon, 21 Jun 2021 19:38:52 +0100
In-reply-to: <8d588c37-0cd1-4a23-b7cb-8b7afd603696@amsat.org>
Message-ID: <877dint63r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 6/21/21 5:21 PM, Alex Benn=C3=A9e wrote:
>> In preparation for offering variation to our build configurations lets
>> move everything and rename it to default. Common included base configs
>> are also renamed.
>>=20
>> During the cleanup the stale usb.mak and pci.mak references were
>> removed from MAINTAINERS.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  configure                                     |  6 ++---
>
>  ---
>>  meson.build                                   |  4 ++--
>>  MAINTAINERS                                   | 22 +++++++++----------
>>  tests/Makefile.include                        |  2 +-
>>  103 files changed, 28 insertions(+), 30 deletions(-)
>
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -36,7 +36,7 @@ export SRC_PATH
>>=20=20
>>  # Get the list of all supported sysemu targets
>>  SYSEMU_TARGET_LIST :=3D $(subst -softmmu.mak,,$(notdir \
>> -   $(wildcard $(SRC_PATH)/default-configs/*-softmmu.mak)))
>> +   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
>
> This one seems to have bitrotten.

Hmm it didn't break the build, looking at it I think this stanza needs
to be dropped anyway...

Will fix thanks.



--=20
Alex Benn=C3=A9e

