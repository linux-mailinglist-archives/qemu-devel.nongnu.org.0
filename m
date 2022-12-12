Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B8649B88
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:59:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4fZo-00070n-Vc; Mon, 12 Dec 2022 04:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4fZk-0006z2-3B
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:58:20 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4fZh-00041Q-Ri
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:58:19 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E08645C0055;
 Mon, 12 Dec 2022 04:58:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 12 Dec 2022 04:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670839093; x=1670925493; bh=LY
 AiM8f3leZ/PIhr3G7EU7Whf6lNbW6pvgNn7vVeU84=; b=VPSf1J88H78yg+N/jm
 n2yVDIx9AX4GTkij7zJL+knsD/el0wjpEVgzJDf+/fgOHlqocqHaeaY95jb9dDgo
 /LLhlkn7JT1SqGU7Fvy5sWe/uBmCR/qaddGpPQIQHH+jSgaOD8ixdjEzbhmDt8wv
 2t1DjDpvg9GJqkKEODTBml+VbFDdxtp5H1OPPvgcjn6Kh8gxGLtvCHLDleQca4LR
 4cw2r2zVHE7CyU6sR6zj14UrW4AxeRvEFF50j6DDrAfq/IGzqBTddkkHWG6QInDz
 qqbutlxleYQi10JHqnLmBxCrdzGyZ6xJpfpDM6QCxmA1c2NFwLgLoj0Kt/531b1w
 U2EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670839093; x=1670925493; bh=LYAiM8f3leZ/PIhr3G7EU7Whf6lN
 bW6pvgNn7vVeU84=; b=MSoyOBtdYR3isRDJi30drpA0LShTjBUiR8jtLpFh1GUm
 rwDPmGQc+5q9NrHMWbpH2Ausq4OQ7Cx4M5AZ2H3g2xBEDdNsVrwA6aeqjHtW+9Zo
 vu0JWE2te2Xw4BWhg2t78VaFKyrRr5WA4Z0A0uhtVaDyLXxa+OffnGkXgMU71o1Q
 neaWgX5tnUh8MHwtsnC2F1vTjHT7ncEastl+8lzmRPDr4uxbgt7dNpT3sMt7l14b
 G3by21YOFq6UDZYNkDQpfy51L2ZESFwWSiqJizn8E1UIuWjnd6H8CVbiVlrazXfK
 w+X3qlbJcrCNgpdk/i66j/O0qFVhHjB8wjnM+DfooA==
X-ME-Sender: <xms:NPuWYy6cNvGxdBQrX34Ak--EOonFfgiWswwuEznxWxqBMqk3SavS8A>
 <xme:NPuWY77v7-qvKNBcWepJ_RdQeGuPsdpAJbDPKeu2FKM3IS6agPvfOnVPHb3cjIQDL
 2CDORfbkeLaIsy5lRA>
X-ME-Received: <xmr:NPuWYxcgFlh3tjGZx1bFYb985sdDlrofGluRuLz6muXF0762om4MYjrtpRMHd_dCqohlkTO1fwijjwDlPzKPOgsJnnrkKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NPuWY_K_Vy5YWCxcyfIatGnhM3ydWNdebSpKfGG9ZcCubHxr5dXz_Q>
 <xmx:NPuWY2LqK51ypd0O-3GsMERtrEmBcuCYdtVFuLf1U6azcT4FPNG13g>
 <xmx:NPuWYwx0he9b7XK0KVv-ZcBrZe_FDv1o83WIiJt3ZoFI3DlqPFhvsA>
 <xmx:NfuWYy3Pq-KtI4u2gdc_uj71UkNDbAtxcFPTWFl8ADgS8CcgWvuCRg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 04:58:11 -0500 (EST)
Date: Mon, 12 Dec 2022 10:58:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Y5b7Mdtklu0xA5bJ@cormorant.local>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BrxpUS6E/HY6MTXN"
Content-Disposition: inline
In-Reply-To: <20221208203955.GA1367659@roeck-us.net>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--BrxpUS6E/HY6MTXN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  8 12:39, Guenter Roeck wrote:
> On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
> > On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > > >=20
> > > > A cq head doorbell mmio is skipped... And it is not the fault of the
> > > > kernel. The kernel is in it's good right to skip the mmio since the=
 cq
> > > > eventidx is not properly updated.
> > > >=20
> > > > Adding that and it boots properly on riscv. But I'm perplexed as to=
 why
> > > > this didnt show up on our regularly tested platforms.
> > > >=20
> > > > Gonna try to get this in for 7.2!
> > >=20
> > > I see another problem with sparc64.
> > >=20
> > > [    5.261508] could not locate request for tag 0x0
> > > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> > >=20
> > > That is seen repeatedly until the request times out. I'll test with
> > > your patch to see if it resolves this problem as well, and will bisect
> > > otherwise.
> > >=20
> > The second problem is unrelated to the doorbell problem.
> > It is first seen in qemu v7.1. I'll try to bisect.
> >=20
>=20
> Unfortunately, the problem observed with sparc64 also bisects to this
> patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
> does not fix it (which is why I initially thought it was unrelated).
>=20
> I used the following qemu command line.
>=20
> qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapshot \
>     -device nvme,serial=3Dfoo,drive=3Dd0,bus=3DpciB \
>     -drive file=3Drootfs.ext2,if=3Dnone,format=3Draw,id=3Dd0 \
>     -kernel arch/sparc/boot/image -no-reboot \
>     -append "root=3D/dev/nvme0n1 console=3DttyS0" \
>     -nographic -monitor none
>=20

Hi Guenter,

Thank you very much for the detailed reports and I apologize for the
fallout of this.

I think this is related to missing endian conversions when handling the
shadow doorbells. I'm not sure if there is a kernel issue here as well,
because as far as I can tell, the shadow doorbells are updated like so:

  old_value =3D *dbbuf_db;
  *dbbuf_db =3D value;

(where `value` is the new head/tail value depending on if this is an sq
or cq).

Keith, is the kernel doing something magically here I am not aware of,
or isn't this missing some cpu_to_le32() / le32_to_cpu() calls as well?

--BrxpUS6E/HY6MTXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOW+zEACgkQTeGvMW1P
DemPiwgAo0V0tKGwebsBL3geLNxDsdUA06nXL8AnH29RSAp5JYngU4QTVcMnpaLf
MKBi9UhcF+TTDXcuH4DChSdOO6H+j/uS7yJ6ekDRM/1YNb+aac3kjc2bFqREva8L
M5EpVhfMYCiMLAF0I5qO9smpmyjr46vqa38BVw9XyYQU66xN2HZxGh9bd0ooVP0V
Z5QN2PeIjVR825zcyd6jvUZGz5/4pWjwtRayxa0RkIcLSH77OOL/ojauHi6l3sRI
ONbe77wpnEkv9AjaVcuYW6NDlr91TggMX8AB9OLFdk9/ty7hU1fyt0eESuGPsj68
4AXgGAiP9iCJQFghx4hE7Vkz/SXqNQ==
=Lvub
-----END PGP SIGNATURE-----

--BrxpUS6E/HY6MTXN--

