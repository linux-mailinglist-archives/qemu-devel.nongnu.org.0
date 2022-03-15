Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB54D9CA3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:50:45 +0100 (CET)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7ZU-0003qb-LO
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:50:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7Xj-0002eP-Uu
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7Xi-0000T4-HZ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647352134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jpmk9kZDfBoVZTXxGVsIlrOMCBo0E9d7WgpycrJXU6s=;
 b=btJi56FlZH4/QYPabmsCrBCFf31QimG/TMkSYr9alAewVmthHdIbsc8g3uYCJnTDJYLgKj
 szlJURL2rCZkpeewVOHsKDH/rKRqw1v5Q5drNtyX5EqcLUI1tXKtRhdZvOwv0/yE9keWUD
 FjbmlJKODxxDwkjCpi1d6N4vINvsd+g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-tZxm74TFOuOk7Khe4gQhIQ-1; Tue, 15 Mar 2022 09:48:50 -0400
X-MC-Unique: tZxm74TFOuOk7Khe4gQhIQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231DA3C00129;
 Tue, 15 Mar 2022 13:48:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFFFA426345;
 Tue, 15 Mar 2022 13:48:49 +0000 (UTC)
Date: Tue, 15 Mar 2022 13:48:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 6/6] libvduse: Add support for reconnecting
Message-ID: <YjCZQJh8xrY5lCuu@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-7-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8BLG3zUxwWcNPnDl"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-7-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8BLG3zUxwWcNPnDl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2022 at 06:59:43PM +0800, Xie Yongji wrote:
> +static int vduse_queue_inflight_get(VduseVirtq *vq, int desc_idx)
> +{
> +    vq->log->inflight.desc[desc_idx].counter = vq->counter++;
> +    vq->log->inflight.desc[desc_idx].inflight = 1;

Is a barrier needed between these two lines to prevent inflight = 1 with
an undefined counter value?

--8BLG3zUxwWcNPnDl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwmUAACgkQnKSrs4Gr
c8hhhQf/QjmhAws1OG/fIVeEUy9JRDSJbKXtyOjV3vcKh/+vllVIHC6mPSsi5tHk
cUPrLYkP8UK2nj15KsccVxrTp3JwZ1i2Rx10wM53m6QJDI7hbSr7+3Z3m5Vk/2RW
Cjd2L9+rxs6k53w0L7qHlcd83hvbjl+YF3+uIFbRzl10cEE7zTSOAoGN09BLinZI
h9iWhu6STdxYcJlGOUNVzYy/QbMrlWZ5ibzSHOpRQJYD3GTQ3qkQlVCvnThR1ia8
c/Nqp7NOtsVjA1QlCUbTvgD5cpqRoK3vyXYPJ9KOamzBroymRtgIMHqabQba+l88
XFsg2jmMVVTNqQQjPvU5aFC6bqzzjQ==
=wASN
-----END PGP SIGNATURE-----

--8BLG3zUxwWcNPnDl--


