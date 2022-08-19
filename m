Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A97599EED
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:19:56 +0200 (CEST)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4iw-0008WT-Sj
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4fO-0006XS-8G; Fri, 19 Aug 2022 12:16:14 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:48822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4fJ-0003d3-Ow; Fri, 19 Aug 2022 12:16:12 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 687A62E1368;
 Fri, 19 Aug 2022 19:15:59 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 eqI76oVfHa-FwOqeTEC; Fri, 19 Aug 2022 19:15:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660925758; bh=OOBlCGzHCCu1/AyWK+nqX9Ew8ENBVxuo34AOag0nJ4o=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=kpn9GmUZsRzDKut055YYPeyp2gMs64Q55+BQuSC2IAFV/SpWHGJP2thVB2HE+MdlB
 3xRQHP4d8K0dz8pKyBMNQBsuYe5r6s34zpfXjHvp5UQlHMFaJ6mfGyEyxqJ4uUHGqA
 A3aDOsL+hEYdet8fi3IHUnK5masB/3hGpS5XjJJw=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c2c9f218-ac6f-c055-0774-06f5af624fce@yandex-team.ru>
Date: Fri, 19 Aug 2022 19:15:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] block: pass OnOffAuto instead of bool to
 block_acct_setup()
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220817092821.119548-1-den@openvz.org>
 <20220817092821.119548-2-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220817092821.119548-2-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/17/22 12:28, Denis V. Lunev wrote:
> We would have one more place for block_acct_setup() calling, which should
> not corrupt original value.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   block/accounting.c         | 24 ++++++++++++++++++++----
>   blockdev.c                 | 17 ++++++++++++++---
>   include/block/accounting.h |  6 +++---
>   3 files changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/block/accounting.c b/block/accounting.c
> index 2030851d79..73ac639656 100644
> --- a/block/accounting.c
> +++ b/block/accounting.c
> @@ -40,11 +40,27 @@ void block_acct_init(BlockAcctStats *stats)
>       }
>   }
>   
> -void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
> -                      bool account_failed)
> +static bool bool_from_onoffauto(OnOffAuto val, bool def)
>   {
> -    stats->account_invalid = account_invalid;
> -    stats->account_failed = account_failed;
> +    switch (val) {
> +    case ON_OFF_AUTO_AUTO:
> +        return def;
> +    case ON_OFF_AUTO_ON:
> +        return true;
> +    case ON_OFF_AUTO_OFF:
> +        return false;
> +    default:
> +        abort();
> +    }
> +}
> +
> +void block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
> +                      enum OnOffAuto account_failed)
> +{
> +    stats->account_invalid = bool_from_onoffauto(account_invalid,
> +                                                 stats->account_invalid);
> +    stats->account_failed = bool_from_onoffauto(account_failed,
> +                                                stats->account_failed);
>   }
>   
>   void block_acct_cleanup(BlockAcctStats *stats)
> diff --git a/blockdev.c b/blockdev.c
> index 9230888e34..392d9476e6 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -455,6 +455,17 @@ static void extract_common_blockdev_options(QemuOpts *opts, int *bdrv_flags,
>       }
>   }
>   
> +static OnOffAuto account_get_opt(QemuOpts *opts, const char *name)
> +{
> +    if (!qemu_opt_find(opts, name)) {
> +        return ON_OFF_AUTO_AUTO;
> +    }
> +    if (qemu_opt_get_bool(opts, name, true)) {
> +        return ON_OFF_AUTO_ON;
> +    }
> +    return ON_OFF_AUTO_OFF;
> +}
> +
>   /* Takes the ownership of bs_opts */
>   static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>                                      Error **errp)
> @@ -462,7 +473,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>       const char *buf;
>       int bdrv_flags = 0;
>       int on_read_error, on_write_error;
> -    bool account_invalid, account_failed;
> +    OnOffAuto account_invalid, account_failed;
>       bool writethrough, read_only;
>       BlockBackend *blk;
>       BlockDriverState *bs;
> @@ -496,8 +507,8 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>       /* extract parameters */
>       snapshot = qemu_opt_get_bool(opts, "snapshot", 0);
>   
> -    account_invalid = qemu_opt_get_bool(opts, "stats-account-invalid", true);
> -    account_failed = qemu_opt_get_bool(opts, "stats-account-failed", true);
> +    account_invalid = account_get_opt(opts, "stats-account-invalid");
> +    account_failed = account_get_opt(opts, "stats-account-failed");

Hm. Actually here you change default behavior from true to false.

In the next patch you fix it back, but better is to avoid the extra change somehow.

>   
>       writethrough = !qemu_opt_get_bool(opts, BDRV_OPT_CACHE_WB, true);
>   
> diff --git a/include/block/accounting.h b/include/block/accounting.h
> index 878b4c3581..b9caad60d5 100644
> --- a/include/block/accounting.h
> +++ b/include/block/accounting.h
> @@ -27,7 +27,7 @@
>   
>   #include "qemu/timed-average.h"
>   #include "qemu/thread.h"
> -#include "qapi/qapi-builtin-types.h"
> +#include "qapi/qapi-types-common.h"
>   
>   typedef struct BlockAcctTimedStats BlockAcctTimedStats;
>   typedef struct BlockAcctStats BlockAcctStats;
> @@ -100,8 +100,8 @@ typedef struct BlockAcctCookie {
>   } BlockAcctCookie;
>   
>   void block_acct_init(BlockAcctStats *stats);
> -void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
> -                     bool account_failed);
> +void block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
> +                      enum OnOffAuto account_failed);
>   void block_acct_cleanup(BlockAcctStats *stats);
>   void block_acct_add_interval(BlockAcctStats *stats, unsigned interval_length);
>   BlockAcctTimedStats *block_acct_interval_next(BlockAcctStats *stats,


-- 
Best regards,
Vladimir

