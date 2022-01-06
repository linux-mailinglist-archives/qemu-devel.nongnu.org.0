Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD648682E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:13:23 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WKI-0001wk-8a
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WGc-00088s-G4
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:09:34 -0500
Received: from [2a00:1450:4864:20::42d] (port=42813
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WGa-0003Xb-SL
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:09:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w20so6065050wra.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y517ROAQ+WoqOqCqznk9PvgkBh5YXmtnWDssJqGGdeM=;
 b=t6bGQ1i02ZC5yrHaPQ2+hQsjZzCAYpxohMr9I7l2PCk/IK0TTxEro+KctlwptpGc2g
 4vm3FebadPdDOcviBljyBZectHuMX+ckBQTJPRtareXqLqW2L4PlAEDO/a/PQWiNclzJ
 rVfNR4zGdRTCe9brXkDKxJlC8MYdsh1dZc20HndWRM1WPOr2v2OC+CK9sd5AZNwZ6EJ5
 AEiSUJMbOiNooq/HL2IZ57loGpYB9mvxF8OisJBFYudIH6hCpoAwH9RTSqrKoEoY3nt+
 25VT2gFG7LV6WxbvfDwwa60HamHwRN0eZunU4h/FBN/DDgu4Qb7bn3Wi13lZd1mrg812
 /ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y517ROAQ+WoqOqCqznk9PvgkBh5YXmtnWDssJqGGdeM=;
 b=dScEbMfHYOCzrxY2/PN/g5AZIYJF8Ib71D0tBsbdPxXF1vVwesFFjdsDbiBkl6u+IO
 WPjVkJqsdLUDJI45wYMwwRWVLz6OJihF39jB6fn46g6aO8dCWxlVr/P574Nlz8eH0rNe
 SI8ql0Y7pO+te9TnEQC5AQIsqVJMuCw6fWeCdD3PTKGcXekuCJ+vgLv1yVAPmauSkYnz
 X1FlnMG65m5zZo4ZyQWe45zLUIj/Wod2G8z0/wb+qR0MRwLPnAJU+bVVw6UHOG5X2fQ5
 xJHgIPQwOiFBqSoYL5+Yv3M+vmyK5MjAtO6eIxzv2H/cT+l8psDcIvS+/hGNyRKZrUg2
 qK6Q==
X-Gm-Message-State: AOAM530+ow+K6FsmQVyr0kts0xSSnmywdwsbd5Z7odLMsBQOZeNLTWjT
 L62knuv4b7VFTLrMkvB+2hgVMQSdcP/oLOXZUsUtzA==
X-Google-Smtp-Source: ABdhPJzaW/QuR8YvEcjAb2xTxW8dMOunzHFJTk966KfUibQ2O5UtvV79Wjc05/+YT+XdpP2iF4miNoJQ83suf9qtfFc=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr50360389wri.295.1641488965742; 
 Thu, 06 Jan 2022 09:09:25 -0800 (PST)
MIME-Version: 1.0
References: <CAOG2ctwLQhtezS80vKWZOJQs5k4qr3PsD2UK+cx8Ce+Sa_HRww@mail.gmail.com>
In-Reply-To: <CAOG2ctwLQhtezS80vKWZOJQs5k4qr3PsD2UK+cx8Ce+Sa_HRww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:09:14 +0000
Message-ID: <CAFEAcA-67WPBrZsnOE10UmrEq3ce5LvuiL3VT9TfSffnM-_UaQ@mail.gmail.com>
Subject: Re: New arm alignment issue with 6.2.0 - bisected to single revision
To: Mark Watson <scrameta@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Dec 2021 at 20:15, Mark Watson <scrameta@googlemail.com> wrote:
> I'm seeing a repeatable alignment exception running m68k system mode on armv7l (arm cortex a9) following this commit:
> "fa947a667fceab02f9f85fc99f54aebcc9ae6b51 is the first bad commit
> commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date: Thu Jul 29 10:45:10 2021 -1000
>
> hw/core: Make do_unaligned_access noreturn


cc'ing Richard as this was his commit. Do you have a repro case
(QEMU command line, any necessary files/images, etc) ?

>
> While we may have had some thought of allowing system-mode
> to return from this hook, we have no guests that require this.
> "
> With this included I see this in the kernel dmesg log:
> [10621.993234] Alignment trap: not handling instruction f843b004 at [<b677bb2e>]
> [10622.000479] 8<--- cut here ---
> [10622.003609] Unhandled fault: alignment exception (0x811) at 0xb13eed96
> [10622.010162] pgd = 45acdb93
> [10622.012941] [b13eed96] *pgd=0557a831, *pte=c01ee743, *ppte=c01eec33
>
> As well as bisecting I've verified it is this revision by checking out clean HEAD then reverting just this revision (+ fixing conflicts).
>
> The patch itself just seems to be adding QEMU_NORETURN (aka '__attribute__ ((__noreturn__))') which I'd expect to be benign, so I'm not really sure what is going on.
>
> I cross-compiled it on Ubuntu using gcc/g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0.
>


thanks
-- PMM

