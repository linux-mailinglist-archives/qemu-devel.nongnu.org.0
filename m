Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E92D4B03
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:54:58 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Y9-0004UN-RA
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4kl-0002Pb-5U
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:03:55 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kn4ke-0008Ql-RL
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 14:03:54 -0500
Received: by mail-io1-xd33.google.com with SMTP id o8so2764195ioh.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QHBoYD3U1iTY3EiC5PaMi7xZ8LPRR3iwzmeAqgnXFjQ=;
 b=qzXy/0wmuY3ZTgz/TjzKcYcyR48gfkI3+dCvz6fDzLt5J0tqTCO/DDy3RLWvADYh0p
 Gso+71N7K+6fZXDj2mBj/8qNFy/TVEMOQjgFdHibyyiFeYfwKzjAwZagzKwbOfTDfI5l
 Cm21MpTQcbwhrm4/HobiYSyNYyfI+/gb9WrJfL3FVHPWgKcnRz42DdklHbFD/p8AJABE
 HqNXnZ3zVmw6IvBCojawI8wrc9PmuMLPSwMf/b2iGmFWlV/g9o4SxGXoYUlTWBmgvIeq
 3SCWWvCcK5W+0dI6p/RQJoxwwkCnJ1+PbNzm8OIDXCbY2h5QS1aRp4sScd5OOieGoMB2
 q+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHBoYD3U1iTY3EiC5PaMi7xZ8LPRR3iwzmeAqgnXFjQ=;
 b=Yuw7IlfN6C/hj9sIknazL2ltUKSrp00gFLVBmKcLro3/mpSvDWC+atTKXmi5hIb3FG
 DHyEkrWTsnqrJD3DaNckwZvsH0aM8TJb/Pbu02NBqjczejtyXwa1DcOwWeLoCUmUxI2S
 GyKTwASIxxOj3MPlOIxgDJJIVh4cEjPvQXiZGVM5MLnE2nVx49EgvIYcKndH+5lz/tME
 g1w8xRwHuDMC/HnouNlH0i2pGADvs0mm01dPdvCvsxQw5UKGtsJXmSz0SEo+BVAQ+Zxy
 Ct+2JbD3wOUFrv2sGr5keEY+552lMsLcCXXLmxC6yhlhYnwpXlTvaNScx9MdJSAs7hY/
 JeBQ==
X-Gm-Message-State: AOAM530VE79ugzKWqWapcCt7WmjXmJDVFLkzZGp58si3DkTqI58tmm8y
 G802vISwEXYKMUgdIjOB88hSeFShoW8su7MZehE=
X-Google-Smtp-Source: ABdhPJyjQ4cjO0XzYmXuNk8g7m//CNuwYZ89nX4zEvJ1H0l7Bp211c/V+ad6SnHaYi24VwCJvBcsmYZReGDGVXkY7vI=
X-Received: by 2002:a6b:5d07:: with SMTP id r7mr4719357iob.84.1607540624236;
 Wed, 09 Dec 2020 11:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20201208163950.29617-1-david@redhat.com>
 <20201208163950.29617-9-david@redhat.com>
 <CAM9Jb+gkw4PnCaKmvw1OV97p_WkOU=ep9v4ENfmn7pzYNbWq4A@mail.gmail.com>
 <39dd00d1-347a-f6e6-3b83-68088656f2a8@redhat.com>
In-Reply-To: <39dd00d1-347a-f6e6-3b83-68088656f2a8@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 9 Dec 2020 20:03:32 +0100
Message-ID: <CAM9Jb+j-fDL_P_qQ3gXHHh0E1Pt=4vrY7AF1qA5OGW4YnR8J1w@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] softmmu/physmem: Extend
 ram_block_discard_(require|disable) by two discard types
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> [...]
>
> >> +/* Disable only uncoordinated disards. */
> > s/disards/discards
>
> Thanks!
>
> [...]
>
> >>
> >>  bool ram_block_discard_is_required(void)
> >>  {
> >> -    return qatomic_read(&ram_block_discard_requirers);
> >> +    return qatomic_read(&ram_block_discard_requirers) ||
> >> +           qatomic_read(&ram_block_coordinated_discard_requirers);
> >>  }
> >
> > How to differentiate if we have both un-coordinated & coordinated
> > cases together?
>
> Checking for both is sufficient for current users - which only care if
> any type of discard is required to work. Thanks!
O.k. Looks good to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

