Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584426C4F7E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0RM-0006Ah-15; Wed, 22 Mar 2023 11:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf0RD-00063l-4a
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf0RA-0005Yc-Pi
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679499099;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XziDxg8n4jDM+0TALffCfuEofCiUECGOKCEGMVFzZs=;
 b=HrFM23b86S6tYqODy6Z66yDsrb4eO81blibuAhv6DSENlW8wp5qX5WROD+8FiK7YToqOW5
 Hpwz7uIIdXLkqDilbQ3YfL4nf90Iv7Xq5VTHUMrnw+fRyFWQcpd4g5xGiRyUb7hkaH1Ht+
 ZpVoSKqLqxNOGu7+jt+7ik2Sdk9pdbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-_OYq_fVINvyYuzEyq4uHKQ-1; Wed, 22 Mar 2023 11:31:36 -0400
X-MC-Unique: _OYq_fVINvyYuzEyq4uHKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F4A85A5A3;
 Wed, 22 Mar 2023 15:31:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCBAF40C20FA;
 Wed, 22 Mar 2023 15:31:33 +0000 (UTC)
Date: Wed, 22 Mar 2023 15:31:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Message-ID: <ZBsfUyEgmEbFxXPM@redhat.com>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
 <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
 <1d0081e1-1a01-037b-1317-947acf43a78d@comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d0081e1-1a01-037b-1317-947acf43a78d@comstyle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 11:20:08AM -0400, Brad Smith wrote:
> On 2023-03-22 9:40 a.m., Thomas Huth wrote:
> > On 22/03/2023 14.38, Philippe Mathieu-Daudé wrote:
> > > On 22/3/23 13:36, Daniel P. Berrangé wrote:
> > > > As a VM used only for automated testing there is no need to
> > > > install the X11 stack.
> > > > 
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >   tests/vm/openbsd | 3 +--
> > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> > > > index eaeb201e91..6af7afac0d 100755
> > > > --- a/tests/vm/openbsd
> > > > +++ b/tests/vm/openbsd
> > > > @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
> > > >           self.console_wait("Password for root account")
> > > >           self.console_send("%s\n" % self._config["root_pass"])
> > > >           self.console_wait_send("Start sshd(8)", "yes\n")
> > > > -        self.console_wait_send("X Window System", "\n")
> > > > -        self.console_wait_send("xenodm", "\n")
> > > > +        self.console_wait_send("X Window System", "no\n")
> > > 
> > > Wasn't this useful to link a X11-ready binary, even if only testing
> > > with -display=none?
> > 
> > tests/vm/openbsd later installs sdl2 and gtk+3, so I assume that will
> > pull in the required libraries if necessary, without all the other
> > non-necessary stuff.
> 
> 
> No, it will not. If you want sdl2 / gtk+3 you have to have X enabled.

That does not appear to be required for QEMU build / test scenarios,
as 'make vm-build-openbsd' succeeded and included GTK/SDL2 support
AFAICT.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


