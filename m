Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9524CE47F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:20:30 +0100 (CET)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSSb-0004eN-76
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSRh-0003by-LU
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:19:33 -0500
Received: from [2607:f8b0:4864:20::102e] (port=53032
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSRg-00067a-5h
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:19:33 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v4so9385438pjh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lqNd5CNcA3qUERNmMqsb8azfytZ92ov5PK4sYcYWE1Q=;
 b=fEp5OfJ1WavBagTMdpugEe3o9zcA1aRS4xVJ9Gteo3Pbi5wjoc4RyfIvvBpg/n2f4G
 o8PWxBZMu0LGPyyCAaKjvdsbr5n2465EN5tS0tJizbgSRUaoxxbcfGgMsKlQLat8VG4q
 jUQ+1tVOZYcX59ZGB016iXaenJoizUt4Kn4iKq285PPimh4mPoN3fdD/S+GlmBBfErCg
 Ldmdia8x+YNJ1Iej2glq9s6MCkpmAzVhB/Bop0BuTqkW1Zx8pLk7flj4gN9q0JtiPSgs
 p0Z3J98JcDU7Q7WP7xcY9MYUkIyo3A/hnP3jpdMhWi/9Pr6LNYGwq5a/4bemeFJCnyF2
 CEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lqNd5CNcA3qUERNmMqsb8azfytZ92ov5PK4sYcYWE1Q=;
 b=b11d5v2Rv70dcVY9HsoSumZseUaAPnjZgFaG9C2c27hfVz4ZQaN2MTgVlIVILDnK0G
 foFq8AlWUqwZF4ubi97lmSLDBeZmF1bsk882Rm8JpzUT2E2t6rLu1HhGuHpEEXeY7Ubc
 gcBd7XtyI5Gt8UcIRGyw7h1s50uonEUW5hQOM3LaDg83qYuZL8pUDyeOp5vo/zsnuXsq
 sWf48TDVS/IS+YW6iqxxJLU+g31TiKxwxuyMGH+yoz/mUk8e99m5GV2H3J09T+KkIRlI
 H7lG4QA3W/y1vlQbmdOOIdaqBWU0RQY0ekTU3J2900PPLbBcB1AKy6kqfJoVNUmFXTOm
 vMig==
X-Gm-Message-State: AOAM5330hLG55QTotQA0mlszHHdMt700ZqQDftqSXovBScGOhC/A6vqd
 +sQB+fz0tb/5EJXY+4soPL0=
X-Google-Smtp-Source: ABdhPJyGV3VVHQFVBugm//JUCme0CPsZemDBx2mUPOE6ub3PtAJGTjdI4FUiELGqKZu1L8HAvKXxtQ==
X-Received: by 2002:a17:902:bf07:b0:14f:a3a7:97a0 with SMTP id
 bi7-20020a170902bf0700b0014fa3a797a0mr2904575plb.105.1646479170625; 
 Sat, 05 Mar 2022 03:19:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm9004663pfh.46.2022.03.05.03.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 03:19:30 -0800 (PST)
Message-ID: <f12f313e-db8e-2a33-93dc-d94295ad6c80@gmail.com>
Date: Sat, 5 Mar 2022 12:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] nsis installer: Fix mouse-over descriptions for
 emulators
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220305105743.2384766-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 11:57, Peter Maydell wrote:
> We use the nsis.py script to write out an installer script Section
> for each emulator executable, so the exact set of Sections depends on
> which executables were built.  However the part of qemu.nsi which
> specifies mouse-over descriptions for each Section still has a
> hard-coded and very outdated list (with just i386 and alpha).  This
> causes two problems.  Firstly, if you build the installer for a
> configuration where you didn't build the i386 binaries you get
> warnings like this:
>    warning 6000: unknown variable/constant "{Section_i386}" detected, ignoring (macro:_==:1)
>    warning 6000: unknown variable/constant "{Section_i386w}" detected, ignoring (macro:_==:1)
> (this happens in our gitlab CI jobs, for instance).
> Secondly, most of the emulators in the generated installer don't have
> any mouseover text.
> 
> Make nsis.py generate a second output file which has the necessary
> MUI_DESCRIPTION_TEXT lines for each Section it creates, so we can
> include that at the right point in qemu.nsi to set the mouse-over
> text.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I opted to put the logic into the Python script, which I think
> many QEMU contributors understand, rather than investigating
> whether NSIS installer script magic might for instance allow
> us to write out only one file rather than two, since I think
> very few of us understand the NSIS installer...

Very much appreciated.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   qemu.nsi        |  5 +----
>   scripts/nsis.py | 13 ++++++++++++-
>   2 files changed, 13 insertions(+), 5 deletions(-)


