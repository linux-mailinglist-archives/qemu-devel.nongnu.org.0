Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73A2C851D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:28:04 +0100 (CET)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjDn-0007PU-5T
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjjBR-00067T-RM
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjjBP-0003oZ-Pw
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606742735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HK/ZkCgCpar8+K77M2NoE/im8VF4U87g4ox736OXbdY=;
 b=BX4osMYPCz9BZAE/VGLev9uYOtFn+4wdTY2tQX8aBwpeLPXIa/qoN6ZddSAX9LIPd04tlD
 cYteVeee2gU54kJR7AHeHEk/N/rp5PhfXwHgIXrl4tTIVOZQd6Tr5UWfiLuPyaGNmDqre2
 5Sno9dnMBtmo2shEL26NuArcwWlmnHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-4_H7AGt-OXW5-wnz6EST8g-1; Mon, 30 Nov 2020 08:25:32 -0500
X-MC-Unique: 4_H7AGt-OXW5-wnz6EST8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DA7185E4B2;
 Mon, 30 Nov 2020 13:25:31 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 475F41A838;
 Mon, 30 Nov 2020 13:25:31 +0000 (UTC)
Date: Mon, 30 Nov 2020 13:25:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <20201130132530.GE422962@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 09:10:14AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> The problem with those is that we can not simply use travis/gitlab/... ma=
chines for running those tests, because we are measuring in-guest actual pe=
rformance. We can't just stop the time when the machine decides to schedule=
 another container/vm. I briefly checked the public bare-metal offerings li=
ke rackspace but these are most probably not sufficient either because (unl=
ess I'm wrong) they only give you a machine but it is not guaranteed that i=
t will be the same machine the next time. If we are to compare the results =
we don't need just the same model, we really need the very same machine. An=
y change to the machine might lead to a significant difference (disk replac=
ement, even firmware update...).

Do you have a suggested bare metal setup?

I think it's more complicated than having a single bare metal host. It
could involve a network boot server, a network traffic generator machine
for external network iperf testing, etc.

What is the minimal environment needed for bare metal hosts?

Stefan

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/E8soACgkQnKSrs4Gr
c8gM3wf/XmHLN8gngMuVtRqCIGcfMkbqw/osNXvr0MTTizHfiOp9XsnAO3uRLgJu
CRhRjZU8uDZp00GSdn1Ctg4JSiUEvVA4a5GAJ+RyBbtlKrOUMTH+ee4JZSYyJQ/r
2evXgO2gjw9pLr62eeDUtSnDuLaS7pKTJQngyGYLjNKo0M2TsnOEsQYz24tCNcqI
SoUPjAcMXMX/KVlyJ3ZGKxXI+H7ecYnAetZ9IqzI1losK1EPsxRz5idXjWxWqwyi
xVrzYbv5HkBIk9IYVyOydYanaGPrgVe6zQJdQ0hnFqB4xRmNa0OHsTzLn1xR4zIi
WChlBCnbtOUlF0zUyVaWJJwXcS3YiA==
=hT9J
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--


