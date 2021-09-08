Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7E4040E2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 00:11:38 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5n7-0007ju-Cs
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5mJ-00074M-Ek
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO5m8-0007CQ-2x
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631139035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/N7itHTnfErWHF0aBsFC3rVXStzBzituJGTSBaKDoic=;
 b=DgfHMHOtpwHsc6XJEAzIktc8kFwW4shQj5IJfaAIjUUMVv7EPpNB1wLnh8G/6Bnwd/ov3/
 8kcuODbJUwn2Ffgp521F0VokrZyJGk56iqTH1yKUM7ae6rXTzQF4BgYdsf88os0/z7SugJ
 CO3/LfHjYvLRcJTORUA1Qu4EWMYAUJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-djb3TSXLOsm4Pkqv6-kJRw-1; Wed, 08 Sep 2021 18:10:34 -0400
X-MC-Unique: djb3TSXLOsm4Pkqv6-kJRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C83362FA
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 22:10:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 889A960C82;
 Wed,  8 Sep 2021 22:10:29 +0000 (UTC)
Date: Wed, 8 Sep 2021 23:10:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Compatibility between -device sga and -machine graphics=off
Message-ID: <YTk006bQJSi9PFmM@redhat.com>
References: <YTjf6BhpPU3aLct9@redhat.com>
 <20210908205053.kn5o57t25qy2qbmo@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210908205053.kn5o57t25qy2qbmo@sirius.home.kraxel.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:50:53PM +0200, Gerd Hoffmann wrote:
> On Wed, Sep 08, 2021 at 05:08:08PM +0100, Daniel P. Berrangé wrote:
> > Given the libvirt XML snippet
> > 
> >   <os>
> >     ...
> >     <bios useserial="yes"/>
> >     ...
> >   </os>
> > 
> > libvirt QEMU driver will always format
> > 
> >   -device sga
> > 
> > Libguestfs uses this syntax, so we need to make sure it still works
> > in future even if 'sga' is disabled or removed in a QEMU build in
> > favour of SeaBIOS' built-in support.
> 
> Just replacing '-device sga' with '-machine graphics=off' in case sga is
> not available should work fine.
> 
> serial console support in seabios is available for quite a while
> (merged in 2017, seabios 1.11 in rhel-7 has it), so switching over
> unconditionally is possibly an option too.  Not sure what the libvirt
> backward compatibility policy is though.

libvirt currently targets QEMU 2.11.0 and newer.

Fortunately it appears that QEMU 2.11.0 included SeaBIOS 1.11.0,
so we can thus eliminate usage of 'sga' from libvirt entirely,
provided I can convince myself migration is safe, which looks
probable.

> > On non-x86 emulators I see graphics=off has semantic effects beyond
> > just controlling whether the firmware prints to the serial or not
> > though.
> 
> It's been a while, but yes, IIRC on ppc this is passed to the linux
> kernel somehow (device tree?) so it also affects the default console
> device used by linux.
> 
> But sgabios is x86-only anyway so that should not be a problem here.

libvirt has never validated the arch when enabling sga, but clearly
it can't ever have been usable on non-x86. So I'll probably restrict
the usage of graphics=off to only those arches where I can validate
it something useful for the firmware output. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


