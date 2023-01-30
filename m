Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10DA680DF5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTVJ-0000Gt-60; Mon, 30 Jan 2023 07:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMTVF-0000Gi-UF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:43:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMTVD-0006VP-OG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675082594;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5Zk/RN04Ve1Bvgy6wbE3xYgsxSI4LfhbHntVAcZgKg=;
 b=WFxSEaY1XkIL426m3yGb7pZUvBxOS55sKdswrAt3FyAU5iRZbJvg631fN6qtc6p8XF5A0V
 vh/Wps6OKAmrqqONbCahOiX2JUQxb40UryuXSd9DTn2OUth+ZV/g/wWo/TvNlAbFCRANyf
 5tPlcmkQIAj0MZ38jc2NaaTy25zDT7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-VHs9bi8POSemHk-H8WOwsw-1; Mon, 30 Jan 2023 07:43:11 -0500
X-MC-Unique: VHs9bi8POSemHk-H8WOwsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACA7E802D19;
 Mon, 30 Jan 2023 12:43:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46D27C16020;
 Mon, 30 Jan 2023 12:43:08 +0000 (UTC)
Date: Mon, 30 Jan 2023 12:43:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y9e7WeJ5OhkOnba9@redhat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
 <f94ce115-b962-b19d-269e-4f593da61c6f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f94ce115-b962-b19d-269e-4f593da61c6f@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 01:22:22PM +0100, Thomas Huth wrote:
> On 30/01/2023 13.01, Daniel P. Berrangé wrote:
> > On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
> > > On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
> > > > 
> > > > Testing 32-bit host OS support takes a lot of precious time during the QEMU
> > > > contiguous integration tests, and considering that many OS vendors stopped
> > > > shipping 32-bit variants of their OS distributions and most hardware from
> > > > the past >10 years is capable of 64-bit
> > > 
> > > True for x86, not necessarily true for other architectures.
> > > Are you proposing to deprecate x86 32-bit, or all 32-bit?
> > > I'm not entirely sure about whether we're yet at a point where
> > > I'd want to deprecate-and-drop 32-bit arm host support.
> 
> Even mobile phones have 64-bit processors nowadays, Rasberry PIs are 64-bit
> nowadays ... which arm hosts scenarios are still limited to 32-bit ?
> 
> Also, as far as I know, 32-bit KVM arm support has been removed from the
> Linux kernel a while ago already, so it's just about TCG now ... is there
> really still that much interest in running emulation on a non-beefy 32-bit
> host?
> 
> Anyway, we could add the deprecation notice now to find out if there are
> still 32-bit users out there who will then start complaining about this.
> 
> > Do we have a feeling on which aspects of 32-bit cause us the support
> > burden ? The boring stuff like compiler errors from mismatched integer
> > sizes is mostly quick & easy to detect simply through a cross compile.
> 
> The burden are the CI minutes of the shared CI runners. We've got quite a
> bunch of 32-bit jobs in the CI:
> 
> - cross-armel-system
> - cross-armel-user
> - cross-armhf-system
> - cross-armhf-user
> - cross-i386-system
> - cross-i386-user
> - cross-i386-tci
> - cross-mipsel-system
> - cross-mipsel-user
> - cross-win32-system
> 
> If we could finally drop supporting 32-bit hosts, that would help with our
> CI minutes problem quite a lot, I think.

CI is a non-technical constraint, that's more about support level.

If we want to save CI minutes, we can declare that some or all of the
32-bit hosts scenarios are now tier 2, rather than tier 1. So the 32-bit
host support still exists, but we're not doing gating CI on every
combination. eg could declare 32-bit for linux-user is tier 1 and fully
tested but 32-bit machine emul is tier 2 and adhoc tested. Or make it
more nuanced per arch target

We only need to deprecate and delete if we have some wins at the code
level that we can't do with while it exists.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


