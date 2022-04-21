Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F250A8AF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:02:31 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc4U-0005rU-Mo
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbnL-0007Z9-Db
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbnJ-0006KE-SH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcTolAbhciuaypNZ1wT+hl2DxqyEp8Oi+ZDxmdTjTxE=;
 b=IGc1g0Hn6DYP0UL8Yb0cCZxW9ckY5ilA4wOQ7OExi5lDaFKKTam+wlF4cjkfm0t63e0mfd
 6R0GzPgS5Q2hC/tIls2AJkA4uiC4zigmuxXpJQui7058LfCN1osI/hyT/l1k5suvQEHlov
 VesSUHKGZCLh7aKCd0e1+KpmSe5eyBw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-8v0IZ14_NVGXBbKvAs6ZPA-1; Thu, 21 Apr 2022 14:44:43 -0400
X-MC-Unique: 8v0IZ14_NVGXBbKvAs6ZPA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so50689wra.15
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vcTolAbhciuaypNZ1wT+hl2DxqyEp8Oi+ZDxmdTjTxE=;
 b=ST3KZ5Wv465r3F0/XS94p17JqAAweQFBh4j/TY51HD2/9azZU2n44TQG3DT/cU59nM
 iur3Oi5CRcnmDceBHVRGEeGDYmMkcls9NwvJtN8P64+EF58l8RqDyeZmyrextnPbtpFg
 3TJrTmQ+jGN8wY8ez5itzG6SMXOhOAjojdTHnI1FlOoGeM6rndXFGUd7bv1Nfl/K8s+/
 9f19ve1QnslO9rvGYphXYWLmJO9oNQiXFcmV60ApTGgEIxCtRLxq42Wf5wCkLXJv025T
 LDXG9mPNPFhqCjgv0cYZtmOJw3APfvdtG4P1c6Kv23TwDm3CSvhUbHHq2r9AWs8BTpXL
 uBwQ==
X-Gm-Message-State: AOAM5330j7KMeQuwGwWp/C/SVej2+42OZsskBQLEOoYUNy/GFVT9z8zC
 7RvdX7Jzsys0L99/D0tOtW8Vth9DJM4TmHa7Bo7NUU+f9fR55TFmnIz68ZMJzxdQe07iLB0ARBo
 ZCESL6vmvx12AIQS7Zg6PcEaOTYR4DSJUYZDtRiCCrkVeXgAYfWdb8wDeW0LiKV5cJmc=
X-Received: by 2002:a7b:c94a:0:b0:38e:c252:4a58 with SMTP id
 i10-20020a7bc94a000000b0038ec2524a58mr10085905wml.177.1650566682355; 
 Thu, 21 Apr 2022 11:44:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRbTmb9nvk8Gt3H9SJeN7gsYO+SgaEOBQdq7iAKmkeoVBz78tyXXg6nRMe1O/Gz0qi7H0KdA==
X-Received: by 2002:a7b:c94a:0:b0:38e:c252:4a58 with SMTP id
 i10-20020a7bc94a000000b0038ec2524a58mr10085886wml.177.1650566681972; 
 Thu, 21 Apr 2022 11:44:41 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b0039290a5b827sm2843188wmq.24.2022.04.21.11.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 11:44:41 -0700 (PDT)
Date: Thu, 21 Apr 2022 19:44:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, berrange@redhat.com
Subject: Re: [PULL 00/18] migration queue
Message-ID: <YmGmF9p5x7f3ufSm@work-vm>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 401d46789410e88e9e90d76a11f46e8e9f358d55:
> 
>   Merge tag 'pull-target-arm-20220421' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-21 08:04:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220421b
> 
> for you to fetch changes up to 25e7d2fd25d133a9f714443974b51e50416546a5:
> 
>   migration: Read state once (2022-04-21 17:33:50 +0100)

Oops, this has a checkpatch nit; just reposted a fixed version.

Dave

> ----------------------------------------------------------------
> Migration pull 2022-04-21
> 
>   Dan: Test fixes and improvements (TLS mostly)
>   Peter: Postcopy improvements
>   Me: Race fix for info migrate, and compilation fix
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (9):
>       tests: improve error message when saving TLS PSK file fails
>       tests: support QTEST_TRACE env variable
>       tests: print newline after QMP response in qtest logs
>       migration: fix use of TLS PSK credentials with a UNIX socket
>       tests: switch MigrateStart struct to be stack allocated
>       tests: merge code for UNIX and TCP migration pre-copy tests
>       tests: introduce ability to provide hooks for migration precopy test
>       tests: switch migration FD passing test to use common precopy helper
>       tests: expand the migration precopy helper to support failures
> 
> Dr. David Alan Gilbert (2):
>       migration: Fix operator type
>       migration: Read state once
> 
> Peter Xu (7):
>       migration: Postpone releasing MigrationState.hostname
>       migration: Drop multifd tls_hostname cache
>       migration: Add pss.postcopy_requested status
>       migration: Move migrate_allow_multifd and helpers into migration.c
>       migration: Export ram_load_postcopy()
>       migration: Move channel setup out of postcopy_try_recover()
>       migration: Allow migrate-recover to run multiple times
> 
>  migration/channel.c                 |   1 -
>  migration/migration.c               |  68 ++++---
>  migration/migration.h               |   4 +-
>  migration/multifd.c                 |  29 +--
>  migration/multifd.h                 |   4 -
>  migration/ram.c                     |  10 +-
>  migration/ram.h                     |   1 +
>  migration/savevm.c                  |   3 -
>  migration/tls.c                     |   4 -
>  tests/qtest/libqtest.c              |  13 +-
>  tests/qtest/migration-test.c        | 368 ++++++++++++++++++++----------------
>  tests/unit/crypto-tls-psk-helpers.c |   2 +-
>  12 files changed, 269 insertions(+), 238 deletions(-)
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


