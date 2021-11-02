Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED6443202
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:48:42 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhw1h-0001aY-5o
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhvz5-0007Ig-JU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:46:00 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhvz3-0003Nd-8j
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:45:59 -0400
Received: by mail-qt1-x82f.google.com with SMTP id j1so12007699qtq.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oBZS+B5OI/pNOurVNUNmHTLzU1LJ6vGeGI0SMtDtTqA=;
 b=ZxvXyZ8G6um96czYq5NWq0JwiA0h3KQZiPg6jRZHGNFHRPslxY+VDPyuTaCEHNUULy
 +pkbJHwaI9jQjaIW8qRyVebYqe2MOnXFruS8bmWxt5KLy3IZ+0AFirfA/DLeUcEl4HIX
 TRgpSA0mp0MdbHJSKO7qkEMITA6Dw2dfICBp3n7qqNf/sBb+gB8edfdhV911nOhAOwHH
 B6snqjnx7hhz3hn1quZHjYRnFA8fZTSIRSu4V/8qL24ItahLZWErZc2Foql8ePgzC/Vz
 +nYzVDZGlH30T0pNHhnmKVJBhUCmIs7aHmo7nDOe0zezTbMGPCuSmMyaFmLIFYCq83rR
 pJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oBZS+B5OI/pNOurVNUNmHTLzU1LJ6vGeGI0SMtDtTqA=;
 b=fvic2XX+fVG4kudnFlTcNJ8FLKsWUHSxoBh3j5oaPkzdwe+nHR2/jAIrdGb2vB5jA/
 iQXSO7Ed6LHSgZjCjGKayG9VeuFEVO7+P+hGX8IZ3d2xJwmBiMjccNy6jSpc3O9ecqz3
 zOX4/ktdGfZf8Im8byxn1Lk34qfaxpJUtQUgPr7srougDUWwMefKzX4yQUU1fptNj50T
 Ygjj3bbvvvwrpedXs1kAjEveGRAV34TSfKxQ2nuBGTNSRzkHaQud/awX1d9nUR41ihOR
 TFKxhAjQLfUarAZJwLGKn300JtJi4pE0rdJGe+8suxp4LtEldPFzPt/2Gtn3hYlZnM1q
 ldMA==
X-Gm-Message-State: AOAM532in8ck/e/0e+uug6B5RDXt8YIX9Qo3hliw9GIuLKwFavUjqQpe
 2dqhogFPa5mguxVCxCg3Mk1tcQ==
X-Google-Smtp-Source: ABdhPJx7asEmjavQwNXvLHtTNJJ4FS8uJKsNMq8MaQoG0lRsFCuUBJcFIhC2E0gsV2D1s47hX+9AHg==
X-Received: by 2002:ac8:7f11:: with SMTP id f17mr31747889qtk.389.1635867956240; 
 Tue, 02 Nov 2021 08:45:56 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y8sm12807287qko.36.2021.11.02.08.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:45:55 -0700 (PDT)
Subject: Re: [PULL 00/20] Migration 20211031 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211101220912.10039-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <709cabc0-95c3-27dd-e2ae-8834fc7b36b3@linaro.org>
Date: Tue, 2 Nov 2021 11:45:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:08 PM, Juan Quintela wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration-20211031-pull-request
> 
> for you to fetch changes up to 826b8bc80cb191557a4ce7cf0e155b436d2d1afa:
> 
>    migration/dirtyrate: implement dirty-bitmap dirtyrate calculation (2021-11-01 22:56:44 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> this includes pending bits of migration patches.
> 
> - virtio-mem support by David Hildenbrand
> - dirtyrate improvements by Hyman Huang
> - fix rdma wrid by Li Zhijian
> - dump-guest-memory fixes by Peter Xu
> 
> Pleas apply.
> 
> Thanks, Juan.
> 
> ----------------------------------------------------------------
> 
> David Hildenbrand (8):
>    memory: Introduce replay_discarded callback for RamDiscardManager
>    virtio-mem: Implement replay_discarded RamDiscardManager callback
>    migration/ram: Handle RAMBlocks with a RamDiscardManager on the
>      migration source
>    virtio-mem: Drop precopy notifier
>    migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>      destination
>    migration: Simplify alignment and alignment checks
>    migration/ram: Factor out populating pages readable in
>      ram_block_populate_pages()
>    migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>      snapshots
> 
> Hyman Huang(é»„å‹‡) (6):
>    KVM: introduce dirty_pages and kvm_dirty_ring_enabled
>    memory: make global_dirty_tracking a bitmask
>    migration/dirtyrate: introduce struct and adjust DirtyRateStat
>    migration/dirtyrate: adjust order of registering thread
>    migration/dirtyrate: move init step of calculation to main thread
>    migration/dirtyrate: implement dirty-ring dirtyrate calculation
> 
> Hyman Huang(黄勇) (2):
>    memory: introduce total_dirty_pages to stat dirty pages
>    migration/dirtyrate: implement dirty-bitmap dirtyrate calculation
> 
> Li Zhijian (1):
>    migration/rdma: Fix out of order wrid
> 
> Peter Xu (3):
>    migration: Make migration blocker work for snapshots too
>    migration: Add migrate_add_blocker_internal()
>    dump-guest-memory: Block live migration
> 
>   qapi/migration.json            |  48 ++++-
>   include/exec/memory.h          |  41 +++-
>   include/exec/ram_addr.h        |  13 +-
>   include/hw/core/cpu.h          |   1 +
>   include/hw/virtio/virtio-mem.h |   3 -
>   include/migration/blocker.h    |  16 ++
>   include/sysemu/kvm.h           |   1 +
>   migration/dirtyrate.h          |  21 +-
>   migration/ram.h                |   1 +
>   accel/kvm/kvm-all.c            |   7 +
>   accel/stubs/kvm-stub.c         |   5 +
>   dump/dump.c                    |  19 ++
>   hw/i386/xen/xen-hvm.c          |   4 +-
>   hw/virtio/virtio-mem.c         |  92 ++++++---
>   migration/dirtyrate.c          | 367 ++++++++++++++++++++++++++++++---
>   migration/migration.c          |  30 +--
>   migration/postcopy-ram.c       |  40 +++-
>   migration/ram.c                | 180 ++++++++++++++--
>   migration/rdma.c               | 138 +++++++++----
>   softmmu/memory.c               |  43 +++-
>   hmp-commands.hx                |   8 +-
>   migration/trace-events         |   2 +
>   softmmu/trace-events           |   1 +
>   23 files changed, 909 insertions(+), 172 deletions(-)

Applied, thanks.

r~


