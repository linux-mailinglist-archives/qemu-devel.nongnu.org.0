Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A82DAFB1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:07:38 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBvN-0004hH-K6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpBuJ-0004Gd-8b
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:06:31 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpBuH-0000TH-1A
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:06:30 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id s186so7807939ybf.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzXlKFqsgxKrcTm2koET2uOecWzaVt/PUhu1Rqse7tM=;
 b=F0huA0Oh9UwFSzmjrL5EndHqxtAPzFf9Ayv+zV0XwCjObkaO1bSxKW605bFv65hxJI
 ci9QG/6ZQF1XWb8zNW/5Hr/dCi3YyrgeF2Y21gNdjPhqtC2X6UxcIVlbXWMwA1l4qfHW
 Bp58IK9h6V2bw2iXNthVyHtaCRnvc0ob4aIZ3R9PxJUlC0kbl4yndNTQzKY/SEG3hkNr
 DdE601fNYmDRU8hFY86F4AE46Xc1cM3KhcZGhHLnteBThi5Q6+nRsCCiP5/61Jb4DFLz
 QUrwGGrD66MK8u2YUPW2xsef0uSViQLKlsL5tAiskpclejgl6GJBQtqpM02ytE4pEd+R
 tGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzXlKFqsgxKrcTm2koET2uOecWzaVt/PUhu1Rqse7tM=;
 b=L0vMJ/vv6UTyw7NKXBH8W78dUFgpUZcEFnbkxSPPLZ2PH5t7viQZE84lOAk7hX4Nbh
 U+osoh/t29Rh8UzXut2NbdygLoq8JlYWio6b3jYLh1bZnFe/ys/C3gegQLGIQ/pnZ7Fp
 PkUq4B/DylxWBcHmNeROWj0KLNHVQemqU+oAaaJJma+4GCHkDPBT0ky6WIyGLVcgPHUU
 iBaqnOPUKprEWpH9Bl26F052inHK8S0V1MHVplQoQ51d24HaOG3TCAPTSC+St9qoB/yb
 DlLjonZ2TZCwXcE1wVKMv/+r3tTZbKVi6VoNvb1YB8AI/T0CmdDHWat9kS/iVJkB6Tst
 Ctmw==
X-Gm-Message-State: AOAM531P0+bQ/qjRRpB1PPaQ23MF51hR13CoCDDSHVgqzoIkvfL72C9s
 Ux+c8tYT3up5cwpwLTPTWa3xncgA58toqR5BzRo=
X-Google-Smtp-Source: ABdhPJxRuEAFO6PBMGV4VEpnKRbNzgA1emdAH5Q1vmbQWq/QI4vTePWyuWVv3til4kjI+UXdDT+ResKa7I+iYB5jpV8=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr42064748ybi.517.1608044788079; 
 Tue, 15 Dec 2020 07:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20201215141237.17868-1-peter.maydell@linaro.org>
 <20201215141237.17868-21-peter.maydell@linaro.org>
In-Reply-To: <20201215141237.17868-21-peter.maydell@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Dec 2020 23:06:16 +0800
Message-ID: <CAEUhbmUgROy8OTSkz6hv7YexMXT_U-iAF2O5Y_9RdZJcco_WGw@mail.gmail.com>
Subject: Re: [PULL 20/20] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
To: Peter Maydell <peter.maydell@linaro.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joe,

On Tue, Dec 15, 2020 at 10:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Joe Komlodi <joe.komlodi@xilinx.com>
>
> Numonyx chips determine the number of cycles to wait based on bits 7:4
> in the volatile configuration register.
>
> However, if these bits are 0x0 or 0xF, the number of dummy cycles to
> wait is 10 for QIOR and QIOR4 commands or when in QIO mode, and otherwise 8 for
> the currently supported fast read commands. [1]
>
> [1]
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453
>
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Message-id: 1605568264-26376-5-git-send-email-komlodi@xilinx.com
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>

Sorry for jumping in, but I just noticed this patch.

I believe you tested this with Xilinx SPIPS but not some other controllers.
Francisco and I had a discussion about dummy cycles implementation
with different SPI controllers @
http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/
I would like to hear your thoughts. I think we should figure out a
solution that fits all types of controllers.

Regards,
Bin

