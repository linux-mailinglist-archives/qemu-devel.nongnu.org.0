Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CA262DF3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 13:36:58 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFyPJ-00031w-UQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 07:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kFyOZ-0002X4-KX
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:36:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35868
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1kFyOX-0007lS-Bk
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599651367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRbhjqzn1oR7WTB1T3VFbLftD/0bKBwsZHJHL4Amxps=;
 b=RrYGo6U9M5+s9oaQOOiyu4FBdlhb8NAncqkmjp98lK3rClfhMgN2qm+jCxqZJVlTOmXHmS
 EBPNJtjrRkkZkIVNWRdrxzDknuH91idlp2yJI+WbS7Yl/+PxLQO+mkM11kuX22O3bmbowd
 E5nDVhzex2dGkyHrBABbshSjBEJtglI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-9X0x3E28ORSScRIpLZm3Aw-1; Wed, 09 Sep 2020 07:36:05 -0400
X-MC-Unique: 9X0x3E28ORSScRIpLZm3Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC54800467
 for <qemu-devel@nongnu.org>; Wed,  9 Sep 2020 11:36:04 +0000 (UTC)
Received: from lpt (unknown [10.43.2.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C725D9E8;
 Wed,  9 Sep 2020 11:35:55 +0000 (UTC)
Date: Wed, 9 Sep 2020 13:35:53 +0200
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 6/6] tools/virtiofsd: xattr name mapping examples
Message-ID: <20200909113553.GE1377607@lpt>
References: <20200827153657.111098-1-dgilbert@redhat.com>
 <20200827153657.111098-7-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200827153657.111098-7-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Thursday in 2020, Dr. David Alan Gilbert (git) wrote:
>From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
>Add a few examples of xattrmaps to the documentation.
>
>Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>---
> docs/tools/virtiofsd.rst | 49 ++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)
>
>diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
>index 2efa16d3c5..a138549862 100644
>--- a/docs/tools/virtiofsd.rst
>+++ b/docs/tools/virtiofsd.rst
>@@ -161,6 +161,55 @@ in which case a 'server' rule will always match on al=
l names from
> the server.
>
>
>+xattr-mapping Examples
>+----------------------
>+
>+1) Prefix all attributes with 'user.virtiofs.'
>+
>+::
>+
>+-o xattrmap=3D":all:prefix::user.virtiofs.::all:bad:::"
>+
>+
>+This uses two rules, using : as the field separator;
>+the first rule prefixes and strips 'user.virtiofs.',
>+the second rule hides any non-prefixed attributes that
>+the host set.
>+
>+2) Prefix 'trusted.' attributes, allow others through
>+
>+::
>+
>+   "/all/prefix/trusted./user.virtiofs./
>+    /server/bad//trusted./
>+    /client/bad/user.virtiofs.trusted.//
>+    /all/ok///"
>+
>+
>+Here there are four rules, using / as the field
>+separator, and also demonstrating that new lines can
>+be included between rules.
>+The first rule is the prefixing of 'trusted.'.
>+The second rule hides unprefixed 'trusted.' attributes
>+on the host.
>+The third rule stops a guest from explicitily setting

explicitly

>+the 'user.viritofs.trusted.' path directly.
>+Finally, the fourth rule lets all remaining attributes
>+through.
>+
>+3) Hide 'security.' attributes, and allow everything else
>+
>+::
>+
>+    "/all/bad/security./security./
>+     /all/ok///'
>+
>+The first rule combines what could be separate client and server
>+rules into a single 'all' rule, matching 'security.' in either
>+client arguments or lists returned from the host.  This stops
>+the client seeing any 'security.' attributes on the server and
>+stops it setting  any.

extra space.

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAl9YvhQACgkQAk1z5KIM
l5QUKwf/ZBaLC62OyOmi7Ngv4ZNoHuNaNrtyfzD1D2nZCk+UG476FQQovF9zvol6
AYQhfWSdai8I5fJnCSGSt4XrbBxx5Y03zCWb7v6Dg+KoUHpOq+FANhSWKWJqbVz0
xqelEzZFXX28TBgXCOwCJ490F4oWnarlVc/Z4hxTYgnPlGKs4L3oM51WZpLw6Ocs
u+a2E/+GH0+zLJAVqNyvpF7hVNzW2r7bH9uk1DshV6cNc2qnLmYwgsgMDiAcUyGi
M4IH+15pgLZ5KgzGkAAHHLcbFfWT/YcOp0OQHSCoBs7llyKNxfoOe1GE3gpY4ZSa
IgzD+RvwjuxbDGKY3/f5nouQIpVySw==
=LUKL
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--


