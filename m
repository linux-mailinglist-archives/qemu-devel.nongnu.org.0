Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC68477CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 20:40:51 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxwcS-0004jX-Sq
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 14:40:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwVF-0002tH-QA; Thu, 16 Dec 2021 14:33:23 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:51685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwVD-0002CI-1p; Thu, 16 Dec 2021 14:33:21 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8F4E1580436;
 Thu, 16 Dec 2021 14:33:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Dec 2021 14:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+PBCEdj0O9BH2fwa/ex34H+tp/0
 VpiC/KtH0a6wBiLU=; b=jOXLTWceI0AMINl1jp8XEcyxq5gj9qUPBG4n1VRNCBk
 vmtB2C3eXY8fPS0ogTSFt/Dyqhk42NVsuYBFyGlTsSZGopMIVvfFf2omReqQtM0T
 FveULBIMxrJLmpKWbIHUCHpz/maj9IVq4S92c4B0VqJokIC9VtSc7avCfqaFWG4N
 xft+adhb6rHpr++KAvl68Yqw3MEuIP4RbWEwjGR9wE2qeHRgKQL02OmPhv9PixL8
 8YqwmKkrPtuUJ42aLthSSP6bbOyU5foQ9g5c943xmZogGZ9HFPgcLetUxEvBSAUN
 6ms6p2Hf9dkGbiSB1t6XhNxBfyT9DGklMmzSIvhJVvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+PBCEd
 j0O9BH2fwa/ex34H+tp/0VpiC/KtH0a6wBiLU=; b=XaTxP0XIxxR26nFb4A5Zn6
 ZOxahLb7voQGHcNR4ELyRZEt6RZNZe1Jhu58kRBTkEWtJNfoNolIoHt3g7qtYVph
 x+Rumn29FtFK5qKijGYXad1Wko9ZLrm+O2jEHCEwcRZ+uwbJpIX5wwKBnl1Pzwvo
 HOhMyW2QqRbGoijc2Qej8CpAz1AVAHu/GSvynux4GbWoc4xgy9+iaxnY+rPkyA/r
 nfW6Ij5K6rnaTALMe60CtyTwwc1HKILGRl/LMUxsbnCqaqB7lnhTBDfcRdVRFFpZ
 Za6iZcy8XhoN2Ih/HJb/liYszMAAb0dkvwWAsuW4DkexbUzFxgYbuJ8eS5NdaTHA
 ==
X-ME-Sender: <xms:fJS7YQNUP1TGndkdlLFexQf8zPaSZQT60Gy1ylR8KySvirr5_geL1Q>
 <xme:fJS7YW-TKxkInEJkXi11Jk06CPamy_cd2c66-pCT6kjO_9IpcRW02bjVpVYc9R6jo
 t8BTV29Pe0clK657vk>
X-ME-Received: <xmr:fJS7YXTYtwEpa7kuOFrHC2u7hTRVj3Bl88xtzj427QH9OV48vjp7Tt0Dcrxe1PFNtavTrg1LIbpZzBwJJtPOPAuzcY-_a7_YDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeduheelvdfgfeegteefgfffudetlefgfeffkeeiffejuddtgfduteffvddugfei
 ueenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgr
 nhhtrdgukh
X-ME-Proxy: <xmx:fJS7YYvNkk8m6qdtKUIgeT9-WuIVKYx7a5pkBFiRQ9mEJ62boZOp1w>
 <xmx:fJS7YYcqlAiC-yFJFwaeescyk_gEyDDfUauMeMAtJ-Pc8PVZiC5URg>
 <xmx:fJS7Yc0BpowLweTbhU38l3NhfrZ83hFKdaEri44GnIi_AtTV_wRKUw>
 <xmx:fZS7YbtzYKDPNr2do0FXLoF677UMX_0DjgJEZLhHwZ3Y81rm0XyZRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 14:33:14 -0500 (EST)
Date: Thu, 16 Dec 2021 20:33:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/8] hw: Have DMA API take MemTxAttrs arg & propagate
 MemTxResult (part 2)
Message-ID: <YbuUeF+JOEYHxEAP@apples>
References: <20211216123558.799425-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qDnXTCUWzk+LcdY/"
Content-Disposition: inline
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qDnXTCUWzk+LcdY/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 16 13:35, Philippe Mathieu-Daud=C3=A9 wrote:
> This is the continuation of part 1 (dma_memory API):
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html
>=20
> This series update the dma_buf API.
>=20
> Based on "hw: Let the DMA API take a MemTxAttrs argument"
> Based-on: <20210702092439.989969-1-philmd@redhat.com>
>=20
> Philippe Mathieu-Daud=C3=A9 (8):
>   dma: Have dma_buf_rw() take a void pointer
>   dma: Have dma_buf_read() / dma_buf_write() take a void pointer
>   dma: Let pci_dma_rw() take MemTxAttrs argument
>   dma: Let dma_buf_rw() take MemTxAttrs argument
>   dma: Let dma_buf_write() take MemTxAttrs argument
>   dma: Let dma_buf_read() take MemTxAttrs argument
>   dma: Let dma_buf_rw() propagate MemTxResult
>   dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult
>=20
>  include/hw/pci/pci.h  | 10 +++++----
>  include/sysemu/dma.h  |  6 ++++--
>  hw/audio/intel-hda.c  |  3 ++-
>  hw/ide/ahci.c         | 10 +++++----
>  hw/nvme/ctrl.c        |  5 +++--
>  hw/scsi/esp-pci.c     |  2 +-
>  hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  softmmu/dma-helpers.c | 25 ++++++++++++++--------
>  9 files changed, 74 insertions(+), 39 deletions(-)
>=20

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--qDnXTCUWzk+LcdY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmG7lHYACgkQTeGvMW1P
DelsEQgAl/t6+1AEUoPUbH3xBeIQTODZhsHqYWbrmeaXJSFDVnpehxKOKvUycmAR
8M0+fR8GF6/Miul+mBophssnJSIVeBvcUFjE0BasW6gNBQujNdqE7YTYdKNDafRL
FLzVqqTOUK/EAOmNc1+9nRndz+p3zfVSr2UdMqFaS9QKKJPcFO5y+QGA9Z1hnhp/
BfR8oEx5y7BNv0geTJnKDN9XVlbf6bEAleToP6dvGrCqEZwCVOEX8I9q8Kg6+4/U
yyWRarwNN1LMS17TlaQHJ37kahdhz3jTCaWLAnz8nC/aSok1TiyO1YxZFzaVh3og
ZSu3WFGDtmsG4PhjMG1KHUrPuaVg1w==
=ZC0M
-----END PGP SIGNATURE-----

--qDnXTCUWzk+LcdY/--

