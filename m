Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A403408EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:38:35 +0200 (CEST)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmAM-00036K-34
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlzy-0004YC-Jn
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlzw-0001wo-Sq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631539668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NG2XzIV1lSUs+ND3IXfoBRNO1Qsi1q4hO4R8pCvoi4U=;
 b=EHnaVlmyfufUjnZcqhTOKT+OKtP673gsSQNAKn194v8+9TV5+IT7Ewf6wnzqKr66QxT+Ex
 3K+qWc6434V6v6Eyyvq2VtCP/TL0eA0h3sAXlRtQprmzISzIkYBJgVJSjNya7RmDFax+0X
 ml3g1VZbiQ1UucXUgJznpelO6RvhO9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-_5Mees5CNOyw8NfIFz06_A-1; Mon, 13 Sep 2021 09:27:45 -0400
X-MC-Unique: _5Mees5CNOyw8NfIFz06_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E237419200CB;
 Mon, 13 Sep 2021 13:27:43 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63B7D77F30;
 Mon, 13 Sep 2021 13:27:43 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:27:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 3/4] include/sysemu/block-backend: split header into
 I/O and graph API
Message-ID: <YT9RzrThGlWp4E5Q@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BG5cbxCgeU9gqGKG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BG5cbxCgeU9gqGKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 08, 2021 at 09:10:20AM -0400, Emanuele Giuseppe Esposito wrote:
> diff --git a/include/sysemu/block-backend-graph.h b/include/sysemu/block-backend-graph.h
> new file mode 100644
> index 0000000000..3310987b16
> --- /dev/null
> +++ b/include/sysemu/block-backend-graph.h
> @@ -0,0 +1,132 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_GRAPH_H
> +#define BLOCK_BACKEND_GRAPH_H
> +
> +#include "block-backend-common.h"
> +
> +/*
> + * Graph API. These functions run under the BQL lock.
> + *
> + * If a function modifies the graph, it uses drain and/or
> + * aio_context_acquire/release to be sure it has unique access.

It's not obvious why additional locking is needed if the BQL is already
held. Please refer to the thread-safe I/O API functions that can be
running concurrently without the BQL.

> + *
> + * All functions in this header must use this assertion:
> + * g_assert(qemu_in_main_thread());
> + * to be sure they belong here.

I suggest "to catch when they are accidentally called without the BQL".
It explains the rationale whereas "to be sure they belong here" doesn't
explain anything.

> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> new file mode 100644
> index 0000000000..66a7bed9f0
> --- /dev/null
> +++ b/include/sysemu/block-backend-io.h
> @@ -0,0 +1,123 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_IO_H
> +#define BLOCK_BACKEND_IO_H
> +
> +#include "block-backend-common.h"
> +
> +/*
> + * I/O API functions. These functions are thread-safe, and therefore
> + * can run in any AioContext.

"can run in any AioContext" makes me wonder what the exact requirements
are. Can they run in any *thread* (regardless of whether an AioContext
even exists for that thread) or do they need to run in a thread that has
called qemu_set_current_aio_context()?

--BG5cbxCgeU9gqGKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/Uc4ACgkQnKSrs4Gr
c8hz4Af/d13NW23rbN8FPMKGvt0WuHY1rWeh+915yKeh30bwGGjViOeQsgPxcLSf
Jr/ShMNbA8cH1AyboY68Kuuk6mTd1eZGkIQUIR65gdvZ0njK1neQcMzjeyOifiNf
Crx/HUqz0gaSc/LvJATPbK49ofJ9snsp2sxWLlF02Mx7xLpO2XhLMyA7CmTAehIQ
A1LX6tPmgtD3WC1oZk2qwpRREWbVWEhWpIZCHUxNUc5gTCdKLJkvN/+wULeX/CgZ
b0yilKCM6rePFgoBVMSUUb5jvVHfgcTIVdrDDX3hzFTTQ1nk/WP3bzRDy37hjG8n
YurJu2Cf4YUOaIsBX0PYNu7iwGQGXA==
=SL4B
-----END PGP SIGNATURE-----

--BG5cbxCgeU9gqGKG--


