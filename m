Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E74092D7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:14:57 +0200 (CEST)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmjY-0007MB-Kb
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmBT-0007TV-6U
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:39:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPmBQ-00021U-Kb
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631540379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFQDRaYNWxrT1BcMXee3Hyy304f7wGDgILZH8ZpOwDo=;
 b=cCTQCepr122MWfxGlr6E3HguDQ42+t4KjcHWF2JSBxauHmLcbgqpUHwKXuxiHYbBgqqKsz
 e3cpLzQXGuiUmWEedXlE4rVDNYik7LR/16QQA0jEdEqQc/RzGcoQfmOql/uU95rhnCMpGD
 qNIGHfU8Rr8j7PJddDQ8s9nWrQZOp9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Octc69o3PSKLE0xQH1zAaQ-1; Mon, 13 Sep 2021 09:39:38 -0400
X-MC-Unique: Octc69o3PSKLE0xQH1zAaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3DD8ABA8C;
 Mon, 13 Sep 2021 13:39:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B21477F30;
 Mon, 13 Sep 2021 13:39:03 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:39:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
Message-ID: <YT9Udq/A0OnNQvR2@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UInyZ76AylEI/xxz"
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

--UInyZ76AylEI/xxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, marking block layers APIs that require the BQL and those that
don't is an important step. I have posted comments.

Stefan

--UInyZ76AylEI/xxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/VHYACgkQnKSrs4Gr
c8hNsgf+NDAfRrzON+Ylpk1+xOIGefUNcKyTsfUmKso6X4eyr84xYCQx1CPhJ2Ia
SdBTEzsMO8BY87pvcqyGUzuhgOAWHazmHkHomK3cxZSoQ3uWvVTeydf6YWoxw+Mp
aNmbN/bMsHvgkCwLSkQ+QdFzJne1cpKtwe6Lwo/SjoubRVLFFK+6uZxyzhP9peFp
M+FR0KpHTzvF6VTY8PAsuKHO424vUfzLidfgPCdzBWvkNSUXlcUWgV1Qhb83zmXf
n2pyv4yL2uzblXmHjOHzUnHCqcN4Ue+TJPdCyx8RzpDlc3Had/4JcrGDGl8rJdo/
vxyWff1ZblMqHG9Q2JFSmhYZB1HQgQ==
=dQ2i
-----END PGP SIGNATURE-----

--UInyZ76AylEI/xxz--


