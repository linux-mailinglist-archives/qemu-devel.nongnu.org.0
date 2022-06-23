Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2C557663
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:12:52 +0200 (CEST)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ItP-0000AZ-Jz
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Icr-0005wl-9E
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Icn-0008VA-GH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655974540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnLjGjUim6ssuMo2+M8HBTPe4Zol4w+W6fDcOaqA6O8=;
 b=fgDx41ktWiCyfrLbXbR57z8RzG6d9JpeRQJ/eSOg7WFHxgV2PqzsDxE+2s8OQ+ysUtSfzL
 VYPI9KIvju24CFMHQo2jdqJZhcv8Dz29LLE5s/ITFtw4dWYcmxB1OI4o+O2rN5vTWql9YU
 UCS1a9Znq+q+S6fCS5NrqeL6i+DLOnE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-AsknxYZ5PsK-bh3N5FpgsA-1; Thu, 23 Jun 2022 04:55:29 -0400
X-MC-Unique: AsknxYZ5PsK-bh3N5FpgsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l3-20020a05600c1d0300b0039c7efa2526so1107278wms.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YnLjGjUim6ssuMo2+M8HBTPe4Zol4w+W6fDcOaqA6O8=;
 b=45vvY40hsoRROFKnzcTwmYRjxCHbh4bfqgv0/5Wtb/5Cr5dpuPGctRa5/m+JnIf8Yc
 IND9lMW1SKQMiYYW58BKYzD2XqnQ60aMa0DpTWRrHv6PGjPssW/ndL2sWdt5PI+AeAHc
 aTqfxBqo4XdozIGTM4/2N1nLGGTux86CcQ0STnbpKUKnXWByPWCdWiOJSp0ePbRvJqrm
 ji8K6uecsuMyKr1lC0HX4XDMOC4rCexjmpwidov7QtSH9ZA1OhfZ7+e0wvfBlXYLVcpn
 SBcLxz7pEXwRJGSw3P0RoRkFGuBzttHAGJfauNRphuM56feYHCu7qajvHjYnk160VI/f
 DlAA==
X-Gm-Message-State: AJIora+aae41C5PuhXA4X+eGnJMxlCQE6YDldN4BmRUwTlogYS4CQQhd
 Zd79PVqfIpaKIcPg53SDhb2E7ebg0MSsuWikSFKkb27WNZwpzwew6j/XbwGh1v2jaWkQuzJaJbu
 0s5R1gPWyPNhvX0owpIJ2OOeKJj0qeK4vvxPilPd5KrL4DegUU6IdhMbCd1fngFqcxtI=
X-Received: by 2002:a05:6000:69d:b0:21a:395e:572c with SMTP id
 bo29-20020a056000069d00b0021a395e572cmr7011848wrb.559.1655974527525; 
 Thu, 23 Jun 2022 01:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1veC/756JYDCcHKAFOdLo9oIdEYoFP5Y0LEHpZ+KiQTJVTEEyFmCMLC6YvQ3dSpSsB/xiRUGA==
X-Received: by 2002:a05:6000:69d:b0:21a:395e:572c with SMTP id
 bo29-20020a056000069d00b0021a395e572cmr7011827wrb.559.1655974527244; 
 Thu, 23 Jun 2022 01:55:27 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003974b95d897sm2450502wmb.37.2022.06.23.01.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 01:55:25 -0700 (PDT)
Date: Thu, 23 Jun 2022 09:55:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: Re: [PULL 00/33] migration queue
Message-ID: <YrQqe38wUDNVlnFS@work-vm>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:
> 
>   Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220622b
> 
> for you to fetch changes up to 9c6eb6dc3785a280b504195d308da082641af2a7:
> 
>   tests: Add dirty page rate limit test (2022-06-22 19:33:43 +0100)

NACK - Peter spotted a 1 character typo; I'll resend.

Dave

> ----------------------------------------------------------------
> Migration pull 2022-06-22
> 
> Compared to Juan's pull:
>   a) Hopefully fixed non-Linux builds
>     (Local build test on mingw64 works
>     Note: the zero-copy capability is now
>     defined on non-Linux systems)
>   b) Added Hyman's series - it had been
>     on queue for a while (sorry for the delay)
>   c) Fixed up a whole bunch of check-patch failures
>     - please use it!
> 
> In this today migration PULL request:
> - Dainiel Berrangé - qemufileops cleanup
> - Leonardo Bras  - cleanups for zero copy
> - Juan Quintela  - RDMA cleanups
> - Hyman Huang - per-vcpu dirty ring work
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (21):
>       io: add a QIOChannelNull equivalent to /dev/null
>       migration: switch to use QIOChannelNull for dummy channel
>       migration: remove unreachble RDMA code in save_hook impl
>       migration: rename rate limiting fields in QEMUFile
>       migration: rename 'pos' field in QEMUFile to 'bytes_processed'
>       migration: rename qemu_ftell to qemu_file_total_transferred
>       migration: rename qemu_update_position to qemu_file_credit_transfer
>       migration: rename qemu_file_update_transfer to qemu_file_acct_rate_limit
>       migration: introduce a QIOChannel impl for BlockDriverState VMState
>       migration: convert savevm to use QIOChannelBlock for VMState
>       migration: stop passing 'opaque' parameter to QEMUFile hooks
>       migration: hardcode assumption that QEMUFile is backed with QIOChannel
>       migration: introduce new constructors for QEMUFile
>       migration: remove unused QEMUFileGetFD typedef / qemu_get_fd method
>       migration: remove the QEMUFileOps 'shut_down' callback
>       migration: remove the QEMUFileOps 'set_blocking' callback
>       migration: remove the QEMUFileOps 'close' callback
>       migration: remove the QEMUFileOps 'get_buffer' callback
>       migration: remove the QEMUFileOps 'writev_buffer' callback
>       migration: remove the QEMUFileOps 'get_return_path' callback
>       migration: remove the QEMUFileOps abstraction
> 
> Hyman Huang (8):
>       accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
>       cpus: Introduce cpu_list_generation_id
>       migration/dirtyrate: Refactor dirty page rate calculation
>       softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
>       accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
>       softmmu/dirtylimit: Implement virtual CPU throttle
>       softmmu/dirtylimit: Implement dirty page rate limit
>       tests: Add dirty page rate limit test
> 
> Juan Quintela (1):
>       migration: Remove RDMA_UNREGISTRATION_EXAMPLE
> 
> Leonardo Bras (3):
>       QIOChannelSocket: Introduce assert and reduce ifdefs to improve readability
>       QIOChannelSocket: Fix zero-copy send so socket flush works
>       migration: Change zero_copy_send from migration parameter to migration capability
> 
>  accel/kvm/kvm-all.c               |  46 ++-
>  accel/stubs/kvm-stub.c            |   5 +
>  cpus-common.c                     |   8 +
>  hmp-commands-info.hx              |  13 +
>  hmp-commands.hx                   |  32 ++
>  include/exec/cpu-common.h         |   1 +
>  include/exec/memory.h             |   5 +-
>  include/hw/core/cpu.h             |   6 +
>  include/io/channel-null.h         |  55 ++++
>  include/monitor/hmp.h             |   3 +
>  include/sysemu/dirtylimit.h       |  37 +++
>  include/sysemu/dirtyrate.h        |  28 ++
>  include/sysemu/kvm.h              |   2 +
>  io/channel-null.c                 | 237 +++++++++++++++
>  io/channel-socket.c               |  19 +-
>  io/meson.build                    |   1 +
>  io/trace-events                   |   3 +
>  migration/block.c                 |  10 +-
>  migration/channel-block.c         | 195 +++++++++++++
>  migration/channel-block.h         |  59 ++++
>  migration/channel.c               |   4 +-
>  migration/colo.c                  |   5 +-
>  migration/dirtyrate.c             | 227 ++++++++------
>  migration/dirtyrate.h             |   7 +-
>  migration/meson.build             |   2 +-
>  migration/migration.c             |  68 ++---
>  migration/multifd.c               |   4 +-
>  migration/qemu-file-channel.c     | 194 ------------
>  migration/qemu-file-channel.h     |  32 --
>  migration/qemu-file.c             | 193 ++++++------
>  migration/qemu-file.h             | 125 ++++----
>  migration/ram.c                   |   8 +-
>  migration/rdma.c                  | 185 +++---------
>  migration/savevm.c                |  55 +---
>  migration/vmstate.c               |   5 +-
>  monitor/hmp-cmds.c                |   6 -
>  qapi/migration.json               | 113 +++++--
>  softmmu/dirtylimit.c              | 601 ++++++++++++++++++++++++++++++++++++++
>  softmmu/meson.build               |   1 +
>  softmmu/trace-events              |   7 +
>  tests/qtest/migration-helpers.c   |  22 ++
>  tests/qtest/migration-helpers.h   |   2 +
>  tests/qtest/migration-test.c      | 255 ++++++++++++++++
>  tests/qtest/qmp-cmd-test.c        |   2 +
>  tests/unit/meson.build            |   1 +
>  tests/unit/test-io-channel-null.c |  95 ++++++
>  tests/unit/test-vmstate.c         |   5 +-
>  47 files changed, 2219 insertions(+), 770 deletions(-)
>  create mode 100644 include/io/channel-null.h
>  create mode 100644 include/sysemu/dirtylimit.h
>  create mode 100644 include/sysemu/dirtyrate.h
>  create mode 100644 io/channel-null.c
>  create mode 100644 migration/channel-block.c
>  create mode 100644 migration/channel-block.h
>  delete mode 100644 migration/qemu-file-channel.c
>  delete mode 100644 migration/qemu-file-channel.h
>  create mode 100644 softmmu/dirtylimit.c
>  create mode 100644 tests/unit/test-io-channel-null.c
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


