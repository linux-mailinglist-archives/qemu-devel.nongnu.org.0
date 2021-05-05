Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2703738DF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:54:12 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFAR-0001Pn-Oq
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leF8n-0000b2-N6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leF8k-0007Ux-2m
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211944;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcr0sZVtGy0QyodyGTD/QilUyY6MXlJnnT/JXieunPg=;
 b=Ycj2CJUx7vIqmiX5xsRi2cd/VSGTmSEIbU6Boi6nkx6WcFhw/SvOsGAa5zuy6EOYApDuwl
 1nY+fmmc0TCorf/2wEibh2zDZNb3/jyraN4YzTMKpLhr4pNhrzzFHKPE9IrGj0YI9l6Sjn
 F/sAXbJrKKrgM99B7ADBGRi08k3dQ4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-SkxO7NO9MAaIIjoPXU9koQ-1; Wed, 05 May 2021 06:52:20 -0400
X-MC-Unique: SkxO7NO9MAaIIjoPXU9koQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B1A803620;
 Wed,  5 May 2021 10:52:18 +0000 (UTC)
Received: from redhat.com (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ADB1421F;
 Wed,  5 May 2021 10:52:08 +0000 (UTC)
Date: Wed, 5 May 2021 11:52:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Message-ID: <YJJ41bUEY+Gfkw/Z@redhat.com>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
 <YJJmYOWDl0UzziW7@redhat.com> <87lf8to49d.fsf@linaro.org>
 <87im3xo3zv.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87im3xo3zv.fsf@linaro.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, mohamad.gebai@gmail.com,
 kuhn.chenqun@huawei.com, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 11:41:46AM +0100, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> >
> >> On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Bennée wrote:
> <snip>
> >>> +TCG introspection features
> >>> +--------------------------
> >>> +
> >>> +TCG trace-events (since 6.1)
> >>> +''''''''''''''''''''''''''''
> >>> +
> >>> +The ability to add new TCG trace points has bit rotted and as the
> >>
> >> When you say this "has bit rotted", just how bad is the situation ?
> >>
> >> Is the TCG tracing still usable at all, or is is fully broken
> >> already ?
> >
> > Well patches 6/7 got it working for generic TCG things. I haven't been
> > able to get the architecture one working but I suspect that is some sort
> > of interaction between the per-arch trace header generation that I
> > haven't quite figured out yet.
> 
> Ahh it's since 7609ffb919 (trace: fix tcg tracing build breakage) which
> limited tcg/vcpu events to the root trace-events file.

That commit is from release 2.10.0.

The other commit mentioned in patch 6 (73ff061032) is from 2.12.0.

So no one has been able to use this feature for 3+ years already.

Is it actually worth fixing and then deprecating for 2 releases before
deleting, as opposed to just deleting the broken code today on basis
that it can't have any current users ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


