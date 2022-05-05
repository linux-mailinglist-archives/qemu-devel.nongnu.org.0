Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5EC51C426
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:44:41 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdei-0000eb-51
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdZw-0004ig-SB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:39:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:57404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdZu-0003pj-Gi
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651765181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YhwLNBwLrv9wFBbau+a9JYsoagW2fKSqReEwd5joK8=;
 b=ELENmjX+O6oiXHax3g3mrt5bfv5OnLQzpBnRthnRkuJfrj7/FVi5Kmk/mfypPxppIHDA8N
 fQo4hiCMW25+dWcokBbc+yEVI5GqYW1xCVA9TwnsV+KHNlObzyl0m0UW7ENFIKVySEUtKq
 G2S1DRb6XFHPx3Crj8Zd5CS1U4l/mKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-FlmENFaoNh-9TE4GNiyZHw-1; Thu, 05 May 2022 11:39:38 -0400
X-MC-Unique: FlmENFaoNh-9TE4GNiyZHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87308185A79C;
 Thu,  5 May 2022 15:39:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 094B940CF8F5;
 Thu,  5 May 2022 15:39:36 +0000 (UTC)
Date: Thu, 5 May 2022 16:39:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 06/17] vfio-user: build library
Message-ID: <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9tBX+AQwUWOqDDfM"
Content-Disposition: inline
In-Reply-To: <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9tBX+AQwUWOqDDfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 10:16:47AM -0400, Jagannathan Raman wrote:
> diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> new file mode 160000
> index 0000000000..030d2f6e79
> --- /dev/null
> +++ b/subprojects/libvfio-user
> @@ -0,0 +1 @@
> +Subproject commit 030d2f6e7978b8ca7577b81d4f48e2771bcd8f47
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 4b20925bbf..300833d8e0 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -23,6 +23,7 @@ RUN dnf update -y && \
>          capstone-devel \
>          ccache \
>          clang \
> +        cmake \

Good, CentOS 8 has CMake 3.20.0.

> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index a3b38884e3..7c6131686a 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>              ca-certificates \
>              ccache \
>              clang \
> +            cmake \

Ubuntu 20.04LTS has CMake 3.16.3:
https://packages.ubuntu.com/focal/cmake

That does not meet the minimum version requirement in this patch series
(3.19.0).

Please re-run container build to check if Ubuntu actually works.

Hopefully libvfio-user will support meson and CMake can be dropped from
this patch series.

Stefan

--9tBX+AQwUWOqDDfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz77cACgkQnKSrs4Gr
c8h77wf/YsaAzEquAib9+YfPNvMVOth50cymDkrzhZMsCOLC6opSaE0/u3NK40Mh
qMoTBt/mSXPfAWjbAS0U8OM6fNOWWmTKhuabJBM7RXJW0+eUJ9Aikt+4AAxzFaDy
Hy/Ana2wT8Ay3CB+kCD0xTcBMr8MdAQaNxQ24Tg/HhywYcQVSt264r6CV7zFyhXv
ET6usnkNVnHqWkEugDMKDkiqyFSQpL/cwWE3R8xZM+q1hzwdO3JvbL2LD5sE244/
57WJjD2g2ph+484NPJMM3nKuzmhO+6/LkfgZWR4rALMleFp2Ej1rZ5pVIvwHNpqi
Tn0z1pbI1QQyBfMnf+QMUVaMa6ptIg==
=GFtV
-----END PGP SIGNATURE-----

--9tBX+AQwUWOqDDfM--


