Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875BE37F5C3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:40:32 +0200 (CEST)
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8lb-0005jF-FO
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh8OA-0003Uv-39
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh8O8-0001ED-70
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620900975;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR5IPYRVst61RDQIjJaD5/BcdcdyJ+y2U2kUtWCs3No=;
 b=GtFjafJEngaOoIYDrXBddj8JXBK57/MYy7ILcjy3tcHL9gXXhYcOmajQNneGB2ZorAqXa3
 czyhDs1ZEOT2P7AIiSyiNXtGiy+lqkXPYVcwTG/Qffvtwy1nSn5dUNRfdf+xv1qz6EVti6
 A/ktcl/G/p4wPLLAULO7hNtTWRTBrmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Ftm_yyARPNqCaxsRftAcJw-1; Thu, 13 May 2021 06:16:12 -0400
X-MC-Unique: Ftm_yyARPNqCaxsRftAcJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD96803620;
 Thu, 13 May 2021 10:16:10 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04F985D6AC;
 Thu, 13 May 2021 10:15:58 +0000 (UTC)
Date: Thu, 13 May 2021 11:15:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 09/22] tests/docker: fix mistakes in ubuntu package
 lists
Message-ID: <YJz8XMKexr4m+YxV@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
 <20210513095519.1213675-10-berrange@redhat.com>
 <6c43d991-fed9-f7c9-2aa8-f9753f8a3eae@amsat.org>
MIME-Version: 1.0
In-Reply-To: <6c43d991-fed9-f7c9-2aa8-f9753f8a3eae@amsat.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 12:12:33PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/13/21 11:55 AM, Daniel P. Berrangé wrote:
> > librados-dev is not required by QEMU directly, only librbd-dev.
> > 
> > glusterfs-common is not directly needed by QEMU.
> > 
> > QEMU uses ncursesw only on non-Windows hosts.
> > 
> > The clang package is clang 10.
> > 
> > flex and bison are not required by QEMU.
> 
> I included them to use the same Docker file to build Linux kernel
> we test. Not a blocker, this is the QEMU project, and I'd rather
> get the vmlinux images prebuilt from elsewhere, so:

If we want containers in which we can build the kernel, we can
also create a dedicated set of dockerfiles containing only the
deps that Linux kernel builds needs, separate from QEMU. 

> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> > Standardize on nmap ncat implementation to match Fedora/CentOS.
> > 
> > Remove vim since it is not a build pre-requisite and no other containers
> > include it.
> > 
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
> >  tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
> >  2 files changed, 2 insertions(+), 11 deletions(-)
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


