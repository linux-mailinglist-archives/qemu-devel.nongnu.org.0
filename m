Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD4615081
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opso8-0007pu-8X; Tue, 01 Nov 2022 11:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opsnu-0007ox-DM
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opsns-0006Vs-1Z
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667315026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CwQ1fBVVRIVFHw74XFc32uIy9izVWGTgibLz8OMncgo=;
 b=LIOIPudu5T6sahEyMO2MVYyo/4pjCzjrezlCluTRdXvywhU0u2qi9F+JVmfzlj2Kct9U0f
 VqoB8gcpF6qPcfhXcNuQrnVMNfZ4AMI+msmjikqm5mhUbA4aNm7ari8iOMivLg7rNz+vhf
 vE+aJX5Rf0SXjzye7Lpo1DBWqT5hKQo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-9DzB-2p9PCmF7ka39sDxEg-1; Tue, 01 Nov 2022 11:03:45 -0400
X-MC-Unique: 9DzB-2p9PCmF7ka39sDxEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0578855449;
 Tue,  1 Nov 2022 15:03:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 119AC40C947B;
 Tue,  1 Nov 2022 15:03:42 +0000 (UTC)
Date: Tue, 1 Nov 2022 11:03:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v2 00/13] tcg-next patch queue
Message-ID: <Y2E1Tc99DsaCmF+G@fedora>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8sxlBlbLQXFrHQGe"
Content-Disposition: inline
In-Reply-To: <20221031215723.414467-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--8sxlBlbLQXFrHQGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--8sxlBlbLQXFrHQGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNhNU0ACgkQnKSrs4Gr
c8gm6wf/eDz+2xEGFXlHTMuRhIYrKhaOFYD+Oqx7t5Gnp/WcnjUibmfMNmDNo28P
Z55UAOQ7YPFWmCT1EbwT00iSMwp0g9nSvniBr9d3dgARGpZA5M4bsjNkRnsARLqN
5vC8AVJFhouDBKi42rmqs9NwiXjWzCRYmK0HO9Y2p7YJKVr9lHckd36bt6LpBvpb
GJcTmA0kjdlwSBAlHFjYzUw7J2Tbj6No2POykfwIJl9+p/B9a02zjNqljThlmyxF
hU38Tj8YpljYGkrjGwsCqayNhIwU+41Fkgr9vzzZnykzAjaCNbeF45wPvrNiUSpT
0pUT4cRrGche94aGsrnFWkNfb9/xlg==
=JyC4
-----END PGP SIGNATURE-----

--8sxlBlbLQXFrHQGe--


