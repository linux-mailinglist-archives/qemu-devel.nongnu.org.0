Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7666752011B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 17:26:45 +0200 (CEST)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no5HY-0001FH-Bx
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no5Em-0007Yp-Ui
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:23:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no5El-0005vF-Ah
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:23:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id e2so19952999wrh.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Z2Wud36soU0xnawyzNJf3vcixb2nxLI6H3vSsojg6ek=;
 b=ZGcwVvsDv24m3QTjE9cmL/UO7sMEngE6BG3mwLSKEpZcuxJL9RkzQibKpjbdGBicWg
 M59eTKr8lZ0QZT+PqH0w3CQ4Q6OVsuPD8Kkzp6UNBUzEMPjh0lz3yjlQ8SnECE1B6aVX
 SzIIHD/9wRjaozxfJ+BBa3HdqS8c+Ad0bTP6SMsY301+7ecOSvvYVduVzPU77daKSa7H
 cCuulo1Gt4E3o/OU9A2y7O7fZvSelm04xw8MT9jvoCYOtC2GBC0fnA44f/eyvlqgdnPE
 HvBkwg0vJ1pBF9cNYFF2dUOGZkBw0l4pJuau08PtEcE+Tnz6HMrppjNSwvYma+qk7LOW
 lAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z2Wud36soU0xnawyzNJf3vcixb2nxLI6H3vSsojg6ek=;
 b=48w1RKQ6vZxQ9OOmHwU3aEEbcqtbxKH372UOX1ngaK4Zp2M4QrEgbSfMkmEBWIr7nL
 noumEyvnVawQjWpv1sgDyCerMy2LeE/bJgl9KgCr39Cw9aBHt64FRnpedHNQe6wktwsR
 Yh69cRI3p2KXpnqvCFld51srGRqG2ylvFmw04OFSXvAbcc0SrkGTvP0+OFZ1k1XMCScZ
 kzoapz+4SmbeNoF2All0XqfAel2eZSs2hd0HazYh4f886/0A3APXHWeY+FE5fLyAcZY4
 B8k0z7scvXuUzi3Hjj3lg5/Jes7NBaGbKGQhQuvUWg+2Fv5kXlREKWoEF9g9QagWF1tC
 8lTA==
X-Gm-Message-State: AOAM532fTBs4PbPCqslHjjxSlCCvBSJs2VjmzNrMaKp4BB1IHmO1q2M7
 Eq5f3UtzgGlt1vIhdTMnlnk=
X-Google-Smtp-Source: ABdhPJyZYW8yupxRWd0eH5waHExB6nmsdrZHT0wazE1CUueje4PRUtHBHd9MgUwWJTRyd9951hK03Q==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr14848831wrw.231.1652109829908; 
 Mon, 09 May 2022 08:23:49 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a7bcc94000000b003942a244f38sm17506255wma.17.2022.05.09.08.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 08:23:49 -0700 (PDT)
Date: Mon, 9 May 2022 16:23:48 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs: Correct the default thread-pool-size
Message-ID: <YnkyBOFNsig0uLO2@stefanha-x1.localdomain>
References: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SQb8FZg/40PNtFs+"
Content-Disposition: inline
In-Reply-To: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SQb8FZg/40PNtFs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 12:20:54PM +0800, Liu Yiding wrote:
> Refer to 26ec190964 virtiofsd: Do not use a thread pool by default
>=20
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  docs/tools/virtiofsd.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,
Sorry it took so long to apply this! Thanks, applied to my block-next
tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--SQb8FZg/40PNtFs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJ5MgQACgkQnKSrs4Gr
c8iLnwf+L/MkEMV9UxAFFOe2dNi5yvYEPPc4MATfYWzp30N2NYxlCB7NSn+Ii19T
A6vbv413fUn5Ic8Z6r+/k5LHkLhuk+zAfYHA2sGgO/xTAuK618e6gV2aTSiKZGS+
rHKjS3CRyKCG3qoYrkffNCX5sDe+6I7nTotfNv9i9Z11TBpTlYV61+AY+Fp4gmL2
hrX3SyuINAMPqln15Ep5iP15U85HgXTpIRQIHO/xFL2/G29nvVoo1/qWEMeO4wIb
fUmpvSXfvPc+9e0E0adMw47dCqbq6abqzm3WwN05RhJYMUafcCPZr6YcSVEBrcCT
tQ2EpsGbdCM2522wWSBfFaqNdzOTCA==
=mSQy
-----END PGP SIGNATURE-----

--SQb8FZg/40PNtFs+--

