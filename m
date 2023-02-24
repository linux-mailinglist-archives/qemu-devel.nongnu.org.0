Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA316A1895
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUC1-0004tA-K6; Fri, 24 Feb 2023 04:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pVUBz-0004sc-7R
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pVUBx-0005uV-JD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677230196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYzwoZQ+Kw06bNiP7rLP/zmkaHFbBsUzUy6whwjkF9U=;
 b=bS1/Q4iD45r0nfS4IU6oEjicElhOHS+pQu0NY8Hg5q+YnEkh9OW5/lfXSEsAnZ1t/5eBYO
 WfHrR1veFEzCbMEZLHA//ypylDVsNbBXHDuu6kDtmyh9biKffI23AGVhzZni8x7BJ1tFmO
 ZatbB/nInmgq6S0z2ZJLMHinTCEVtFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-pTW4Hd2DMfCcniOFEYrMzg-1; Fri, 24 Feb 2023 04:16:32 -0500
X-MC-Unique: pTW4Hd2DMfCcniOFEYrMzg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 938FC101A521;
 Fri, 24 Feb 2023 09:16:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58739492B12;
 Fri, 24 Feb 2023 09:16:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E3021180063A; Fri, 24 Feb 2023 10:16:30 +0100 (CET)
Date: Fri, 24 Feb 2023 10:16:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Ben Dooks <qemu@ben.fluff.org>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <20230224091630.mpgjli544r3p7r2x@sirius.home.kraxel.org>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/fkf3Cya1NOopQA@invalid>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 10:11:11PM +0000, Eldon Stegall wrote:
> On Thu, Feb 23, 2023 at 03:33:00PM +0000, Daniel P. Berrangé wrote:
> > IIUC, we already have available compute resources from a couple of
> > sources we could put into service. The main issue is someone to
> > actually configure them to act as runners *and* maintain their
> > operation indefinitely going forward. The sysadmin problem is
> > what made/makes gitlab's shared runners so incredibly appealing.

I have a gitlab runner active on a hosted machine.  It builds on fedora
coreos and doesn't need much baby-sitting.  Just copied the bits into a
new repository and pushed to
	https://gitlab.com/kraxel/coreos-gitlab-runner

> Daniel, you pointed out the importance of reproducibility, and thus the
> use of the two-step process, build-docker, and then test-in-docker, so it
> seems that only docker and the gitlab agent would be strong requirements for
> running the jobs?

The above works just fine as replacement for the shared runners.  Can
also run in parallel to the shared runners, but it's slower on picking
up jobs, so it'll effectively take over when you ran out of minutes.

take care,
  Gerd


