Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A74E65A6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 15:50:06 +0100 (CET)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXOmr-0001Zp-8O
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 10:50:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXOkk-0000A6-8R
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXOkf-0003dp-BY
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 10:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648133268;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EJKzOcklGmHKScTdIVSdVcDo7rJblhmuW50uVqMiFc=;
 b=i9YixihkAvGEWVeM9GMy3lrK8wyKOOAbYfQXPfCDIageAr2cPUMPYBaj1Z1iMub/HNbX37
 gUnM+ckE6EDIEv4B1wGQU7u65NMGpUwPCNDLqciQzcEK1B5yPZsNTSsIFtL9i+N9fG/k8N
 ZQ1YPwUyVtsgOqENrXf+5Bz+sG9Kapg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-psuU6U6tP5-X5t25GXkUfQ-1; Thu, 24 Mar 2022 10:47:40 -0400
X-MC-Unique: psuU6U6tP5-X5t25GXkUfQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6133B801585;
 Thu, 24 Mar 2022 14:47:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1EE3403176;
 Thu, 24 Mar 2022 14:47:38 +0000 (UTC)
Date: Thu, 24 Mar 2022 14:47:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
Message-ID: <YjyEiPalZkS+aQs+@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
 <CABJz62N52DA8P9EweUnqgO6-Yy6-e8in2PDyjqcE_kbhWh7kvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABJz62N52DA8P9EweUnqgO6-Yy6-e8in2PDyjqcE_kbhWh7kvA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:29:25PM +0000, Andrea Bolognani wrote:
> On Thu, Mar 24, 2022 at 09:03:07AM +0000, Daniel P. Berrangé wrote:
> > > Overall making it *all* GPLv2+ compat is going to be important if you
> > > want people to be comfortable using it. If it has a mix of GPLv2+
> > > and GPLv2-only code in the source tarball, then the overall combined
> > > work will have to be considered GPLv2-only and that will put people
> > > off using it. Even if they could theoreticallly restrict their usage
> > > to only the GPLv2+ parts, many won't get that far before moving on.
> 
> Agreed.
> 
> > Actually I'll go furthuer and suggest that if we're going to do a
> > relicensing at all, and your goal is to encourage usage, then GPLv2+
> > is the wrong choice. Use LGPLv2+ if you want to facilitate usage, while
> > retaining a copyleft license.
> 
> Does LGPL make sense in the context of Python, where there is no
> linking?

It isn't linking in the native binary sense of the word, but I'd
still consider in "linking" in the more general sense that you're
combining two distinct pieces of work, one of which is a library.

BSD/MIT is more common in the arbitrary snapshot of installed pyton
mods on my system, but there are still a decent number of GPL and
LGPL licensed python modules, and I'd consider the distinction
between GPL and LGPL to still be valid for Python apps.

Ultimately QEMU has been a copyleft licenses project, so I feel
that's a preferrable choice to stick with for the python code,
over the totally permissive licenses.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


