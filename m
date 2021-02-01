Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9C30ADA4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:21:01 +0100 (CET)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6csj-0004DZ-1q
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6cpp-0002iR-MD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6cpm-0008F0-Sv
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612199873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijFzKQM0M7UIkKeoxGk2+/sLqwx0hNJN1Lxsf8OPPCQ=;
 b=EBobLnODpc6QUMIYFNA7ryETRmobqv5LqFDMdUicglSdPKJ+XyqINGpkPipBYsTZzJdvP4
 XZVYPQ3F/XXb/hWMkGm3tWdWJP7rjaM3rNqMCI7Ddg8haksYUArLa8lwFSVd9oXrGSdFmX
 sSAccDHOA46Q49INZWsd7VE5dzBBk2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-4BYIuAfhMUKdh28l6NwR0g-1; Mon, 01 Feb 2021 12:17:51 -0500
X-MC-Unique: 4BYIuAfhMUKdh28l6NwR0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1130A100C61F;
 Mon,  1 Feb 2021 17:17:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 395855C23D;
 Mon,  1 Feb 2021 17:17:45 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:17:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210201171742.GN4131462@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
 <87sg6foiha.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sg6foiha.fsf@oldenburg.str.redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 05:33:53PM +0100, Florian Weimer wrote:
> * Daniel P. Berrangé:
> 
> > and supported by GCC, CLang, GLibC and more.
> 
> Clang and glibc are the official spellings, I think.

Ok.

> > diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
> > new file mode 100644
> > index 0000000000..4565e6a535
> > --- /dev/null
> > +++ b/docs/system/cpu-models-x86-abi.csv
> 
> > +Icelake-Client,✅,✅,✅,
> > +Icelake-Client-noTSX,✅,✅,✅,
> > +Icelake-Client-v1,✅,✅,✅,
> > +Icelake-Client-v2,✅,✅,✅,
> 
> Icelake Client supports x86-64-v4 according to Intel ARK and a quick
> test on a reference system.  Have you defined it differently in QEMU?

QEMU's Icelake-Client CPU models appear to be missing most of the AVX-512
CPUIDs bits:

  https://gitlab.com/qemu-project/qemu/-/blob/master/target/i386/cpu.c#L3291

Compared to Icelake-Server which does have them:

  https://gitlab.com/qemu-project/qemu/-/blob/master/target/i386/cpu.c#L3409

I don't know why it is specified this way in QEMU. It could easily
be a bug in QEMU's definitions. Alternatively there might be a subset
of Icelake-Client SKUs which genuinely do lack these features, and
this influenced the decision to omit them from QEMU models.


> > +KnightsMill,✅,✅,✅,
> > +KnightsMill-v1,✅,✅,✅,
> 
> This one is correct.  Even though Knights Mill supports AVX-512, it does
> not cover the variants that are considered definitive for x86-64-v4.
> 
> > +Skylake-Server,✅,✅,✅,✅
> > +Skylake-Server-IBRS,✅,✅,✅,✅
> > +Skylake-Server-noTSX-IBRS,✅,✅,✅,✅
> > +Skylake-Server-v1,✅,✅,✅,✅
> > +Skylake-Server-v2,✅,✅,✅,✅
> > +Skylake-Server-v3,✅,✅,✅,✅
> > +Skylake-Server-v4,✅,✅,✅,✅
> 
> This one is a little bit odd.  Skylake Xeons which are not Xeon Scalable
> Processors exist, and they do not support x86-64-v4.  Is this again a
> matter of different naming in QEMU?

Most likely this is just a case of the QEMU Skylake-Server model being
written in terms of the most common SKUs, and ignoring the inconvenience
of certain SKUs lacking the features.


In general there are waaaay too many different variants of Intel CPUs for
QEMU to provide a named model to cope with every scenario. So the QEMU
models are always an approximation of what exists in the silicon.

If there are places where we've made bad mistake, we do now have the
ability to do CPU versioning. So in theory we could introduce a new
Skylake-Server-v5 which removes the AVX512 stuff if there's a genuine
problem with some variants of silicon not supporting it. Alternatively
people with such hosts can just use an older named model like
Skylake-Client.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


