Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1306033CF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 22:11:17 +0200 (CEST)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oksvj-0003T6-HE
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 16:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oksma-0007Mq-Cn
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 16:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oksmY-0000VE-L7
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 16:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666123306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhCrNFHxZ+aVPjMTDUYAKYKJYqkbl7Wgylg5QDXp0AQ=;
 b=FVRQxvRDy8AZv8llTrp0MGKATcCuulspbhoNWsptMDDpVFU+oCpUds2cQUuiqjSw65aZWx
 vVdPLu69YBFwo1CXI42jHYXo/TLc7eJ5nLOlJcc0DPnPbLvn9KIt1ogwiM3HP+xlPaYOmx
 i8aqwp1Io3VwSjux6r1MRqX0qeqIIyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-NcmdzA8XOXyFJlOSQUb4cQ-1; Tue, 18 Oct 2022 16:01:44 -0400
X-MC-Unique: NcmdzA8XOXyFJlOSQUb4cQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CCEC185A792
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 20:01:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC1BD492B05;
 Tue, 18 Oct 2022 20:01:43 +0000 (UTC)
Date: Tue, 18 Oct 2022 16:01:42 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/53] target/i386, scsi, build patches for 2022-10-18
Message-ID: <Y08GJh5BLSpqU2QJ@fedora>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I4dMjJwyhWqzRPvc"
Content-Disposition: inline
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I4dMjJwyhWqzRPvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--I4dMjJwyhWqzRPvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNPBiYACgkQnKSrs4Gr
c8hxQwgAieyXCnd7rndNAutsv1HkDGZgtrrAIZ3qbZt44W5rabCiVosp+l8eu4jT
5qHayUcze5wI+pFlVW6aBNVFjDXavuQIRtVpC3UQWXhOFtER6nEfZL6NrWN6lLNW
umVSwmcaK1LKHz3KgVOmMMihQgecg69unoOBmJ5eTf4ltzQs6A8eZOkbrE+g/qtu
Tc/4bK2A0N0npdhbsWTUrbuUlYivJhCpR8SCzCSLJfdmZC7h8pB93TOreSUszGZz
O/jnviuaKzm2HZixFgz6JkEO/lVu/na2v6CxqpC5cs0aO1qHSqvvUAYTCYJkAyLh
pRZX6T8M1IBQy4L8GLKwMifmj9g1cw==
=fXmw
-----END PGP SIGNATURE-----

--I4dMjJwyhWqzRPvc--


