Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE637AAD4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:38:30 +0200 (CEST)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUSr-0007Ei-Ih
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgURr-0005y2-3y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgURn-0001NH-Vj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620747442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYDFZpj+zEYq3n2kMbzev8EcTrmfDeKFq77GDOryE+E=;
 b=Zs5blkKHOXwiPg9bwDxCOWA4ZG+9oWgidbaptkDUlktRfKaG2wrX43CqLOnb/+7zGRneR5
 VS3Jo822zT51lfeNKWsiLfS9bvsVto7DHVgdx7XVaFc+xiPpCkupI2hqyi5I+YhitNrJMn
 YexFaMmFn7NPQP0N30AbcmImQF8Bhvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-R_zcaKUvOPuMRm5YrnzHHw-1; Tue, 11 May 2021 11:37:20 -0400
X-MC-Unique: R_zcaKUvOPuMRm5YrnzHHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99DE81083E9C;
 Tue, 11 May 2021 15:37:19 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96F9A19CBF;
 Tue, 11 May 2021 15:37:14 +0000 (UTC)
Date: Tue, 11 May 2021 16:37:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Subject: Re: vhost-user reconnection and crash recovery
Message-ID: <YJqkqYvWAAw3hZBG@stefanha-x1.localdomain>
References: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EpkZhP9CHS3Tbg1c"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EpkZhP9CHS3Tbg1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 03:00:05PM +0000, Boeuf, Sebastien wrote:
> But what about the vhost-user backend initialization? Does
> QEMU go again through initializing memory table, vrings, etc...
> since it can't assume anything from the backend?

Yes, the initial protocol messages are the same after reconnection.

In QEMU's vhost-user-blk implementation there is a special code path
involving vhost_dev_get_inflight(). This fetches and restores inflight
virtqueue request state. The restore logic is called by
vhost_user_blk_connect(). Aside from that reconnect is the same as
establishing a new connection.

Stefan

--EpkZhP9CHS3Tbg1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCapKkACgkQnKSrs4Gr
c8gNMgf+LzkxGK+rAezE6rmKw5eBWnTropxCouXYMwtLqrMhzJjjrxV5GUwiQSyG
08xsNOvph3M+HGbB+EU3YFxBMTqGdvlgcrGdp9GoO6hrEI2eKMUVFtJQGxh8WMcD
u04bc2vdYUnip8CeX7/3t8SQzEpBeJVYwrH/Pewpu8v2vktfFqGu9J7yjAQTHG/A
jl/+2C0v5E0lqq8Pw4eJBy2eMC7UncfItFIRJqB6SkML8AcKzBWRSmm/H8E2/KDT
p4rGYMHdsJqpzviuZiut2AdFqCSWr8VXjP8jgAkYSb4ZB6Bw+XyeN6Z1iXcNmOHh
m6zoZ7b8eN0loaMo9Yxn/d2mjVU8dA==
=4Jtb
-----END PGP SIGNATURE-----

--EpkZhP9CHS3Tbg1c--


