Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E684046E9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:20:06 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFHz-0000ru-8V
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOFFs-0007J0-Tw
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOFFr-0004Nf-JB
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NfqIYyoT8Rtz5lO9NFn5SUJwR1RPH1Ue0qHwmETLoeg=;
 b=ZgN8KOQBx7w0DC4SO26/ztEq1V7Sf6Tk33jeW5uAZ9DWeOv0Vm83jw4paNLOox0G4M7the
 +V+pN752gwdVNREq84Scoj1GG+P+vhJH/u9pRD4YrxPUBllcAanmHkVcHvUJeu8nn04Zbr
 dXjaJSNSh580GBq3tok9yCJ2m23p9+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-0zpYKYk6OyOZkaHQTuWefA-1; Thu, 09 Sep 2021 04:17:53 -0400
X-MC-Unique: 0zpYKYk6OyOZkaHQTuWefA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F3B718D6A2A;
 Thu,  9 Sep 2021 08:17:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23CDB100164A;
 Thu,  9 Sep 2021 08:17:47 +0000 (UTC)
Date: Thu, 9 Sep 2021 09:17:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Message-ID: <YTnDKxNREaBgpXKI@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="il4NOTdT20Qw/IBC"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--il4NOTdT20Qw/IBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jag,
I have finished reviewing these patches and left comments. I didn't take
a look at the libvfio-user's implementation.

Stefan

--il4NOTdT20Qw/IBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5wyoACgkQnKSrs4Gr
c8hs4AgApVZchT9ZynzCnLBAKeiF29XsRe+U4N1d78DrDQgTRTMZ8F/x7drCo1wR
n5Jqy4CNFT6L6NemoWM9WdpuokttuT4xg2weNcbwZ1iTcfzAEaRsnuEUarWTFcxB
5SjGakb9NesE4G+/OiMD6xlp+qf6xYaYK8fVNjbU7wtz9qfvj2/Nk/I1FOp7c1GQ
0jkCDRnQn4z4uvyzey+2msxy5qBzuPEV/zh3YywcO76ptOREoWVLgJlVs9HWMWBW
hGBCMwBdnfYHczIdks6s8eNszP/m1Qq+k9mHpVGeiBobq/mFNbtXUDt+viVmIOLb
Tlkaznor4f0p6YNpiFZeJ78NEim3Jg==
=GdXR
-----END PGP SIGNATURE-----

--il4NOTdT20Qw/IBC--


