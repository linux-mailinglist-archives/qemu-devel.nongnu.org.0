Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C130ADAB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:23:30 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cvB-0007YW-Go
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6crK-0004Je-Tm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6crI-0000SV-WF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612199968;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04EhfPcHYX9UhzPf2e/FnBcnF2SHsIOz8eA0EZwoOzo=;
 b=MHr/ATCs45magY4xr4tIEXJkk1v2lR2f0eaP6PIHuRqxJAEh4P4bIcr5T9jvrCbBRnyKZV
 7c25ubpx1h8FGXRPbxmQ1pgfJvlyuOEWJZgid+3Ev1QvpuP+Q72CxWIlDTMws1smbKmUpH
 R5xpE8CU6LkJJoMTLX3wt5fAI2pIEao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-8LMP8JpAMSSJmyife6RiqA-1; Mon, 01 Feb 2021 12:19:25 -0500
X-MC-Unique: 8LMP8JpAMSSJmyife6RiqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC538835DF7;
 Mon,  1 Feb 2021 17:19:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 994FF5D749;
 Mon,  1 Feb 2021 17:19:15 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:19:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210201171912.GO4131462@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
 <CAFEAcA-yzX1ZSPayvy9u8GUbXpgLgQNA7=52qSnDMjakSU0B-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yzX1ZSPayvy9u8GUbXpgLgQNA7=52qSnDMjakSU0B-Q@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 04:53:03PM +0000, Peter Maydell wrote:
> On Mon, 1 Feb 2021 at 15:39, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
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
> > +ABI compatibility levels for CPU models
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The x86_64 architecture has a number of `ABI compatibility levels`_
> > +defined. Traditionally most operating systems and toolchains would
> > +only target the original baseline ABI. It is expected that in
> > +future OS and toolchains are likely to target newer ABIs. The
> > +following table illustrates which ABI compatibility levels can be
> > +satisfied by the QEMU CPU models
> > +
> > +.. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
> > +
> > +.. csv-table:: x86-64 ABI compatibility levels
> > +   :file: cpu-models-x86-abi.csv
> > +   :widths: 40,15,15,15,15
> > +   :header-rows: 1
> 
> Apart from the QEMU/KVM specific CPU models, why is this something
> we should be documenting rather than, say, the people specifying
> what the ABI compatiblity levels are ?

QEMU's named CPU models are not a perfect match for features in the
real world silicon. So even if someone has a Skylake Server CPU with
feature X, this doesn't mean QEMU's definition of the Skylake-Server
CPU model is guaranteed to have feature X.  So we want to document
the compatibility of the exact CPU models that QEMU has defined.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


