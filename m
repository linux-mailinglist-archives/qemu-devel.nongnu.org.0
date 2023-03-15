Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67806BB799
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:24:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSyw-0007Zt-Ih; Wed, 15 Mar 2023 11:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcSyt-0007ZJ-ST
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:23:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcSyr-0001Bb-8l
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678893836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jTxjUwaGNrU997YXmd1Gd07OQ6YXEnGZ+ubJOcPfNTY=;
 b=P7ruHrbm681cjZ6ufsJD1l9DijICSkhq522buP4vgl4Uomr209BhmA+3/pxgS1LP2a/yLu
 ytTjCc89gC4jYTU6f2xZcQnS+GISTzXQumlj9yjiAn5Ue1tflC6fhyDXbKyLeUapbt1/8w
 DM4tsaOdbXV2HriHyWVX7X3U4p8GCTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-em-7fTesP0K7Dia1OiuQ0g-1; Wed, 15 Mar 2023 11:23:49 -0400
X-MC-Unique: em-7fTesP0K7Dia1OiuQ0g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD832801206;
 Wed, 15 Mar 2023 15:23:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32CEF400F5D;
 Wed, 15 Mar 2023 15:23:47 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:23:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230315152346.GB16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P0+YC7C2o+OYytsg"
Content-Disposition: inline
In-Reply-To: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--P0+YC7C2o+OYytsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:21:01PM +0530, Viresh Kumar wrote:
> The current model of memory mapping at the back-end works fine where a
> standard call to mmap() (for the respective file descriptor) is enough
> before the front-end can start accessing the guest memory.
>=20
> There are other complex cases though where the back-end needs more
> information and simple mmap() isn't enough. For example Xen, a type-1
> hypervisor, currently supports memory mapping via two different methods,
> foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
> both these cases, the back-end needs to call mmap() and ioctl(), with
> extra information like the Xen domain-id of the guest whose memory we
> are trying to map.
>=20
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
> the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end will send the additional
> information within the memory regions themselves.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--P0+YC7C2o+OYytsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR4wIACgkQnKSrs4Gr
c8ijJQf/ROItbOzK05kO+CNPMWwO1kNa7SCAoOi6cgj452PZmF2b9cMDlBDfbsL6
jliMKUFGBKkpKxBUD8JcxGlRwcJQT8AwG0KFjCWLwkzNx7BxnrDaXf0I2UgR5E/6
nwHD2R+3K4Ay9QCyIUVrOWmId37SHX2e04d+1+iy7lWdQ1FM5/wc43Bt8aq80oYK
YSuDIuFRXxJdr2Uxr8J9tKgukl3AkoKP8wzFUilzBN9GIMe9wPet8WF7sPwCi5+s
QiQ9CVojLmqiXSDYUrAa2/Y8SypGimyvuy1C3kbNl7i2ow9r7vMr9Vw+/X0uhXb9
Klhmo2NzmGmYT3bQ8RzENH0DYPwCNQ==
=4b2c
-----END PGP SIGNATURE-----

--P0+YC7C2o+OYytsg--


