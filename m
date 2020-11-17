Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876F2B6004
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:05:30 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0fp-0000px-EO
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf0et-0000Pj-PL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kf0es-0002JS-0v
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605618269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kNa5O/Hj0HBQuu1Ns8AweW8QzcPZsqmg4/YkfGYf+Iw=;
 b=Xwp56/KT49sbsswI0OIMC0uLJI9JtB+oqXYDcJ2RFaiaPyPiR9XQ9fQImgUBzGARz9Jrp4
 td62IOWG8uOQz+9Dc6v1Cb3ErELwCJtlBDV+/UOBU46fHp9GMfx4HnUBs+zs43I7MFcF6O
 bZC+8zhS/tGlnaSicCH3Y4MfsD1voXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-MyAQ-weGMI6SqUW7jvbcQg-1; Tue, 17 Nov 2020 08:04:25 -0500
X-MC-Unique: MyAQ-weGMI6SqUW7jvbcQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1334A6D585;
 Tue, 17 Nov 2020 13:04:24 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA7D55760;
 Tue, 17 Nov 2020 13:04:18 +0000 (UTC)
Date: Tue, 17 Nov 2020 13:04:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 01/10] vhost: remove work arg from vhost_work_flush
Message-ID: <20201117130417.GK131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-3-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-3-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EVcIhgQsEzAXu06J"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EVcIhgQsEzAXu06J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 05:19:01PM -0600, Mike Christie wrote:
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index f22fce5..8795fd3 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -1468,8 +1468,8 @@ static void vhost_scsi_flush(struct vhost_scsi *vs)
>  	/* Flush both the vhost poll and vhost work */
>  	for (i = 0; i < VHOST_SCSI_MAX_VQ; i++)
>  		vhost_scsi_flush_vq(vs, i);
> -	vhost_work_flush(&vs->dev, &vs->vs_completion_work);
> -	vhost_work_flush(&vs->dev, &vs->vs_event_work);
> +	vhost_work_dev_flush(&vs->dev);
> +	vhost_work_dev_flush(&vs->dev);

These two calls can be combined into a single call now.

--EVcIhgQsEzAXu06J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zylEACgkQnKSrs4Gr
c8hrVwf+Mw0t1WPblvn8yE7/N+vf0dXbjADIoB7GyZgfdmFl4j1KGKlUh0ou0Kqb
Jth2D1ZdGZH640h2T+KEiGahhxXOP5yKL3GuEQcy80cd/93c+jpR4QRnUvg8xCSH
CrVg4cIAuf8cZAUXDjj7a5VeL7z3yI6Diq6iWX6Y8I8JOMtYBdI4DUeLJjUagIiL
qv65Rakq6rUcSDuQtl0uJopuWBM9sdntAUCrJLbBZakQThdBW7eu+L0TUbWI+w2k
iCSNazGQV2yqgRWfN8cKqC2bPG2rVVmghPK3XWCLkjSoNnnEizR/d1BrRLOHs/Rg
YoNm0XOtXilZ2v9oOenhdNIoekvUpA==
=j25G
-----END PGP SIGNATURE-----

--EVcIhgQsEzAXu06J--


