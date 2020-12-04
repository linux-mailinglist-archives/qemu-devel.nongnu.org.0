Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16252CE872
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 08:14:22 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl5IL-0004RH-IL
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 02:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kl5HH-0003uS-GD; Fri, 04 Dec 2020 02:13:15 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kl5HG-0004B8-3K; Fri, 04 Dec 2020 02:13:15 -0500
Received: by mail-io1-xd42.google.com with SMTP id r9so4777555ioo.7;
 Thu, 03 Dec 2020 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4CHpusmkixuTxRRAPlq1qz1p5pY/Jph9sYNqkVnQFWA=;
 b=uBvmmV49UBsko18sLybMLESG4rQDC40d5mkztDqD2ChhKlBiUp4NKnMASCI4D8qmvR
 a4IRlI7ZlFOB0iSfHj9d2gvY6wm6nXqo7jto5iSfWdAKobTVTRb00rMmAXvYpHdOzbK/
 6/xtozrOWNH0fgqzj+b6QJOA6o6K1eN4h3JpiDLQHujXezBwlBaKZ/Q9SGCFpAlxQRxg
 dYyTAKASqeZ8kroPVTb+oQNF9yUXIvUz6U0KGwOitymd4JPPhbSS0OX50dSbFfe76yD8
 ls4bZ/A8d/RxglIn5uZCE3hjEfSJxRMNum4d91SQCVziR3LnFrG7TBViXEQ5Fr24rVN8
 Wuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4CHpusmkixuTxRRAPlq1qz1p5pY/Jph9sYNqkVnQFWA=;
 b=Dl9rKnHVYZmeQIoU3Eey79PSVWeD15vsp8D6aZ3gjOQztCuf4qwZm0iejSvcWDRLOk
 FA4KnIiRQWUn3kybfV9ME18zujaihAz0QMTAGwyBrw46Hxc7Tm2AZkKCA0hBz+H9v3kB
 cBeQIVV12T8uHHP9OZhpQ7iQf1hsFiUt68V+B5JGTk3NYhC00YwrC0qfBcPftUX+esqm
 sJgD1Z2wpYMu51LaBwWdpgSN9jCNaPWBwjin7pXw6dNS1TrkoZZP+0jVgKO+92okCEy1
 5rIS4DMQP1NQGeZFtc/MlYZxhhzqit7ILYqlxTFLvbYl/+oYDXyMXwnYxEn4r1Q8rXQN
 dj6Q==
X-Gm-Message-State: AOAM531Ar43hDw4ynVkGwgua00OTvIHzEgQpsBaprJxe4jzorbUubm92
 9uMbirGhmjyJquKqd8r3uMSeEsyTy1LZzUYQki0=
X-Google-Smtp-Source: ABdhPJyKGrBvNW0S7Gi0Ac+c8L+QTplpe49u32kFHTwM2U90NUCGN4e2qMontmS8gm0Fnqnr8qtdu8vPboDH9kN/Ad8=
X-Received: by 2002:a5d:8592:: with SMTP id f18mr4538602ioj.67.1607065992444; 
 Thu, 03 Dec 2020 23:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-2-ganqixin@huawei.com>
 <CAM9Jb+iXWAQq7gg8RxS=aVX1MHBVuZucb4rXGaTU40kJ6-TmTw@mail.gmail.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065DD609@DGGEMI525-MBS.china.huawei.com>
In-Reply-To: <A5B86EC83C48EF4CB2BC58BEF3A2F496065DD609@DGGEMI525-MBS.china.huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 4 Dec 2020 08:13:01 +0100
Message-ID: <CAM9Jb+hJRyQzCEcoHG3kepbjyJ2dA341WmR+4CtR3L1oMYWJkg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
To: ganqixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 >      mdc->get_memory_region = pc_dimm_md_get_memory_region;
> > >      mdc->fill_device_info = pc_dimm_md_fill_device_info;
> > > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> >
> > Any reason why pc-dimm would be in the storage category?
...
> Thanks for you reply. As far as I know, pc-dimm is a dimm device for memory hotplug, described as a "DIMM memory module" in "-device help".
> This device looks related to storage, so I put it into the "storage" category to make it easy to find. I'm not sure if this is appropriate, do you have any better ideas?

O.k. I see storage & memory as different devices. Since we don't have
any memory device type defined, maybe its okay to put it in MISC
device.

Thanks,
Pankaj

