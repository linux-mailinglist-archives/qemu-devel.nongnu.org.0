Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2691B5A97
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 13:33:35 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRa6o-0001w0-Hc
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 07:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRa5Y-00013x-T5
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 07:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRa5Y-0006We-Em
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 07:32:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22864
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jRa5X-0006Vf-Vj
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 07:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587641535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwMQKyUMVvxkAGWWVCnEsR/cW4s03175dR//OY/P81I=;
 b=EybvxTS7hAZm8H2cluynH3HMh5vQtu1WBpjhorLrjLEoYWPx5y5S7XzB76AQwmFT9Nj1gR
 r8EMtfET2K3ZPad79Awuo+VkWPsB9hmiMmQtwDwFLPBesEg8850Mt6yDIKjmxa2y89aLKq
 GBCMD3tz2neWGtJA+HNWEWSyMA9i1vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-Z4zzOSuMNh-2gC6EhHbu4w-1; Thu, 23 Apr 2020 07:32:13 -0400
X-MC-Unique: Z4zzOSuMNh-2gC6EhHbu4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B79D100CCD0;
 Thu, 23 Apr 2020 11:32:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D505C1BD;
 Thu, 23 Apr 2020 11:32:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F40B1753B; Thu, 23 Apr 2020 13:32:04 +0200 (CEST)
Date: Thu, 23 Apr 2020 13:32:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-pci: update virtio pci bar layout
 documentation
Message-ID: <20200423113204.mwkj5x3jryuxz6c5@sirius.home.kraxel.org>
References: <20200422215455.10244-1-anthoine.bourgeois@gmail.com>
 <20200422215455.10244-2-anthoine.bourgeois@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200422215455.10244-2-anthoine.bourgeois@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 06:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 22, 2020 at 11:54:55PM +0200, Anthoine Bourgeois wrote:
> The modern io bar was never documented.
>=20
> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
> ---
>  hw/virtio/virtio-pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 4cb784389c..d028c17c24 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1705,6 +1705,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, =
Error **errp)
>       *
>       *   region 0   --  virtio legacy io bar
>       *   region 1   --  msi-x bar
> +     *   region 2   --  virtio modern io bar (off by default)
>       *   region 4+5 --  virtio modern memory (64bit) bar

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

>       *
>       */
> --=20
> 2.20.1
>=20


