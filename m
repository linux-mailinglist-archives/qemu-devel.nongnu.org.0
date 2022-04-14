Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA0F500494
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:13:40 +0200 (CEST)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nepvO-0001sO-TK
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nepu8-0001CD-Rt
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nepu5-0007k5-I4
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649905935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSWSHXUUrAqPxpMzB71JbZ/4yfKGqSUYtCigyEBbK2s=;
 b=Bw3X/nzihtJxOw9OmyWlzR4tL9CNys/TueZLu77siLDXYO09kcgC+UFOjOTWg2loypVryg
 6vRTMqnQy8ctA1YnbPJuLVRyxthy0KJhVWBISJJSySFOosjmM+CLtXzsPyKUyPaYn9Morb
 ng82UT8atXG9LYwV5e7lPldy9NTmqhM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-090gud_VOYenfR91Bh6Csw-1; Wed, 13 Apr 2022 23:12:14 -0400
X-MC-Unique: 090gud_VOYenfR91Bh6Csw-1
Received: by mail-lf1-f72.google.com with SMTP id
 v13-20020a056512096d00b004487e1503d0so1785723lft.4
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSWSHXUUrAqPxpMzB71JbZ/4yfKGqSUYtCigyEBbK2s=;
 b=3MMxMD8GvslkmJrxGpFEgk8LVTFWe+JEij3ICZYU4dN8mz/43RrY5HcNArxQkvXEvu
 D1/FaDWBnWBfUBUZcQgzIs60/d5n3WoxIru+Z1rUODNMsrJtios0HiU+UwW98zxbcu71
 l4pyUpiIUSb766AbQYDiDrc+zmCRo9cFHswOMOehh4VmCPy4nCXcGvNL84f6gemKstA3
 acEqtqJ+g7jbRe4Fk+LBTu3g0ffaLeNIR09s98AGiQvNVCXIlsxMgBM7XskqRHin4SEE
 M+N8Rvr4slyS1v2vhk6X+brxhq1hDCdZ68JxKvUA+F83j2DR0+dP78FeANZuCQDpVSdv
 D+tA==
X-Gm-Message-State: AOAM533mxDrU1XEOK3fTINHR9BojoQujF3dIG8ZuKTTsmuAIXud1MMgV
 RSzsZDBQaHZumf6ZRszDbggGJESs6C6NHqKvznk0jZXGM9oP0c39dEqJdtNQ5F0Hxm0kEywd9vD
 +NmQf13dBZnfXdgSngt5xI5dXMeali7Y=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr406743ljq.300.1649905933193; 
 Wed, 13 Apr 2022 20:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9am7s22AZofpErvZ+bwvpiSgcu0Ij7lZrMm5w3I7hGN2h3/4SAu4RPz1GWSVeZ6IVG5ebrAdXidv4EMzwAT4=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr406730ljq.300.1649905932935; Wed, 13
 Apr 2022 20:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <MWHPR11MB00314CD6EF6407DD7CFB2FC89BEF9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00314CD6EF6407DD7CFB2FC89BEF9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 11:12:01 +0800
Message-ID: <CACGkMEvE9Hf56dkd4zB0JULr7cG-g0Bafxz4--Xj+C2z5MUkfQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 9:52 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
> No update for a while. Ping...
>
> Thanks
> Chen

Hi:

It's near to release, I think we can queue this for 7.1?

Thanks

>
> > -----Original Message-----
> > From: Zhang, Chen <chen.zhang@intel.com>
> > Sent: Friday, April 1, 2022 11:47 AM
> > To: Jason Wang <jasowang@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Cc: Zhang, Chen <chen.zhang@intel.com>; qemu-dev <qemu-
> > devel@nongnu.org>
> > Subject: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
> >
> > This series fix some COLO related issues in internal stress testing.
> >
> >  - V2:
> >     - Add more comments in patch 2/4 commit log.
> >
> > Zhang Chen (4):
> >   softmmu/runstate.c: add RunStateTransition support form COLO to
> >     PRELAUNCH
> >   net/colo: Fix a "double free" crash to clear the conn_list
> >   net/colo.c: No need to track conn_list for filter-rewriter
> >   net/colo.c: fix segmentation fault when packet is not parsed correctly
> >
> >  net/colo-compare.c    |  2 +-
> >  net/colo.c            | 11 +++++++++--
> >  net/filter-rewriter.c |  2 +-
> >  net/trace-events      |  1 +
> >  softmmu/runstate.c    |  1 +
> >  5 files changed, 13 insertions(+), 4 deletions(-)
> >
> > --
> > 2.25.1
>


