Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A749B7A7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:32:08 +0100 (CET)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNnj-0004sJ-4O
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:32:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCMze-0001tP-SJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCMzb-0000re-DJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643121617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZOM4RPnn8yiiQbUUM1esl5pyVHRSOi81YVMbzJNGU8=;
 b=jVQMsorV8E82T5Qr9p0a7iDe1cxeQnQ+TVLbpOMsLz0JFnkKEOswRlIK2uYCHRPYcsJk2V
 CfxFnj1P2AtftqwZjei0MtR3JbWSl5wgycsUDqKucWPzFtdvJIUYsLXIjppok0LLQ+JvR3
 YTL0hq2hnloxbneBqqCLHei7ilokCqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-9loS-cXMM_ShjqAi0d172g-1; Tue, 25 Jan 2022 09:40:16 -0500
X-MC-Unique: 9loS-cXMM_ShjqAi0d172g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C82192AB8A;
 Tue, 25 Jan 2022 14:40:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68332703BA;
 Tue, 25 Jan 2022 14:40:14 +0000 (UTC)
Date: Tue, 25 Jan 2022 14:40:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 09/18] vfio-user: define vfio-user-server object
Message-ID: <YfALy5SGmXH8wN0n@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <eb699639ce12bcf4b57c5877cf95515fbb31176c.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OzkWqs2rOnhBE5MX"
Content-Disposition: inline
In-Reply-To: <eb699639ce12bcf4b57c5877cf95515fbb31176c.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OzkWqs2rOnhBE5MX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 19, 2022 at 04:41:58PM -0500, Jagannathan Raman wrote:
> +/**
> + * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
> + * is set, it abort the machine on error. Otherwise, it logs an

s/abort/aborts/

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OzkWqs2rOnhBE5MX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwC8sACgkQnKSrs4Gr
c8hO8Qf8C7cL/fvKoysWrTaUyOYX7UV6RoWhbEiQqXxol9EeMovXkgQu4SmUD/S0
Rw8ZmANNf1aV6mRpOR5C/PpWGauon4lW05eqvbfDBfQAGV6x9+wzWJ5KXAjizi9e
xJqJwKScWETGlQIE0XOOwKQWAIvYS6jFGvD5uUbgc/BzpxZAmpJX+byXjdwVlLPj
zPLC/vxmHA2yKx3pUG6fUCt2Mz/cqe8s50tU6ZxRrc1X4PMfT5RQf32nRXuGfkR/
WXVhAMpPV7JowuzEHlE6bzL0lxCPgWe2pceb0Z3KUTupr3jF+YwcUfmVekeE0vPH
KlA+DpX6b9eD8u7D4ccXfBAFGBBHbA==
=jmjf
-----END PGP SIGNATURE-----

--OzkWqs2rOnhBE5MX--


