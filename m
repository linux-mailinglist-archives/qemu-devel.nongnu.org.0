Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671464E38D4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 07:25:03 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWXwz-0000cR-K3
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 02:25:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nWXnm-0007Dj-Te; Tue, 22 Mar 2022 02:15:33 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nWXnj-0005uy-NS; Tue, 22 Mar 2022 02:15:29 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E80975C01ED;
 Tue, 22 Mar 2022 02:15:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Mar 2022 02:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=GsJ0IuDmT3wPjrnnHpLjVqKWhKZuGF
 u/YeGHdJumt+8=; b=k8WfgfobU7hW3giHTvbgyLlmBxMC/uDxwJkxvHNoQgyRcE
 3q1T3DhxANBoCIabtFAGDOb/ykXzRVouAY5zfQkN+6iCqjdQYNnJiErrtCuGcuro
 O2SqLvQas6JX926PN7glkZ85C15InTfxe0u+3f9/bhKKqw99g5foXJDpIjA8z/Mh
 A0i2hMqTEE9A87UBEIP2F5TL/pfPIlssDXgJcExqSPOR6EvaJ/n6i82ixsxdutxQ
 g3FCcgJ0BqXbHzQc9y/FWz9At2d00dU90PnyD9MUQqV4NGU7gtmsAcSV6/BhHZi8
 9+rmcgB1UmJ73rJBFuegAMvb6ZpAz4NGpAULg2HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GsJ0IuDmT3wPjrnnH
 pLjVqKWhKZuGFu/YeGHdJumt+8=; b=bLjc3PkTOW4O9SAF9uAJ4ATP4r4hiDsXC
 QxLLGUWdaqJQQL/oh3uZjVpYDIcA6IMi3SU5R4Ggl6pKMt7bO9LcYLuRyqTeTFCS
 41wCGu2V3MMij0SB9VvJcI5dAwzJh/BY99OR+yi9itTb+JuRLkST0fh5ieTiGpME
 NLi7H6S6VPP703hPru30AL9b3UfbA/CpWEiLx2EQa2/qJgFP6osYkq1g5djUJqQL
 SEeMQuZlohpQnTbyJwUmbnPGyfIbbZ10wBMoqE/WFtAQV5LYvjJKhvQqNs9L9a2s
 KXB2MnQHuCZpy34ENtkKOMzRcZ8408sU2EelkPEyabIAFSJDjKa8A==
X-ME-Sender: <xms:aGk5YhhwuxPg9hgdFT8DEcRw4xrTx-OlDV0vAI-SKk7jhULGEC94Ow>
 <xme:aGk5YmBmmjukpJ_6XKXPiQNhYPj6OjWzpZ2RAysXv-8_WwDtVwwM5HrmSw_EpjYSi
 5Px47XyKXTaU2m7GaU>
X-ME-Received: <xmr:aGk5YhEvmLAAQ0QvcC-TelyRz5_uvo9JyTuJMIuRPmfu7lQENBBDc1-QFmWjv2WreTXawqe9lstHYNM_fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:aGk5YmS8pFH3nQL09fWCWps8hFvP2Z6SBCI1vxSLScJPgPwlnBNCEg>
 <xmx:aGk5YuzS2WR3Nbmt7FlcYpE9FGe4Gm0NdX8z8W3o2ms7HKYpiF26FA>
 <xmx:aGk5Ys5ytT4XTcMOy6ob7t30OW40y5p_gyEgAE1srnTo6gTSAN9fMg>
 <xmx:aWk5Ytn9ZPIx7l7wgqIDqvAEs9gOK0OghoGv_mwAFtDlrD7M1gVn7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 02:15:03 -0400 (EDT)
Date: Tue, 22 Mar 2022 07:15:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 14/15] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Message-ID: <YjlpZUTidq2z/UzU@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-15-lukasz.maniak@linux.intel.com>
 <Yh4QNqgQ+jl+sZCC@apples>
 <YjhxX9r6XLKCM1Fh@kagner-MOBL1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rBq9IKmb2vEu30+y"
Content-Disposition: inline
In-Reply-To: <YjhxX9r6XLKCM1Fh@kagner-MOBL1.ger.corp.intel.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rBq9IKmb2vEu30+y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 21 13:36, Lukasz Maniak wrote:
> On Tue, Mar 01, 2022 at 01:23:18PM +0100, Klaus Jensen wrote:
> > On Feb 17 18:45, Lukasz Maniak wrote:
> > > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> >=20
> > Please add a short commit description as well. Otherwise,
>=20
> Klaus,
>=20
> Sorry I forgot to add the description in v6 aka v7, been really busy
> recently.
> I am going to add the description for v8.
>=20

No problem :) Let's hope the ACPI maintainers Ack's your proposed fix
and we can move from there :)

--rBq9IKmb2vEu30+y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmI5aVoACgkQTeGvMW1P
DelX3wf/RCHF0SmTUvSfO/yQY+IPO4SycWB20K1AoX88r+nkJ5V+WNn9qAhLJWYH
sx8yTFKqHe/xzEuWSDI1kC/LmgKN+4ZyN5E6aUCenlhJq2VDsurppSQCuGgnzOmF
5x50CongCX6GVTNz2OHyX3Z3mZW+AhDpOtgMCmD3YaBpoyI/pbxnZmuX3LgzMPTo
AhZedtUR9JgNpIq5XgnuTRv2gKJt2lSWNNhkWHqpekNPGj5uoEgNPPfCgZonyC3E
W4XsISqapVI2XePS5G+uGd2vtYZWrJSuUcNvgparQG/7mYy2YAaD+QI9jRQmG4rH
duifws/Wp3QXZSiRXyLqxd1ZPtOO5g==
=NEN2
-----END PGP SIGNATURE-----

--rBq9IKmb2vEu30+y--

