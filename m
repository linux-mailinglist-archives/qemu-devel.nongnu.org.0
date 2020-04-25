Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7F1B8519
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Apr 2020 11:14:01 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSGsq-0001ZQ-U3
	for lists+qemu-devel@lfdr.de; Sat, 25 Apr 2020 05:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jSGrv-0000xE-Nn
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 05:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jSGrt-0006gG-TA
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 05:13:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jSGrt-0006V8-As
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 05:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587805979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nPcfpOh8E/ms/mruBFQqIRs8FMvXA1tMYgNKBGfA+vU=;
 b=T9mU6ZmV0VL+84u8ck+OFAAvdnVdG23Tp4YaJu+uGb7pQxW3dJ5SdB/cSN7/xawx5KZa+7
 mnH3APhrxNoYj5ZQ3nUHMUAXuuyYu24TzkqtBUiKSg+DA91HUNp6mck50wq0No+QnxMcSI
 DBQqiq0OE8ip+Gts1vU/6x1waaOnZf0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-WlBvQmu2NLCZskPfOrriGQ-1; Sat, 25 Apr 2020 05:12:56 -0400
X-MC-Unique: WlBvQmu2NLCZskPfOrriGQ-1
Received: by mail-wr1-f69.google.com with SMTP id y10so6417771wrn.5
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 02:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=VYjCd/RqaDpYqL0bPzvK6NSA5as6Z2M3Ue0UMPJvhlE=;
 b=IRIm3cJBC5GLAIAIpIFBnQDI4EqvlzrGsAyBgm0GWHqOwHqxEABLOLZC6bQt0Ra5J2
 3tx6rqgtrL27cHTkiJvdz1o2WLCPJ2NPY+dprMs4Fvao7C9c2O6yh//bcn7U5zgMp9Cm
 BRNAPzyiOX/gkbWxV7PuUOtflcatoRZV3DP8126zy0xKV5Xy1MU28qBHhZcgAdwhUMHs
 70XatzfB+w2uWmT/H3rU2d0G1TTBccz2xsAF8zySU6T3mnIVNfAIKxXxJyMdiGcsnbVj
 OWQDCTA+EnkOSHF34P0ZeJOy9f9K6orjCHuVNI+cM6Gz2Po7EBtceulvaLz824SXZlYQ
 /B3Q==
X-Gm-Message-State: AGi0PubiAyHXS+yOM0Bz2fBvAKaDKp1hLYtNaB5Q0R2gaCwyPiOtr+jv
 07/F+DErgfDovIiepZIBMEVOgZ61r5QdGkiA0dfUxpYEBCDzIJStlhGQvP8QGIqBm/KdHPdf9+y
 +RxptYBB3A9ltfUA=
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr17410456wrw.198.1587805974943; 
 Sat, 25 Apr 2020 02:12:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLa/+juMsh8HAw01g9WCzdEqJ8V8ERuSN0hV6an2DkcGkYQZF4WO8mcSVuaYgi1nUf1vmVsIg==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr17410439wrw.198.1587805974674; 
 Sat, 25 Apr 2020 02:12:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926?
 ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
 by smtp.gmail.com with ESMTPSA id p6sm11833457wrt.3.2020.04.25.02.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 02:12:53 -0700 (PDT)
Subject: Re: [PATCH v5 0/2] Replaced locks with lock guard macros
To: Stefan Hajnoczi <stefanha@gmail.com>, dnbrdsky@gmail.com
References: <20200404042108.389635-1-dnbrdsky@gmail.com>
 <20200424105037.GC174193@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f82fa018-0022-3b9f-402e-3f402115adb0@redhat.com>
Date: Sat, 25 Apr 2020 11:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424105037.GC174193@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4wVw6fv0b3DKMcJ9l3USncQMdw2QIBrUj"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/25 05:12:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4wVw6fv0b3DKMcJ9l3USncQMdw2QIBrUj
Content-Type: multipart/mixed; boundary="tnbDkNGwV2KR638fZyqK7UQ7CJPVXV14v"

--tnbDkNGwV2KR638fZyqK7UQ7CJPVXV14v
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24/04/20 12:50, Stefan Hajnoczi wrote:
> Paolo, hope you don't mind if I use the block-next branch to merge this
> and Simran's patch that depends on it.

Absolutely not, thanks.

Paolo

> Thanks, applied to my block-next tree:
> https://github.com/stefanha/qemu/commits/block-next



--tnbDkNGwV2KR638fZyqK7UQ7CJPVXV14v--

--4wVw6fv0b3DKMcJ9l3USncQMdw2QIBrUj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl6j/xUACgkQv/vSX3jH
roOr0AgAqf2u1EXZiNNdpCqegqWVXNG6UstNK6tBuGnCfWPg4SWRNjfzVj6jwL3P
+9DcV93Fh2rBwjmh6ZcLwbK6lc6C9/iEMChONsmcp3vnt4zZSC2F3CWYnTVTpwEn
SaQ9QmDfnf64PzLY8OGTU8LEDLIkLxLAxi0ZwRnyy9ql4B7prPiEcVfkMdXPcohy
EBCcC/SJkETYksrBOEJXjNmLXBs/OPNWfKqBof5cEBy6/aT40Zv4ud3OwkotPJEh
kmlLUQBzhvSwPtHf8+TSqffkAeT32/I9dC5n2fWvTf//fLI+bCX1PZ9GJM+YyBJ7
tO/LIRybAbicipJ3zemtvA0yYhhnmA==
=EIbD
-----END PGP SIGNATURE-----

--4wVw6fv0b3DKMcJ9l3USncQMdw2QIBrUj--


