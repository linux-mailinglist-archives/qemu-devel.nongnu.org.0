Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69213E5AA2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:04:18 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRQX-00040y-W1
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDROu-0002dw-Ae
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDROr-0007hE-K5
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628600553;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB2i6ccwP1lmZUqacFFScrbsgtzvwtDmDlr4j4p7HF0=;
 b=GBoKIt6dB9nULHv7kaxirnkLwI7cEIFyqwFW/xPfrHr1iUV/iju2N4Mtv06di6fYihkPn5
 NjutAnM1IRX0VpoYm6WuDW9iFWKBr0Vs68JhXty3igdZQlKG1b6LL0b/rIu2c69XAvzcji
 db2VWMJf/J4RORzphCTIuiImaz4/xcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Yjhj8C82M-6rivSH0mm8fg-1; Tue, 10 Aug 2021 09:02:28 -0400
X-MC-Unique: Yjhj8C82M-6rivSH0mm8fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB73801AE7;
 Tue, 10 Aug 2021 13:02:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADE013AD3;
 Tue, 10 Aug 2021 13:02:26 +0000 (UTC)
Date: Tue, 10 Aug 2021 14:02:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: make sphinx-build be quiet by default
Message-ID: <YRJ43+nESHtsDf1w@redhat.com>
References: <20210810110023.3923155-1-berrange@redhat.com>
 <CAFEAcA_J2T92Gr6-koxofLw5cFEad4evLkSXS9L9gef1OV1yLQ@mail.gmail.com>
 <YRJfS7yRmwO+bQBt@redhat.com>
 <CAFEAcA88NK8F9UAep2yL-aVyZX+r5gUdy6+VbdB4HvjbgW1qWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA88NK8F9UAep2yL-aVyZX+r5gUdy6+VbdB4HvjbgW1qWw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 01:48:51PM +0100, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 12:13, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Aug 10, 2021 at 12:06:47PM +0100, Peter Maydell wrote:
> > > Can we make meson pass '-q' only for non-verbose builds, so that
> > > if you pass make 'V=1' you still get the verbose sphinx output ?
> >
> > The meson.build rules are turned into a ninja.build file at configure time.
> > IOW, at the time that conversion happens the V=1 arg isn't present, so we
> > can't conditionally pass '-q'.
> 
> I'd rather have "always verbose" than "never verbose" then, I think.
> 
> Also, this seems like a meson/ninja misfeature if we can't do
> a perfectly sensible thing. We can do it for cc, why not sphinx?

This patch is trying to make sphinx behave the same way as CC.

With CC by default you get "Compiling C object ...." and with V=1
you get the gcc command line printed.

With sphinx you now get "Generating QEMU manual with a custom command"
and with V=1 you get the sphinx-build command line printed.

In both cases you'll get errors printed to stderr by gcc/sphinx

There is no case in which GCC would print verbose progress information
reading source/header files to stdout, which is what sphinx currently
does without '-q'

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


