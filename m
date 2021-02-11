Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398B31882A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:32:38 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9H3-00051L-4m
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA9AZ-0006ER-90
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:25:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA9AT-0002ag-Gw
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:25:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id w4so5038030wmi.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r+Hrafcp0B6+5y6dX8kQBJ5Fbyos41QAh3FX6bLS6rc=;
 b=XcX4dwe7Z4CjvbS/VeQ0u8LzuvM8TywgW7g7MxX02277ex6MJUXdAzTYSfCgvPUlhQ
 Df3N2+5IGZY99gMYgh/GGiRxQ5D/ShKyClBw4sWL7JYjObHcDmz7d2D+opD+OvDSdH92
 Ph/JhjL6EbffWregwwxukzllrc7eF1NV7GTjC3bEaaeQpGvg/tTX3+aLy2sNN93XPSyF
 AwDgzhzd4JgGmf+nohPvJRmzRwMn2fz4RftmHfUUquCXtTZAgHdP8r42YWZ99YsebMg/
 BZgB2MQZlePJQENjAPxTBTFtYxy5qPuVBUwNV0CUenBKzvwj+jD+sp8Yf4HM3RfS5LmM
 JgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r+Hrafcp0B6+5y6dX8kQBJ5Fbyos41QAh3FX6bLS6rc=;
 b=VQRIT4NtU7OVHgHnZ+POUedTCLsKjLByKgunFdxZwqkiEELiiG9HhKP+eB8F/ntBff
 0l0hJFgT22PgSzrhqVH6Gl8D6emMGL+5eFJIaG0GJqkfTRlcE3LAktSe1HRoNQjhmP0v
 qCiKD5acDuKNEBs/TMytwAExUA0OEm4oHi7Q/11B6NRZofTVaXvebLVq3FOAs2qWh7O4
 C/wmD0G2EYHE5gjFms8z326jBKNWC6+Oer3GuAKBd7+VZ+2CFpXfwgxJYzDr3hQd7XhA
 HTPo7ADsf39YxbnFQQ6hHveEnRS0mt3UMFhwbbDshwpf2EbjtR7zLS0T8hAR1fMyU1mc
 I9Rw==
X-Gm-Message-State: AOAM5339Rm/+eKhrxx4LjykvgcpM51+e/+ygTQaldcfLgWPg1UFJhpb5
 4PlEExFqfmr6B25/wESAM+A417iYFAdrNwfu
X-Google-Smtp-Source: ABdhPJypOdWDQvKQagOsb+PhTSQUiN9H181jQCvUvqIHnUA7rUYQymVoJ4OINY/4L+GsY5tY0h1Bgw==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr4264041wmh.99.1613039147755;
 Thu, 11 Feb 2021 02:25:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f3sm10231418wme.26.2021.02.11.02.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 02:25:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 198791FF7E;
 Thu, 11 Feb 2021 10:25:46 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-11-alex.bennee@linaro.org>
 <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 10/21] exec: Move TranslationBlock typedef to
 qemu/typedefs.h
Date: Thu, 11 Feb 2021 10:24:19 +0000
In-reply-to: <975bb94d-390a-c8d8-8880-313184664e3f@amsat.org>
Message-ID: <87zh0aucie.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, Michael Walle <michael@walle.cc>,
 cota@braap.org, kuhn.chenqun@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 2/10/21 11:10 PM, Alex Benn=C3=A9e wrote:
>> From: Richard Henderson <richard.henderson@linaro.org>
>>=20
>> This also means we don't need an extra declaration of
>> the structure in hw/core/cpu.h.
>>=20
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>
>
> I'd say this one matters ^,
>
>> Message-Id: <20210209182749.31323-2-alex.bennee@linaro.org>
>
> but this one less.

My general approach to Message-Id's is to keep the one from where I
snarfed the patch and the last Message-Id from whichever iteration of
posting it's had. IOW the second one will be replaced by whatever the ID
is of the parent post here.

>
>> ---
>>  include/exec/tb-context.h     | 1 -
>>  include/hw/core/cpu.h         | 4 +---
>>  include/hw/core/tcg-cpu-ops.h | 3 +--
>>  include/qemu/typedefs.h       | 1 +
>>  target/arm/internals.h        | 3 +--
>>  target/cris/translate.c       | 2 +-
>>  target/lm32/translate.c       | 2 +-
>>  target/moxie/translate.c      | 2 +-
>>  target/unicore32/translate.c  | 2 +-
>>  9 files changed, 8 insertions(+), 12 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--=20
Alex Benn=C3=A9e

