Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782552CE07
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:15:10 +0200 (CEST)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbJN-0003Vw-KK
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbFM-0000A9-GG
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:11:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbFI-0004vu-Ap
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:10:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id i19so8321929eja.11
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNvx8kWLzKQ74EA3mzS4Ao+IYQGe03xu0TVUZD1uC4E=;
 b=oAazPoE0841Mm8e7HyXpZS8RUaB38ouzSQyoT8dIlrDHY2BtcW9kejRidvkaU/1KMy
 q7pGHIRJGBrnj+xPHDFMOEUIL2lW9qq29TDEb3yGqvvspoHn6JgSJyAZND680xo5iuRz
 AmXc2ZPgnQlEpCosFpRjHiQ5KcPymDQzegOchOh7w1Y+apNVTZ3qnHnGgsOA/qevNNrc
 5iaLWgk4zJ8qdQjqJRdowNKo0tFEBz93oNAyBTGUekuCHuDgWpC6Uz1HacMNEgyrSz/g
 0djTEUh3JI+IDYStPyoZGsbLPhOFPEcTdllCPszEXk9zh5y/lyX64V/6hK26szmqAi9i
 fHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNvx8kWLzKQ74EA3mzS4Ao+IYQGe03xu0TVUZD1uC4E=;
 b=LfYO6PEf745u6glgdCtBT0r28FoeTasKawSpedAETRjpDP3Gu2o94CAnCfAOs3RfdG
 csZ/wgnIeBJpoj3yb6gsOptc8cX8/DXJH2MdYLjuhTy3iOWo8kQOoqHO4hs0FWGhYCWd
 ULHvzyWQ0CntSk1U2cU1YHVreZEhDFWXTr95d9jnan3SPtaneLwBp62M/1E+COMYLF3m
 yxnvE/zO13e9u2jJI7d69mLPswe9MQ/1PaNH3FgxBt5TZ8kcA82jW6Sl88laVqXkSB4p
 scyUlBZUgMJXBLAZUc5r+8CpbVmEGqZIsAgMg/OZF8DwAvwmYl9yQ1QFFIHXqh44Mtw5
 F2BA==
X-Gm-Message-State: AOAM53007VDG8FNELuxdx3kmwkLZfEEGNAw9VYqPTXkYC3DDDm/2/hMx
 Ne5qMbKdSrTGbq0LBgA3aadFyKRJwm3S08SjR2BT
X-Google-Smtp-Source: ABdhPJyjBmEkUU00k+Jfip89NnzMn5FItjNGzklvBbwsYAv30SJRt3jC9c7mFRWB/xaWgd3dI072SFXkkGxl4ldZ/4A=
X-Received: by 2002:a17:906:7c96:b0:6f3:b6c4:7b2 with SMTP id
 w22-20020a1709067c9600b006f3b6c407b2mr3114353ejo.676.1652947854872; Thu, 19
 May 2022 01:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-6-xieyongji@bytedance.com>
 <YoT4piGYvCmV1GK2@stefanha-x1.localdomain>
In-Reply-To: <YoT4piGYvCmV1GK2@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 19 May 2022 16:11:37 +0800
Message-ID: <CACycT3uzGTZ+_4_t23tea07TFb0WV1vvzFQvA4=qq6pmAcbSdA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, May 18, 2022 at 9:46 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 03:40:48PM +0800, Xie Yongji wrote:
> > +static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
> > +                                    uint64_t avail_addr, uint64_t used_addr)
> > +{
> > +    struct VduseDev *dev = vq->dev;
> > +    uint64_t len;
> > +
> > +    len = sizeof(struct vring_desc);
> > +    vq->vring.desc = iova_to_va(dev, &len, desc_addr);
> > +    assert(len == sizeof(struct vring_desc));
> > +
> > +    len = sizeof(struct vring_avail);
> > +    vq->vring.avail = iova_to_va(dev, &len, avail_addr);
> > +    assert(len == sizeof(struct vring_avail));
> > +
> > +    len = sizeof(struct vring_used);
> > +    vq->vring.used = iova_to_va(dev, &len, used_addr);
> > +    assert(len == sizeof(struct vring_used));
>
> Can these assertions be triggered by a malicious virtio driver? For
> example, if a guest is accessing this device, will the vDPA/VDUSE kernel
> code forward the address to QEMU without validation?
>
> If yes, then it's necessary to return an error here instead of aborting.
> A qemu-storage-daemon process might contain multiple VDUSE exports and
> an error in one export shouldn't kill the entire process.
>
> I haven't audited the code, but this is a general issue: if vDPA/VDUSE
> kernel code forwards untrusted inputs to us then we cannot abort or
> crash. Usually the kernel is trusted by userspace but maybe not in this
> case since it may just forward inputs from a malicious VIRTIO driver?

Make sense. And it can also be triggered by the malicious VM in
vhost-vdpa cases. Will fix it in v6.

Thanks,
Yongji

