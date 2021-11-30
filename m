Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E790463C20
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:45:07 +0100 (CET)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms6Fe-0008LE-LJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms6Ci-000512-75
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:42:04 -0500
Received: from [2a00:1450:4864:20::334] (port=51992
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms6Cg-0004cf-9R
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:42:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id 137so18032879wma.1
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvYajHKZvQcjN1/ZRJpPABJ6KsdnGij0EBop1zsp8O8=;
 b=eAxcRONPpxs3lpjaoAE+HKLt2JOzs/8+xDGLuJA30xnG8lW4FtJi8HvPRi1XbhxW3a
 T9g1Lwno10smIeDi58lyLp7KXUQaiXIRkRi8GJTz+TxZhuh4ouj2h1k8KnRXbjesdXj1
 klyQ7uxX1x4hPToiMYGnZRqlVX1VAV6SnW37MuKIba0JO9UGvA6s34hXYDJfs/BiJHhH
 If0V2qneVbslpysKLrAIdgTZPG+j8B5HKl+AP+YJBKAiT3480cZSEouyiL1pvouov8jD
 7SbWen2GbAWKFCpOsYzy+K10sgjPe8erbIJRDMMe/7A0P2hMfm22BGoC7aVvmgR7PQ0x
 cATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvYajHKZvQcjN1/ZRJpPABJ6KsdnGij0EBop1zsp8O8=;
 b=kfMdsNjCZW8HVJ7ZxbSengWBoA+YCh3omb7xkrW72ydJlLvDSvBlZmbOoMCY/AeBBS
 zaig+SKJvg1z/B4ioE6i0/hVa96f2L6WuEBUlqAdsXhjhNYVwDu079BqLB3CZHJ+o8wR
 ++Mv6GXMuA7Nwzx82vgKG0uehzfkPnqmh99E1XpYDw3F6xfZmdrX95xxmwtpCKVRqgCy
 RtkccjR8qjl9oy9NdkkBUlpYIGozajt3AeYnWlX/j6unHQrY41YmvgvpFCxnXOtHpzuR
 SEDKVu6yfsviHkIe2DeBsf+Ra7+CaydJC8RWO8TkHuws5GYCaRjt9f/cMflmPjqJTa6u
 /m2A==
X-Gm-Message-State: AOAM530WjtRatrtuLCRGTh+I1kwyX3cYkYp3z8iIssZFZ3PFwzlfdfio
 6UoFkn8P+WC1fpn2zdwXxRfU/dDLzc3qH1ninuA/Tw==
X-Google-Smtp-Source: ABdhPJyn9Ywd9XEPgls9FL7XkWSBNWtimXimuAf9ZfhauDZWW//eX/AObJkBU6/h8SpUEhQLRlj9uc/1fTiwKxKu7J0=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr611614wmd.133.1638290520733; 
 Tue, 30 Nov 2021 08:42:00 -0800 (PST)
MIME-Version: 1.0
References: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
In-Reply-To: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Nov 2021 16:41:49 +0000
Message-ID: <CAFEAcA-4sA+xUkzxoFyXiw=LmEZkJRkBhCx+2YZ7x30Omr+new@mail.gmail.com>
Subject: Re: Odd square bracket encoding in QOM names
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Nov 2021 at 08:36, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> Has there been a recent change as to how square brackets are encoded within QOM
> names? I noticed that the output has changed here in the "info qom-tree" output in
> qemu-system-m68k for the q800 machine.
>
> The q800 machine has a set of 256 memory region aliases that used to appear in the
> "info qom-tree" output as:
>
>      /mac_m68k.io[100] (memory-region)
>      /mac_m68k.io[101] (memory-region)
>      /mac_m68k.io[102] (memory-region)
>
> but they now appear as:
>
>      /mac_m68k.io\x5b100\x5d[0] (memory-region)
>      /mac_m68k.io\x5b101\x5d[0] (memory-region)
>      /mac_m68k.io\x5b102\x5d[0] (memory-region)

I looked at info qom-tree for an Arm machine, and the [..] seem to be
OK there. I tried to test with q800 but got stuck on finding a
command line to get it to run. Do you have repro instructions?

thanks
-- PMM

