Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5772C6B9E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:33:03 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiYI-0000pN-BS
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiiWp-0008JC-1W
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiiWl-0007q4-6b
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606501886;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZRqV252xLPTODhKGutIKprXDVXs4skDLBV2y4xikXAw=;
 b=ZrpEoAKorbiHTgKpUBhxXurCkidOwRJSMJGZ6HODKZMuivrKgEkd2PVcHcABd4iMJ902RT
 1zoAW0hW/IvNq89Uoh0aPMiRK1hxVmE9RbnhKB9oZFbgWoWghXlBwq0BMbmd5LMAloFtE+
 bHzWNXeLxCuD7LMy81UIOSwbTIDrxHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-C6nerz8jPdWFeXBWp25tbA-1; Fri, 27 Nov 2020 13:31:22 -0500
X-MC-Unique: C6nerz8jPdWFeXBWp25tbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF4A803626;
 Fri, 27 Nov 2020 18:31:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3019E189A5;
 Fri, 27 Nov 2020 18:31:13 +0000 (UTC)
Date: Fri, 27 Nov 2020 18:31:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
Message-ID: <20201127183110.GJ1596141@redhat.com>
References: <20201127181025.472458-1-thuth@redhat.com>
 <00693af0-4d49-8e8a-65d8-64c0ad34c756@redhat.com>
MIME-Version: 1.0
In-Reply-To: <00693af0-4d49-8e8a-65d8-64c0ad34c756@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 alex.williamson@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 07:15:43PM +0100, Thomas Huth wrote:
> On 27/11/2020 19.10, Thomas Huth wrote:
> > After adding some missing packages, it's possible to check 32-bit
> > builds and tests with the fedora-i386-cross container in the gitlab-CI,
> > too.
> > 
> > While we're at it, update it to Fedora 31. Unfortunately the gcc
> > from the later versions emits some very dubious format-truncation
> > warnings, so Fedora 32 and 33 are currently unsuitable for this job.
> > 
> > I also had to remove the gnutls-devel package since linking then
> > failed due to its dependency libtasn1 not being recognized (even
> > if I explicitely installed it into the container).
> 
> In case anybody is interested, the failure can be seen here:
> 
>  https://gitlab.com/huth/qemu/-/jobs/876977206#L4799
> 
> ... which is very strange, since in line 259, meson claimed to have found
> libtasn1 ... anybody got an idea what's going wrong here?

It installed the 32-bit  tasn1 RPM, but the 64-bit tasn1-devel RPM


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


