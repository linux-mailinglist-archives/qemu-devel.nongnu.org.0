Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8B544B99
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:19:22 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzH8D-0007ND-9H
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzElv-0004Pe-Ar
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzElt-0004Fk-K6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654768088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IknPCi5o3bC7nYHJH2H88BFQ1iautSWK4M0zgTGgBqo=;
 b=GGgZirgR7INF2kOQt73PyBMo3qaGteS1VYb5Js3m3t3eCMFARU/XqnRdjHKvhsc0ewJdBm
 HgoS2CcvwO1uiBJQekdnyw+MoHsh4qvGsX0uMITCgsp+HsenuIIkc3ULd89huBFpBc1Zid
 cddqM9KgZJ9UQDkpsDFxNH0jTlZxMlI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-TUIKYu6mMDiHvhte3-ODug-1; Thu, 09 Jun 2022 05:48:05 -0400
X-MC-Unique: TUIKYu6mMDiHvhte3-ODug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6A033801FE3;
 Thu,  9 Jun 2022 09:48:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7182A492CB1;
 Thu,  9 Jun 2022 09:48:02 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:48:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 11/18] job.h: rename job API functions called with
 job_mutex held
Message-ID: <YqHB0WJByoEkGr2a@stefanha-x1.localdomain>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-12-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CMh/WXcXGKPe7tzD"
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--CMh/WXcXGKPe7tzD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 09:37:00AM -0400, Emanuele Giuseppe Esposito wrote:
>  /**
> - * Release a reference that was previously acquired with job_ref() or
> + * Release a reference that was previously acquired with job_ref_locked(=
) or
>   * job_create(). If it's the last reference to the object, it will be fr=
eed.
> + *
> + * Called between job_lock and job_unlock, but might release it temporar=
ly.
>   */
> -void job_unref(Job *job);
> +void job_unref_locked(Job *job);
> =20
>  /**
>   * @job: The job that has made progress
> @@ -421,8 +427,10 @@ void job_progress_increase_remaining(Job *job, uint6=
4_t delta);
>   * Conditionally enter the job coroutine if the job is ready to run, not
>   * already busy and fn() returns true. fn() is called while under the jo=
b_lock
>   * critical section.
> + *
> + * Called between job_lock and job_unlock, but might release it temporar=
ly.

s/temporarly/temporarily/

--CMh/WXcXGKPe7tzD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhwdEACgkQnKSrs4Gr
c8hHYAgArZmV6Ra7UTyqSF0djBSxA5xTwoISur7mdoPtZqZoz+H+bPR9E45PF3Qf
lXbKr7v13RW+ZmP0zyWDwbBwHqsXI7QPNFEosGNAT6mfuf+zW+tKQxBvgobBODwd
aC1QU3mdVXlt6DKLkmoBQVmxXtdNIwbI4SuHNEsxbQfCAtSQjV5Ct98YDvqnJhTK
DYh1N/91tLYGGjM9/n33RNTKLudago8/8LS85Rs3kn3fsfXWkcXOgWgLXmBets9J
fDae7Mt2Vs2dH6h+lNfuRqQex3xHEtma/kW4X7VC6KFnI+zltsPbXsrSLiv1e1My
qM1VepKDivzpPpRsM8kIIi32q2X1/w==
=xk8O
-----END PGP SIGNATURE-----

--CMh/WXcXGKPe7tzD--


