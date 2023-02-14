Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3769680E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxDX-0006l6-Mf; Tue, 14 Feb 2023 10:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRxDQ-0006kI-Ah; Tue, 14 Feb 2023 10:27:34 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRxDN-0004Av-DM; Tue, 14 Feb 2023 10:27:31 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 411645E788;
 Tue, 14 Feb 2023 18:27:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ERlF110RiKo1-LkszYjPD; Tue, 14 Feb 2023 18:27:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676388434; bh=hLK+1AkLIOAWFdNehgrZUGJygZIklr6idhhj2HwZ44Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=S6Akc1Xlc5ZT1jhV8iVvyeHtSDCCUaE46rb6bA100IPpRZJLDiYcig4UXotYxAd/B
 2TfLqnu+R87Y6NeCDeJhzI41nzWhXGpuTjlqPgFh4zckhVvov1Q26rnkUAeEYMcRMM
 baAGkAWu9bBLUqHhyY1gYodd4VJTEn6oy2DopHKA=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6a3cfdab-ff8e-d07a-dd86-ce17eb5dc623@yandex-team.ru>
Date: Tue, 14 Feb 2023 18:27:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] migration: Remove _only suffix for
 res_postcopy/precopy
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-4-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230208135719.17864-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08.02.23 16:57, Juan Quintela wrote:
> Once that res_compatible is removed, they don't make sense anymore.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   include/migration/register.h   | 18 ++++++++----------
>   migration/savevm.h             |  8 ++++----
>   hw/s390x/s390-stattrib.c       |  7 +++----
>   hw/vfio/migration.c            | 10 ++++------
>   migration/block-dirty-bitmap.c |  6 +++---
>   migration/block.c              |  7 +++----
>   migration/ram.c                | 18 ++++++++----------
>   migration/savevm.c             | 24 ++++++++++--------------
>   8 files changed, 43 insertions(+), 55 deletions(-)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index a958a92a0f..4a4a6d7174 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -47,22 +47,20 @@ typedef struct SaveVMHandlers {
>       /* This runs outside the iothread lock!  */
>       int (*save_setup)(QEMUFile *f, void *opaque);
>       /* Note for save_live_pending:
> -     * - res_precopy_only is for data which must be migrated in precopy phase
> +     * - res_precopy is for data which must be migrated in precopy phase
>        *     or in stopped state, in other words - before target vm start
> -     * - res_postcopy_only is for data which must be migrated in postcopy phase
> +     * - res_postcopy is for data which must be migrated in postcopy phase
>        *     or in stopped state, in other words - after source vm stop


That's now wrong. "postcopy" is everything except "precopy", as it includes "compat". Really, for RAM, it can be copied in precopy too, and it is copied in precopy until user run command migrate-start-postcopy. (In contrast: block-dirty-bitmap cannot migrate in precopy at all, it migrate only in stopped state or in postcopy).

So, finally:

"precopy"

   definition:
   - must be migrated in precopy or in stopped state
   - in other words: must be migrated before target start
   - in other words: can't be migrated in postcopy
   - in other words: can't be migrated after target start

"postcopy"

   definition:
   - can migrate in postcopy
   - in other words: can migrate after target start
   
   some properties:
   - probably can be migrated in precopy (like RAM), or, may be not (like block-dirty-bitmap)
   - of course, can be migrated in stopped state


To be absolutely clear, we may rename them to "not_postcopyable" and "postcopyable".


-- 
Best regards,
Vladimir


