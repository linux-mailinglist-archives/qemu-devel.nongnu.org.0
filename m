Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6355E6A640E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXA34-0006uO-9q; Tue, 28 Feb 2023 19:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXA2t-0006ty-PN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 19:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXA2q-0008M1-EE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 19:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677629405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFJrXXLnosKcxnC4rBYX4KWr9paoukNnKRynu+LQU2E=;
 b=cCdHyiZsmrsNbSjf/Us6V7zB2V5CIrzq1XD9Ypt1F7rvApG5/vZRO4YlJNsaFva50vWzyE
 yZDKcE9CHx2JQW1gJPH9BgGzEErAaOwQMVL9SyEKAggvtabQnK/O0UqPjcag2wyCw47mGG
 YSMg/V7XnuS5PtRtKa2+/TLJhkp6+us=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-HWY_xUATOGyDdemJHbBq4w-1; Tue, 28 Feb 2023 19:10:01 -0500
X-MC-Unique: HWY_xUATOGyDdemJHbBq4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649AC811E9C;
 Wed,  1 Mar 2023 00:10:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6A13140EBF6;
 Wed,  1 Mar 2023 00:09:59 +0000 (UTC)
Date: Tue, 28 Feb 2023 19:09:57 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <Y/6X1buYOXDpaXO0@fedora>
References: <20230225163141.1209368-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4V6I9W9NLLmP3ARl"
Content-Disposition: inline
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--4V6I9W9NLLmP3ARl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 11:31:37AM -0500, Peter Xu wrote:
> [not for merging, but for discussion; this is something I found when
>  looking at another issue on Chuang's optimization for migration downtime]
>=20
> Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
> way.  However we didn't implement them with RCU-safety. This patchset is
> trying to do that; at least making it closer.
>=20
> NOTE!  It's doing it wrongly for now, so please feel free to see this as a
> thread to start discussing this problem, as in subject.
>=20
> The core problem here is how to make sure memory listeners will be freed =
in
> RCU ways, per when unlinking them from the global memory_listeners list.
>=20
> The current patchset (in patch 1) did it with drain_call_rcu(), but of
> course it's wrong, because of at least two things:
>=20
>   (1) drain_call_rcu() will release BQL; currently there's no way to me to
>       guarantee that releasing BQL is safe here.
>=20
>   (2) memory_listener_unregister() can be called within a RCU read lock
>       itself (we're so happy to take rcu read lock in many places but we
>       don't think much on how long it'll be taken; at least not as strict
>       as the kernel variance, so we're just less care about that fact yet=
).
>       It means, drain_call_rcu() should deadlock there waiting for itself.
>       For an example, see Appendix A.
>=20
> Side question to Stefan / Maxim: why do we need drain_call_rcu() and what=
's
> its difference from synchronize_rcu() in API level besides releasing and
> retaking BQL when taken?

Hi,
I haven't taken a look at the patches or thought about the larger
problem you're tackling here, but I wanted to reply to this specific
question.

It's been a long time since Maxim, Paolo, and I discussed this, but
drain_call_rcu() and synchronize_rcu() do different things:
- drain_call_rcu() is about waiting until the current thread's
  call_rcu() callbacks have completed.
- synchronize_rcu() is about waiting until there are no more readers in
  the last grace period.

Calling synchronize_rcu() doesn't guarantee that call_rcu_thread() has
completed pending call_rcu() callbacks. Therefore it's not appropriate
for the existing drain_call_rcu() callers because they rely on previous
call_rcu() callbacks to have finished.

Stefan

--4V6I9W9NLLmP3ARl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP+l9UACgkQnKSrs4Gr
c8hnawf+NfOS75RRe25IQh8aRko+Dq9NefBWplFFiKIpMWwe5sc28AGajHEmLQUA
R8TMsfkqjGkBOtsqzh8bH72WVvW3q1r6cZenMCEGd7O+kecxUPcEfQohDCGlx2zG
KF6LLGldotDnwOMzjhB/bjWT+xGms5N0g1IMvY5SIFL+XAMrTlZe+ShvzBsR3ClH
7PqVEscLWOun0ubXugs/CVZfSfyYvYEELR1em2XfSUIx1k6GGJB3BrS0Bqc8G7po
PVu5kPkNruxZO0eU1RgcxwrlKErk/gSyz5vJwgsK/nIrtxeKBdPXpO8+lU8LhDvX
0IxssB3+r3JDs20ftYU5agJt+WGoLQ==
=EUUq
-----END PGP SIGNATURE-----

--4V6I9W9NLLmP3ARl--


