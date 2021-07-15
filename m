Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E963C9F56
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:18:04 +0200 (CEST)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Fb-0006nf-Ls
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m41EE-0005L4-Ln
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m41E9-00083A-Op
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626354992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rSkls7pQuZZhp+u3ZbDN6TUCCsrvzEeiVzXTGv2mdNU=;
 b=iNtzpqq+FN6p3r+PBoaR9E9ADeov06Ec8+9XZNlNhTvuB0foX+cXAVzpZE+7NwvWr89k/E
 4MgpuglQTwEStM2ojXREPwNTxpxC186NdCDfwiUthyPbalyXlYAbfIMn5jimICQ4keF3ed
 TskI5sPkcqjVp3d2yDcK7GTLsIETj8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-rLn8U9ZhMRKj9gEylokAmA-1; Thu, 15 Jul 2021 09:16:28 -0400
X-MC-Unique: rLn8U9ZhMRKj9gEylokAmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A30E101F7AE;
 Thu, 15 Jul 2021 13:16:27 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AD885DA61;
 Thu, 15 Jul 2021 13:16:19 +0000 (UTC)
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
 <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: tests/acceptance/multiprocess.py test failure
In-reply-to: <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
Date: Thu, 15 Jul 2021 09:16:18 -0400
Message-ID: <87wnpr4t0d.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel <qemu-devel@nongnu.org>,
 Willian Rampazzo <willianr@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Hildenbrand writes:

>
> Hi,
>
> maybe
>
> https://lkml.kernel.org/r/20210709052800.63588-1-yang.zhong@intel.com
>
> resolves your issue. If not, pleas let me know and I'll try
> reproducing (will have to install avocado).

Hi David,

Yes, that fixes it.  Sorry for missing that patch on the ml.

Maintainers (Elena, Jagannathan, John),

Are you planning a PR with this patch?

Thanks,

-- 
Cleber Rosa
[ Sr Software Engineer - Virtualization Team - Red Hat ]
[ Avocado Test Framework - avocado-framework.github.io ]
[  7ABB 96EB 8B46 B94D 5E0F  E9BB 657E 8D33 A5F2 09F3  ]


