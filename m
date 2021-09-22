Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F4414AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:39:50 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2TV-0006ui-Pn
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mT2SH-0005MK-3p
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:38:33 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mT2SC-0005Eo-96
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:38:31 -0400
Received: by mail-lf1-x12d.google.com with SMTP id g41so12153197lfv.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7/vDhCfCO8GWmmOXQpC6JsvYwIxZSEZsQxTfXaYv84=;
 b=Uz2MxzdoNDX6dhOp3IF4xD36aO4yTDgSbarHOatUa/6SEUxBBs9B65S72lOjRcir+3
 LQO0S81gpRY0/YtTCExxSfLwLiJY4PoAcrEdwmr2zJXx3oTSD/z8wUZ5WDGRkbKKLvau
 0PqSIPkXWwN5I5ZXcb1B2nYKA+sBFZgHUZFZs6XDUd/kdvoGfyKroXcu10aBrHYcg6FQ
 EcbxYA3ZEZkOclUCNljq+ptjnU7qKE7rfBEx33RXDdje19VxROu2iKcN9+qwdzb1Yo9H
 sM9OOAmff+GaVK4KJ4TKyGLcsO7mkxLmA8ICWQRv12OduMPchMmMnUTYEvFFzMkgy/aQ
 Urmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7/vDhCfCO8GWmmOXQpC6JsvYwIxZSEZsQxTfXaYv84=;
 b=A/oNWG9RWEaSK5FGVuwGYOE6jBQ5GmGEC2KV5+iAAdsYpAvjsZAq0pOsmvdwTA8Vl/
 58t/U8laPsajob5F+0BG9THfuEuv8GpgnVRmhowHytHLjsnVMqahUXy6X99aBVOaQWKE
 /dPP8ql+oZWLULGw3gw1X7wBv3sTs5xDJS7R0cn9w0zuA3ggRVWpqtcWoKkzDmNbPUFO
 j7mzlikqs5csKsgA7XfF7lmbdGWQdX4SdA7jTjY2cQz+BHIPNwu01ST9Ne+0mYjB+XMC
 YTCH0KcwZpPKAMsqrcYnwQXtMut9mfjj+vJ1sPy56+1kp3rb4NIPzOKFDpmT9pkDJQM4
 BONQ==
X-Gm-Message-State: AOAM5311OO2J8ajD06j+eED9LJSxEVwi7DG5lupfpiBu7Kur8TmiUTaU
 a5/8kvqN5KWovpZIKhcAuTLVOQOnaCi6xUkrFbcrcA==
X-Google-Smtp-Source: ABdhPJy4U/Qykgh56rsm1XZU4iCOHZMNsgVDIHSbm3kDqtpvbS42/cDQJ3rB1ATulDZXKq9b8/9Gt0dMgBvDBrrYvMI=
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr25401159lfn.662.1632317869289; 
 Wed, 22 Sep 2021 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <20210915134301.GA211485@nvidia.com>
 <E8353F66-4F9E-4A6A-8AB2-2A7F84DF4104@bytedance.com>
 <YUsqQY5zY00bj4ul@unreal>
In-Reply-To: <YUsqQY5zY00bj4ul@unreal>
From: =?UTF-8?B?6a2P5L+K5ZCJ?= <weijunji@bytedance.com>
Date: Wed, 22 Sep 2021 21:37:37 +0800
Message-ID: <CAGH6tLV=9ceaUH_zdevtTyL5ft4ZxxX8d0axops4DmbFdFYFjQ@mail.gmail.com>
Subject: Re: Re: [RFC 0/5] VirtIO RDMA
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=weijunji@bytedance.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Gunthorpe <jgg@nvidia.com>,
 mst <mst@redhat.com>, RDMA mailing list <linux-rdma@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 yuval.shaia.ml@gmail.com,
 virtualization <virtualization@lists.linux-foundation.org>,
 Yongji Xie <xieyongji@bytedance.com>, Doug Ledford <dledford@redhat.com>,
 =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 9:06 PM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Wed, Sep 22, 2021 at 08:08:44PM +0800, Junji Wei wrote:
> > > On Sep 15, 2021, at 9:43 PM, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> <...>
>
> > >> 4. The FRMR api need to set key of MR through IB_WR_REG_MR.
> > >>   But it is impossible to change a key of mr using uverbs.
> > >
> > > FRMR is more like memory windows in user space, you can't support it
> > > using just regular MRs.
> >
> > It is hard to support this using uverbs, but it is easy to support
> > with uRDMA that we can get full control of mrs.
>
> What is uRDMA?

uRDMA is a software implementation of the RoCEv2 protocol like rxe.
We will implement it in QEMU with VFIO or DPDK.

Thanks.
Junji

