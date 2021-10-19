Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D537B433D73
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:26:49 +0200 (CEST)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcssz-0005vH-0R
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcsOI-0001uo-Uw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:55:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcsOG-0008Sd-QL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:55:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ls18so400164pjb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SBfHSEzPMAPEjebSiNpgs+15wWgTs6sCMoE30dkhVko=;
 b=tlAzXdsoVbYBAeukprEZH+cEsSe2fDaEiDVVh7K/51QMXxOIHJXVEzF4OR8HftaTyp
 cjy8gUW16YllaJ2YQsM+oEVKi/u6Q2tc5rx6i8KEg2+wZQGP8gW13nGmAR8RV2kZUrZx
 oxWNXy1CyBksM7pl7VthyYm4xGO3Ln8j+khQtqsKJXKPY3xB/CRzpgt6qmK6r6PFT7iq
 7N+UmMzUsGcWVzcou6KHq8cMBY6wowmQcSm11zhd0K4bGbay7A1n3rVICqUx4BCQYHyS
 S5yip4sB+SeiOlVuuK4lGFAk3REuMYCxOqjO1v6jCfCS2UTQhPJztYWcVCULtOK07ZQ3
 lggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SBfHSEzPMAPEjebSiNpgs+15wWgTs6sCMoE30dkhVko=;
 b=JdcOB86iMxwMGhytWwIw53ENFDcZ5rRr0HGgk4tqDG032kUNOX7sdE2LGPhQTfLIQD
 XRuctcH9QxJnH2HiN3Le+gSYoZNYWu7UZhjgrIuyTSAn4KWKMFL58c+Iv8NzvUM6oxkh
 8ahvPOgSOpoVdMdrLSZbDPspAFp6HIdA4/yhYyzNWvY+dSIyaRe5e0BaVyLtsP0p4WD1
 45qbe80VyUHEvIBLuBlw/BVGMHI28YWs5Ezx9pRsGBfmiZ0EEK1V+mcmpJWI0I1yjRMc
 GiG8UomNBa3uSnqcVZnyisjYX7PM7m05jLmRF1CvnB0yOj0f1WhUieJN9liPAHao1fKv
 cx3g==
X-Gm-Message-State: AOAM530Z3O+k0ktG2+P1Yn8HUlBUslxuQgkNn4+SUMa6HPyY3+Uym8K7
 9LrUoevyJ5nWyC5YUtyaqndrhQ==
X-Google-Smtp-Source: ABdhPJwU/sWFut9KcFzxKRajVcANvQbP2VrI/3KfCjo7eTlhce/gfFIkHqe/QZEj+o7+lI0tX+LpwA==
X-Received: by 2002:a17:90a:f415:: with SMTP id
 ch21mr1090009pjb.235.1634662503055; 
 Tue, 19 Oct 2021 09:55:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y2sm3361580pjl.6.2021.10.19.09.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 09:55:02 -0700 (PDT)
Subject: Re: [PULL 0/7] Migration.next patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211019092907.5255-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59c7e680-deea-786e-77d3-3e17207a2595@linaro.org>
Date: Tue, 19 Oct 2021 09:55:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:29 AM, Juan Quintela wrote:
> The following changes since commit 362534a643b4a34bcb223996538ce9de5cdab946:
> 
>    Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-20211018-pull-request' into staging (2021-10-18 12:17:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration.next-pull-request
> 
> for you to fetch changes up to 911965ace9386e35ca022a65bb45a32fd421af3e:
> 
>    migration/rdma: advise prefetch write for ODP region (2021-10-19 08:39:04 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (3rd try)
> 
> Hi
> 
> This should fix all the freebsd problems.
> 
> Please apply,
> 
> ----------------------------------------------------------------
> 
> David Hildenbrand (1):
>    migration/ram: Don't passs RAMState to
>      migration_clear_memory_region_dirty_bitmap_*()
> 
> Li Zhijian (4):
>    migration: allow multifd for socket protocol only
>    migration: allow enabling mutilfd for specific protocol only
>    migration/rdma: Try to register On-Demand Paging memory region
>    migration/rdma: advise prefetch write for ODP region
> 
> Lukas Straub (2):
>    multifd: Implement yank for multifd send side
>    multifd: Unconditionally unregister yank function
> 
>   meson.build            |   6 +++
>   migration/multifd.h    |   4 ++
>   migration/migration.c  |  12 +++++
>   migration/multifd.c    |  35 ++++++++++---
>   migration/ram.c        |  13 ++---
>   migration/rdma.c       | 113 ++++++++++++++++++++++++++++++++++-------
>   migration/trace-events |   2 +
>   7 files changed, 151 insertions(+), 34 deletions(-)

Applied, thanks.

r~


