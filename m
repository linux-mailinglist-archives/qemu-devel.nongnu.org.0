Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E878431A759
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:14:45 +0100 (CET)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgi3-0001Lq-He
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgce-00070F-D0; Fri, 12 Feb 2021 17:09:08 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgcc-0000xL-LD; Fri, 12 Feb 2021 17:09:08 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u8so702219ior.13;
 Fri, 12 Feb 2021 14:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVyBH/CwJNMTMooaiCv6r+r9iTHgOAa/UjqD1FaGRU8=;
 b=BY6UksFJjo1sWqxF5jxiY1YKsFTop+6cSJQ3APKq0XMOYAsO43Oy95Z/y5+DAkMXqd
 FUDDh7iPhhUwt8s7Smv6/LkYpmd43FNqIGvt146UeLYJjpch075+p689KS3COGVhG4Re
 uSeOSEiz4HFNQDsBFrK8/XTg4a/AExndy2NzdxPcfyYMr/lP4dLX722EqNOqRd0gqF3v
 CmaWK/NE9za4HAjap0g5dewdqoNeV8O2UEy721Of0sjze0U+6NiJD0/n1BubjNkes/+j
 NHPjGBTAqtx1bIe7m8D9q0nUvTIqyR6hMFQlL7klgkje2efW63Xe5Vf4X8R48njFgcNO
 Szxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVyBH/CwJNMTMooaiCv6r+r9iTHgOAa/UjqD1FaGRU8=;
 b=A6giY9O3TetJNsY5ItQm14YOTUFYd9n8bYhqx++MJjVwMdZ4dnkVnBE15ZGAkRwEX0
 YdLyeN+U243GmC/3L0dw1ESX0hiz3fs7BkhceSb9C1HHRhn+ncsQaFSGlKlIl89AfHbu
 DlSdFj12qF5FwlW/jdbSxt5UbZ5lFmtjHj1dOXTKKJhkjNbCH3O6y5WKpuYmJIuY9Hmp
 sT3BVShS+cJJ6sYsnBH3gZ6PhLQVHxdIlYJkwNhR1bjhNbdbP8fzGG+9BqqOZj7WEYfD
 oBuUgRWptIq7WTzmWmzaS+7bb70ulvIkwWcQCip9TZzyl7ySVX6Z1fFpONK0CmQnOi/R
 Xd5A==
X-Gm-Message-State: AOAM533nGZElwshZlFRCMsxN81c2AWTBbcyRKGDgs60HNamr4udiTQIJ
 4zNaYLGPZLZT2YcnNOPCCc0nuhiRWI8x5Jc58ho=
X-Google-Smtp-Source: ABdhPJywYidSR7O/9a2ogQBlj4em3rIJK6WOdKX9+z8+rmNh/84kWBtRmnWCWA0Gyt4Zi67LVHuYqmL0PqxcWndXK4Q=
X-Received: by 2002:a5d:854b:: with SMTP id b11mr3700676ios.105.1613167745358; 
 Fri, 12 Feb 2021 14:09:05 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-10-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-10-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:08:24 -0800
Message-ID: <CAKmqyKOZ3VS1n6xCvRzu6_VZb3g2sZS4VbZ6M0aopsXX00mG9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 09/15] sd: emmc: Add support for emmc erase
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:19 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Add CMD35 and CMD36 which sets the erase start and end.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/sd/sd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 236f2b8..7aab647 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1544,6 +1544,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>
>      /* Erase commands (Class 5) */
>      case 32:   /* CMD32:  ERASE_WR_BLK_START */
> +    case 35:

Can you comment the CMD here?

>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->erase_start = req.arg;
> @@ -1555,6 +1556,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>
>      case 33:   /* CMD33:  ERASE_WR_BLK_END */
> +    case 36:

and here?

Alistair

>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->erase_end = req.arg;
> --
> 2.7.4
>
>

