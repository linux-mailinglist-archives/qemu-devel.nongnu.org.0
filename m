Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CC31F32A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:43:07 +0100 (CET)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsws-0003a5-NT
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCssG-0000wK-Au
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lCssD-0007i9-Dm
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613691495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g1duESPJuXAd2GLbBDBNUgnHjCsFzUYqGhToeWkTzx8=;
 b=RkYFZFOiWYXScrekv9ahXUePcrK/tBlSCPp1QGwFKnn+NQZIyiOuph7bJ5DXtrnq0S4Dia
 Xex6fkTebnTc2HuDftpwSe5aTnUkXaHwrMiHu482/WPgXzet5RQecF6el2GWaHaJBZzdRL
 JJeCVYhyg3BI2agOEHaQagken1gBdh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-3pqCk56DNCOnQIBRt8ETIQ-1; Thu, 18 Feb 2021 18:38:11 -0500
X-MC-Unique: 3pqCk56DNCOnQIBRt8ETIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D14B107ACE3;
 Thu, 18 Feb 2021 23:38:10 +0000 (UTC)
Received: from localhost (ovpn-3-246.rdu2.redhat.com [10.22.3.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F081C10016F6;
 Thu, 18 Feb 2021 23:38:09 +0000 (UTC)
Date: Thu, 18 Feb 2021 18:38:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] Machine and x86 queue, 2021-02-18
Message-ID: <20210218233807.GI760746@habkost.net>
References: <20210218232415.1001078-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210218232415.1001078-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Moger, Babu" <Babu.Moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 06:24:12PM -0500, Eduardo Habkost wrote:
> I'm hugely behind in backlog of qemu-devel messages and patches
> to queue/review (my apologies to all waiting for something from
> me).  I'm flushing the few patches I had queued so they don't get
> stale.
> 
> The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:
> 
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
> 
> for you to fetch changes up to bf475162d70a16a6cef478272aa32be1025aa72a:
> 
>   hostmem: Don't report pmem attribute if unsupported (2021-02-18 16:43:17 -0500)

My apologies, a corrected version of the pull request tag was
pushed, with the correct version of the EPYC-Milan patch:

The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)

are available in the Git repository at:

  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request

for you to fetch changes up to def835f0da0d153b397071e6bb8f2b46f51f96b4:

  hostmem: Don't report pmem attribute if unsupported (2021-02-18 18:34:47 -0500)

----------------------------------------------------------------
Machine and x86 queue, 2021-02-18

Feature:
* i386: Add the support for AMD EPYC 3rd generation processors
  (Babu Moger)

Bug fix:
* hostmem: Don't report pmem attribute if unsupported
  (Michal Privoznik)

Cleanup:
* device-crash-test: Remove problematic language
  (Eduardo Habkost)

----------------------------------------------------------------

Babu Moger (1):
  i386: Add the support for AMD EPYC 3rd generation processors

Eduardo Habkost (1):
  device-crash-test: Remove problematic language

Michal Privoznik (1):
  hostmem: Don't report pmem attribute if unsupported

 target/i386/cpu.h         |   4 ++
 backends/hostmem-file.c   |  13 ++---
 scripts/device-crash-test |  96 +++++++++++++++++-----------------
 target/i386/cpu.c         | 107 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 162 insertions(+), 58 deletions(-)

-- 
Eduardo


