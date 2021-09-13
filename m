Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB694087B5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:02:47 +0200 (CEST)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhrS-0005sq-Bh
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPhly-0002Zz-Oe
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPhlw-0003dM-QJ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631523424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsfceZ3KFRX/4stUWxveDLRUfP9EJhrhs6OW3ldPhdU=;
 b=B6TeZC4WYZSSVOamzHhNM86zU4Hz0b1S/zwWoGlg/X9GaLOd/CNqwIgzIsUcmDBXFaBtnK
 oPo7BKHOl2HeUVwC4HMukK2EYY8p+wO1dCweD/xWm7Ze9K7Zbf71V0WlXFoFw/9CSd4g2p
 +kUypfZF7BsJyvX8hUofpwPOzQ3EWr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-dZjho2RtPpGLmZv31AzreQ-1; Mon, 13 Sep 2021 04:56:59 -0400
X-MC-Unique: dZjho2RtPpGLmZv31AzreQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1726684A5E4;
 Mon, 13 Sep 2021 08:56:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F24A53AB2;
 Mon, 13 Sep 2021 08:56:56 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:56:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web v2 PATCH] Update the information about the required
 version of macOS
Message-ID: <YT8SVsNsVsDDtONp@redhat.com>
References: <20210913062126.16946-1-thuth@redhat.com>
 <CABLmASGBZs_pxFBx8cW3uVF_gaUuaLE7hMhAy71hN+OZZPqw2A@mail.gmail.com>
 <7548727b-222a-34ac-6fb1-1bc01837b9b2@redhat.com>
 <YT8Lqty7upJ/RTDA@redhat.com>
 <ba52ec23-34fe-2eda-f0eb-d36a880aeda9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ba52ec23-34fe-2eda-f0eb-d36a880aeda9@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 10:36:23AM +0200, Thomas Huth wrote:
> On 13/09/2021 10.28, Daniel P. Berrangé wrote:
> > On Mon, Sep 13, 2021 at 10:04:25AM +0200, Thomas Huth wrote:
> > > On 13/09/2021 09.35, Howard Spoelstra wrote:
> > > > 
> > > > 
> > > > On Mon, Sep 13, 2021 at 8:21 AM Thomas Huth <thuth@redhat.com
> > > > <mailto:thuth@redhat.com>> wrote:
> > > > 
> > > >      The versions that we specify for macOS are way too old already. Let's
> > > >      rephrase this without specific version numbers, pointing the users
> > > >      to the latest version instead.
> > > > 
> > > >      Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
> > > >      ---
> > > >        v2: Rephrased to be more in sync with docs/about/build-platforms.rst
> > > > 
> > > >        _download/macos.md | 6 ++++--
> > > >        1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > >      diff --git a/_download/macos.md b/_download/macos.md
> > > >      index 06aa811..c55438a 100644
> > > >      --- a/_download/macos.md
> > > >      +++ b/_download/macos.md
> > > >      @@ -6,5 +6,7 @@ QEMU can be installed from <strong>MacPorts</strong>:
> > > > 
> > > >        <pre>sudo port install qemu</pre>
> > > > 
> > > >      -QEMU requires Mac OS X 10.5 or later, but it is recommended
> > > >      -to use Mac OS X 10.7 or later.
> > > >      +QEMU requires the the most recent macOS version that is currently
> > > >      available.
> > > >      +Support for the previous version will be dropped two years after the
> > > >      current
> > > >      +version has been released or when Apple drops support for it, whatever
> > > >      comes
> > > >      +first.
> > > >      --     2.27.0
> > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > Nice to see this clarified.
> > > > I guess a small typo crept in: "QEMU requires the the most recent macOS
> > > > version that is currently available."
> > > 
> > > Thanks, I'll drop one of the "the"s.
> > > 
> > > > Also, is this statement correct when the 2 year previous version(s) are
> > > > also supported?
> > > 
> > > https://qemu-project.gitlab.io/qemu/about/build-platforms.html only talks
> > > about "the previous major version" ... so that's a good question, what
> > > happens if a vendor releases multiple major versions within two years?
> > > 
> > > I guess the intention was that all previous versions are supported as long
> > > as the two years haven't expired yet. We might need to update the
> > > build-platforms text in that respect, too.
> > 
> > The intention was that we limit the scope of our support to at most
> > 2 concurrent releases, even if the vendor has more still under support.
> > The current major version at all times, and the previous major version
> > for upto 2 years (unless vendor EOLs it before then).
> 
> Ok, then we should maybe talk about "the *last* previous major version" instead?

Sure, that would make it more explicit.

> Also it seems like we have a similar situation with NetBSD:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/614
> 
> Version 9.0 has been released in 2020, i.e. it's not older than two years
> yet. Current version is 9.2 already, though, so there has been a previous
> major version (9.1) in between, right?

Looking more closely, 9.x are all minor versions rather than major version.
8.x is the prev major version. So we dropped the ball wrt NetBSD but I don't
feel all that bad given the expected number of users/contributors from that
platform. We'll just need to remember this in future.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


