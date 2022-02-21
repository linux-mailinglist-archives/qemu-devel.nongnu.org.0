Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358944BDA9B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:43:30 +0100 (CET)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAqX-0002m4-AN
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:43:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAlC-0003dK-TI
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAlB-0007S9-2C
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EO4p5UxfJEVUnsqgCiNpv/XfUPtfNwMB+y4qm4PzTd0=;
 b=PPXw3uY/F6xmgcEPENbiaK6Q2YdIY0vNmyZoyPsF+b3TZr5Iep8f9FUfLEtbZXAcWmhmdJ
 XrnScXcu1hPcIq3yVa+D0OHl+TOF93kOYr1jsHCfC7LUv51tO5I/DTtZUiAvgRd2GAumus
 0dd6qnQjhRRmiuqmJd2jBPsCdiibjhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-ZSAOJXiRM1ihDjGGjoqeZA-1; Mon, 21 Feb 2022 10:37:54 -0500
X-MC-Unique: ZSAOJXiRM1ihDjGGjoqeZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE7B814243;
 Mon, 21 Feb 2022 15:37:53 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08416108F844;
 Mon, 21 Feb 2022 15:37:26 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:37:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Message-ID: <YhOxteVSJd3GpqkK@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6VMLOrkecyPWe+p6"
Content-Disposition: inline
In-Reply-To: <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6VMLOrkecyPWe+p6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 17, 2022 at 02:48:54AM -0500, Jagannathan Raman wrote:
> +struct VfuObjectClass {
> +    ObjectClass parent_class;
> +
> +    unsigned int nr_devs;
> +
> +    /*
> +     * Can be set to shutdown automatically when all server object
> +     * instances are destroyed
> +     */
> +    bool auto_shutdown;

This field is introduced but it is hardcoded to true. Is there a way to
set it to false?

--6VMLOrkecyPWe+p6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITsbUACgkQnKSrs4Gr
c8ivowf7BlQrPh4q2r8yi0iNgoHW8cqg1Sk6scNY5PpqiU2VID/yxdlKPd4POp1I
U7D7Vjrcs2TP9ngPAdcQQ/xZ2CFIrJYCTJToyMVLWbb3kZmBkYXoIvcI+FvRE8Tt
12C2QdP6kTp7kKc9J4zvsJ3yyTBsy0p99gCjjKhy1fsMtoZNhdCKhvA395MQgw8D
vK47ftX17kADcwJRSHnUR6pQv3orC1TZMZUMRXs0aJPaKr+5m8hATxhr7n0MHFiU
QQKmO6MiY8+oBxQ0GUwSihg/y6MUZbTHptbfvSPnzzevR5nZkOjhxdbV2LABBLdG
1uL/F+Iome/dsa7A1KHWrG8XlJGAtQ==
=ChtN
-----END PGP SIGNATURE-----

--6VMLOrkecyPWe+p6--


