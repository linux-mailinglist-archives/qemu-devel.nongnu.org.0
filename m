Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF8414882
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:11:10 +0200 (CEST)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT15h-00055R-RP
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mT13d-0004NZ-2z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:09:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mT13X-0005rX-Gq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:08:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id k17so2529972pff.8
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lCLhWfKxcbszqzc7oQk+utveO/inesSB2yNmkLK60Rk=;
 b=OCkUFJV/8JT3t6/UDUPnnOx2ABvf26fAQQhNuluDLsZsiHog5SjXsk2eBS/AmzxG4P
 XFTj+vkTdTvNolmP87qiTuAZkbuwFe8bVu5Pp3+ql8t6KVEQqBwJSSlJOWrKLRjOxh95
 AFSiOtyyfM3w4ON26dQBsDH/gR7tu/qM1V2kMsf7EpcQ7aQt7Zp8NL1plgoNmZd6s9Ye
 PeRnaVBYA/ioIDnU6QeQNXUSygVDx/KVcmiqZ+EadamiLpKHp3SjVz+xGrSMBBWiebp7
 0A/b2so4h95myPrE9iLpm1gZnAXzCpNtJWraWq1kdHl9CfezDHFvXYPfV2lxF2jVCTV9
 sC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lCLhWfKxcbszqzc7oQk+utveO/inesSB2yNmkLK60Rk=;
 b=r1pF8XOePVWIWyUwJYYdtvISxe0eh2BTwUVL4xZdtNUuhZsmHOPYow3WRZRqyskR5Z
 IgSgHI4kfEmLtdDTABsi+hO3ofgsVGjLVpbPttruWZImnALrFIG0LisGgVa/UslrekFn
 IsNYxadcqVedBs/5gDp2l+42IUijchNcgSduFx+pGWZzfqS7g4U3b08ZOX86iyY/IuMf
 fXL6XrhfxJgnTt4+KEKqFPSOJ5/IAk1tpVS6cerJPNM5+o8p7q05bvHLx3X64TmNxjXF
 kcnAx44CbMvXy6N4dg6Gtc+7YvRCmr5R70wy9qzyptHk62SB5+dS6FS945+QIWssGhAR
 q9BA==
X-Gm-Message-State: AOAM533dpW5HJJnVqKNpdQbdB5djO4Ear5O8ba766aji+JFBtTv7AmXh
 Oj1Q4SY8P2hKaJzbFI5RG30Org==
X-Google-Smtp-Source: ABdhPJwMsNBO/mIhyJx2SCpRm+/aiBSwo7IruX11zjKVrc/RomyeLppBKHkJnxV9+3c+yIXn1fR2Cw==
X-Received: by 2002:aa7:93c9:0:b0:43c:f4f5:aac2 with SMTP id
 y9-20020aa793c9000000b0043cf4f5aac2mr34779616pff.11.1632312532313; 
 Wed, 22 Sep 2021 05:08:52 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.225])
 by smtp.gmail.com with ESMTPSA id mv6sm2234606pjb.16.2021.09.22.05.08.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:08:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [RFC 0/5] VirtIO RDMA
From: Junji Wei <weijunji@bytedance.com>
In-Reply-To: <20210915134301.GA211485@nvidia.com>
Date: Wed, 22 Sep 2021 20:08:44 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <E8353F66-4F9E-4A6A-8AB2-2A7F84DF4104@bytedance.com>
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <20210915134301.GA211485@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=weijunji@bytedance.com; helo=mail-pf1-x433.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>,
 RDMA mailing list <linux-rdma@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 yuval.shaia.ml@gmail.com,
 virtualization <virtualization@lists.linux-foundation.org>,
 Yongji Xie <xieyongji@bytedance.com>, Doug Ledford <dledford@redhat.com>,
 =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Sep 15, 2021, at 9:43 PM, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> On Thu, Sep 02, 2021 at 09:06:20PM +0800, Junji Wei wrote:
>> Hi all,
>> 
>> This RFC aims to reopen the discussion of Virtio RDMA.
>> Now this is based on Yuval Shaia's RFC "VirtIO RDMA"
>> which implemented a frame for Virtio RDMA and a simple
>> control path (Not sure if Yuval Shaia has any further
>> plan for it).
>> 
>> We try to extend this work and implement a simple
>> data-path and a completed control path. Now this can
>> work with SEND, RECV and REG_MR in kernel. There is a
>> simple test module in this patch that can communicate
>> with ibv_rc_pingpong in rdma-core.
>> 
>> During doing this work, we have found some problems and
>> would like to ask for some suggestions from community:
> 
> These seem like serious problems! Shouldn't these be solved before
> sending patches?
> 
>> 1. Each qp need two VQ, but qemu default only support 1024 VQ.
>>   I think it is possible to multiplex the VQ, since the
>>   cmd_post_send carry the qpn in request.
> 
> QPs and CQs need to have predictable fixed WQE sizes, I don't know how
> you can reasonably expect to map them to a shared queue.

Yes, it is a bad idea to multiplex the VQ. If we need more VQ,
we can extend QEMU and virtio spec.

>> 2. The virtio-rdma device's gid should equal to host rdma
>>   device's gid. This means that we cannot use gid cache in
>>   rdma subsystem. And theoretically the gid should also equal
>>   to the device's netdev's ip address, how can we deal with
>>   this conflict.
> 
> You have to follow the correct semantics, the GID flows from the guest
> into the host and updates the hosts GID table, not the other way
> around.

Sure, this is my misunderstanding.

>> 3. How to support DMA mr? The verbs in host cannot support it.
>>   And it seems hard to ping whole guest physical memory in qemu.
> 
> Either you have to trap the FRWR in the hypervisor and pin the memory,
> remap the MR, etc or you have to pin the entire guest and rely on
> something like memory windows to emulate FRWR.

We want to implement an emulated RDMA device in userspace. Since
we can directly access guest's physical memory in QEMU, it will be
easy to support DMA mr.

>> 4. The FRMR api need to set key of MR through IB_WR_REG_MR.
>>   But it is impossible to change a key of mr using uverbs.
> 
> FRMR is more like memory windows in user space, you can't support it
> using just regular MRs.

It is hard to support this using uverbs, but it is easy to support
with uRDMA that we can get full control of mrs.

>> 5. The GSI is not supported now. And we think it's a problem that
>>   when the host receive a GSI package, it doesn't know which
>>   device it belongs to.
> 
> Of course, GSI packets are not virtualized. You need to somehow
> capture GSI messages for the entire GID that the guest is using. We
> don't have any API to do this in userspace.

If we implement uRDMA device in QEMU, there is no need to distinguish
which device it belongs to, because there is only one device.

Thanks.

Junji

