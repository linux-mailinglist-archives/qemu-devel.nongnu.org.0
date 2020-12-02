Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680622CB192
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 01:33:42 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkG5U-0000Is-Tr
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 19:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkG49-0008F9-D9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 19:32:17 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkG46-0008E4-3K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 19:32:17 -0500
Received: by mail-qk1-x744.google.com with SMTP id y197so3284756qkb.7
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 16:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RFB6G1mmmeBa1+gEvcJVvD35Q3AzS3d3eCRjC/0N7yc=;
 b=E+QP3ji5MUwf4Vc5l/csfsOO+KZMfWrQGsn8EC9UWAE3/QPv+ToFNOLAMdwEP90Qd0
 /7dRC3K1350v8U9Jdxb3smT1jgzESefnrFJubyExWb/BneG+nPzHLhumY8zW7S4IoBgE
 a6HQW73dmB/gH1ZwEiIdFZ6EtsV+sBY11AwnbkN4pxMaljg+4nCsRtTFO76HVe9nuToC
 7H/lxK6IrWupOKRLi7aPPaaPFrE/IpF2mYwqshaMHsn+jwI8ImlY/Va+xl7OJ9Wx8Qza
 p39IbVFjBH60tNDDNUzElXHYgNov4/Um8tALloorV2RmyH6fWB3Ay2XmpH7CYLGMppSH
 rygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RFB6G1mmmeBa1+gEvcJVvD35Q3AzS3d3eCRjC/0N7yc=;
 b=Iqm9dYKqx62OcoGCt99aAe+6YMibosjEzvdzO9yJ+qzuYVeOclg6tLfpRQ/TlWk/YB
 K+P1bGvWoQGUWoqmpDQ+J6qO9mc4iHwRJv6qaTunVJVtBvKtqYx0mWCYQQyU+oiyqs64
 ukbQj+Kl1xXxjclx07yrlNHyYHq/h5P1ERBdyogpjAAwwgEKhhfdhf7+KZbTxYIsc9/G
 JJ1IKrO3SK2rxuhCND02Hme2q99flBwVrOI4Q5wrNYd88Gb/jOXG4z1Gi582hfKuhwUm
 XddrsXaEeSs6xFH3febMXIVo1chxYr/VROrX5NFNQjgVrxzicMHnA9D1jiY6oUEtJofP
 cWEQ==
X-Gm-Message-State: AOAM531ko/ShiKmULXFtL+pmz34/aIR1dS6X7S/J5NM9i6+d+sIVH8K4
 WOw4Ve4VPV214i5cZPv44E5xPntO6lNQmKTtWBk=
X-Google-Smtp-Source: ABdhPJzc9AyjFKRszQd0l76hGZYQ5mntLBdHuHgeALSDuAM/wyTJzxoyCQRrh64HJyH7UFnMCrbI905iempt6eInuWc=
X-Received: by 2002:a37:a14a:: with SMTP id k71mr127960qke.33.1606869130552;
 Tue, 01 Dec 2020 16:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20201130102228.2395100-1-f4bug@amsat.org>
 <e59e0eee-16b1-7ed1-c5e0-30fa8781f772@linaro.org>
In-Reply-To: <e59e0eee-16b1-7ed1-c5e0-30fa8781f772@linaro.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Wed, 2 Dec 2020 08:31:56 +0800
Message-ID: <CABDp7VptGxMNiMFPSshf8U9nwrqBQC0=qHmG69=bW4MMXhEuWQ@mail.gmail.com>
Subject: Re: [PATCH] target/mips: Allow executing MSA instructions on
 Loongson-3A4000
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=zltjiangshi@gmail.com; helo=mail-qk1-x744.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Tue, Dec 1, 2020 at 2:24 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/30/20 4:22 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > The Loongson-3A4000 is a GS464V-based processor with MIPS MSA ASE:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg763059.html
> >
> > Commit af868995e1b correctly set the 'MSA present' bit of Config3
> > register, but forgot to allow the MSA instructions decoding in
> > insn_flags, so executing them triggers a 'Reserved Instruction'.
> >
> > Fix by adding the ASE_MSA mask to insn_flags.
> >
> > Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > Buggy since 5.1, so probably not a big deal.
> > ---
> >  target/mips/translate_init.c.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~
>


--=20
Huacai Chen

