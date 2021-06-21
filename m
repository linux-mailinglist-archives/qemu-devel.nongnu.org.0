Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C83AF4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:15:53 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOSe-0004LY-LL
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvORd-0003Vh-Ij
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:14:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvORb-0005nm-RT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:14:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h11so3233067wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ACAOQsTJy/WZV+9Rcsqjp1YMXqiXhSeDg+ZxCwMPOm8=;
 b=ApkxVGA93XdhABivgh8FTJ++0iFhf3k6V3LADySbmYMW4sXvxTth9qMe8kGv4xqBrw
 hcfK8H9QW9KeuU8kihAB2/mopZlheGa26zmLxnTX+uDixN2yenjuqpj45VmB90ShsLmu
 peYEzdNfL5K/dFebtpolP85FG8WluOdZMNVD+VDi1kx+EaB9S9bBUQKbtETHxyZH0P4y
 pByOQOBRFW4emnGs7lPe5i4RCaIqjmdc28EQuYOLCoFrwOaejPCc4/daBQ7Vdhe+FahJ
 d93EcfK9eiF55BlpmIJLmRLybazRE0KMPNZK76T7R5a74+sQcE3JLODTQGFDrDXo71cm
 L/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ACAOQsTJy/WZV+9Rcsqjp1YMXqiXhSeDg+ZxCwMPOm8=;
 b=XmeVmav4ZwZeUbuiMPnROG+u1hpGkfH8QnnpAQGEm01sxmHeje8KisBgwdQrFJruiJ
 ri8l7yKPQFbqzMVokqYeKpw26snKUm99LhSxHio29Uy4qhOEoKiSCBP27r28jbCfBGn2
 nVJ8UaATv0g6R1ov+/V8ZTbrP2EON0YXxqknzFk7EbZbkVG/uub/niuCvt+NbStRJPfY
 fALdAMn9SCl+dDKVU3zGEKU+Z6keo0dsu6xlHEAZQfGihLY+i3ZzoyxPv3pB1EtxhLfZ
 EWYEQPz59ltOwO090dw3M0ywhQ5CMdrOsdehdG4EF10jJDWBrpqbVQxfZ8/VAXM0hC6H
 1a+Q==
X-Gm-Message-State: AOAM5304DZJfcqjHkWUu6Y59cCX4Lg044fHiGTbWyEMr57UoWxEg4Gek
 ciy17HemW/a/5+eH0ioCOHc=
X-Google-Smtp-Source: ABdhPJzoIHZH4G+CW75q4niCTt3AvxG00cL5IBMktrPE0frE9n9n8r4dpZPeRWu1H+jTsoC1yBYQkw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr6131700wrp.366.1624299286103; 
 Mon, 21 Jun 2021 11:14:46 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f12sm22243236wru.81.2021.06.21.11.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:14:45 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] configs: rename default-configs to configs and
 reorganise
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, thuth@redhat.com,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d588c37-0cd1-4a23-b7cb-8b7afd603696@amsat.org>
Date: Mon, 21 Jun 2021 20:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 5:21 PM, Alex Bennée wrote:
> In preparation for offering variation to our build configurations lets
> move everything and rename it to default. Common included base configs
> are also renamed.
> 
> During the cleanup the stale usb.mak and pci.mak references were
> removed from MAINTAINERS.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure                                     |  6 ++---

 ---
>  meson.build                                   |  4 ++--
>  MAINTAINERS                                   | 22 +++++++++----------
>  tests/Makefile.include                        |  2 +-
>  103 files changed, 28 insertions(+), 30 deletions(-)

> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -36,7 +36,7 @@ export SRC_PATH
>  
>  # Get the list of all supported sysemu targets
>  SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
> -   $(wildcard $(SRC_PATH)/default-configs/*-softmmu.mak)))
> +   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))

This one seems to have bitrotten.

