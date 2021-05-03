Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F937169A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:27:13 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZXU-0005PJ-98
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ldZWH-0004wG-Dg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ldZWF-0001ts-O8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 10:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620051954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCmDoeibqX1nxQdDxcef15Nxk9S5leYyT4c+qK4Rar0=;
 b=WIyy3NyI5pizUqfDoTpmztbllusCKWIy8VXgy0Zl/Vct81mN5SSDS4+0+/eMUZrCSh4i5T
 GOG8/SOtzrNKDeBIsV30xozk8Mg/D4kQ+tdHKKoPb6Jk07gldo87M3ugoVfdIBSJy/h2ds
 MArK0nP88RpJbFbIAVMPUowe7zQLiPc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-_VTU37jaM0eb9L656cQXAw-1; Mon, 03 May 2021 10:25:52 -0400
X-MC-Unique: _VTU37jaM0eb9L656cQXAw-1
Received: by mail-pl1-f200.google.com with SMTP id
 p4-20020a1709032484b02900e6aa6adc54so1717007plw.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 07:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pCmDoeibqX1nxQdDxcef15Nxk9S5leYyT4c+qK4Rar0=;
 b=q97xvs0xqCFd0eD9tWchmq7Yq/p5q+8XaSJJ/4jnHEIzvd4HHAOs4HR4sdpBhyC9e1
 mOzwHHZd7KOQPHsMFMHkdyZCun+6I8EhM+RLbWxyBn6XAM8NwcWwMMwtEsLsaYlNBkxB
 Z2hRT37EyAs7MrG2wC58WHOExWTuyZs7HV9SXViNBU44O4QlgnArXFJ+fIkWTUyZRnlq
 jP/ztY0Y5tBa86yeFyiN/X9L7vocba5YQPDetd58vsG+O/t9GdeqT+UABajgm/4uvfAm
 OUxUIQdrWKx9QeAwZwkEm7myWkokmk2Ct4HjD5SSGltgPe8lcyMso1K9nCyidW3rdPku
 JkNQ==
X-Gm-Message-State: AOAM532b7MtUYrEXYBefwnp2l1QtUJPLvBsP0NyaSXkTxryBuc+5egK/
 DgowE7s+b1hG11SbbLVXr//kVx/nw9bFschaQEfC1//QUhz6wG1hDlsjvwvNbeyohlg2AK7Tr8U
 h/FuWcrxwSsd1Lw0T6cxuIjsdgJ/ewNg=
X-Received: by 2002:a63:184a:: with SMTP id 10mr16502035pgy.426.1620051951808; 
 Mon, 03 May 2021 07:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkG3D+kzCVZZFfa/KPV0SuXar5rl2rJ+LXBUVt4nzNgFlankpm3K/pI3h/ySrMNX21HIYrTpPmlU9KhHJqalk=
X-Received: by 2002:a63:184a:: with SMTP id 10mr16502022pgy.426.1620051951573; 
 Mon, 03 May 2021 07:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503132915.2335822-1-kraxel@redhat.com>
 <20210503132915.2335822-3-kraxel@redhat.com>
In-Reply-To: <20210503132915.2335822-3-kraxel@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 3 May 2021 16:25:40 +0200
Message-ID: <CAA8xKjUL_FtT5_kxAcWZENBRduYcr++HB7qkWzb0dGLzSNjJ4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Remy Noel <remy.noel@blade-group.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 3:29 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Use autofree heap allocation instead.
>
> Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/redirect.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 17f06f34179a..6a75b0dc4ab2 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *=
dev, USBPacket *p,
>                  .endpoint =3D ep,
>                  .length =3D p->iov.size
>              };
> -            uint8_t buf[p->iov.size];
> +            g_autofree uint8_t *buf =3D g_malloc(p->iov.size);
>              /* No id, we look at the ep when receiving a status back */
>              usb_packet_copy(p, buf, p->iov.size);
>              usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
> @@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice =
*dev, USBPacket *p,
>          usbredirparser_send_bulk_packet(dev->parser, p->id,
>                                          &bulk_packet, NULL, 0);
>      } else {
> -        uint8_t buf[size];
> +        g_autofree uint8_t *buf =3D g_malloc(size);
>          usb_packet_copy(p, buf, size);
>          usbredir_log_data(dev, "bulk data out:", buf, size);
>          usbredirparser_send_bulk_packet(dev->parser, p->id,
> @@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRed=
irDevice *dev,
>                                                 USBPacket *p, uint8_t ep)
>  {
>      struct usb_redir_interrupt_packet_header interrupt_packet;
> -    uint8_t buf[p->iov.size];
> +    g_autofree uint8_t *buf =3D g_malloc(p->iov.size);
>
>      DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
>              p->iov.size, p->id);
> --
> 2.30.2
>

Nitpick: I would probably reference CVE-2021-3527 in patch 4/5 and 5/5
as well. Just to avoid someone from cherry-picking this patch only,
not actually fixing the root cause of the CVE.

Regards.

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


