Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67280F7765
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 16:09:22 +0100 (CET)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUBJg-0002d2-Ub
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 10:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iUBIs-0002Be-VI
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iUBIq-0002z4-D1
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:08:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27316
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iUBIq-0002yo-9G
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573484907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYtXzWtMMC+O9l0qe6hHWK83J0wOG+2EVWQX3SeIzJ8=;
 b=JXwpIMRjUL6ROn6trRgj0WSWCAAcnh/HH0MP/smKujovsiMGajZ9LA1CZ0eFPX9IDAKnAd
 ByWSpn6CkKTPONX+YUpAN6D7CCUviVF5AwrF6+jLWGFDi6qiTM07/tFSRGVe2g8wuI0u6B
 Vf/DHFaxm+U9L1KkJfhXD9/Ixk515RM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Z-QX86njPI2_1-msLwRNSg-1; Mon, 11 Nov 2019 10:08:26 -0500
Received: by mail-qt1-f200.google.com with SMTP id f31so4477014qta.0
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 07:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3mecn7BIdpGzUNLabrSHxl+Rb91pgGv3Jx85K0D+Fz0=;
 b=p4xLI2fdaBFLQPbS+BcD7xL8mD0nTt7zx4axEMQJGWawkDrS7Q/LFcUHB5dIwErBjF
 pa43J56MX+/SgBNqMxkmoHWR5G1Kx9kppM3OSI5wR1d59ZX7OSKixOKKpMLZdLwu3J6Z
 LmMj14wEyiQt3p4KPtiM+CsG5l0+dl1jOy9f9Kino6Siterq+p5KP1UTVfYmZbd80mOC
 02Qeg0CSdQRWGjojRpHqNoR9LcgPbFCmPM00deUGNhkJXXzZCsKUqN4ku3oFsS/Vq+XK
 pOT9Pnt1HRMY+Y8iHBGJqFYasEjfAp8MPOhhYbSeFDnzS6c1EqUjtVUR/7T3ad3XMmKZ
 opqA==
X-Gm-Message-State: APjAAAXExQtk2lxbmh94K2pfVp3ccMcGmVamhHbJWN5NFVQTc7tnC9KV
 GPjf+IIyDWPm+UmHzN43xuNQdK5vwfdtuusQ1cEQPpQsvDN/7Q83ahXOQU0fYL7MTcsCToXYgsu
 nGfcLeDCZk/kQl3I=
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr10541055qke.121.1573484906053; 
 Mon, 11 Nov 2019 07:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwi10KrKIqIfaP/gr5PeWs5vACyS7+UcEsqDiA0tEwkYwDzHfBZUDxKzDQ8jLwSzEglrqpVcQ==
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr10541037qke.121.1573484905854; 
 Mon, 11 Nov 2019 07:08:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id 27sm12063462qtu.71.2019.11.11.07.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 07:08:25 -0800 (PST)
Date: Mon, 11 Nov 2019 10:08:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
Message-ID: <20191111100607-mutt-send-email-mst@kernel.org>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
MIME-Version: 1.0
In-Reply-To: <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
X-MC-Unique: Z-QX86njPI2_1-msLwRNSg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
 Claudio Fontana <claudio.fontana@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hannes Reinecke <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
> On 11.11.19 14:45, Michael S. Tsirkin wrote:
> > On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
> > > +| Offset | Register               | Content                         =
                     |
> > > +|-------:|:-----------------------|:--------------------------------=
---------------------|
> > > +|    00h | Vendor ID              | 1AF4h                           =
                     |
> > > +|    02h | Device ID              | 1110h                           =
                     |
> >=20
> > Given it's a virtio vendor ID, please reserve a device ID
> > with the virtio TC.
>=20
> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this finall=
y
> official.
>=20
> Jan

And I guess we will just mark it reserved or something right?
Since at least IVSHMEM 1 isn't a virtio device.
And will you be reusing same ID for IVSHMEM 2 or a new one?


>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux


