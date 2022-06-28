Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E155CB45
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:59:43 +0200 (CEST)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Aof-0008Br-Qh
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Al7-0003p9-Cx
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Al1-0004up-Oz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XMpPYXkHaesmntP2xty5CoAn2TSR2xghlCHuxBPSIe8=;
 b=YF8d54YEx5JSs/fwkiLDt3cs6iY+lYcabKMPpkMB2pQfPu6H802ETD87g4eU7ePOTtUNFZ
 5DN8K7UuURLykhzane8M93y6MbusmZrUXpPvmsBH+ZqCXZrHv9nTwYkyaa7MIAmQP1NH/T
 Ahcuin5UW6qzZVT8snKZ3L8p8ziyMAc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-vcMMC3uEPGuaOBpoPIMFJQ-1; Tue, 28 Jun 2022 08:55:53 -0400
X-MC-Unique: vcMMC3uEPGuaOBpoPIMFJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3478818A6526;
 Tue, 28 Jun 2022 12:55:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11CA52024CB9;
 Tue, 28 Jun 2022 12:55:50 +0000 (UTC)
Date: Tue, 28 Jun 2022 13:55:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <Yrr6VDCuKpp8SqW9@redhat.com>
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
 <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 06:06:19PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 5:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > I think the main difference is not even in how it works, it's
> > > in what it does. Which is check that ACPI tables are sane.
> > > Who cares about that? Well developers do when they change the
> > > tables. Users really don't because for users we have the expected
> > > tables in tree and we check against these.
> >
> > It wants to build and run a big guest binary blob -- that to me is
> > the main difference. Users don't much care about any of our tests,
> 
> perhaps but we do enforce patch submitters to make sure make check
> passes before submitting patches. make check-avocado is not run as
> part of make check, requires considerable disk space to download all
> guest images and hence generally not run by patch submitters. Making
> bits parts of avocado tests almost defeats the purpose of having this
> test at all.

This proposed biosbits test also involves a considerable download.
The test is said to be irrelevant for anyone except those working
on a fairly narrow set of QEMU firmware related bits. So by the same
rationale we shouldn't impose that burden on everyone working on
QEMU by having it in qtest. Making it entirely optional, only
downloaded by avocado on demand, for the people who need to run
the tests is best.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


