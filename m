Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE22ED69D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:19:36 +0100 (CET)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZsl-0001LK-9H
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxZrR-0000UG-8H; Thu, 07 Jan 2021 13:18:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:52152 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxZrP-0002Ab-4l; Thu, 07 Jan 2021 13:18:12 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A549241283;
 Thu,  7 Jan 2021 18:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610043487;
 x=1611857888; bh=Dc3ta0kPvmqurJnqQM9izWM0l4LTeDh7k/ekk+OWlDI=; b=
 Ze2D3fugpz1EjezxTqbo5JD/n8VDI8p8V2yQjKJm6fKAb6VxMfPsmLtI2rvA/7Cw
 yl+sc50boexUv5Dk0eaEpj9C1ktssQpQNoNej5XuFt2eDbL8yqxxhudf7O/Ws0dq
 OwFZjvTk+CgEZPag4FZC9e1lmZbyGrDLcHiZm6ATyhk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAkc84nKNDin; Thu,  7 Jan 2021 21:18:07 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 459A2412C6;
 Thu,  7 Jan 2021 21:18:06 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 7 Jan
 2021 21:18:05 +0300
Date: Thu, 7 Jan 2021 21:18:23 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/dQb7xj/RYiT00R@SPB-NB-133.local>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
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

On Thu, Jan 07, 2021 at 05:23:54PM +0100, Paolo Bonzini wrote:
> On 07/01/21 16:56, Roman Bolshakov wrote:
> > IMO duplication of dependencies shouldn't be needed for a build system.
> > Meta build system should allow private and public dependencies. Different
> > rules are applied to them. Private dependency is not propagated beyond a
> > target that uses it, public dependency is propagated.
> > 
> > Right now it seems that meson is missing the notion of public and
> > private dependencies and that's where the problem arises. The post [1] (and
> > the related issue) summarizes what I'm trying to say.
> 
> Meson doesn't have a concept of public dependencies because it separates the
> private (static library) and the public (declare_dependency) view. That is
> you'd have:
> 
> public_deps = [gnutls, anotherpublicdep]
> lib = static_library(..., dependencies: public_deps + [aninternaldep])
> dep = declare_dependency(link_with: lib, dependencies: public_deps)
> 

Thanks! This wasn't obvious to me. But what's not clear that CMake can
do both collection of objects (what I provided in the example) and
static libraries and they're different. I assume what you have shown
would look in CMake like (please note that STATIC is used instead of
OBJECT):

add_library(crypto STATIC crypto-file1.c ...)
target_link_libraries(crypto PRIVATE aninternaldep
                              PUBLIC  gnutls
                                      anotherpublicdep)


That explains why attempt to use dependencies between link_whole static
libraries in meson causes symbol duplication. CMake on other hand can
just make collection of objects or even a chain of collection of
objects. They'll be linked in fully only in a final static library,
shared library or an executable.

> The real issue is that Meson's implementation of link_whole for
> library-in-library makes sense for one use case (convenience library that is
> linked into another convenience library) but not for another (grouping code
> for subsystems).  I cannot blame them for this because link_with is a more
> common case for the latter; OTOH QEMU is using link_whole a lot in order to
> support the *_init() construct.
> 
> I really think the correct fix is for Meson to use objects instead of
> archives for link_whole, similar to how QEMU Makefiles used to do it. This
> would also remove the need for the special .fa suffix, so it would be an
> improvement all around.
> 

Does it mean that we need a kind of object target in meson? Do you think
if this interface would work?

crypto_objs = object_library(..., dependencies: public_deps + [aninternaldep])
crypto = declare_dependency(link_with: crypto_objs, dependencies: public_deps)

Regards,
Roman

> Paolo
> 
> > If we resolve the issue, then we just specify gnutls as a public
> > dependency of crypto and all users of crypto would get gnutls headers.
> > 
> > Here's an example how clearly CMake approaches the issue [2][3]:
> > 
> > add_library(crypto OBJECT crypto-file1.c ...)
> > target_link_libraries(crypto PRIVATE aninternaldep
> >                               PUBLIC  gnutls
> >                                       anotherpublicdep)
> > 
> > 1.https://github.com/mesonbuild/meson/issues/495#issuecomment-206178570
> > 2.https://cmake.org/cmake/help/latest/command/target_link_libraries.html#linking-object-libraries
> > 3.https://cmake.org/cmake/help/latest/command/target_link_libraries.html#libraries-for-a-target-and-or-its-dependents
> 

