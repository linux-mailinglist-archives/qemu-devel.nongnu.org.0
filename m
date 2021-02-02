Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B830BE27
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:28:20 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6un5-0001J4-Hq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6uiy-0007Gt-2A
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:24:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6uis-0006si-Jm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612268636;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6M7JWjNBJyJ0PYnbR1UF12LuEtXcDjZmDnKN85uT3xo=;
 b=NE5wxehUgqNm8lI31lMgvRnIm37VvjIZcoUUwNyFXJOICMkl6E/s9A7Q6s7b15bzVp5SsH
 jAa8gskiv5ebsMixhlt9koU5fQUD8kbcCvMNWhNFNXxISbyz0qlHszDSaaHxNgMISOeS+Y
 wyzBE24te6TZDyqAo/5kRLsiwA+kANQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-N2JL6awnP0uq6-Kv8gQLuw-1; Tue, 02 Feb 2021 07:23:51 -0500
X-MC-Unique: N2JL6awnP0uq6-Kv8gQLuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A5D780ED8E;
 Tue,  2 Feb 2021 12:23:50 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726641002393;
 Tue,  2 Feb 2021 12:23:45 +0000 (UTC)
Date: Tue, 2 Feb 2021 12:23:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210202122342.GC4168502@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
 <cunv9balsck.fsf@dme.org>
MIME-Version: 1.0
In-Reply-To: <cunv9balsck.fsf@dme.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 09:41:15AM +0000, David Edmondson wrote:
> On Monday, 2021-02-01 at 15:36:03 GMT, Daniel P. Berrangé wrote:
> 
> > It is useful to know which CPUs satisfy each x86-64 ABI
> > compatibility level, when dealing with guest OS that require
> > something newer than the baseline ABI.
> >
> > These ABI levels are defined in:
> >
> >   https://gitlab.com/x86-psABIs/x86-64-ABI/
> >
> > and supported by GCC, CLang, GLibC and more.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  MAINTAINERS                        |   2 +-
> >  docs/system/cpu-models-x86-abi.csv | 121 +++++++++++++++++++++++++++++
> >  docs/system/cpu-models-x86.rst.inc |  18 +++++
> >  3 files changed, 140 insertions(+), 1 deletion(-)
> >  create mode 100644 docs/system/cpu-models-x86-abi.csv
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fbb228ef2b..bb8d60c458 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -344,7 +344,7 @@ F: tests/tcg/i386/
> >  F: tests/tcg/x86_64/
> >  F: hw/i386/
> >  F: disas/i386.c
> > -F: docs/system/cpu-models-x86.rst.inc
> > +F: docs/system/cpu-models-x86*
> >  T: git https://gitlab.com/ehabkost/qemu.git x86-next
> >  
> >  Xtensa TCG CPUs
> > diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
> > new file mode 100644
> > index 0000000000..4565e6a535
> > --- /dev/null
> > +++ b/docs/system/cpu-models-x86-abi.csv
> > @@ -0,0 +1,121 @@
> > +Model,baseline,v2,v3,v4
> > +486,,,,
> > +486-v1,,,,
> > +Broadwell,✅,✅,✅,
> > +Broadwell-IBRS,✅,✅,✅,
> > +Broadwell-noTSX,✅,✅,✅,
> > +Broadwell-noTSX-IBRS,✅,✅,✅,
> 
> Would it be useful to add an explicit negative mark (✘) in the slots
> where the CPU does not satisfy the requirement? It makes reading the
> table a little easier (my opinion, of course).

I felt it was clearer to only show the positive case. Since the
ABI levels are additive, you can count the ticks at a glance to see
the ABI level achieved. Also this CSV file isn't really meant to
be seen by users directly. It is just data input that gets rendered
into an HTML table that looks like this:

  https://berrange.gitlab.io/-/qemu/-/jobs/1001700036/artifacts/public/system/target-i386.html#recommendations-for-kvm-cpu-model-configuration-on-x86-hosts

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


