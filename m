Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF067445198
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:34:40 +0100 (CET)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mia4s-0001w9-Iz
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mia3G-0001Cp-NK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:32:58 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mia3E-0001Ex-Jg
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:32:58 -0400
Received: by mail-qk1-x736.google.com with SMTP id i9so5169685qki.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulYIhBfdhvA/pmsvldP8bQWgCiSkGKmAbTtwCiZUw4s=;
 b=F2/+3x+y6b5Gi8WD2v3c7ChZRxYpX5k6amdH7Xul36BQlesB2NLgtGEtmMGFKDLXp+
 l6tYJmY7Tl6FcMktG4k4+lF/DA7DXN7vcSC7aH7yEB4mFlVjK0UBIZjz8kBYGK2l3o4A
 4+Uaakh1DI5lQw0+TtqTIy7Z99G/t/ObrL7FRdCn5lqy3wtkLruFW6IpyOjUf++/rK1n
 83hzwQ2kOz/llkPK79AtCxQkHxQK6OEn+VrqT3dW6WPU+c0DdkRmdSMRH6hE6ZEQxcFv
 J2ku/VhJEXE6ClU8TfGBXLaYy3LnYXe5U//uKq7aleaXerccSkTr6ak5BoJsi1fHxPSA
 8gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulYIhBfdhvA/pmsvldP8bQWgCiSkGKmAbTtwCiZUw4s=;
 b=3vuDu3dHK/dPhoBAXL+tKvnr/plencgb/G7aMGo/BEHeGW40m7ZXCxoygRBsQIGd1M
 EvCxnUJHL9BcZ6OwvCiwBIRvwYrxOxmNGpWZLam1xPTiY6G2Xv36S2tRJzzpxnY/1dYI
 HlRFlZEzUkUy0oNW4tjvAOel6/yeiUeOHxUtVH98hit3ExDMCMSLVGdupM4bkhjdXckz
 XW1kKy4DBmDO6Y3Jp+RCw1ocv1V+pcruO7fyFxIhr8+AM8JymXLVlb35oks93YcZSQ3P
 uPonfTFc60yYsupvavN3RZ3um40BzSiFujln6rJ1vSI+tLkgXgInjbUtk0a1NoahEfwu
 8drQ==
X-Gm-Message-State: AOAM533lwF4c9qbSZEOL/AWqimGGfsEBd0caBXciAb7QfK9xxTP5Y8hY
 DhhWL3JrcySj+pUJg6ESbvL6Bg==
X-Google-Smtp-Source: ABdhPJwqly9VnbEM0R/mpaaiex5v4Vrywzpb+ltJ8n02NEH8CSQ7gImGWyKS8cBB0w7YUUaUJkNFHA==
X-Received: by 2002:a05:620a:2416:: with SMTP id
 d22mr19882450qkn.458.1636021975305; 
 Thu, 04 Nov 2021 03:32:55 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm3292710qko.13.2021.11.04.03.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 03:32:54 -0700 (PDT)
Subject: Re: [PULL 00/11] Migration 20211102 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211103084605.20027-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4217c250-e1ec-9561-ce27-2ab7d31371e8@linaro.org>
Date: Thu, 4 Nov 2021 06:32:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 4:45 AM, Juan Quintela wrote:
> The following changes since commit 741bdeb1d5a4024a2c54c6abb2de493a27b61953:
> 
>    Merge remote-tracking branch 'remotes/kwolf/tags/for-upstream' into staging (2021-11-03 00:32:56 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration-20211102-pull-request
> 
> for you to fetch changes up to 64153ca613d0a50d1301eae4bd895aade001fcca:
> 
>    Optimized the function of fill_connection_key. (2021-11-03 09:39:48 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> This are the pending migration patches on the list:
> - Provide an error message for migration_cancel by Laurent
> - Don't dump colo cache when a guest core is requested by Lukas
> - Initialise Compression_conters for new migration by Yuxiating
>    On top of that I added another missing initialization
> - Colo optimizations and crash improvements by Rao.
> 
> Please, apply.
> 
> ----------------------------------------------------------------
> 
> Juan Quintela (1):
>    migration: Zero migration compression counters
> 
> Laurent Vivier (1):
>    migration: provide an error message to migration_cancel()
> 
> Lukas Straub (1):
>    colo: Don't dump colo cache if dump-guest-core=off
> 
> Rao, Lei (7):
>    Some minor optimizations for COLO
>    Fixed qemu crash when guest power off in COLO mode
>    Fixed SVM hang when do failover before PVM crash
>    colo: fixed 'Segmentation fault' when the simplex mode PVM poweroff
>    Removed the qemu_fclose() in colo_process_incoming_thread
>    Changed the last-mode to none of first start COLO
>    Optimized the function of fill_connection_key.
> 
> yuxiating (1):
>    migration: initialise compression_counters for a new migration
> 
>   migration/migration.h |  2 +-
>   net/colo.h            |  6 +++---
>   migration/colo.c      | 16 +++++-----------
>   migration/migration.c | 18 +++++++++++++-----
>   migration/ram.c       |  9 +++++++--
>   migration/savevm.c    |  1 +
>   net/colo-compare.c    |  4 ++--
>   net/colo.c            | 31 ++++++++++++-------------------
>   net/filter-rewriter.c | 10 +---------
>   9 files changed, 45 insertions(+), 52 deletions(-)

Applied, thanks.

r~

