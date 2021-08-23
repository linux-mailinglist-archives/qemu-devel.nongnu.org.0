Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B33F46F8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:54:55 +0200 (CEST)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5jK-0000Yq-K6
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI5hv-0007eu-Ax
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:53:27 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mI5ht-0002Xa-TR
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:53:27 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so24712570otc.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40pSyCXw/D0phkMHVmwzXggJHeLk/3+MgdhMVIJFW4Q=;
 b=CtiepIV5V/wG1RlLp4NdSB95ysZPVFst+Cpw3qF4BNFdAFIvlD+SuzpmvSicMOi6Hg
 6eYoOvYTZ8GvlDhcSZzNjh99YdvN9Vq9noGEXfG5DuNPkNqxV9qGqka6YNlzzTllO0dv
 7A6eSstwsFtse/U+O+gV01Wp0+vBo+MQqmShaB1+K961JIynudONkuE4D/cAjaxYo+SZ
 Fu3uFJ0judYsNn2jM6/h+9//c32cv8Ls0ZzmmP1KLCxihDcBFBjqYSEhrFgzCh0R9kvo
 S1pf1O3CWh8OfEDHhGkXK0Hocq13DaePPz46uTfiYDhQjYS6D78KiF5OciRdLHJjuXY0
 PUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40pSyCXw/D0phkMHVmwzXggJHeLk/3+MgdhMVIJFW4Q=;
 b=lmq+87/uTIGy+NLH4t61ECZTkf3ezYUIMV2hr7ZB5aBxL2cFo+zSJhRLKT5yzVb8zu
 b5nOi+DCuzn3bF05fCjFtnyRCdufmSRLJbp6UqGdeXm+BWsLlL+x9IDm0AhwCvdQw/6k
 3EVAMCpP7Ia0XNrl0g6Ms2sAlGWqfe7wrPV6b4I8Ig4x2tYOK55yx92bw6mEkWIud+v7
 VD+P5Ovmkay0yYpSYlEq+3MFZvVMr7+9nMDOR6nxq1hRfzCnBgSql15W1PPCaL+XKY0L
 gyEWtfvKH09lKFw5MwCna3Futro2BVkR8ZJqOLuiFH1kAlVowALWV4lPkNfZPwuhFvCo
 4SpQ==
X-Gm-Message-State: AOAM532U6P7eAM4/JxF1IwLPoKveDCLGva9kkykzjTSK2WCvIn+0O1wP
 +1lqNKMMYb0uk2j/li0/1x9zir22OMYHeZU4+Z0=
X-Google-Smtp-Source: ABdhPJyhS39cuYGkNZZ81voC/6vCczmjOu2INt1YK/15S3uw/+6Lo0HB0v/nzfLfVl2Tedyj8tEJDwdYmfykDf4Tqfc=
X-Received: by 2002:a9d:7e83:: with SMTP id m3mr21177367otp.44.1629708804813; 
 Mon, 23 Aug 2021 01:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
 <dfcfa096-080a-4bc1-7a16-ce783839c4b7@fujitsu.com>
In-Reply-To: <dfcfa096-080a-4bc1-7a16-ce783839c4b7@fujitsu.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 23 Aug 2021 11:53:13 +0300
Message-ID: <CAC_L=vVT731FO=hk3KOLJ6EG8LCMJtcH5oaXbdmj76cJxpemeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] enable fsdax rdma migration
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zhijian,

On Mon, Aug 23, 2021 at 11:41 AM lizhijian@fujitsu.com
<lizhijian@fujitsu.com> wrote:
>
> CCing  Marcel
>
>
> On 23/08/2021 11:33, Li Zhijian wrote:
> > Previous qemu are facing 2 problems when migrating a fsdax memory backend with
> > RDMA protocol.
> > (1) ibv_reg_mr failed with Operation not supported
> > (2) requester(source) side could receive RNR NAK.
> >
> > For the (1), we can try to register memory region with ODP feature which
> > has already been implemented in some modern HCA hardware/drivers.
> > For the (2), IB provides advise API to prefetch pages in specific memory
> > region. It can help driver reduce the page fault on responder(destination)
> > side during RDMA_WRITE.
> >
> > CC: marcel.apfelbaum@gmail.com
> >
> > Li Zhijian (2):
> >    migration/rdma: Try to register On-Demand Paging memory region
> >    migration/rdma: advise prefetch write for ODP region
> >
> >   migration/rdma.c       | 117 +++++++++++++++++++++++++++++++++--------
> >   migration/trace-events |   2 +
> >   2 files changed, 98 insertions(+), 21 deletions(-)
> >

Series
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

