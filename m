Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDF50DE36
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:51:23 +0200 (CEST)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwJO-0000xw-5E
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niwGD-0007k6-B2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niwGA-00005K-1X
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650883680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=mA++A3P+7HCXxoIYGCBvzPmkBsaKfW/uJybZWTcJS4g=;
 b=INz77bXHxZ970GT1IjUnzU+K7UhGFPhtFLEhSQ9nRcUmBAUbz+HbozwQKpPqGjh1rv6MML
 eOmYOaQabySAqMYN6fX+p5Bh9QwI6xae7+S/h0UnrI/CjNe87j5pRiyKjdIM4LQMoBxxtj
 6UM+5YByDvUYKOOY6BOAN0rqc/1NnIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651--jz2PYfvM0SPz8krMAY_tw-1; Mon, 25 Apr 2022 06:47:56 -0400
X-MC-Unique: -jz2PYfvM0SPz8krMAY_tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B8A31014A61;
 Mon, 25 Apr 2022 10:47:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A81BE404E4AC;
 Mon, 25 Apr 2022 10:47:55 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:47:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: pbonzini@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org
Subject: Signing QEMU up for GitLab for Open Source?
Message-ID: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fFI4CtBn9Wq+/b5N"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fFI4CtBn9Wq+/b5N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
QEMU needs to enroll in GitLab for Open Source before July 1st to
receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:

https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-source-projects/
https://about.gitlab.com/solutions/open-source/

CI/CD minutes also become available to personal forks for open source
repos so contributors can run CI pipelines without hitting CI limits as
easily.

Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has anyone
already submitted an application?

Stefan

--fFI4CtBn9Wq+/b5N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmfFoACgkQnKSrs4Gr
c8iczAf/fm9a7aMPDTFjs2jvLvYJytdBgsnDvXGzU8GHky3PsscpymWDtl43Bz/a
UPnDo/d2l3uaxS0IlACuwNsfUzjXL76tjZ1mXgFzZ6St9Ux6DqnrBLqZdW0XG1y5
GAThEdZoQMG4ZOBLk74d2J1EIKQxjEUkwPKGz1TdyDnMrsK2ovv4qh5o6zhB7COM
Suqf1vE8Fu2bnVEUKUKiFYvjnFw8M9i5wTN9vUNipUJe/cIQiJJdq4/KehwdKfJP
FuYz5MFwDdZUEaxKcnhFvwTx3JP+Atn4MzJc0JVPo0+onFaRQXvQQTsWEFfnnN4s
oq//J3XogcGRDVULaeKF7GXYW42+aQ==
=RvSf
-----END PGP SIGNATURE-----

--fFI4CtBn9Wq+/b5N--


