Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2532A457
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:39:56 +0100 (CET)
Received: from localhost ([::1]:46816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH77r-0005Zp-Ht
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH76k-0004iT-La
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:38:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH76i-0001qS-SE
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614699523;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIiXkajfsKyYWi8Y2M3v3pb6gspLlLv7V7MW6i9eHCw=;
 b=E0nS7ltGXo3M6xZ/Q5ghE3zBZLUi92n9P5pOxIJB022onbdVKUFATfGyvE20M3K+sGdxOz
 obNFeKfy/T8eMSR44fH366iTsDI0Y7E8qO+jrrAX5AF+jsQdxOtsYsBx7VuDQxIExpmYsn
 3sQYqrLeYrFboSEi1IorD4lijN1PJVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-CZvzfSeXO7a694sPxXpm_g-1; Tue, 02 Mar 2021 10:38:28 -0500
X-MC-Unique: CZvzfSeXO7a694sPxXpm_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA1385B664;
 Tue,  2 Mar 2021 15:38:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E40360BFA;
 Tue,  2 Mar 2021 15:38:26 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:38:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YD5b74uynDvWUySy@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
 <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 08:18:03AM -0500, Daniele Buono wrote:
> On 3/2/2021 5:30 AM, Daniel P. Berrangé wrote:
> > On Mon, Mar 01, 2021 at 03:39:42PM -0500, Daniele Buono wrote:
> > > Hi Daniel,
> > > 
> > > On 3/1/2021 10:08 AM, Daniel P. Berrangé wrote:
> > > > What are the unique failure scenarios for CFI that these jobs are
> > > > likely to expose ? Is it likely that we'll have cases where
> > > > CFI succeeds in say, x86_64 target, but fails in aarch64 target ?
> > > For CFI to fail (even if it shouldn't) you'll need code that is calling a
> > > function pointer that was not well defined at compile time. Although
> > > unlikely, that could happen everywhere in the code.
> > What does "was not well defined" mean here ?
> > 
> 
> At high level, the compiler creates metadata for every function. Before
> jumping to a function pointer, it makes sure that the pointer and the
> pointee have matching types.
> Not well defined means one of these two cases:
> 1. The function has a different type than the pointer -> Most likely an
> error

How strictly is this checked ?  With GLib function prototype mismatch
is not uncommon. For example GLib might need to invoke a callback with
a signature:

   int foo(int somearg, void *opaque);

The API though will often declare the callback signature to be
generic

   void (*GCallback) (void);

The caller will implement a callback with

   int foo(int somearg, mytype *mydata);

and will use  G_CALLBACK() to do an intentional bad cast to GCallback

Before it invokes the callback, GLib would cast from GCallback back
to    int foo(int somearg, void *opaque);

Notice this last arg doesn't match the type of the actual implemented
callback.

Is this scenario going to upset  CFI, or is it happy that 'void *'
is compatible with 'mytype *', and ok with the intermediate casts
to/from GCallback ?

> 2. The function was not available at compile time so the compiler could
> not create the related metadata -> Most likely a false positive.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


