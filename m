Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B15FCD22
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 23:28:31 +0200 (CEST)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oijHC-0007aF-N6
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 17:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEa-0003SW-GN
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oijEY-0003hx-To
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665609946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nt9/RL0Q2HuNiLuoJsZmgt1YjpePzAfWA5WiBsNDMuE=;
 b=Yu8P59gxk0/x+9xwF3x6rjaSfFe7om1cyvEaG3dReJtLa3LaJQz2AiFzoSWgQK/k+557Ro
 A97mwKc26M1ATnnCM0G8M+AAVTzf+EQmsksXRWUpXRRV7Fuh0xFXFngTh7hCYECiW8ooeE
 BkFyw5YOEqdYegaRQgP9qdAcwsxlxMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-KfQypZ3WPHemlOYxtfHmeA-1; Wed, 12 Oct 2022 17:25:44 -0400
X-MC-Unique: KfQypZ3WPHemlOYxtfHmeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D65B811E7A;
 Wed, 12 Oct 2022 21:25:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F01E492B0A;
 Wed, 12 Oct 2022 21:25:43 +0000 (UTC)
Date: Wed, 12 Oct 2022 17:25:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/50] Block layer patches
Message-ID: <Y0cw1WKUAFDtIKJ7@fedora>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3aFAb/Das5vpt9//"
Content-Disposition: inline
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


--3aFAb/Das5vpt9//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--3aFAb/Das5vpt9//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNHMNUACgkQnKSrs4Gr
c8gwQAf/QhdIm9PF++QmKv2qA3XCOoCywjo7Ib9tEwxMi5CUksXKQHgPeZTAURy3
KQ0bTmGau6QCV83xFAFjABTnst1bfjK8DMRYXZcWCXlzbWKhuSjWVONW3KUvjqGp
V6rPvTfzSZR9VwylGSAwyPUoYjOSdNNIhKxYO1orkeF+I63ISTbNNpb0somgdBaL
eeW4RqCe8xBHilb0UDzwtO1yRydSHwZa8BzGifDgUByFr+QRsow83Q0WMIPsHux7
XrS9iTgyNtlOnQQAIldE8i1keMMN6rSGGPCvlftTmg14mKQBgRkvU8b/wLfAlYwz
/+N+x7rOpkI3TmMgOVgiuypHS91UmA==
=2P98
-----END PGP SIGNATURE-----

--3aFAb/Das5vpt9//--


