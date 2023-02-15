Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C535697672
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 07:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBKF-0005m2-QX; Wed, 15 Feb 2023 01:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pSBKE-0005lq-Hh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:31:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pSBKB-0004KY-M5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:31:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id y1so17981185wru.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 22:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8CDLFK7kgb1a9gqUfwlbJIdVNfQPcN7GyE046f742JU=;
 b=KXe5YHK8iyxz3qbONUlFZPzoAzC93WcvRw3zulvk6DVqHnxdC2N5j5/bvB6Tu6ZyGj
 zWz6X7Dub/m5ADQj7hHhyzmJQPCgOpqcGCEeRw4K4D2jI5S8hGlsQ8+6ri8jITFCaWU7
 9JEv5QhgJVxrKtBwI3uql3uummEoxZDYEKlF25/CUpK/+yv5Y8dcKp8zohgzemJUaF4j
 GFvR/qqznxJGJFMAEdZkMYu/SpBHtz/gY8Eao+4Vk2TeDZOrrHo9/dPyS13xusbfIpjG
 w6WraJ3W4jgCgcdVG1OQuAMCqHPynwWeIhJ9yTQdwe6/ONT3KvHqD/7UV5V2vPd+CxoO
 sI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8CDLFK7kgb1a9gqUfwlbJIdVNfQPcN7GyE046f742JU=;
 b=hUnpZxZeuvPazx5S5U7IRNmhjUqM941UGr2D7kj4v8NuejsMwrHk40BFkQDWIHuKyj
 9NLiPQBvRj+JeG6OZJQQGpbHb+2W03t0oXjzB7KVTlUZz0uuniN9ZFfEWZc/zfeJiPgf
 TWnP0bvgHqaL5EA8mLdYJpohz6181pDdHgt9Ig7KOp3+cVKjxKk3ZFte5flHdJldCctS
 DGBp6QeiD1MLieDqvZ9aSDHr4dtLpHmQi40Op/hcVDNDOMNnBD9OtPidpIRVPVcmtqzN
 K3ySl9Vc+SOljNIOHc31GQFZj9MSCGpntDeoKKi8gN95y+NyhC+3ulSslhISksZuRTKZ
 HJzQ==
X-Gm-Message-State: AO0yUKUrSPHjqVO1aq0mvBQjgRJTRKugfadg/hNyKffaqAX4latKW9Go
 xYeL3oGVQVgH5vJUUk7d0euYqs9/8xa14Ekxw3o=
X-Google-Smtp-Source: AK7set9L19zOrenQ0KprjBpxhUCQ1t/rCjfJKKjuBr5nvt2dOCcrzrDTicGsMvWJRb0GOkOE3HK8nlCL1vqLMmcSH80=
X-Received: by 2002:a05:6000:3:b0:2c5:54cf:ef78 with SMTP id
 h3-20020a056000000300b002c554cfef78mr37247wrx.323.1676442685441; Tue, 14 Feb
 2023 22:31:25 -0800 (PST)
MIME-Version: 1.0
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
 <Y+q3+eXdYz0qOtDT@x1n>
 <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
 <Y+uHMm1hvP7N6sKD@cormorant.local> <Y+uhL77aBFVEWsJd@cormorant.local>
In-Reply-To: <Y+uhL77aBFVEWsJd@cormorant.local>
From: Major Saheb <majosaheb@gmail.com>
Date: Wed, 15 Feb 2023 12:01:14 +0530
Message-ID: <CANBBZXOos3JUkq7zqjNqr39wiU4-zptBq1Jr3KwzWddW1jj-5Q@mail.gmail.com>
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
To: Klaus Jensen <its@irrelevant.dk>
Cc: Peter Xu <peterx@redhat.com>, k.jensen@samsung.com, philmd@linaro.org, 
 armbru@redhat.com, mst@redhat.com, lukasz.gieryk@linux.intel.com, 
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, 
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=majosaheb@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Assuming you are *not* explicitly configuring shadow doorbells, then I
> think you might have a broken driver that does not properly reset the
> controller before using it (are you tripping CC.EN?). That could explain
> the admin queue size of 32 (default admin queue depth for the Linux nvme
> driver) as well as the db/ei_addrs being left over. And behavior wrt.
> how the Linux driver disables the device might have changed between the
> kernel version used in Ubuntu 20.04 and 22.04.

Thanks Klaus, I didn't had the driver source, so I acquired it and
looked into it, the driver was not toggling the cc.en nor waiting for
csts.ready the right way. So I implemented it and it started working
perfectly.
- R

On Tue, Feb 14, 2023 at 8:26 PM Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Feb 14 14:05, Klaus Jensen wrote:
> > On Feb 14 17:34, Major Saheb wrote:
> > > Thanks Peter for the reply. I tried to connect gdb to qemu and able to
> > > break 'vtd_iova_to_slpte()', I dumped the following with both Ubuntu
> > > 20.04 base image container which is the success case and Ubuntu 22.04
> > > base image container which is failure case
> > > One thing I observed is the NvmeSQueue::dma_addr is correctly set to
> > > '0x800000000', however in failure case this value is 0x1196b1000. A
> > > closer look indicates more fields in NvmeSQueue might be corrupted,
> > > for example we are setting admin queue size as 512 but in failure case
> > > it is showing 32.
> > >
> >
> > Hi Major,
> >
> > It's obviously pretty bad if hw/nvme somehow corrupts the SQ structure,
> > but it's difficult to say from this output.
> >
> > Are you configuring shadow doorbells (the db_addr and ei_addr's are
> > set in both cases)?
> >
> > > > > Following is the partial qemu command line that I am using
> > > > >
> > > > > -device intel-iommu,intremap=on,caching-mode=on,eim=on,device-iotlb=on,aw-bits=48
> > > > >
> >
> > I'm not sure if caching-mode=on and device-iotlb=on leads to any issues
> > here? As far as I understand, this is mostly used with stuff like vhost.
> > I've tested and developed vfio-based drivers against hw/nvme excessively
> > and I'm not using anything besides `-device intel-iommu`.
> >
> > Do I undestand correctly that your setup is "just" a Ubuntu 22.04 guest
> > with a container and a user-space driver to interact with the nvme
> > devices available on the guest? No nested virtualization with vfio
> > passthrough?
>
> Assuming you are *not* explicitly configuring shadow doorbells, then I
> think you might have a broken driver that does not properly reset the
> controller before using it (are you tripping CC.EN?). That could explain
> the admin queue size of 32 (default admin queue depth for the Linux nvme
> driver) as well as the db/ei_addrs being left over. And behavior wrt.
> how the Linux driver disables the device might have changed between the
> kernel version used in Ubuntu 20.04 and 22.04.

