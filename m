Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A592FBC81
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:34:09 +0100 (CET)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1txI-0004Xc-Qp
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1tuN-0003Mc-0l
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1tuL-0006Wa-4N
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611073863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fbDKYN/EdnVf2fLBZ3hI/+bbKwc4soxEmtuUZhkH7Sk=;
 b=EtnT25588YoVPa8vPe4GUzNQ9QCvyv2nzUzIed6s+POcfvzQoM7uLDk4ZC9lA3N1CIteH/
 NgAvCmP4T+yz0ZpkWYptABev1rtqcNo4wApxRiOWYybChJMZsoycotvBOEP0irXLLNPzUV
 pby7K1fxqCFcJAWbmjk9pO2c+Ff4elg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-OIog_EGdNzePcx3yrR7drw-1; Tue, 19 Jan 2021 11:30:59 -0500
X-MC-Unique: OIog_EGdNzePcx3yrR7drw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1444BBEE1;
 Tue, 19 Jan 2021 16:30:57 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA6E510016FF;
 Tue, 19 Jan 2021 16:30:53 +0000 (UTC)
Date: Tue, 19 Jan 2021 11:30:52 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [External] : Re: [RFC PATCH 1/2] hw/i386: -cpu
 model,-feature,+feature should enable feature
Message-ID: <20210119163052.GG1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
MIME-Version: 1.0
In-Reply-To: <cuna6t499ir.fsf@dme.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 04:27:56PM +0000, David Edmondson wrote:
> On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:
> 
> > Hi,
> >
> > Thanks for the patch.  Getting rid of special -feature/+feature
> > behavior was in our TODO list for a long time.
> >
> > On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:
> >> "Minus" features are applied after "plus" features, so ensure that a
> >> later "plus" feature causes an earlier "minus" feature to be removed.
> >> 
> >> This has no effect on the existing "-feature,feature=on" backward
> >> compatibility code (which warns and turns the feature off).
> >
> > If we are changing behavior, why not change behavior of
> > "-feature,feature=on" at the same time?  This would allow us to
> > get rid of plus_features/minus_features completely and just make
> > +feature/-feature synonyms to feature=on/feature=off.
> 
> Okay, I'll do that.
> 
> Given that there have been warnings associated with
> "-feature,feature=on" for a while, changing that behaviour seems
> acceptable.
> 
> Would the same be true for changing "-feature,+feature"? (i.e. what this
> patch does) Really: can this just be changed, or does there have to be
> some period where the behaviour stays the same with a warning?

I actually expected warnings to be triggered when using
"-feature,+feature" as well.  If we were not generating warnings
for that case, it will need more careful evaluation, just to be
sure it's safe.  Igor, do you remember the details here?

-- 
Eduardo


