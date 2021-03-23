Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE2134612E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:16:23 +0100 (CET)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhpW-0001ck-Gz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhmn-000086-Cz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:13:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lOhml-0007kB-9s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:13:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id bf3so23649496edb.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LqZ6NYKM1ZHssG2U3VL5fh+YTSX3qwMVov8IgQI18Gg=;
 b=pah9zk7mmVM2yav/5cXyEXypMubksftIk/Z053s9xhFTP2h+zHbNgCvbWv30384A8T
 8/QyFrUYnV63NWZPjvl/phGMc+x/QsJfRg+upzK0WXHQZcg/f0nPdBKmWzLmHm8PG/aI
 SBeuCe5P4QuLWbSWHy2yc5fgSGvWE7Gffe7JekluE7eqGiDSvJEyy0FJQFzqqExjYs/Z
 XfbYUs5Vy0xh1KsVE2hngAoXAu4/5fkytCj0L1keksqjlhSSYNfF3gg+Gq6r809UsO03
 gvhuM1UfWD+D81tocLHrCV6TiJ//g8p3N3TUJFzC+3uR/SpxtZqjsNSmqdmMv1stMx4v
 Scag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LqZ6NYKM1ZHssG2U3VL5fh+YTSX3qwMVov8IgQI18Gg=;
 b=nLB49rfBkcyRYpBAqnvKC7G6KTH3Ouyn+4RZ7/fB9jXnt/aojKZMkHQCWFCZnpuLpD
 cGfjGUKhMedPdEkNISwunOm/0KpSSrmWcxgyUpzujzy3w2cC9Cv5/brVrQ3heLs2RTww
 PYoo4hbo9+CLYbf/Wq7VLyVQdFUlTv3h9LXyaLh8oMTijWFEqxjtya6t4Y9BiwnBQpPp
 TXbRin9EXa0po06izydZ/qNwteOJpx8oY5cS6EcTZLViypTZvUhRI97EQVw1Dxyz8Llj
 9LPd77aBaSlgkrtC5luSOOqkAdL4HRhF6YMGq2jYJq27wSnCu6v1cIY9V5LUAtJfYJer
 0Zcw==
X-Gm-Message-State: AOAM531puB2evr85rYLqFs+nhMvI1F+PSGJb/zsDYLKqeH7/99xd+b3l
 rWpbLlUmBDT/v8oJ3e8Awaotc47MSZw=
X-Google-Smtp-Source: ABdhPJzkaeLDusakYn5sDUlYlCNim3HyQ4QOivcMxDHj7JHktQxH2+poWJ0/kSbpIFBttRer6SETUg==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr4830358edc.21.1616508810023; 
 Tue, 23 Mar 2021 07:13:30 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id h10sm13412173edk.17.2021.03.23.07.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:13:29 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:13:28 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 7/8] virtiofsd/passthrough_ll.c: Changed local
 allocations to GLib functions
Message-ID: <YFn3iJb+9YwocFNS@stefanha-x1.localdomain>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-8-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NZ2IL4XgIwRjUiz+"
Content-Disposition: inline
In-Reply-To: <20210319132527.3118-8-ma.mandourr@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NZ2IL4XgIwRjUiz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:25:26PM +0200, Mahmoud Mandour wrote:
> Changed the allocations of some local variables to GLib's allocation
> functions, such as g_try_malloc0(), and annotated those variables
> as g_autofree. Subsequently, I was able to remove the calls to free().
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--NZ2IL4XgIwRjUiz+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ94gACgkQnKSrs4Gr
c8iDAwf/eQnemVSXGzsv/9vRihLjp5LvN2ODXrY5QkcDPaKBxXatzETtentcj6kg
3JSzzhYERu/J83iZnaD33S1l03ynhKTzPjIwRC+Rl+tU3ujJU7QPYT0ItRTUZ7Iy
DQYIaOVHdgSom2z2HPit3ZmJGA2Mn0ncAFKV4CPD2PHooTcL/HP2sholjNKfNwuF
cHb2+RBNIatSfMDDlqXDz3n9R8xOAp9y4SFJkyzOzehTvdxAomh00MdoDIvp6nhf
bJxBBwSpltK2Frfu5AprA9rXv+xRtRuwILM5gnxGkFw5BMhUxzXDsNkaEDxFb+Yb
zAHd1rYrWKvGbMEZ4IW53wMDILzrqg==
=5UMY
-----END PGP SIGNATURE-----

--NZ2IL4XgIwRjUiz+--

