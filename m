Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202496242F9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:11:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7KY-0006eg-PK; Thu, 10 Nov 2022 08:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot7KX-0006eV-HA
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:10:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot7KV-0005TV-NV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:10:53 -0500
Received: by mail-pl1-x636.google.com with SMTP id l2so1332550pld.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F4HU4Zf/XUz28Q2C+Raa91AJATypFbj1PkjfmOQeoy4=;
 b=ZEMatztZvL9KQapyGMkoWcCa+lfVumbS2MNS5Gb4mZot3v0BnSDBHNMFZoPqq/C5KQ
 v0jdCZc8Tu7yj/j1NYaqDX/oC8wPV6v2+adNgmeBXGwKHOxp0kvpTrbOc4ANzJaCbNH7
 edDRADs1nwtjuf6kNOwNvCm/Ew7GdwoOIHojir0QQV2mNey9Apxq4pZXraiJB7KQmhaf
 Xi1kxta/U5ck09IvNKtrwB+mA1OajVAbved0KCCz4yncJQBZ3JmMzKhaCcBuR16fmxxt
 qB+qcn9V0OaTH1Dx+7QpxCO3BtMtTxk4mLnPC0h311Htn2mGo4tVbHDW/RXCvG+mf9V0
 yzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F4HU4Zf/XUz28Q2C+Raa91AJATypFbj1PkjfmOQeoy4=;
 b=vQwuGHZYfTTnZLtvkGFQ+mUp3TblxZ5FKobMUN7VXKhCzSCcZQVfzSgXhp6UU7G0z3
 m5trLVBy0Jm4vtfNIwEEY+E1eeVc9qr51M3UOc+voKri19AXL+ly2CgQbW/8BnN6Fy0j
 GmdUuZyfX61oF1T9WY1YLhhxNQwkn0Stc9ZkYOjmgOec3KbDWpd24ILCrW4kGwt4LRnI
 zpj6QoCvqLJNgpcqc4KzlbSN9Cz4GHxeCszLoSe+Yisdz4MEgyyEBc734S+L9CvtCj86
 hF3Mvrfg7rmTlxyWAVwLdaXJz/R48auCpSkT3cCSUyF60UdUScQXeJl8qUWEl/n53k/4
 WDIg==
X-Gm-Message-State: ACrzQf02fOKaBTHQ6MBECP299HhT1hHTGQ07YjF+HFCgJEbKgT8h3NqG
 voN8ng6ILjGAu1UQ7nTYkU+4Qm4q0v+czOGgJTe7vg==
X-Google-Smtp-Source: AMsMyM4Z6BM3+jAmgi1/Qj3Lt7kPcdD0YYabcre9eNmxpzeT0rmyq8Wj1LTiI0VEmZjHKBT/BMkbspO6QUb768fB5qk=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr64565661plb.60.1668085850074; Thu, 10
 Nov 2022 05:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20221101071048.29553-1-yangyicong@huawei.com>
 <20221102040935-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221102040935-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 13:10:38 +0000
Message-ID: <CAFEAcA_9eiMiGRPimtLc4UrfTktPO33cbs6gRhR1D+jH8eJ_SA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Only generate cluster node in PPTT when specified
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yicong Yang <yangyicong@huawei.com>, imammedo@redhat.com, ani@anisinha.ca, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org, 
 wangyanan55@huawei.com, qemu-devel@nongnu.org, jonathan.cameron@huawei.com, 
 linuxarm@huawei.com, yangyicong@hisilicon.com, prime.zeng@huawei.com, 
 hesham.almatary@huawei.com, ionela.voinescu@arm.com, 
 darren@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 2 Nov 2022 at 08:17, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Nov 01, 2022 at 03:10:42PM +0800, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> >
> > This series mainly change the policy for building a cluster topology node
> > in PPTT. Previously we'll always build a cluster node in PPTT without
> > asking the user, after this set the cluster node will be built only the
> > the user specify through "-smp clusters=X".
> >
> > One problem is related to this but not fully caused by this, see the
> > discussion in [*]. When booting the VM with `-smp 8` and 4 numa nodes,
> > the linux scheduling domains in the VM misses the NUMA domains. It's
> > because the MC level span extends to Cluster level (which is generated
> > by the Qemu by default) that spans all the cpus in the system, then the
> > scheduling domain building stops at MC level since it already includes all
> > the cpus.
> >
> > Considering cluster is an optional level and most platforms don't have it,
> > they may even don't realize this is built and a always build policy cannot
> > emulate the real topology on these platforms. So in this series improve the
> > policy to only generate cluster when the user explicitly want it.
> >
> > Update the tests and test tables accordingly.
>
> I think we can classify this as a bugfix and so allow after
> the freeze, however, this needs ack from ARM maintainers then.

I don't use, test or understand any of the ACPI related code :-)
I'm happy to leave it up to your judgement whether this should go
into this release or wait for 8.0.

thanks
-- PMM

