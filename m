Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D21476E6A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:58:25 +0100 (CET)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnWq-0007UW-QX
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:58:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxnUa-0005au-P6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxnUZ-0003Yl-EA
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639648562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcU5XDrTrxFOfYbTRdpTCA4csGQC8HuOXfd9pykZ97I=;
 b=hAVv5F2lNiyjGppa9WMe9ixgP2yzRgbWxn2wAZ1NJFgO5AqOxuJyAYODaDP1PM6bWuIGpF
 TaBH5+VJtDibSrRRUIpPMEUUWG4u7zJgHA19o0hbRR7V2S9aiHE3qjSpRM/apO7r2qFWhG
 +Nxcb6JpCx4O8jIES8jC26ImFXdO2tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-Hsxi_6MHO1mlQ89KLO1C7w-1; Thu, 16 Dec 2021 04:56:01 -0500
X-MC-Unique: Hsxi_6MHO1mlQ89KLO1C7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB24F1018722;
 Thu, 16 Dec 2021 09:55:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C01092A6A;
 Thu, 16 Dec 2021 09:55:29 +0000 (UTC)
Date: Thu, 16 Dec 2021 09:55:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 05/14] vfio-user: instantiate vfio-user context
Message-ID: <YbsNEI91U7TQVo5Z@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <661e4b32da4b2ae7e0027fb483d74b96faff2cb8.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <661e4b32da4b2ae7e0027fb483d74b96faff2cb8.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7sOXBUiXamwBuqjh"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7sOXBUiXamwBuqjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2021 at 10:35:29AM -0500, Jagannathan Raman wrote:
> +static void vfu_object_init_ctx(VfuObject *o, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (o->vfu_ctx || !o->socket || !o->device ||
> +            !phase_check(PHASE_MACHINE_READY)) {
> +        return;
> +    }
> +
> +    if (o->err) {
> +        error_propagate(errp, o->err);

Missing o->err = NULL because ownership has been passed to errp.

--7sOXBUiXamwBuqjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7DRAACgkQnKSrs4Gr
c8gn/gf/Uc/JJeAb7tFqcL3jcHqKNKxWJgWKTm5CaHCImzkiXmCegS92GNe7lJC1
MmSu1QpIgX+nmWKd5ALHBm2VqgPANbJWqfzoJPWLGLE267ki63j3gxs/i4lNmXO2
zxFSNpQ42327Mm18g7s+jVQXTSJxNoIFoRghc2/oGx+TabirmT5JgoK8AhgH11VO
rkK+vdHo+5gMzU/eanfIQHVTxyuf8uu8YwGFc9xuwfAHGrciQVcKfi+Q+UoSxgkU
WryXeXm/k4MoJ5ouZ+7utKC2qNin7jXebUg/R/ucPtLdNuwVjCj2dm3OCm/jQMDe
HCG9FJ7hkCk12nlb7lR3ozxA0Pj/Xg==
=WI7w
-----END PGP SIGNATURE-----

--7sOXBUiXamwBuqjh--


