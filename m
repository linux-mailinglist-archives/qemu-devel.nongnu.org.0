Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9E613135
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPGD-0002Ru-MJ; Mon, 31 Oct 2022 03:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1opPFw-0002QV-Qf; Mon, 31 Oct 2022 03:30:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1opPFu-00045V-Qh; Mon, 31 Oct 2022 03:30:48 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8FC583200124;
 Mon, 31 Oct 2022 03:30:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 31 Oct 2022 03:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667201440; x=1667287840; bh=LA
 W4C1oh1J1G2RHacHLuM64FNTznEXvlAlmOpKkA+k8=; b=dZP1Lvm/TKYgHagvDK
 aO0PI98XSwTXLg+lrEXCGSwyTiP8sWFW1it5uZut3CVaXNElthTjzexvvr5OXXpr
 oSbNxnSRMMtMfLmFTlvT+CZKokZosVM0eVnnEGiEKsmR9y3Dhlbm+1kFjoHmUJDt
 F/bA7AJBGfoHVNHK3JsM6gbv6uSU9a8N1GCVahjRpzBA4h/FRR77YT8HLQPYraaG
 W02pMVpBH2dfGKLWhW8ZP8daaswj4WWKwMGTzj6XUn2Z97VwBmNURRrFmi0BhTBN
 iyueVlnvyT9Pi7Qjtz9gq3MpY7/R83z+IluhpFTtQjf8LKPB3ybZT6fI6zOcdjmq
 sosw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667201440; x=1667287840; bh=LAW4C1oh1J1G2RHacHLuM64FNTzn
 EXvlAlmOpKkA+k8=; b=aYJn94yTW2E9IzdN/nUEuC08Q4qTVE1gRe0bR7uY5NDw
 XMcHAcToksVNX9RdEURnVJbfXO5HvtoRWC1wH9sBV65gXBJ5Ut0aotexlAUnJv53
 CYdH12oyFdfwrkMoP1oSkgtf53dwCw3EA66LHg+zrpaU+Bb8ePrHd/67HxyM19p4
 qQEYxCedHkVzWC0G8bndsCUM9NpGywDflsU49fFf5VpwExINq9OyYdRSuEx38kI2
 JbdwZTY8MgHh9HlSaTz7oelt/5+8I3wLjN2DkdDp3MIPZkjetiSaUoPgfTH752To
 G1qASjevSwn6BWpCDbNnulLo9EbUm1WS8dy71KJ5Eg==
X-ME-Sender: <xms:n3lfYzzayf9VF2T2hG1-TlrtaOswJyLyYbYGZNWUc0IqKpRgy2bGSw>
 <xme:n3lfY7TvScKhsZfEZJS-B43I0deKOdlAHIq06OTdsZRm-QFXzvhxj6tvcdeYvobDE
 bZqVd82SJy3OyChbSg>
X-ME-Received: <xmr:n3lfY9UfJzAJjDw4z-2m0umkY9SAcE7qM5erpDgxRG5aq_wpzIfK2-IZ1ALdGeW6sos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedruddvgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:n3lfY9hXgfqNU9sfMUAvleuNl_oFfybkLXUppDrgBg3wlQBP9XU9Gw>
 <xmx:n3lfY1A7YmVjh_twj8ebBpva2dWuq88Iz-UtrBpp2tfq-3Q3hXmBoQ>
 <xmx:n3lfY2K9w_qaRZMVmgHjcEq4oa8HaI-uOmdXpwwDNeorumaJ_7biqQ>
 <xmx:oHlfY47B-HpW8UnTw4MKP-AjzIrW3Che2lSD1gpf_6GVuHk-uG4wkw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 03:30:38 -0400 (EDT)
Date: Mon, 31 Oct 2022 08:30:36 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Daniel Wagner <wagi@monom.org>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <Y195nENga028PvT9@cormorant.local>
References: <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
 <Y0RTHArVOWN2Tg2K@cormorant.local>
 <20221018081546.mzziix5ymjmpus56@carbon.lan>
 <20221021125948.g2vuxkcvmflm3ruu@carbon.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4fTtED0GPjpVWijq"
Content-Disposition: inline
In-Reply-To: <20221021125948.g2vuxkcvmflm3ruu@carbon.lan>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--4fTtED0GPjpVWijq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 21 14:59, Daniel Wagner wrote:
> On Tue, Oct 18, 2022 at 10:15:57AM +0200, Daniel Wagner wrote:
> > On Mon, Oct 10, 2022 at 07:15:08PM +0200, Klaus Jensen wrote:
> > > This is all upstream. Namespaces with 'shared=3Don' *should* all be
> > > automatically attached to any hotplugged controller devices.
> > >=20
> > > With what setup is this not working for you?
> >=20
> > Ah okay, I missed the 'shared=3Don' bit. Let me try again.
>=20
> Nope, that's not enough. Maybe my setup is not okay?
>=20
>   <qemu:commandline>
>     <qemu:arg value=3D'-device'/>
>     <qemu:arg value=3D'pcie-root-port,id=3Droot,slot=3D1'/>
>   </qemu:commandline>
>=20
>   qemu-monitor-command tw0 --hmp drive_add 0 if=3Dnone,file=3D/tmp/nvme1.=
qcow2,format=3Dqcow2,id=3Dnvme1
>   qemu-monitor-command tw0 --hmp device_add nvme,id=3Dnvme1,serial=3Dnvme=
-1,bus=3Droot
>   qemu-monitor-command tw0 --hmp device_add nvme-ns,drive=3Dnvme1,nsid=3D=
1,shared=3Don
>   Error: Bus 'nvme1' does not support hotplugging
>=20
> With the patch below the hotplugging works.
>=20

Looks like you are not configuring a subsystem device (nvme-subsys) and
attaching the nvme controller to it.

--4fTtED0GPjpVWijq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNfeZwACgkQTeGvMW1P
DelJ0Qf/RSRm2nkSeVW1QP7EFsaQV96HMK8cpXWVz3ubhiiOQy668dF9JMHlDKnV
jWbZjux655yrogotnFrUm4d7odH9gLImUYg2uTc0SXrh7zh3e90kz0xAPgAjlmly
2mnIz3FXdjlCOvptfJtONPFM0I6cfUzQ7Wn6BdZ75pBAh0gI1xP2cbsV9h/7yYWR
3khLZ/ryOJQDa9RfXRUq+ljnA7UCuU8bNePSoAqnZI6Wt2Ya612OOYILnUxaLY4F
Th8iLJ6jS/UiHzrRb8Q0d/bfCAj6ea5NxB7tnou41tR3JBrOOjP4TB9H6Qy1Lixe
a0mK9PINcxa8tFICtqlfoOGLarBilg==
=uT8L
-----END PGP SIGNATURE-----

--4fTtED0GPjpVWijq--

