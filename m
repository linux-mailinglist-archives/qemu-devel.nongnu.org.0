Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D199B61528A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:47:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opxDO-0003c3-P1; Tue, 01 Nov 2022 15:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxDA-0003Ym-6D
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxD8-0002Xc-EZ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667331969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ei852sD9EwzpcwK8fHmoGnbMrUKKpFZTUQeLiB59Vuk=;
 b=QYVkXg2yeYn4mMVn7RN5T+tSv0hPh8qXHq9+jUbW2wEjxFA/qM95cn3dN6DGnbV7CFScjp
 j8FtMyYq/Owbu0LFYTillvpU1HiQO4Lo1tE4dtrpctgfPkxCwOUfUK4HAi++FH0C/m7CJ6
 bB1KBvCfHH/jzQtda2Y9Zm8cAiIFRXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-m2TuwdYdPbCT1PmYlr-Jnw-1; Tue, 01 Nov 2022 15:46:07 -0400
X-MC-Unique: m2TuwdYdPbCT1PmYlr-Jnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32404101AA45
 for <qemu-devel@nongnu.org>; Tue,  1 Nov 2022 19:46:07 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E96141511F
 for <qemu-devel@nongnu.org>; Tue,  1 Nov 2022 19:46:06 +0000 (UTC)
Date: Tue, 1 Nov 2022 15:46:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Announcing QEMU 7.2 soft freeze
Message-ID: <Y2F3fcclDXCIksFg@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PR+tv5zNdgC3X/Ig"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--PR+tv5zNdgC3X/Ig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

QEMU has entered soft feature freeze for the upcoming 7.2 release.
https://wiki.qemu.org/Planning/SoftFeatureFreeze

v7.2.0-rc0 is scheduled for tagging on November 8th.

If you encounter a bug that needs to be fixed before the release, please
create a GitLab Issue with the "7.2" milestone:
https://gitlab.com/qemu-project/qemu/-/milestones/7

The release planning page is here:
https://wiki.qemu.org/Planning/7.2

Contributors: Any features that haven't been merged into a maintainer's
tree yet are not expected to be in QEMU 7.2. Please help by focussing on
bug fixes during the feature freeze period. It is likely that code
review will slow down as maintainers focus on the release.

Now is a good time for everyone to add merged features to the changelog:
https://wiki.qemu.org/ChangeLog/7.2

Thanks for your help!

Stefan

--PR+tv5zNdgC3X/Ig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNhd3wACgkQnKSrs4Gr
c8ijiwf/StNPKrFka+pi9NX1BsYH6nEOVHWqYdrdm5JivAIz9UREI9d1g9UkwguJ
+ekMwWP79i3G2XLJgJl487/UaK9CIfPjfpGPta7VcLcDrh39RE2z6Bjz3VB1iCMp
iJgJn6opjlWXN+Ozhu8SdHNiVencIdv1PPlz5tFL7twP9EfBzzDZuSfabgNnrpoH
fdjn4PfomNVaHh/+B/FhLZsQCAvhSq78dqWs9a40K92fObh9A9wmbDBdy3yc8VdY
6XlBf4Zkzxk40PbC22h73Uw7B+vaOqNYsVJ9dQKfJyCq6CsQYTLtsGihbjlSl9gc
DLx2I7nlIHPtdStDDKcA4dgfDnIh4w==
=jgto
-----END PGP SIGNATURE-----

--PR+tv5zNdgC3X/Ig--


