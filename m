Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E4E49377F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:42:11 +0100 (CET)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Tm-0006hh-6K
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:42:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7Lo-000366-5N; Wed, 19 Jan 2022 04:33:57 -0500
Received: from [2a00:1450:4864:20::331] (port=53132
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7Lm-0007Dr-4k; Wed, 19 Jan 2022 04:33:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id v123so4102746wme.2;
 Wed, 19 Jan 2022 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rusnm8c2TRpEoLdsZwDCELhooHu3+tmqoyrBg5KC+Fs=;
 b=pI9NsBC8sarZBjRd1kjX2IGbk5kBrvoLlmt18Y3t5S6BqGt7rn1PjypYyIqFvQkQR5
 BtDk9OAqf/vfuFmQkHPEIB1HMSRlqU/Wh4/WqOgbBV+83fhVh2D4UqJ8sczt7qgEJHpt
 /B9hIaVEOaLTE3voWSyh2q4A+gEtdQ4fdcen2mMKOVV4dfIsMD2Z3yVDrUhDRyfI1Z/P
 BdiBnoTCO6RkzEzi54iG3fc88iWCXqXA5TvQxdV2Uleuu9hiDRRvi8RhOyG07Y+UODWF
 VMxpgROHQWwHcEXbIaogfnotmBDhingP2Q9vW2yTpi0dQewjcz0crEF9etRzMchT+va5
 vIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rusnm8c2TRpEoLdsZwDCELhooHu3+tmqoyrBg5KC+Fs=;
 b=0Q7EK3v+RAwcvAW0U2XgGr+GGrJLAhfEy984jzo4sS3s64h+q9GRGs9n/NC5iXL8Zf
 w8ALmE+0k404scx0bvgQBt0/TdZU+JarIkBdby1Vskaf1WbxX7zS0s0MC+8Qw0sXYV7g
 /mJ8hldTAewno2y8i1Qj0kzmIeG5+DLatti5aB0q9UEd9/HAElu6upP1HKCBcFlz8vDa
 teB302c/EJwxBgn8mdk6YiCbaTe/U8ypULa/julVWxzNWYn0epO4KVaScNzLpCy+fz+x
 baWaqYiNGg6yLm7ngs5ikwrzGLfl80tmrhak1HAazBW6AUv3DNXwe9TXZjQrZrTjfR1N
 sFNA==
X-Gm-Message-State: AOAM531PKjtLUqr6ZYK7/mh1oIRdGiiRZJO9Jp4KLHTEkYK6dHmITOQu
 zkf6O3XeqOgoZv9S96FjRhk=
X-Google-Smtp-Source: ABdhPJzs5z+iJ65OWfwjVDcyOKNzWSZmc/3J+GRFzlYNQL5OoiEpsUH8Ua1aIDKRwmWM+UyuiH5Y/w==
X-Received: by 2002:a5d:6486:: with SMTP id o6mr10976698wri.609.1642584831128; 
 Wed, 19 Jan 2022 01:33:51 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id d11sm22952415wri.67.2022.01.19.01.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:33:50 -0800 (PST)
Message-ID: <ceb9f0e7-8550-1641-574e-7390cbc6870d@redhat.com>
Date: Wed, 19 Jan 2022 10:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 08/12] reopen: add a transaction to drain_end nodes picked
 in bdrv_reopen_parse_file_or_backing
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-9-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-9-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> Depending on the options given to reopen_state,
> bdrv_reopen_parse_file_or_backing could pick another bs
> that could be from another graph, and thus not protected
> by subtree_drained_begin called by the callers of this
> function.
> 
> We can't simply drain-undrain here, because of transactions.
> To simplify the logic, transactions always assume that they
> are run under drain, so the various subtree_drain introduced
> so far always take care of covering tran_commit().
> 
> And since we cannot directly do it, as the transaction is
> created/committed higher above, we can just add a new
> transaction to the list that just executes subtree_drained_end
> to match the drained_begin done in this function.

A rewrite of the last two paragraphs:

---
Of the two callers of bdrv_set_file_or_backing_noperm, 
bdrv_reopen_parse_file_or_backing is unique in that it does not complete 
the reopen, it only prepares a transaction.  The actual commit (or 
abort) is done higher in the call chain.

Therefore, the call to bdrv_subtree_drained_end_unlocked must be delayed 
until after the transaction's fate has been determined and its actions 
have been performed.  Do this by recording a TransactionActionDrv to end 
the drained section for new_child_bs.
---

Likewise, the subject can be "block: keep children drained across a 
reopen transaction"; explain the change and not the technicalities of 
how you did it.

Paolo

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index fb5bc3077a..fcc44a49a0 100644
> --- a/block.c
> +++ b/block.c
> @@ -4522,6 +4522,10 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
>       return bdrv_reopen(bs, opts, true, errp);
>   }
>   
> +TransactionActionDrv bdrv_drv_subtree_end = {
> +    .clean = (void (*)(void *)) bdrv_subtree_drained_end_unlocked,
> +};
> +
>   /*
>    * Take a BDRVReopenState and check if the value of 'backing' in the
>    * reopen_state->options QDict is valid or not.
> @@ -4550,6 +4554,7 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
>       const char *child_name = is_backing ? "backing" : "file";
>       QObject *value;
>       const char *str;
> +    int ret = 0;
>   
>       assert(qemu_in_main_thread());
>   
> @@ -4573,6 +4578,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
>                          "cycle", str, child_name, bs->node_name);
>               return -EINVAL;
>           }
> +        /* This will be paired with a drained_end in tran_commit */
> +        bdrv_subtree_drained_begin_unlocked(new_child_bs);
>           break;
>       default:
>           /*
> @@ -4583,18 +4590,19 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
>       }
>   
>       if (old_child_bs == new_child_bs) {
> -        return 0;
> +        goto end;
>       }
>   
>       if (old_child_bs) {
>           if (bdrv_skip_implicit_filters(old_child_bs) == new_child_bs) {
> -            return 0;
> +            goto end;
>           }
>   
>           if (old_child_bs->implicit) {
>               error_setg(errp, "Cannot replace implicit %s child of %s",
>                          child_name, bs->node_name);
> -            return -EPERM;
> +            ret = -EPERM;
> +            goto end;
>           }
>       }
>   
> @@ -4605,7 +4613,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
>            */
>           error_setg(errp, "'%s' is a %s filter node that does not support a "
>                      "%s child", bs->node_name, bs->drv->format_name, child_name);
> -        return -EINVAL;
> +        ret = -EINVAL;
> +        goto end;
>       }
>   
>       if (is_backing) {
> @@ -4614,8 +4623,14 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
>           reopen_state->old_file_bs = old_child_bs;
>       }
>   
> -    return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
> +    ret =  bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
>                                              tran, errp);
> +
> +end:
> +    if (new_child_bs) {
> +        tran_add(tran, &bdrv_drv_subtree_end, new_child_bs);
> +    }
> +    return ret;
>   }
>   
>   /*


