Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D02AF1E5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:19:22 +0100 (CET)
Received: from localhost ([::1]:43718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq1x-0003u5-Uj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcpto-0006Fe-83
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:10:56 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcptk-0001km-Or
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:10:55 -0500
Received: by mail-wm1-x343.google.com with SMTP id s13so2268829wmh.4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mMMsKfJ8hpaPq6xD9N8YKH9KYT2ykEpm60EjnUOP4A4=;
 b=kAIET6Q0ARBe5Krs7wI35WqJ7PtQezAXQqdwiCtq4r4Ko6OXcOVpzmD2XqYR5q7Zh1
 2975TKwvbTPPFlYBDR9ebt8Eh6OpCy61SdMZfpE8ZTs02qA/UCvnHSJNoyBv5wsNuHNM
 96jcVYD3lWLzNLUXNOsL1EDVAW2Rkg+e5z/dpRt1cSlyjLLkQg5b4vhu+qWl8qTyjPH+
 MBZoxsCQFx8/KIxQwVkQx0kMzGKhHC6xKBldxgpggJjsKbAp73ZeNUeK1afSmRvOjGEc
 quDrjL6PZWHn/QllWRawKHoSZM+HrBSMa758eTI8uDhDdO52N9CqHutM9GN6B6kmUfoy
 9lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMMsKfJ8hpaPq6xD9N8YKH9KYT2ykEpm60EjnUOP4A4=;
 b=Sbqy0zfEAWVDfGDordB0QNTQXfIlUdxmGNnvhI/FnGPeZBOpHIE3mgMMQ0bkmpwoOm
 gvQCbRZ/dAuy3svOMjKrux+uTVU5V2ZAvLGBVcg5gXHp/IcUP4TlKlFf6SDa7+qO2sVr
 AySGaFyXcDj/r2Mr8H/3f0ulEXkHEH2dq17MCyTG+7e9+u7pOvyPeE0fwo2y1eQp4Iu+
 xp3Qu+6EyVpGOCfoNyOC4hsMv4QZ+iT8z5HRHfJeQSCm0TdZCtHqavjADgMUgLyhzMIL
 aPRv6GzcHdnlc2w7iSKfbmKYwMpfsgIoH6z9rrP0rO3UwyHkRqEbir5Mzr3T9BCNUlOl
 9NbQ==
X-Gm-Message-State: AOAM5339+iJ/b8gdTynIwfMDGGtXU3DmuBGdxIdi07nA5hTU+f+GruSg
 eng/gOKbp4Tlgk6dAN3iO84=
X-Google-Smtp-Source: ABdhPJxqFn1l3GSk2KoLpftKXaOxUkn0oClE1zWCIhzTDdFz63HZSBO569htLv3wGOjk6bOZJW8fdQ==
X-Received: by 2002:a1c:4957:: with SMTP id w84mr4052775wma.84.1605100250391; 
 Wed, 11 Nov 2020 05:10:50 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id u16sm2429741wrn.55.2020.11.11.05.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:10:49 -0800 (PST)
Date: Wed, 11 Nov 2020 13:10:47 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] scripts/tracetool: silence SystemTap dtrace(1) long long
 warnings
Message-ID: <20201111131047.GA1395688@stefanha-x1.localdomain>
References: <20201020094043.159935-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20201020094043.159935-1-stefanha@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 10:40:43AM +0100, Stefan Hajnoczi wrote:
> SystemTap's dtrace(1) prints the following warning when it encounters
> long long arguments:
>=20
>   Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax=
 error near:
>   probe vhost_vdpa_dev_start
>=20
>   Warning: Proceeding as if --no-pyparsing was given.
>=20
> Use the uint64_t and int64_t types, respectively. This works with all
> host CPU 32- and 64-bit data models (ILP32, LP64, and LLP64) that QEMU
> supports.
>=20
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Suggested-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  scripts/tracetool/format/d.py | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+r4tcACgkQnKSrs4Gr
c8jj+ggApJ1+OMDz5yjYCqMbyAXK1mQHIz1Osre512sRcgwSJ2RGVaxb6MP7U97q
O2olgOw2xJmPVTwmLQKhGiZxqND9q5C0oeKgF58J8+v5cTq5p0fqqRjjbvueG+IN
YjHqE25GOgcx864BPFF9bXkdwUufEDyTwS37H+gzAxCJjMV8zOWPwIag2hkk5OBz
lv4wJDBEERVYGZlrrb6qIPJkyVS+CXGZfPbwmBf95UMjIvJEGgG5wpOre16H4OpI
a5EOus7eyQf+m2JPI/SFekNahfkynwjQ9Gb4pKzUYn8iEohqvi0HLhhqr1Nb+36m
G4rTSJ3++IqdoYfE+uxvpNXq661r/g==
=V/sA
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

