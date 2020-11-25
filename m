Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586BA2C408E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 13:50:31 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khuFf-0006iJ-Sz
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 07:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khuEj-0006II-OH
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khuEe-0004CX-Pk
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606308562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DKfBJMATjfYLGdnz1GJdOyCD5qVyrVwCruKoaXCb5Go=;
 b=PkbMGOtvCxq5tYVij5H4x7rCAHA6ttXFLw3Ftk64n+c1ksZDfGly543+VDelvDhy1ooLeQ
 XoxFYoIaxNl/7hgp8uv1Tkyo/rvwZU/HoudhEJxAHhzhiBKSAJAt9IjhlsMOiz6MTfj0dL
 TmGSad432FjGnjsVZVnpc5mG8rGXEA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-i_fiGd3NO16pJzCSSxyeOA-1; Wed, 25 Nov 2020 07:49:18 -0500
X-MC-Unique: i_fiGd3NO16pJzCSSxyeOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53072805C01;
 Wed, 25 Nov 2020 12:49:17 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4ADC6F43C;
 Wed, 25 Nov 2020 12:49:00 +0000 (UTC)
Date: Wed, 25 Nov 2020 18:18:56 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Darren Kenny <darren.kenny@oracle.com>
Subject: Re: [RFC 1/1] security-process: update process information
In-Reply-To: <m2r1oi9117.fsf@oracle.com>
Message-ID: <88q0r796-9s48-103n-po28-2o60o9q29499@erqung.pbz>
References: <20201124142238.225417-1-ppandit@redhat.com>
 <20201124142238.225417-2-ppandit@redhat.com> <m2r1oi9117.fsf@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Darren, all

+-- On Tue, 24 Nov 2020, Darren Kenny wrote --+
| I always understood triage to be the initial steps in assessing a bug:
| 
| - determining if it is a security bug, in this case
| - then deciding on the severity of it
|
| I would not expect triage to include seeing it through to the point
| where there is a fix as in the steps above and as such that definition
| of triage should probably have a shorter time frame.

* Yes, initial triage is to determine if a given issue is a security one and 
  its impact if so.

* After above step, an upstream bug (or GitLab issue) shall be filed if the
  issue can be made public readily and does not need an embargo period.

* Following step about creating a patch is needed considering the influx of 
  these issues. If such a patch is not proposed at this time, we risk having 
  numerous CVE bugs open and unfixed without a patch.

* Sometimes proposed patches take long time to get merged upstream. Hence the 
  60 days time frame.

* It does not mean issue report will remain private for 60 days, nope.


| But, if it is a security bug - then that is when the next steps would be
| taken, to (not necessarily in this order):
| 
| - negotiate an embargo (should the predefined 60 days be insufficient)
|
|   - don't know if you need to mention that this would include downstream
|     in this too, since they will be the ones most likely to need the
|     time to distribute a fix

* Embargo period is negotiated for important/critical issues. Such embargo 
  period is generally not more than 2 weeks.

* Yes, embargo process includes notifying various downstream communities about 
  the issue, its fix(es) and co-ordinating disclosure.

| - request a CVE
| - create a fix for upstream
|   - distros can work on bringing that back into downstream as needed,
|     within the embargo period
| 
| I do feel that it is worth separating the 2 phases of triage and beyond,
| but of course that is only my thoughts on it, I'm sure others will have
| theirs.

* Yes, I appreciate it, thanks so much for sharing.

* This patch is to get the qemu-security list up and running. I'll refine the 
  process further with above/more details as we start using it. Hope that's 
  okay.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


