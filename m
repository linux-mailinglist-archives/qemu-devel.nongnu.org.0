Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D52ED80D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:37:49 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxb6S-0006JM-BU
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxb4s-0005fT-LS; Thu, 07 Jan 2021 14:36:10 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57106 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxb4p-0003cI-Ee; Thu, 07 Jan 2021 14:36:10 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0C95541268;
 Thu,  7 Jan 2021 19:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610048163;
 x=1611862564; bh=7Jc9pn7dX6TYLIB0mXaziEfQDZjtMQxeIOvPQWYb+GY=; b=
 Mtp+2V+AwVZGdoemfyLLXUd3Ltl7B4DxNHQcqp05NeA5skvY7tww1w9YlxAYOb7o
 ZTbI097m2dunfmbjG69fTIxRN/zywP4+I1XRthwg9mLumqJrUiDoTZSM2FdiQfx8
 tMhORYmDBe/9bETOY5ZDaLesc9QjyvuBv9av3pXW3K8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5E6AmBYGKIIN; Thu,  7 Jan 2021 22:36:03 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7D045404AC;
 Thu,  7 Jan 2021 22:36:03 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 7 Jan
 2021 22:36:03 +0300
Date: Thu, 7 Jan 2021 22:36:20 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/ditOsBmc4A1lJn@SPB-NB-133.local>
References: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
 <X/dQb7xj/RYiT00R@SPB-NB-133.local>
 <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "open list:Block
 layer core" <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 07:22:06PM +0100, Paolo Bonzini wrote:
> On 07/01/21 19:18, Roman Bolshakov wrote:
> > 
> > > The real issue is that Meson's implementation of link_whole for
> > > library-in-library makes sense for one use case (convenience library that is
> > > linked into another convenience library) but not for another (grouping code
> > > for subsystems).  I cannot blame them for this because link_with is a more
> > > common case for the latter; OTOH QEMU is using link_whole a lot in order to
> > > support the *_init() construct.
> > > 
> > > I really think the correct fix is for Meson to use objects instead of
> > > archives for link_whole, similar to how QEMU Makefiles used to do it. This
> > > would also remove the need for the special .fa suffix, so it would be an
> > > improvement all around.
> > > 
> > Does it mean that we need a kind of object target in meson? Do you think
> > if this interface would work?
> > 
> > crypto_objs = object_library(..., dependencies: public_deps + [aninternaldep])
> > crypto = declare_dependency(link_with: crypto_objs, dependencies: public_deps)
> 
> No I think that Meson should simply explode link_whole libraries to their
> constituent objects.  This way duplicates are avoided.
> 

Ok. I've looked through related changes in meson and it flattens object
files implicitly for link_with/link_whole parameters of static_library:

  https://github.com/mesonbuild/meson/pull/6030/files

But qemu adds dependencies to source set and populates dependencies
parameter of static_library and declare_dependency and we get duplicate
symbols:

  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00411.html

Perhaps it's a bug then.

Regards,
Roman

