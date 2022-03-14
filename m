Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC544D8846
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:37:27 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmlC-0004Mx-MK
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:37:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTlyG-0006vk-4r
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nTlp2-0004Fd-7u
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647268638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qknTPTbkHS67ZgxxOT1slZihXOg/IrdICn+nrjawq8I=;
 b=TOnYtT3dxpql8VbmDZBfd63qHpDCpLT4jU5TJJuQnSUo6/IZsusm4QTUfBYrxxfJ2ElgYw
 HEVIbx3CA4xVwF4lHF/CmX0PqIaDqYbGrP7H5PsJXi+/vm0iFbb4OEWKqtEvtaifnmY81R
 raIG0WDkKgIpslozKoPcGru1vpsp9xo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-a_7I3qcuPm6-CQzr-xbE1Q-1; Mon, 14 Mar 2022 10:37:17 -0400
X-MC-Unique: a_7I3qcuPm6-CQzr-xbE1Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E42363C1EA56;
 Mon, 14 Mar 2022 14:37:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C48C698CCC;
 Mon, 14 Mar 2022 14:37:16 +0000 (UTC)
Date: Mon, 14 Mar 2022 14:37:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 14/16] util: introduce C++ stackless coroutine
 backend
Message-ID: <Yi9TG2/f6baWIiiR@stefanha-x1.localdomain>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-15-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zNjTROfzkLm1tPsA"
Content-Disposition: inline
In-Reply-To: <20220314093203.1420404-15-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zNjTROfzkLm1tPsA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 14, 2022 at 10:32:01AM +0100, Paolo Bonzini wrote:
> +// ------------------------
> +
> +// CoroutineFn does not even need anything more than what
> +// BaseCoroutine provides, so it's just a type alias.  The magic
> +// is all in ValuePromise<T>.
> +//
> +// Suspended CoroutineFns are chained between themselves.  Whenever a
> +// coroutine is suspended, all those that have done a co_await are
> +// also suspended, and whenever a coroutine finishes, it has to
> +// check if its parent can now be resumed.
> +//
> +// The two auxiliary classes Awaiter and ResumeAndFinish take
> +// care of the two sides of this.  Awaiter's await_suspend() stores
> +// the parent coroutine into ValuePromise; ResumeAndFinish's runs
> +// after a coroutine returns, and resumes the parent coroutine.
> +
> +template<typename T> struct ValuePromise;
> +template<typename T>
> +using CoroutineFn = BaseCoroutine<ValuePromise<T>>;
> +
> +typedef CoroutineFn<void> CoroutineFunc(void *);

CoroutineFunc looks like a coroutine entry point function. If that's
correct then I suggest naming it CoroutineEntryFunc to avoid confusion
between CoroutineFn vs CoroutineFunc (their names are too similar).

Also, where is CoroutineFunc used?

> +// The actu promises, respectively for non-void and void types.

s/actu/actual/?

--zNjTROfzkLm1tPsA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIvUxsACgkQnKSrs4Gr
c8jF7QgAqX5b8uamZ1k+kPo9GUxCsShnsOTE+C+pQWp9twPqHWWTGIgSEg2BROKU
zOkB+DM8ZNr79cJIqzjubCwhUi9m1lgEYnYti15mNeq5UmvKf/op/Uju7PZM7Eyy
faP2voGvNlZihU8ob5XvrkWIDyK3wPptI/jYuVL5YS1eh+jQmfARza8rcaHHtXeP
LwNFKfSc9jnlIpo1a2aApe0ZcexSwLQybLvC0RiZejApNK9uQtiu9haYYpSyvtlk
+0cplH6SiVn2tgiwIUD0JYZWqJMazHyC5AOK7x+ZSlf5N4lDnSzeDzYSurFm34QV
NZQMgzGenQGEF/BKIO9ChRwt06HfAA==
=89F3
-----END PGP SIGNATURE-----

--zNjTROfzkLm1tPsA--


