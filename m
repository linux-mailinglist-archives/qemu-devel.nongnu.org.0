Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7195F5688
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:37:55 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5X0-0004aC-Td
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5AM-0000DP-Qy
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og5AJ-0006cw-QO
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664979266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjknCiY7fS0EkTEe6FKz2C3WEm2aOpFC++HltQ3Kj6s=;
 b=aQ9NQNUDiopGeDqXuqWGUS/akPo4hnAgzvKzKpF8/PVZ/zDj5bvHt8sEkA0zcCM652KybA
 +53iXigvCmy3fh0P1p/ECopIU6Q6nzyCQVwQdL90HE0Zjgb9uT0Y8MS45fGQXYuuZzsB9I
 I+0wCODcYeoOL7FQkE6MYsbKVnzVhgk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-WmsmwVXsOl6mgNFaKMWTsQ-1; Wed, 05 Oct 2022 10:14:23 -0400
X-MC-Unique: WmsmwVXsOl6mgNFaKMWTsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B2282A59554
 for <qemu-devel@nongnu.org>; Wed,  5 Oct 2022 14:14:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E694112131B;
 Wed,  5 Oct 2022 14:14:22 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:14:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v3 00/15] x86 + misc changes for 2022-09-29
Message-ID: <Yz2RPJnUc9QBKXZ2@fedora>
References: <20221003191504.203181-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3eN2nE/DFxxuph4e"
Content-Disposition: inline
In-Reply-To: <20221003191504.203181-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3eN2nE/DFxxuph4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--3eN2nE/DFxxuph4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9kTwACgkQnKSrs4Gr
c8jaQAgAjrnffacobq6EA12ttro5JgYfewIJyiyDVNpNNXGATNw36EliF8gY36uz
Bffm8KRbhR/9sB9t90mRhEkdtUt98Gu0P65eGdNLD+GfLKi57hQ3pFdQPdTPJ+mA
cUbWZzzAAH62qnetfiCV7+S9Nwa3a6B9lZVbVt4vehLWTRYzgKxYXALEjuoB4Ai/
4ySuRueea8Qwm3fr7YjuUGuqzbxl/Zgyr8Q4jzQ7Q7E3wrzQi0jMnlt3YBXmE2hO
v2MdTeKBdenNyDZxiPwbeiHmxpe58tVX3f5AB/ERR7S8fjrXbgxMK/ZhtKU5y7h7
+LEvRdZiMcDKWow8HcGTiKbzsteimA==
=9aQo
-----END PGP SIGNATURE-----

--3eN2nE/DFxxuph4e--


