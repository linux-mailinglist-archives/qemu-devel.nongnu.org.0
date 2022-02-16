Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F84B9360
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:50:51 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKSCI-0003Ri-CC
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:50:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKS9r-0002E7-JD
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:48:19 -0500
Received: from home.keithp.com ([63.227.221.253]:33882 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKS9o-0001WH-8U
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:48:18 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 633053F320D7;
 Wed, 16 Feb 2022 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1645048092; bh=okYTv/yyFeYbTwC6iQme4ZJjL3vanQk4riVyPvOY1Ng=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KhMql8A9bojM9OlZXbsEcIDKNXw8JEYdUYQ+uUvJ0IaKmQqVBNJ8M23tedygtKlUR
 SkWgSVqWAqdw7FNoabLZLrOPZgiLpWCXua9cMLcGIAQJoIv5hs/VSTjBP/jIo2ShQ9
 m9YLFCbahQ4aKX6E3Vxra3QOZ7w1oy87dTZPyJBzbV2ycavzu3J50UIJunc3rjB4QP
 MhIxgYU3wsmiPQ/3RGga+lTqeoBMN15Nndh3xR+ZhNSIeEbRvMTHVCUTV+rROqOYVG
 gSr50HFPVuE1IqCl+EyLZxjm0UyJ7bA6kjV4qUiLC0HqPJL/At0dKPrZMildb0AePm
 yiDvOB/HyQLjQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0mZtNiaAnFk1; Wed, 16 Feb 2022 13:48:11 -0800 (PST)
Received: from keithp.com (koto.keithp.com [192.168.11.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 84C183F32077;
 Wed, 16 Feb 2022 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1645048091; bh=okYTv/yyFeYbTwC6iQme4ZJjL3vanQk4riVyPvOY1Ng=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=A2KGRPy/H3DY9fiMYVDPRJTJeXwmj75tFPNY4b4Xsy8N3yFcoTGRQCPEvBEFRBA1y
 Qb2rHZbGDziX1byayw+hfLd+c2MuiuFQb/NCoShIlmrijI047jNduQV/RzVfhVYyGl
 8FmRaB8Vcfdju1sSVG9R8XxTKLA5CTYaYjTximHhqBv6D+SCwaSqzFeJxUvPk0gTtI
 WCo5VYUsyF1KsVZhYMPzuXI5o+TlBeM99T9xihPgOW6t9jNYZvUdPHqQenYN73V1nX
 epZuCGJDRaZNGqlOTtk+yjfmnCuTbjHX+acik8Ul//kcXFaPh1VPend0krsYyNao/j
 Q23DNjIlCSkMg==
Received: by keithp.com (Postfix, from userid 1000)
 id 411CC1E6017A; Wed, 16 Feb 2022 13:48:11 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tcg: Add 'signed' bit to typecodes
In-Reply-To: <6786d609-493a-5ff8-aa75-fcaba0259b2b@linaro.org>
References: <20220216063945.1986257-1-keithp@keithp.com>
 <6786d609-493a-5ff8-aa75-fcaba0259b2b@linaro.org>
Date: Wed, 16 Feb 2022 13:48:11 -0800
Message-ID: <87wnhuzdno.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Richard Henderson <richard.henderson@linaro.org> writes:

> The signed information is still there, merged with the typecode:
>
> #define dh_typecode_void 0
> #define dh_typecode_noreturn 0
> #define dh_typecode_i32 2
> #define dh_typecode_s32 3
> #define dh_typecode_i64 4
> #define dh_typecode_s64 5
> #define dh_typecode_ptr 6
>
> Note that is_signed is bit 0.
>
> But I can see that dh_alias_s32 hides it -- definitely a bug there.

Awesome. I suspected that was the underlying cause -- missing some of
what dh_alias does to the values.

As I said in the commit message, I looked at just filling out the
dh_typecode_ set to avoid using dh_alias entirely, but that actually
turned out to be a more complicated patch as you need to handle 'tl'
types, which are machine-specific; something dh_alias handles.

Either way works; I took the path which involved creating less new code
(as dh_is_signed was already written) to try and make it a bit easier to
evaluate the result.

Thanks for taking a look at the patch; I had a fine evening chasing this
down starting with a bug report written in an embedded python dialect :-)

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmINcRsACgkQ2yIaaQAA
ABHMmw/5ATsjy0qc7aEpllvzkGiUzMYqYLam4f+MAbbglsSSBJyVkHiLT4ezGPXm
1aIPT3N1LSxaJs/5oGS6zCopDteEfn7GIZQlFjNPToAWRQE8wg7WUTTUv8Eo0xAU
0cPYt8AHAWS4ADLz6PBiyP3A5UdUU9S8041t+JzuLYnTprFO9XGs8goC51bxYayb
KNQfzaBfeUvaAdceCZpeet0MDmr0BL6EfxmlYQLBZ0iPzltZ4zbptKSE/Xe8EoGa
oithX/4PcsVDQsmqNk9+kSbiv+/70iOrtWXmNZtZycbCatOTaYye0lmqTp2rCLiv
N1ojRfNQgD7orfnPCK+OtMo/QkjcwnAA1/2VZhAI92uAWvGpuOeVZxuVGims/BVy
iU9jtzdPgjVV6Ry2VD1d3FrPqH1A4cb3TrAxJCPG8F1mySDByepqZ3eBCy2WSGYC
8iazU0tAYzWsINE/iHsLhPlFBXV6xeRW3hZZL7svLk8L4Wc+3Mgu7uylU8sOH9jR
WkTWdWT5G9sqXTd5H0ZUxs6/v8tMTaVMmBPerHg7UIY60SnW+iScKJoZsV/U2E2c
1KxHo53mQWv7w8FYIGLH+yPpViiy3Oa6XWLkX9RdMaTq7btJI4Vv/Aidec5Xe+d8
SaMBydT5ccGQgmwiJKTluLPRTKdGfveBO2rSEND6ypozP978CZY=
=3jgT
-----END PGP SIGNATURE-----
--=-=-=--

