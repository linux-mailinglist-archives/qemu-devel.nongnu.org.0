Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A903A619120
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 07:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqqFh-0006sQ-UX; Fri, 04 Nov 2022 02:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqqFY-0006qX-V3; Fri, 04 Nov 2022 02:32:20 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oqqFW-0004Iu-Gy; Fri, 04 Nov 2022 02:32:20 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DA9D13200488;
 Fri,  4 Nov 2022 02:32:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 02:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667543535; x=1667629935; bh=on
 33JlTQLCqTX36bOSgKt3VzbZsv/2FVWFZ7QSDlnk4=; b=PotBdQ9GqPTvH8rLQW
 PUFTpatFFCBYpqwf6icBdo+Jyv9Lj0KUUiLVwmaWT2xToAsmDOtGj2uBURpRkxt+
 gfg8OL0NtDmHlHY37wecGu/Q0X15Hf/X9ZFTHRWLIj8g/wpUdweoeh0x1Av8uNqM
 qqq/XA+g5xbOCt9ZZcpXYwvjpueSo2H8M4L3Vj2CORum4+LGFrAuCXyDNp2dfPF8
 /6PqBy5Pzqxab7vj7DDZnDJGQV2lv9AweErRJYneS3EjmSf9vlhhvyd5rUKS8n5v
 JTgvxevl64GP/GCla/Wz2ZkXvI9TaKDTIIyZ4oIF8UaE8LHCeTZZ9H3xgB4IAIo2
 hAyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667543535; x=1667629935; bh=on33JlTQLCqTX36bOSgKt3VzbZsv
 /2FVWFZ7QSDlnk4=; b=nNLgu7rtR8HwqIySpb9bWd5AO5HLQIT9Lm6OT0rOdmV9
 UChjfCz4WFxkUDSvFezGoUP41FyY5YAAHUpBpg2GcpPa6Qy0PRgSA7WF6TTeIgTn
 uSsmFjw+vPG8PHKen8zVVNI03qApO27eppTjpMvyStIljJi5ucxBoWYdRMWikRKP
 JZ2pimjLpXA1rrOJqJpqS7drtGywK5jNbc/dDIefTF1jNX6UIZDFCwbMh8bzubJ5
 d5fCPdW74L6aqlME8bpIW6ihFH+zwKSZ/44aS3zlCRHchvQNa435abPtnvitbYpm
 qrEerRm9PB5Nx1qEiuifPp/uXE6kO4SDeqv1+Cb3bw==
X-ME-Sender: <xms:77FkY9WncJVvWsImEDW_Zok6rs9AEsooznd3sMLKqVUOiTK7mCm16Q>
 <xme:77FkY9nvEo5yfJ3-0KcMpDSM6d2b4oZKTaVlo_0gGoK6TJbjIh-697SdPNt3FZg_0
 OfkKZBnm2bxzjNrQNU>
X-ME-Received: <xmr:77FkY5Zt-cIhHJWmRta4nS-WJAx7-_pc68IUJce8Czc8zncLC2yfNmj32t3Ice_hf4K3yifD6E9pe7PvNwEjACO9XsmyGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddtgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:77FkYwXZ03vvQ7MguX9zmKK-Ro2NKzz5GUm2cHNO48TQ6a0JiB7jyw>
 <xmx:77FkY3mpDbFGTKT6CVF7EIptAzSMG9QrqXteqldMnl7d7tYIzZks8g>
 <xmx:77FkY9d6hlOUdO4YcU-sQ5IkyUT2E27Urje9FFcgYBgj5HqVtDrQSg>
 <xmx:77FkYwBJmpsdHy4BafHTXGJBjjyOO-UiEKUO_MfY491WPkJ3bGMaBw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 02:32:13 -0400 (EDT)
Date: Fri, 4 Nov 2022 07:32:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
Message-ID: <Y2Sx7O4MFHKrvXQA@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
 <Y2OvzcfeawKWvvJ0@cormorant.local>
 <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ch0BNqNArxCFBFyA"
Content-Disposition: inline
In-Reply-To: <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--ch0BNqNArxCFBFyA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  3 21:19, Jinhao Fan wrote:
> On 11/3/2022 8:10 PM, Klaus Jensen wrote:
> > I agree that the spec is a little unclear on this point. In any case, in
> > Linux, when the driver has decided that the sq tail must be updated,
> > it will use this check:
> >=20
> >    (new_idx - event_idx - 1) < (new_idx - old)
>=20
> When eventidx is already behind, it's like:
>=20
>  0
>  1 <- event_idx
>  2 <- old
>  3 <- new_idx
>  4
>  .
>  .
>  .
>=20
> In this case, (new_idx - event_idx - 1) =3D 3-1-1 =3D 1 >=3D (new_idx - o=
ld) =3D
> 3-2=3D1, so the host won't update sq tail. Where am I wrong in this examp=
le?
>=20

That becomes 1 >=3D 1, i.e. "true". So this will result in the driver
doing an mmio doorbell write.

--ch0BNqNArxCFBFyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNksesACgkQTeGvMW1P
DelUUggAjS7n+KgWwYdJBBCdsfTgOr27rNNJlp9c8dGW5WcRMipbgkk1tAxDAryT
NRxSz8nPqHkwGpfGF/iK2ti76tVvUQGgSX4RlQRKAv4Ltu2QOjitP7XupNmQChVG
tfArR1fAPThD5hAftnG2HEQFhjfkqApCXkMMP2mdAIxatGKO+ChEydrtBNW+C3W+
BMe8VqTXSZURVi+sB6VYWwxJu5kCh78moI/ExJg0n1e/uN7anCnHJrkdlb/VrKV2
iV8+dDZD7AKzdAJo/0XZZeW6QNKfaqLH+naflQ3LuViM3jv8Zh3Rhbq2qZFK4FOT
Hk6C4wX/BI8XpqWhHz5PYmCBMyDP8A==
=dKic
-----END PGP SIGNATURE-----

--ch0BNqNArxCFBFyA--

