Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F744AB0D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:58:15 +0100 (CET)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNtO-0005IA-V0
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:58:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNsG-0004bw-Ae
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkNsC-0006U3-0b
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636451819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jQSB9KKYgM+N4D6eonhsISYc/oSCPJbBhbACu1s1Wk=;
 b=ZudJ3GNdPTp7p5rXUlxLuYz3E1168rbAv6GSsrucruWVwnXm2sQHqFtmY/AtMIy/08P+YW
 bDtQX6WYaImv/QC5kdYxPDJ7yhyFfyJmATyGC0h+gJFwaULMqTJXj8GAmCemAmvVwA3/ZF
 ltkOMU6cTHrHt6sVYAAPLR5URkWyZPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-L4zKzQj0PSet3dv6RwvOcg-1; Tue, 09 Nov 2021 04:56:57 -0500
X-MC-Unique: L4zKzQj0PSet3dv6RwvOcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819CE100C609;
 Tue,  9 Nov 2021 09:56:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 521B060843;
 Tue,  9 Nov 2021 09:56:52 +0000 (UTC)
Date: Tue, 9 Nov 2021 09:56:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Cirrus-CI all red
Message-ID: <YYpF4coXvnStffD5@redhat.com>
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
 <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 10:45:18AM +0100, Thomas Huth wrote:
> On 09/11/2021 10.39, Philippe Mathieu-Daudé wrote:
> > FYI, as of today, the latest merge history is red (last 10 days):
> > https://cirrus-ci.com/github/qemu/qemu
> > 
> > If we want to keep using this, we should somehow plug it to
> > GitLab-CI (i.e. Travis-CI is run as an external job there) so
> > the project maintainer can notice job failures.
> 
> Well, considering that all the cirrus-run based jobs are currently failing
> due to the non-working API token, that does not seem to work very well
> either.

Who owns the API token ? For other projects, this was addressed a while
ago by refreshing the token. I would have tried this myself for QEMU
but I don't have privileges on the QEMU projects in github/gitlab.

> > Alternatively the windows job could be passed to GitLab:
> > https://docs.gitlab.com/ee/ci/runners/runner_cloud/windows_runner_cloud.html
> 
> See:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg02474.html
> 
> ... the problem is again that the shared runners are only single-threaded,
> so it's incredibly slow, especially if you have to re-install MSYS2 each
> time. I once tried to improve the patch by caching the MSYS2 installation,
> but it did not work that well either... (but if somebody wants to continue
> my work, I can rebase and send it out again, just let me know).

Potentially this is something where we can make sure of the Azure credits
QEMU is getting, though it would require someone to figure out shared
runner integration and maintain it...

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


