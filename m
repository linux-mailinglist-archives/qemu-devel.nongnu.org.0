Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74802EF86A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:53:33 +0100 (CET)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxpF-0002qc-0q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxxRX-0006fL-71; Fri, 08 Jan 2021 14:29:03 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:34476 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxxRS-00057B-Sq; Fri, 08 Jan 2021 14:29:01 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C70FA4120E;
 Fri,  8 Jan 2021 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610134133;
 x=1611948534; bh=SkfEU3ubg7GeAEuNVKVjpdYtnHP7uxx1ZTorzY0XS0M=; b=
 iuLSxxHElaX93LPdgpZqsnjE9ehOCbhmIDKmbDnLNgGNVOrSWTLMZ9Hl0wY/QZ4V
 Ne8xXQExsA7Uf5NcyNon+ZP6rF+wLy9kOXP8kNs0OiavZPXpdx2DYHuTfLN1v/wl
 BkKMeyYrtBJQOaYCc/X3bNsdZbD7cz8CYhiK3fCgcmw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbXsEIyS_PeC; Fri,  8 Jan 2021 22:28:53 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C238641208;
 Fri,  8 Jan 2021 22:28:52 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 8 Jan
 2021 22:28:52 +0300
Date: Fri, 8 Jan 2021 22:29:12 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <X/iyiCT39u5MCS2D@SPB-NB-133.local>
References: <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
 <X/dQb7xj/RYiT00R@SPB-NB-133.local>
 <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
 <X/ditOsBmc4A1lJn@SPB-NB-133.local>
 <CABgObfbYXoGVv4_KSzKR5J4XfJ2du9z77LEh1vrShz-q-O_t4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CABgObfbYXoGVv4_KSzKR5J4XfJ2du9z77LEh1vrShz-q-O_t4g@mail.gmail.com>
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

On Thu, Jan 07, 2021 at 08:41:50PM +0100, Paolo Bonzini wrote:
> Il gio 7 gen 2021, 20:36 Roman Bolshakov <r.bolshakov@yadro.com> ha scritto:
> 
> > > No I think that Meson should simply explode link_whole libraries to their
> > > constituent objects.  This way duplicates are avoided.
> > >
> >
> > Ok. I've looked through related changes in meson and it flattens object
> > files implicitly for link_with/link_whole parameters of static_library:
> >
> >   https://github.com/mesonbuild/meson/pull/6030/files
> >
> > But qemu adds dependencies to source set and populates dependencies
> > parameter of static_library and declare_dependency and we get duplicate
> > symbols:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00411.html
> >
> > Perhaps it's a bug then.
> >
> 
> No, the same deduplication is not done for executables, because executables
> use libraries directly and not their object files.
> 

Paolo,

I tried to use extract_all_objects() to get all object files directly
but it doesn't work on dependency objects defined via
declare_dependency(). It works only on regular targets (libs and
executables). And as far as I understand the intention to have
declare_dependency() in QEMU was to specify public interface to avoid
some duplication. But meson doesn't have public/private notion for build
targets so if we drop declare_dependency we need to specify link_whole
in every user of a library that's had link_whole: declare_dependency()
and build files would become less lean. So I'm not sure how to proceed.

The proposed patch (in the subject) is the still the best we've got so
far that fixes macOS build immediately without much bigger wrestling
with meson.

-Roman

