Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697965A536D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:44:16 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSio2-0005Qd-W6
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSijN-0001aa-T9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 13:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSijJ-0006Jc-T9
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 13:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661794759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=25dOBtLX3GOazriDFsFzC9MqMNcHPEVZ0DgwoY8R920=;
 b=dysIUb/7Kf5psyh0lKaEPfpOVyaqWOnyEj1zbMEEvQWkRRaV/pqaHzF53+TGz3ZANden6h
 Sj5gDvkSnKBHNmnR2MmBORqf+bHaZNEWiYdYDsUZnS9KQePGd4ZCPvVGGx2DrEzV8TewBN
 QMav8+h1qBFfJEbzk4X3rSbtbWmdN/Y=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-3YAT-TiRNbu9GsbcnC0Qag-1; Mon, 29 Aug 2022 13:39:18 -0400
X-MC-Unique: 3YAT-TiRNbu9GsbcnC0Qag-1
Received: by mail-il1-f199.google.com with SMTP id
 c7-20020a056e020bc700b002e59be6ce85so6407382ilu.12
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 10:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=25dOBtLX3GOazriDFsFzC9MqMNcHPEVZ0DgwoY8R920=;
 b=gkKvxsGWD2s5yhtdC6GcEMXdXRlwIiHbB+eiBNuXKr70BBgGsoyt2cRnD0K6Jhvg7d
 cMR4t4K2Yy9UGom0uKtDvOSE4HYoda5+FnKi6+3jwCi+wBdHnvD+bv24Bf0bfTwEPmv2
 ssoiqyeAOIdMhqo7JfgkDKvBy4ZQ763JWy8ZsJso1ML7vi5VVDALfe/vaeMhIWLSeAy2
 xcxOzesjERuyB8DgXAsP1akJKDhZNk1yp3mHm8PU1S+rXhlASPyRCuOi2VQQelIxoIrf
 OmQqvKdC99/+G1ov9xlVeExa3TT4ozn8k+24CV62z83iHX5DHJ5V7e1Xvu94RqkA/vQW
 h1aA==
X-Gm-Message-State: ACgBeo27fVVCcwxZRgWhouq3fZ2VcwcItr/cSWWUaP/WOdzZt/qTr6DJ
 xz/LuPXGgzKQe62ssgG5rFs8I1s6XUTw5usGrDH8Gp0XqZ3N+WU2vEA74YAFPFVxBTqdXHnWojH
 9q9i1KP6eaRZTEvTCOrOycLhX32FUgvSklZy4fkLA9VU3gcx32zlYKhPLpRYNZJVy
X-Received: by 2002:a05:6e02:168f:b0:2eb:1c2c:33a5 with SMTP id
 f15-20020a056e02168f00b002eb1c2c33a5mr2418185ila.98.1661794757363; 
 Mon, 29 Aug 2022 10:39:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4J0fD/soAs5NtWKjoBNiGyEQoUaJGxJ47t5LFZJ4z2ChpnCjesrdKaIZpTOWENdTnsi0phaQ==
X-Received: by 2002:a05:6e02:168f:b0:2eb:1c2c:33a5 with SMTP id
 f15-20020a056e02168f00b002eb1c2c33a5mr2418167ila.98.1661794756978; 
 Mon, 29 Aug 2022 10:39:16 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a021903000000b00349e5bf727fsm4543575jab.21.2022.08.29.10.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 10:39:16 -0700 (PDT)
Date: Mon, 29 Aug 2022 13:39:14 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 00/13] migration: Postcopy Preempt-Full
Message-ID: <Ywz5wvBUntUlFC/V@xz-m1.local>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Aug 29, 2022 at 12:56:46PM -0400, Peter Xu wrote:
> This is a RFC series.  Tree is here:
> 
>   https://github.com/xzpeter/qemu/tree/preempt-full
> 
> It's not complete because there're still something we need to do which will
> be attached to the end of this cover letter, however this series can
> already safely pass qtest and any of my test.
> 
> Comparing to the recently merged preempt mode I called it "preempt-full"
> because it threadifies the postcopy channels so now urgent pages can be
> fully handled separately outside of the ram save loop.  Sorry to have the
> same name as the PREEMPT_FULL in the Linux RT world, it's just that we
> needed a name for the capability and it was named as preempt already
> anyway..
> 
> The existing preempt code has reduced ramdom page req latency over 10Gbps
> network from ~12ms to ~500us which has already landed.
> 
> This preempt-full series can further reduces that ~500us to ~230us per my
> initial test.  More to share below.
> 
> Note that no new capability is needed, IOW it's fully compatible with the
> existing preempt mode.  So the naming is actually not important but just to
> identify the difference on the binaries.  It's because this series only
> reworks the sender side code and does not change the migration protocol, it
> just runs faster.
> 
> IOW, old "preempt" QEMU can also migrate to "preempt-full" QEMU, vice versa.
> 
>   - When old "preempt" mode QEMU migrates to "preempt-full" QEMU, it'll be
>     the same as running both old "preempt" QEMUs.
> 
>   - When "preempt-full" QEMU migrates to old "preempt" QEMU, it'll be the
>     same as running both "preempt-full".
> 
> The logic of the series is quite simple too: simply moving the existing
> preempt channel page sends to rp-return thread.  It can slow down rp-return
> thread on receiving pages, but I don't really see a major issue with it so
> far.
> 
> This latency number is getting close to the extreme of 4K page request
> latency of any TCP roundtrip of the 10Gbps nic I have.  The 'extreme
> number' is something I get from mig_mon tool which has a mode [1] to
> emulate the extreme tcp roundtrips of page requests.
> 
> Performance
> ===========
> 
> Page request latencies has distributions as below, with a VM of 20G mem, 20
> cores, 10Gbps nic, 18G fully random writes:
> 
> Postcopy Vanilla
> ----------------
> 
> Average: 12093 (us)
> @delay_us:
> [1]                    1 |                                                    |
> [2, 4)                 0 |                                                    |
> [4, 8)                 0 |                                                    |
> [8, 16)                0 |                                                    |
> [16, 32)               1 |                                                    |
> [32, 64)               8 |                                                    |
> [64, 128)             11 |                                                    |
> [128, 256)            14 |                                                    |
> [256, 512)            19 |                                                    |
> [512, 1K)             14 |                                                    |
> [1K, 2K)              35 |                                                    |
> [2K, 4K)              18 |                                                    |
> [4K, 8K)              87 |@                                                   |
> [8K, 16K)           2397 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [16K, 32K)             7 |                                                    |
> [32K, 64K)             2 |                                                    |
> [64K, 128K)           20 |                                                    |
> [128K, 256K)           6 |                                                    |
> 
> Postcopy Preempt
> ----------------
> 
> Average: 496 (us)
> 
> @delay_us:
> [32, 64)               2 |                                                    |
> [64, 128)           2306 |@@@@                                                |
> [128, 256)         25422 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [256, 512)          8238 |@@@@@@@@@@@@@@@@                                    |
> [512, 1K)           1066 |@@                                                  |
> [1K, 2K)            2167 |@@@@                                                |
> [2K, 4K)            3329 |@@@@@@                                              |
> [4K, 8K)             109 |                                                    |
> [8K, 16K)             48 |                                                    |
> 
> Postcopy Preempt-Full
> ---------------------
> 
> Average: 229 (us)
> 
> @delay_us:
> [8, 16)                1 |                                                    |
> [16, 32)               3 |                                                    |
> [32, 64)               2 |                                                    |
> [64, 128)          11956 |@@@@@@@@@@                                          |
> [128, 256)         60403 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [256, 512)         15047 |@@@@@@@@@@@@                                        |
> [512, 1K)            846 |                                                    |
> [1K, 2K)              25 |                                                    |
> [2K, 4K)              41 |                                                    |
> [4K, 8K)             131 |                                                    |
> [8K, 16K)             72 |                                                    |
> [16K, 32K)             2 |                                                    |
> [32K, 64K)             8 |                                                    |
> [64K, 128K)            6 |                                                    |
> 
> For fully sequential page access workloads, I have described in the
> previous preempt-mode work that such workload may not benefit much from
> preempt mode much, but surprisingly at least in my seq write test the
> preempt-full mode can also benefit sequential access patterns at least when
> I measured it:
> 
> Postcopy Vanilla
> ----------------
> 
> Average: 1487 (us)
> 
> @delay_us:
> [0]                   93 |@                                                   |
> [1]                 1920 |@@@@@@@@@@@@@@@@@@@@@@@                             |
> [2, 4)               504 |@@@@@@                                              |
> [4, 8)              2234 |@@@@@@@@@@@@@@@@@@@@@@@@@@@                         |
> [8, 16)             4199 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [16, 32)            3782 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      |
> [32, 64)            1016 |@@@@@@@@@@@@                                        |
> [64, 128)             81 |@                                                   |
> [128, 256)            14 |                                                    |
> [256, 512)            26 |                                                    |
> [512, 1K)             69 |                                                    |
> [1K, 2K)             208 |@@                                                  |
> [2K, 4K)             429 |@@@@@                                               |
> [4K, 8K)            2779 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  |
> [8K, 16K)            792 |@@@@@@@@@                                           |
> [16K, 32K)             9 |                                                    |
> 
> Postcopy Preempt-Full
> ---------------------
> 
> Average: 1582 (us)
> 
> @delay_us:
> [0]                   45 |                                                    |
> [1]                 1786 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       |
> [2, 4)               423 |@@@@@@@                                             |
> [4, 8)              1903 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                     |
> [8, 16)             2933 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    |
> [16, 32)            3132 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [32, 64)             518 |@@@@@@@@                                            |
> [64, 128)             30 |                                                    |
> [128, 256)           218 |@@@                                                 |
> [256, 512)           214 |@@@                                                 |
> [512, 1K)            211 |@@@                                                 |
> [1K, 2K)             131 |@@                                                  |
> [2K, 4K)             336 |@@@@@                                               |
> [4K, 8K)            3023 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  |
> [8K, 16K)            479 |@@@@@@@                                             |
> 
> Postcopy Preempt-Full
> ---------------------
> 
> Average: 439 (us)
> 
> @delay_us:
> [0]                    3 |                                                    |
> [1]                 1058 |@                                                   |
> [2, 4)               179 |                                                    |
> [4, 8)              1079 |@                                                   |
> [8, 16)             2251 |@@@                                                 |
> [16, 32)            2345 |@@@@                                                |
> [32, 64)             713 |@                                                   |
> [64, 128)           5386 |@@@@@@@@@                                           |
> [128, 256)         30252 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
> [256, 512)         10789 |@@@@@@@@@@@@@@@@@@                                  |
> [512, 1K)            367 |                                                    |
> [1K, 2K)              26 |                                                    |
> [2K, 4K)             256 |                                                    |
> [4K, 8K)            1840 |@@@                                                 |
> [8K, 16K)            300 |                                                    |
> 
> I always don't think seq access is important in migrations, because for any
> not-small VM that has a migration challenge, any multiple seq accesses will
> also be grown into a random access pattern.  But I'm anyway laying the data
> around for good reference.
> 
> Comments welcomed, thanks.
> 
> TODO List
> =========
> 
> - Make migration accountings atomic
> - Drop rs->f?
> - Disable xbzrle for preempt mode?  Is it already perhaps disabled for postcopy?
> - If this series can be really accepted, we can logically drop some of the
>   old (complcated) code with the old preempt series.
> - Drop x-postcopy-preempt-break-huge parameter?
> - More to come
> 
> [1] https://github.com/xzpeter/mig_mon#vm-live-migration-network-emulator
> 
> Peter Xu (13):
>   migration: Use non-atomic ops for clear log bitmap
>   migration: Add postcopy_preempt_active()
>   migration: Yield bitmap_mutex properly when sending/sleeping
>   migration: Cleanup xbzrle zero page cache update logic
>   migration: Disallow postcopy preempt to be used with compress
>   migration: Trivial cleanup save_page_header() on same block check
>   migration: Remove RAMState.f references in compression code
>   migration: Teach PSS about host page
>   migration: Introduce pss_channel
>   migration: Add pss_init()
>   migration: Make PageSearchStatus part of RAMState
>   migration: Move last_sent_block into PageSearchStatus
>   migration: Send requested page directly in rp-return thread

Side note:

Not all the patches here are servicing the preempt-full goal.  E.g. we
could consider reviewing/merging patch 1, 5 earlier: patch 1 is long
standing perf improvement on clear bitmap ops, patch 5 should be seem as a
fix I think.

Some other trivial cleanup patches can be picked up too but not urgent.

-- 
Peter Xu


