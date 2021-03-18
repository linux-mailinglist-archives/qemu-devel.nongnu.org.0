Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BE340E9A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:48:30 +0100 (CET)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyd4-0007Cz-A2
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyb1-0006dW-6T
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMyav-0000H0-Nk
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616096768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gA/lU2BliF1UUbINXnwfZv6d+vr6xPUMM/wKOZgqcT4=;
 b=IfMcBTzLRRQp1dIdtmSI55AXXsC06H28QDX+khPfgen6Y6948N2eqyG2V7T0mqx8BkAPNB
 Mkwohvc2rzDVwspH31R4KN8mOehpVfodbPYHUgeD3lwx+OGIIzAIvWTMTJPYYO8Q/nl14a
 weiBY/U9Jonhb1BlMf82Q2zRlSSkJ0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-TKC2yWH6OV2FjdqD6YEjIw-1; Thu, 18 Mar 2021 15:46:04 -0400
X-MC-Unique: TKC2yWH6OV2FjdqD6YEjIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 685EE520E;
 Thu, 18 Mar 2021 19:46:03 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5CBC610F1;
 Thu, 18 Mar 2021 19:46:02 +0000 (UTC)
Date: Thu, 18 Mar 2021 19:46:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
MIME-Version: 1.0
In-Reply-To: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l5CRXC39DiUNAvzO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--l5CRXC39DiUNAvzO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Now I'm having serious doubts about Gitlab usefulness for the QEMU
> community...

The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
GitLab Merge Requests so that anyone can submit a merge request and get
CI coverage.

I think we need to expect free tiers to be insufficient for full CI
coverage. In the longer term we probably need to rely on dedicated
runners, although I'm not sure how much of the issue is QEMU's huge CI
pipeline versus the performance limitations of shared runners.

Stefan

--l5CRXC39DiUNAvzO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBTrfkACgkQnKSrs4Gr
c8guyggAofuA3a5Qcp7/BE/2rOx0NdYl+5LCcZ/cWWkif5l6DwntyDigfCxNzL6i
JgZPTT+2h1VQMKIvMdww7OA3JOO3CURH6CQ9IBqOfOnq5+avM2dNZj7WTPDc9MdD
NbcK44+chcHEErxhnMSzlZNegxXP2EL+z6ZCy0m4EGw8Cjgrsd3/1JxYJ1zUff7a
exIYLU6wHLvZzaqdOaNlUPzEPhQO0xo54kaVjjjSppiSvOmQbHHDTHHseFa2FZNA
tNnz8JJnONG2W63mORebRmQnQ5aGu0gyBK0/QNXfQ2QPl0jvvNfhV8akhpxpaZ6f
TRuyWelfhWAhh9Spb6yPNDlCZVMG7Q==
=E1z4
-----END PGP SIGNATURE-----

--l5CRXC39DiUNAvzO--


