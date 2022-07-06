Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52E567DF8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 07:45:34 +0200 (CEST)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8xqu-0007NL-L6
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 01:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8xlg-0006Tw-Mk
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8xlc-000718-SU
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657086003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDR06GgtcRIQFIgBY4jGsV++VyJZbjHgPN/Nu+TN0/M=;
 b=V/HZjWXtZvPWM/9QQOxBTJSGXnChZj7+7IRCpzun9EOQjaGzKMT3h8cgNSleIZwjl9s7v5
 7as1A9egNantebGO8umxqyG4x6gczIc4i1fHzZFfUWjbg2tgj/rEOa2/GiVhiwIRc6U/Uj
 Vg686C11tbXOwMM9hVIW6/2DMPGVgeQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-1Wgi9XX1MWiV5u1RJAOzaQ-1; Wed, 06 Jul 2022 01:39:54 -0400
X-MC-Unique: 1Wgi9XX1MWiV5u1RJAOzaQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 d24-20020a2eb058000000b0025a7f5ccae6so4235341ljl.14
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 22:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uDR06GgtcRIQFIgBY4jGsV++VyJZbjHgPN/Nu+TN0/M=;
 b=xma8Nw6wC2tWJH3A5u5bePo13V70gd4xGDEA1/+pNMi/WbhG+vw79UwFO6Hw+CWGbT
 ht30+jheWKyUn5PXY4YXhBsXcC+F6lMYq36eubKHSjy7EdZ77c7v8XzvMAJrLdaYuHZ1
 1Qz2k2K5qoJv/Jx3jKLusEEg3EfDzrFi0s4aijFNuV7a0ycrGG6E4CaVyQCiDdAiLBn4
 WCUUgSgOBaskNnCUnJsuTl2SheDUzZVKFdpX/OyQjBA2uEqti+YV9Yb6wZ5ststiXa86
 Ky8PXQk0fsL84uD3wQaLuXFL7opZT6JTtefyrUeB+L4Hr1F+azPq3AoVT7SsvNTkZXS8
 2rbA==
X-Gm-Message-State: AJIora99XnaTLVewiVUWmg58HVKqSGBpVxvjp7eHETG+a2sBN/ASpTXg
 Da8kVCd00bUaypY4Uf1xR35RwDW69gnh/BkNFjDDkpxrvj2Z9J/F+xTfDCQQHkMSBTUkyJHiwbF
 tDmQGDbDkvgYCJNQukQ/PcaJphr4HYXM=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr17074930lfu.442.1657085992551; 
 Tue, 05 Jul 2022 22:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1c5Y7+u8P2weXw9fGgpzRPws0yjI0hMfWfEhBwTeNJxJFjBNW8WUy4jLUpdmr+5O27SJPv8s0Y9h0z2TAHEs=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr17074916lfu.442.1657085992322; Tue, 05
 Jul 2022 22:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
 <YoTv6hUkdggrfd4l@work-vm>
 <CACGkMEu6nxmZiyi=w_+hwemETfRJfhvwMypeSiLY1QZ_g9tJ4A@mail.gmail.com>
 <MWHPR11MB00317BE49AE00B7CDC066A3D9B809@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00317BE49AE00B7CDC066A3D9B809@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Jul 2022 13:39:41 +0800
Message-ID: <CACGkMEtoH7L3Jk7+OOigiXN6wH4EQ0XmMUkzFgj+T5vapAgaNw@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>, 
 Like Xu <like.xu@linux.intel.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 6, 2022 at 1:02 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
> > > > > > > On Fri, Apr 1, 2022 at 11:59 AM Zhang Chen <chen.zhang@intel.com>
> > wrote:
> > > > > > > >
> > > > > > > > If the checkpoint occurs when the guest finishes restarting
> > > > > > > > but has not started running, the runstate_set() may reject
> > > > > > > > the transition from COLO to PRELAUNCH with the crash log:
> > > > > > > >
> > > > > > > > {"timestamp": {"seconds": 1593484591, "microseconds":
> > > > > > > > 26605},\
> > > > > > > > "event": "RESET", "data": {"guest": true, "reason":
> > > > > > > > "guest-reset"}}
> > > > > > > > qemu-system-x86_64: invalid runstate transition: 'colo' ->
> > 'prelaunch'
> > > > > > > >
> > > > > > > > Long-term testing says that it's pretty safe.
> > > > > > > >
> > > > > > > > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > > > > > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > > > > >
> > > > > > > I'd expect this to get ack from the relevant maintainers.
> > > > > > >
> > > > > >
> > > > > > The scripts/get_maintainer.pl can't find relevant maintainers for this
> > patch.
> > > > > > Maybe Paolo have time to cover this simple patch related to runstate?
> > > > >
> > > > > No news for a while, any comments for unmaintained files changes ?
> > > > > Ping...
> > > >
> > > > Adding David and Juan.
> > >
> > > This looks OK to me;
> > >
> > > Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > Great.
> >
> > >
> > > it should be fine to merge it along with the pull that takes the other
> > > patches.
> >
> > Yes, I've queued this series.
>
> Hi Jason,  did this series get lost in the net queue branch?

Unfortunately, yes.

It will be included in the net pull request.

Sorry.

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> > >
> > > Dave
> > >
> > > > Thanks
> > > >
> > > > >
> > >
>


