Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2A65513
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 13:20:55 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlX89-0004Zn-7v
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 07:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlX77-00043z-LE
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlX76-0000vC-8r
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:19:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlX76-0000sd-1E
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 07:19:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so5292870wms.2
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 04:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pvvl2KFZw3Bgffir1oDtkHVfWW/qFKlBFNsSp/JHeUA=;
 b=J9oRGA34xA7HfSA+gcqPhQwggBBA2i4/GiuaNHPFVh9en0DvWw0zmXIaIXbuqGro7e
 DxUT72roEEt7RvEhVFgARIBAiSfs7lzEwdBhDjGt9jLkcTlJO0tKeQJUTskYiUfRbC1T
 6Ih89v/3dVFdjtxl7BzCjYX12JnljYvVv69fxIhkPm6NO4XsgbqxbivIuHK1mHddmM5P
 BqAT8T5mLLBDbCf7v1QvlHvVyh9Mhh0UXSOsojM25dISnaQfAJ/W5NgjiYZvN/tO5+L5
 HhgvXODRFkY9Vo2aiLZCPR2zM78hZJDfxxoiM4IYUsZ2C9xEXk3+LKS6cueJnBr4KWgD
 4Unw==
X-Gm-Message-State: APjAAAVbJw37svou2eDiBFpozK4bS9/Rsa+F/YB81cPMGSK2XQUYyJS2
 c6NDwSs6hfnGxaUWH5XeF2lBeg==
X-Google-Smtp-Source: APXvYqyjd7ZrSwYYmw978V8fjgofoBdAe7oUaU3LEfGBuDO/2NMl98HOIH2vayVmNwq0aY4meeWBNw==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr3998130wml.175.1562843986138; 
 Thu, 11 Jul 2019 04:19:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id o24sm10071088wmh.2.2019.07.11.04.19.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 04:19:45 -0700 (PDT)
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20190711104412.31233-1-quintela@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c2bfa537-8a5a-86a1-495c-a6c1d0f85dc5@redhat.com>
Date: Thu, 11 Jul 2019 13:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711104412.31233-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PULL 00/19] Migration patches
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/19 12:43, Juan Quintela wrote:
> The following changes since commit 6df2cdf44a82426f7a59dcb03f0dd2181ed7fdfa:
> 
>   Update version for v4.1.0-rc0 release (2019-07-09 17:21:53 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/juanquintela/qemu.git tags/migration-pull-request
> 
> for you to fetch changes up to 0b47e79b3d04f500b6f3490628905ec5884133df:
> 
>   migration: allow private destination ram with x-ignore-shared (2019-07-11 12:30:40 +0200)

Aren't we in hard freeze already?

Paolo

> ----------------------------------------------------------------
> Migration pull request
> 
> ----------------------------------------------------------------
> 
> Juan Quintela (3):
>   migration: fix multifd_recv event typo
>   migration-test: rename parameter to parameter_int
>   migration-test: Add migration multifd test
> 
> Peng Tao (1):
>   migration: allow private destination ram with x-ignore-shared
> 
> Peter Xu (10):
>   migration: No need to take rcu during sync_dirty_bitmap
>   memory: Don't set migration bitmap when without migration
>   bitmap: Add bitmap_copy_with_{src|dst}_offset()
>   memory: Pass mr into snapshot_and_clear_dirty
>   memory: Introduce memory listener hook log_clear()
>   kvm: Update comments for sync_dirty_bitmap
>   kvm: Persistent per kvmslot dirty bitmap
>   kvm: Introduce slots lock for memory listener
>   kvm: Support KVM_CLEAR_DIRTY_LOG
>   migration: Split log_clear() into smaller chunks
> 
> Wei Yang (5):
>   migration/multifd: call multifd_send_sync_main when sending
>     RAM_SAVE_FLAG_EOS
>   migration/xbzrle: update cache and current_data in one place
>   cutils: remove one unnecessary pointer operation
>   migration/multifd: sync packet_num after all thread are done
>   migratioin/ram.c: reset complete_round when we gets a queued page
> 
>  accel/kvm/kvm-all.c          |  260 +-
>  accel/kvm/trace-events       |    1 +
>  exec.c                       |   15 +-
>  include/exec/memory.h        |   19 +
>  include/exec/memory.h.rej    |   26 +
>  include/exec/ram_addr.h      |   92 +-
>  include/exec/ram_addr.h.orig |  488 ++++
>  include/qemu/bitmap.h        |    9 +
>  include/sysemu/kvm_int.h     |    4 +
>  memory.c                     |   56 +-
>  memory.c.rej                 |   17 +
>  migration/migration.c        |    4 +
>  migration/migration.h        |   27 +
>  migration/migration.h.orig   |  315 +++
>  migration/ram.c              |   93 +-
>  migration/ram.c.orig         | 4599 ++++++++++++++++++++++++++++++++++
>  migration/ram.c.rej          |   33 +
>  migration/trace-events       |    3 +-
>  migration/trace-events.orig  |  297 +++
>  tests/Makefile.include       |    2 +
>  tests/migration-test.c       |  103 +-
>  tests/test-bitmap.c          |   72 +
>  util/bitmap.c                |   85 +
>  util/cutils.c                |    8 +-
>  24 files changed, 6545 insertions(+), 83 deletions(-)
>  create mode 100644 include/exec/memory.h.rej
>  create mode 100644 include/exec/ram_addr.h.orig
>  create mode 100644 memory.c.rej
>  create mode 100644 migration/migration.h.orig
>  create mode 100644 migration/ram.c.orig
>  create mode 100644 migration/ram.c.rej
>  create mode 100644 migration/trace-events.orig
>  create mode 100644 tests/test-bitmap.c
> 


