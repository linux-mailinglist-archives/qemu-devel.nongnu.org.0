Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CEE67CE49
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3Lw-0000rn-Qn; Thu, 26 Jan 2023 09:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3Lu-0000rS-Nf
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pL3Ls-0000mq-Ph
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674743743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mjes/+iy4yKem7cQHBdHF9tiZOx4vJ41V8SyNBPWO2U=;
 b=Pe6/3d2U0mk9toRwKcHFJbIO25eEvKErxWHsKqhXKOiVHynMQbTKkAirN4hjpy9rxKs6XA
 f0V2WwMqa69NPi3G62osGCmu7YgPO4NqM7dzdvGHhwSZQRr3pOnGeI6nvi8qqKz4XcfMEh
 yeB9/LOUet08Jliz2aJ6Ev9AZcN1Dgw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-DY1AVFy5NoKLPkmy9VbhXw-1; Thu, 26 Jan 2023 09:35:40 -0500
X-MC-Unique: DY1AVFy5NoKLPkmy9VbhXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C263C1485C;
 Thu, 26 Jan 2023 14:35:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D38B751E5;
 Thu, 26 Jan 2023 14:35:38 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:35:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9KPuOT3NEAjN740@redhat.com>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <87pmb1pfas.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmb1pfas.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Thu, Jan 26, 2023 at 01:57:02PM +0000, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > Hi; we've run out of gitlab CI pipeline minutes for this month.
> > This leaves us the choice of:
> >  (a) don't process any more pullreqs til we get more minutes in Feb
> >  (b) merge pullreqs blindly without CI testing
> >  (c) buy more minutes
> >
> > For the moment I propose to take option (a). My mail filter will
> > continue to track pullreqs that get sent to the list, but I won't
> > do anything with them.
> >
> > If anybody has a better suggestion feel free :-)
> 
> I've submitted a support request (#366644) to GitLab to see if they will
> give us more minutes for this month. Longer term ideas:
> 
>  * Reduce compile time by reducing number of identical object files we
>    build for specific_ss
>  * Move more tests over to custom runners (don't we have an x86 box
>    somewhere?)

NB, we don't want to sacrifice coverage for contributors fork CI.

The current private runners don't do that because they're testing
scenarios that were already impossible with shared runners.

>  * Carry out an audit of code coverage for different test sets and
>    rationalise our CI set

I'm confident we can rationalize our jobs, especially the cross
compilation ones.

For each non-x86 arch we've got two sets of jobs, one for system
emulators and one for user emulators.

IMHO the most interesting part of non-x86 testing is the TCG
host target. We don't need 2 jobs to cover that, either system
or user emulators would cover TCG build / test. Most of the rest
of code is not heavily host arch dependant.

So for cross compilation we could limit ourselves to

  - 1 job per TCG host target 
  - Some full coverage job(s) for a big endian arch
  - Some full coverage job(s) for a 32-bit arch

I expect that could eliminate quite a few cross arch jobs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


