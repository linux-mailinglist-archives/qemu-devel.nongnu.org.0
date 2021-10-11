Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD3428A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:12:44 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZsIV-0006ww-6R
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaiwei.kernel@gmail.com>)
 id 1mZsGE-00061U-Ll; Mon, 11 Oct 2021 06:10:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lihaiwei.kernel@gmail.com>)
 id 1mZsGC-0003l0-Nq; Mon, 11 Oct 2021 06:10:22 -0400
Received: by mail-ed1-x52a.google.com with SMTP id ec8so15992885edb.6;
 Mon, 11 Oct 2021 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5UfrrzHwZLzsu2JJhKXeDjwcfI2VtXJV+HVf1rY21Q=;
 b=dCQA3TCllX3IFtVjG6rwClF9rJAhvNr0laPD0WSJf3wz7z3frc8MLUW0QZf24hWKLN
 4WP0QIauNmcp3OgDbfHLFXl4IIWAsMBxfEfmq5mf+EX53bS5PykQxycEVmvX0zGyjGPy
 BS7nsvuknjC9dht3KXdWKgFyazSXH+fBw3YbhhsterT4iv/i9VqNWnaGoGU0R6y8nRfa
 NgetvoI2IeXXZ1j2x1ST2fATxPT+Bb+De3y+YgBdH3WQva8vimxhQDSSj4C7r6GFLYL3
 WEhElbXOEvn+Z4K7het8vX04NwoeXKKCGaw6HN/CFDxmxP061MPycnBz7g1b8c6fDG+M
 KZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5UfrrzHwZLzsu2JJhKXeDjwcfI2VtXJV+HVf1rY21Q=;
 b=MSCi9SLFfrUnbIYGf2zzzfPEvx8ISzI4NOdMioXm4cd0zUwvkZ4nlPPO3KWhd0VpsQ
 /m/lX7C+2niHKgnVUTrzyyjblYyZDsV4EAgGG2km3uUicfeb9TYwrxM/UxAZEsAqoqds
 c11xrpEakkzB2C2Y210fVeOopv5fARvA/dFr5yxLkrKMPWuYwOjfdP+UYwrBq/zKmDRv
 qCi/9VclusxPR35BmFg+mZYPdUXkeG6bHx01UyYLh36OjvlcNVSDajuVM7Ndlfh9Me3/
 Z1kUM5tiPdbRIE5lNl0+PGvl22EaE6aIZcIa8EmVnQhpKisHJXUZ6UIGJDblUdmuqola
 U5Kg==
X-Gm-Message-State: AOAM532Hst0qTA93eCMAxHhVfNYCbRq7XSDVdSj+1vjpY+OI64nE+Z+r
 aVDMi9fa9ouOHqJFfcSIt2vcZqgrhhfF9HJFkw==
X-Google-Smtp-Source: ABdhPJyy2jbEQ45ynrFz6Qvw1HVqlECUwZW0VEyh5CDha62q4654/O358ElXMVzsrMZYMe07O8VC+RZD2+R+9Ti3Nz8=
X-Received: by 2002:a05:6402:410:: with SMTP id
 q16mr40022298edv.286.1633947018498; 
 Mon, 11 Oct 2021 03:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org> <YWBhEQxM4wRyZWzs@myrica>
In-Reply-To: <YWBhEQxM4wRyZWzs@myrica>
From: Haiwei Li <lihaiwei.kernel@gmail.com>
Date: Mon, 11 Oct 2021 18:10:07 +0800
Message-ID: <CAB5KdOa4aLUq_d5RBws1cp_cfq55fw8_FhLY-HPV-1iVyFYKQQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=lihaiwei.kernel@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 eric.auger@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 11:18 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> > Looks like this can not be applied yet because the bypass bit
> > isn't in yet. what's up with that?
>
> The boot-bypass bit isn't a hard dependency for this series, but it will
> be needed for full support eventually. It will be delayed by spec and
> Linux header changes
>
> In the meantime we can work around the problem by having the boot disks
> bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).

Hi Jean,

I have tested on x86 platform with environment:

qemu, your personal repo: http://jpbrucker.net/git/qemu, branch:
virtio-iommu/acpi-2021-10-01
linux kernel, 5.14
qemu command, with '-device virtio-iommu' and boot disk
'virtio-blk-pci,iommu_platform=off'

But the guest boot failed. The print is as follows:

Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... [    7.490238] Btrfs
loaded, crc32c=crc32c-generic, zoned=no
Scanning for Btrfs filesystems
done.
[   10.593238] _warn_unseeded_randomness: 300 callbacks suppressed
[   10.593243] random: get_random_u32 called from
bucket_table_alloc.isra.0+0x123/0x430 with crng_init=0
[   37.534015] random: get_random_u64 called from
dup_task_struct+0x415/0xa10 with crng_init=0
[   37.539950] random: get_random_u64 called from
arch_pick_mmap_layout+0x411/0x5e0 with crng_init=0
[   37.539973] random: get_random_u64 called from
arch_pick_mmap_layout+0x381/0x5e0 with crng_init=0
Begin: Waiting for root file system ... [   38.624374]
_warn_unseeded_randomness: 38 callbacks suppressed
[   38.624389] random: get_random_u64 called from
dup_task_struct+0x415/0xa10 with crng_init=0
Begin: Running /scripts/local-block ... [   38.630760] random:
get_random_u64 called from arch_pick_mmap_layout+0x410
[   38.630767] random: get_random_u64 called from
arch_pick_mmap_layout+0x381/0x5e0 with crng_init=0
mdadm: No arrays found in config file or automatically
done.
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
[   39.633914] _warn_unseeded_randomness: 1278 callbacks suppressed
[   39.633918] random: get_random_u64 called from
dup_task_struct+0x415/0xa10 with crng_init=0
[   39.634867] random: get_random_u64 called from
arch_pick_mmap_layout+0x411/0x5e0 with crng_init=0
[   39.634875] random: get_random_u64 called from
arch_pick_mmap_layout+0x381/0x5e0 with crng_init=0
mdadm: error opening /dev/md?*: No such file or directory
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
mdadm: No arrays found in config file or automatically
done.
Gave up waiting for root file system device.  Common problems:
 - Boot args (cat /proc/cmdline)
   - Check rootdelay= (did the system wait long enough?)
 - Missing modules (cat /proc/modules; ls /dev)
ALERT!  UUID=3caf26b5-4d08-43e0-8634-7573269c4f70 does not exist.
Dropping to a shell!

Any suggestions? Thanks.

--
Haiwei

