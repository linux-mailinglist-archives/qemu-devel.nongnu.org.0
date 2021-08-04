Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6833E02D6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:11:47 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHcX-0002pp-Uv
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBHbY-0001zn-WC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBHbV-0008B5-70
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628086239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnJ1Iqrhhg2dQ8YItw9ZfMyMAiMZStfFOOiLa6wOK3Q=;
 b=QJiPRDIgXgG8R+S79NhkSl8/Q9Tgrzm2IT5sgBImDNFkMj9jGi2oub57ix9KZEjvKyZ6kT
 fjygiNFo+y+Qx1Jq8ACfGH/B6Rm60xb97AVc2qAIZBoUfsFSxDPcaPz3soyR84+CPBbYOL
 NuMoJQ4K4UfsOwvDjfoyEi5qMLMH4DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-wpm3-OPRP2abzYiT_Xjf5w-1; Wed, 04 Aug 2021 10:10:35 -0400
X-MC-Unique: wpm3-OPRP2abzYiT_Xjf5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B51892503;
 Wed,  4 Aug 2021 14:10:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAEC366FFF;
 Wed,  4 Aug 2021 14:10:32 +0000 (UTC)
Date: Wed, 4 Aug 2021 15:10:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Failing iotest 206
Message-ID: <YQqf1axrlDfGZYLH@redhat.com>
References: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
 <20210720011151.l66z3q5hfc7urcfv@redhat.com>
 <YPaKMLGBINB+uSXz@redhat.com> <YQl6O8z0LIOXHzlV@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YQl6O8z0LIOXHzlV@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 07:17:47PM +0200, Kevin Wolf wrote:
> Am 20.07.2021 um 10:32 hat Daniel P. Berrangé geschrieben:
> > On Mon, Jul 19, 2021 at 08:12:58PM -0500, Eric Blake wrote:
> > > On Mon, Jul 19, 2021 at 10:06:01AM +0200, Thomas Huth wrote:
> > > >  Hi,
> > > > 
> > > > iotest 206 fails for me with:
> > > > 
> > > 
> > > > --- 206.out
> > > > +++ 206.out.bad
> > > > @@ -99,55 +99,19 @@
> > > > 
> > > >  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options":
> > > > {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode":
> > > > "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg":
> > > > "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file":
> > > > {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
> > > >  {"return": {}}
> > > > +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
> > > >  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> > > >  {"return": {}}
> > > 
> > > > 
> > > > Looks like it is missing a check for the availability of the corresponding
> > > > crypto stuff? Does anybody got a clue how to fix this?
> > > 
> > > What system is this on? Which crypto library versions are installed?
> > > I suspect this is related to Dan's effort to speed up crypto by
> > > favoring gnutls over nettle, where the switch in favored libraries
> > > failed to account for whether twofish-128 is supported?
> > > 
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03886.html
> > 
> > Yes, the gnutls provider doesn't support twofish. This doesn't matter
> > in real world usage because no one is seriously going to ask for twofish
> > instead of AES for luks encryption.
> > 
> > I guess that test suite was simply trying to ask for some non-default
> > values though.
> 
> Do we already have a patch somewhere that makes it use a different
> value? Or if not, which value would be most likely to work everywhere?

Ultimately there is only one cipher alg that is guaranteed 'aes',
which can be used in two keysizes 128/256, and two modes cbc/xts.

Sine aes-128 with xts is the default, if you want to exercise
a non-default codepath for LUKS support, i'd suggest aes-256
with cbc mode, and essiv IV generator.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


