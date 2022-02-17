Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423B4B9C6C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:48:34 +0100 (CET)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdOn-00020b-0X
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKd7P-0005c5-TL
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nKd7K-00032G-EV
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645090225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIrZXwX77PNEDAtLXr0w1k+NFhP3nlgCp8Yow1kH+l4=;
 b=V9/BUJgf8bpFKnykjxFMaLQ0T93z2B2DX191opuAmHZMS+SmqdiFmLVp6WOZgK/3b9MqpG
 1idUj9CIJG34BZtkryKX4xPzxg23BiC9zKRCLV2kowHk5ZvumHCsfUtwRtWCLVPSK7ZRQx
 6iy4hpJJwYSkj2vPnIEcSq+xyxXBFyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-7EYNqP8gNb2UTfi70_l9Ww-1; Thu, 17 Feb 2022 04:30:22 -0500
X-MC-Unique: 7EYNqP8gNb2UTfi70_l9Ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1DF1800D50;
 Thu, 17 Feb 2022 09:30:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 944F75E4BC;
 Thu, 17 Feb 2022 09:30:20 +0000 (UTC)
Date: Thu, 17 Feb 2022 09:30:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Portable inline asm to get address of TLS variable
Message-ID: <Yg4Vq/0Pm1sh0sLq@stefanha-x1.localdomain>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <CAJSP0QUOXwwBzXpBNhGb_uuxM8AqP2mOD_7tSSWoEhErdVnHNw@mail.gmail.com>
 <871r02zgj9.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H7B6bpB+n8nKkdFW"
Content-Disposition: inline
In-Reply-To: <871r02zgj9.fsf@oldenburg.str.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H7B6bpB+n8nKkdFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 09:46:02PM +0100, Florian Weimer wrote:
> * Stefan Hajnoczi:
>=20
> > I'm basically asking whether the &tls_var input operand is treated as
> > volatile and part of the inline assembly or whether it's just regular
> > C code that the compiler may optimize with the surrounding function?
>=20
> &tls_var is evaluated outside of the inline assembly, any compiler
> barrier will come after that.  It's subject to CSE (or whatever it's
> called.  Three asm statements in a row
>=20
>   asm volatile("" : "=3Dr"(dst_ptr) : "0"(&tls_var));
>   asm volatile("" : "=3Dr"(dst_ptr) : "0"(&tls_var));
>   asm volatile("" : "=3Dr"(dst_ptr) : "0"(&tls_var));
>=20
> result in
>=20
> 	movq	tls_var@gottpoff(%rip), %rax
> 	addq	%fs:0, %rax
> 	movq	%rax, %rdx
> 	movq	%rax, %rdx
>=20
> which is probably not what you want.

Right, the approach I suggested doesn't work. Thanks for sharing the
example!

Stefan

--H7B6bpB+n8nKkdFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIOFasACgkQnKSrs4Gr
c8io9gf/aHVuVOnJjbOP+Us+0jh5VndZ3CMA0KVDOpMhDAmUOwVi11i6mOsBw1pK
HIVgJjV6sbkcQCvjPZcsGjOGRrfhewLt40dY4S7TAdf/gxXwQKp4Rq1jZAMU7eGh
h7i6ovlAZUvfY3SmzGx/fyBYN5QJnqzTgfmp+fARb5VPiv56supcGMH1OrWNQSHJ
nG+9Ywedl3btkwFCI0oYrczANE0MW6XtHb4GxHQdqn75gShLvV/Oz69b3u0eoVf+
LJk1WBpI+fSQA0Q5GJoY9Xc1aYxQadQbNoPpN/KOVXer3SAkl/69NkhNe/7AGQpa
gJo6OsKDOK6uMVAX0GNmkA3tElfFow==
=rhnd
-----END PGP SIGNATURE-----

--H7B6bpB+n8nKkdFW--


