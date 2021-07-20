Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3F3CF629
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:34:01 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5lCS-0002SJ-8K
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5lBU-0001ZO-Ku
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5lBS-0001Xw-Oc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626769978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vNthB/DSgivwulxRM48hoqVRFVr/5yj8dLIK2SOAXFU=;
 b=JQ6uQP5XlIP+/lV3EM3AaZ+fcKohU3H91zRag6pDhlOn5drctkSMbW2xs8oC1qSSrVI3bR
 p2mrlpmRJq5kGBuhm6hUjfxRW/WBi3hlXStDPwf2OXPM2WMgBvUD6EQzD4xeU9hmUoP/b+
 +xOfMjj2yow6aFbriJhgM1uA3nsGaa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-znW-HjvnP26VaRjtg9znxg-1; Tue, 20 Jul 2021 04:32:53 -0400
X-MC-Unique: znW-HjvnP26VaRjtg9znxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7870510168C8;
 Tue, 20 Jul 2021 08:32:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DE160BD8;
 Tue, 20 Jul 2021 08:32:51 +0000 (UTC)
Date: Tue, 20 Jul 2021 09:32:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: Failing iotest 206
Message-ID: <YPaKMLGBINB+uSXz@redhat.com>
References: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
 <20210720011151.l66z3q5hfc7urcfv@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720011151.l66z3q5hfc7urcfv@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 08:12:58PM -0500, Eric Blake wrote:
> On Mon, Jul 19, 2021 at 10:06:01AM +0200, Thomas Huth wrote:
> >  Hi,
> > 
> > iotest 206 fails for me with:
> > 
> 
> > --- 206.out
> > +++ 206.out.bad
> > @@ -99,55 +99,19 @@
> > 
> >  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options":
> > {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode":
> > "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg":
> > "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file":
> > {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
> >  {"return": {}}
> > +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
> >  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> >  {"return": {}}
> 
> > 
> > Looks like it is missing a check for the availability of the corresponding
> > crypto stuff? Does anybody got a clue how to fix this?
> 
> What system is this on? Which crypto library versions are installed?
> I suspect this is related to Dan's effort to speed up crypto by
> favoring gnutls over nettle, where the switch in favored libraries
> failed to account for whether twofish-128 is supported?
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03886.html

Yes, the gnutls provider doesn't support twofish. This doesn't matter
in real world usage because no one is seriously going to ask for twofish
instead of AES for luks encryption.

I guess that test suite was simply trying to ask for some non-default
values though.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


