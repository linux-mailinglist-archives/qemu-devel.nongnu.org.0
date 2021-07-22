Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4053D279D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:33:44 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bdn-0006Bf-8J
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bck-0005Vd-7W
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bcg-0006mh-DA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626971553;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evNNP4f4514tt8+yoyAZ5wA9H3n2jYKe16R1kQE4QpM=;
 b=SFI6i/tIoK1n4pP3Foq1NVdVKQ1rIeTmgSwTmL2wpo9kqVmIz4qVBQCljEurXFm3qy6/oI
 1Uk12EfJafQqRhyPI0z3HVBSgWPlOjR70+N8bGZhhcaPqy5QWLjjMNYdf9UeknqFyd4ouj
 +MkIgaLStumjEc02q9dtxBlf3ESw0KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-eskfrtjeNo-dKQLHninH_g-1; Thu, 22 Jul 2021 12:32:27 -0400
X-MC-Unique: eskfrtjeNo-dKQLHninH_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED1BA105146E;
 Thu, 22 Jul 2021 16:32:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E688E60C05;
 Thu, 22 Jul 2021 16:32:16 +0000 (UTC)
Date: Thu, 22 Jul 2021 17:32:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.1 0/2] gitlab: misc tweaks to job execution rules
Message-ID: <YPmdjcTjdECcGDvE@redhat.com>
References: <20210722162035.2765755-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722162035.2765755-1-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Self-nack.  Sent the wrong version of the code - this one is broken,
ignore it.

On Thu, Jul 22, 2021 at 05:20:33PM +0100, Daniel P. Berrangé wrote:
>  - Fixes a problem with acceptance jobs running when build jobs fail
>  - Fixes a problem with pages job publishing website from undesirable
>    branches.
> 
> Daniel P. Berrangé (2):
>   gitlab: only let pages be published from default branch
>   gitlab: don't run acceptance jobs if build jobs fail
> 
>  .gitlab-ci.d/buildtest-template.yml |  4 ++--
>  .gitlab-ci.d/buildtest.yml          | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


