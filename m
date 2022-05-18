Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C852B4AC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:36:37 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFAa-0001Jl-3D
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrF8G-00082G-BC
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrF8D-00082I-Ky
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652862848;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pEOrJ94iiWtQq2aQ38neCjMjhTCvqNQPp1XuR3FoEYE=;
 b=GRwEkuOyIB/BUGINn7jKUBQYL2B6lfV0T52EytXxX/9sfWzMIuDNVHPJQDmi62bUewLTLT
 51MojHaeSJZ8XOCABI24t6Xtvbkxb3n7VSzpr/CsYowx+d/qA9gM/1ScHwLprDO5S0U98j
 yf9kjO5Y3ta28Ywb7vZo698Rl++QCu8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-1aTdJv64PredknEdRFWqkQ-1; Wed, 18 May 2022 04:34:05 -0400
X-MC-Unique: 1aTdJv64PredknEdRFWqkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A66B85A5A8;
 Wed, 18 May 2022 08:34:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A83841410DD9;
 Wed, 18 May 2022 08:34:03 +0000 (UTC)
Date: Wed, 18 May 2022 09:33:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Rajesh A <rajesh.a@tatacommunications.com>
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Ramya R (GIMEC)" <ramya.r@tatacommunications.com>,
 "V G ASHWINI ." <Ashwini.VG@contractor.tatacommunications.com>
Subject: Re: QEMU cpu socket allocation
Message-ID: <YoSvdVsApoGi9e93@redhat.com>
References: <KL1PR0401MB4793897A84C6EA0959F0645EEECE9@KL1PR0401MB4793.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <KL1PR0401MB4793897A84C6EA0959F0645EEECE9@KL1PR0401MB4793.apcprd04.prod.outlook.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 10:50:02AM +0000, Rajesh A wrote:
> Hi QEMU dev
> 
> Virt Manager is able to configure a QEMU VM with more CPU sockets
> than the physical host has.
> For example, in the below VM, when I request 16 vCPU cores,  by
> default it takes as 16 Sockets with 1 core each. The host itself
> has only 2 Sockets.

You've told virt-manager to overcommit your CPUs.

>   1.  How does QEMU allow this and how the VM works?

It is functionally fine. A vCPU is merely OS thread, and the OS
schedular will just schedule each vCPU as it would any OS thread.

It multiple vCPUs all try to run work at the same time, then they
are going to compete with each other for running time on the physical
CPUs, and so they'll only get a subset of the time they reall want.

>   2.  What is the recommended configuration of Sockets/Cores/Threads
> for best VM performance of a 16 core VM running on a 2 sockets host ?

You've not said how many cores & threads your host CPUs have, so we
can't answer that.

The normal recommend is to not overcommit logical CPUs, where logical
CPUs means sockets * cores * threads.

VMs created by virt-manager don't use CPU pinning, so they float
freely across host CPUs as decided by the host OS scheduler. When
having floating CPUs, the CPU topology should never use threads > 1,
but the mix of cores & sockets has essentially no impact on performance.
Since each vCPU will move across different host pCPUs over time, the
effective topology is constantly changing.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


