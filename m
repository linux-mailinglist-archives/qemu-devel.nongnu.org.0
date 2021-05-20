Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4B38B427
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:21:42 +0200 (CEST)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlQZ-0000ut-7Z
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljlPI-0000Bc-Uo
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:20:20 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ljlPH-0008GE-13
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:20:20 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5776275wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DxgcexMKN/l4Emwr8F57ImxjTTX8KUdtr6TgfN8wwXo=;
 b=WsKdFz+8sKGWWOEG57QwiqS9st0duEXxuocKgl/iYTP2eInZE9saXz25n0wi6CasWI
 R88iKHVS4Sz1eMoLIOf2IY0XTA7ydd8CdcWEKZ7zC9VSuQPB6wlvVPwhzezuUZsk8h1e
 Buq2nqIOLhe6YudNP3n8lR+6O6VNdV92G6lnzg/9TEJG9CQ6PwefrdoeMZOkwSMfoRoO
 HBI0DzyinxxlkSC6fShdmxSYLh3bpwYbQSrFwhRSvSomJ/U6/EnG27ZiaLAtOFD601ad
 o5v0Idb1d8qZz4yxu3cwlfukG7kUENK1o+MP2zUPWNfhPMCtOdY9LEDi1PYJb8s0Xxjb
 MQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DxgcexMKN/l4Emwr8F57ImxjTTX8KUdtr6TgfN8wwXo=;
 b=fp1tTIxVsGMa8l6kdPLYdcSyuFuadnTSjLFyYZPFNAs8/VI/Jxg3RwITIjzG3l6bMR
 eGBXwnwEWlgfl5L31Hw6RlvGAmrQrxUOmNP7O5CMVVHdE3+rgtdY8relKsxpHM1S+8wk
 BCWzeX9LxC1KFDoVrGGuiJLE4YgVz14pCNPUJ908icSlIdi4bk4VXLdkZX7nLhtcj67c
 YsQxCc+aTgG1eCFpN+bQXpQpKeMOpEEnPBpGrYL58Rj+/v4a8SbE8yLsBgdDM23ibaVr
 bny8J9rYhMSgPLE2/GMbIxZLhxKRL2Alou+5mhkuyvC4trYZgGuDQImJE0oca3rliY9K
 CgDQ==
X-Gm-Message-State: AOAM5317jzVrMFDCTgm1g1N1VX5iyOnr+pJmLZFaRHKNLuW3hh3v71iW
 LJ0Azzy3H7udOROzNMGafo8=
X-Google-Smtp-Source: ABdhPJyhd4ct3ztRdPPO0SFEWVxMRikuKTG70DF3H/+Bl83qwh5ddQrEjksn0hwlvIrN2dZaa07jTw==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr4880166wme.178.1621527616661; 
 Thu, 20 May 2021 09:20:16 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id x10sm3721132wrt.65.2021.05.20.09.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:20:15 -0700 (PDT)
Date: Thu, 20 May 2021 17:20:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtio: Clarify MR transaction optimization
Message-ID: <YKaMPvuVvrOKGnWA@stefanha-x1.localdomain>
References: <162125799728.1394228.339855768563326832.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pOzw53M3xjzWeDia"
Content-Disposition: inline
In-Reply-To: <162125799728.1394228.339855768563326832.stgit@bahia.lan>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pOzw53M3xjzWeDia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 03:26:37PM +0200, Greg Kurz wrote:
> The device model batching its ioeventfds in a single MR transaction is
> an optimization. Clarify this in virtio-scsi, virtio-blk and generic
> virtio code. Also clarify that the transaction must commit before
> closing ioeventfds so that no one is tempted to merge the loops
> in the start functions error path and in the stop functions.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> I'm posting this because the wrong version of my "virtio: Improve boot
> time of virtio-scsi-pci and virtio-blk-pci" series as explained here:
>=20
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg04744.html
>=20
> While here, I'm also adding the comments to the core virtio code, which
> also does batching since commit 710fccf80d78 ("virtio: improve virtio
> devices initialization time").
> ---
>  hw/block/dataplane/virtio-blk.c |   16 ++++++++++++++++
>  hw/scsi/virtio-scsi-dataplane.c |   16 ++++++++++++++++
>  hw/virtio/virtio.c              |   16 ++++++++++++++++
>  3 files changed, 48 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--pOzw53M3xjzWeDia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCmjD4ACgkQnKSrs4Gr
c8g47Qf/eoLDX8DMblM2BXpSNqkA4vlUAr1thcpWkkTrdcEA1+2sP+o0IybeW6SJ
PTP0EHeaIccQX5Q9wliHYsE+GvUIv1XLlpCdhT/Yj6QxDoNbyaJIKkEwhMNV68Vg
jaqn3LNXC4KTrhO1sjtUoIlPQzuKkliEwGeQYVKqbDCaKkhTA+CnNJ8HRouFNbGJ
4NxmvTnzDglKo7+S4YKYjnIxoY30ygkqkQAZSUgJD1VYmufSIT1I9i8uxC69rl9T
Tun9IaJbb76FKVWCvkuos2/Xx6mQVQK49nodtQrS33Kl8g1RV4C3q10jCJgLNlk5
DNhz7voC6My6iwW+jVLwZXD3/K3pgg==
=HOup
-----END PGP SIGNATURE-----

--pOzw53M3xjzWeDia--

