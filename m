Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7144938F6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:55:38 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8cq-0008SO-6d
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8Ip-00072d-Pi; Wed, 19 Jan 2022 05:34:55 -0500
Received: from [2a00:1450:4864:20::333] (port=51062
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8Io-0005Z8-8d; Wed, 19 Jan 2022 05:34:55 -0500
Received: by mail-wm1-x333.google.com with SMTP id w26so4531337wmi.0;
 Wed, 19 Jan 2022 02:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Ew1XQhD0THvWSE7cQkGgeYXKBatYSSv9ZizCKyOtpw=;
 b=P02QZfMXAr7x8zxEa2vI3LlGx0wc269+o0OVJHupQLqCwxRoh98Q0pp3ewAweE6xZu
 GwH6zml/zLTYgI7zsVh0LRz0Rgd/1XStZtjQZGEo2W48KCJOsDnBDMD7DAyOtTJ87hoU
 CHMhv4vnyH7e74HndHiPQN5mIkwf81Rfd3e/zRXzqwQxMpMGY4cDJJGbHwxSSfT97BNy
 lP9lMUpEQs0yiHEJH/9U6j+X5d8yWmCA3NunyMGqJ+oqG6vh49VMHgRlMuLI+rhHX1N+
 gep44Eqtt43J33nda6I4oiIOqr0pP6C5vnMjqhaoG75Y8E7C1pxoRKfheWMA37jRmiP6
 qVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Ew1XQhD0THvWSE7cQkGgeYXKBatYSSv9ZizCKyOtpw=;
 b=JOype9DCkJRohhPkUSeilWJ5LOZw/aMkc9VAlrf+qc5XRJTlL02IEpkaZT3j+pfpcz
 q66hHm82KV34WezZ9o8BoylrLp/ooW5Yon3rED26P2f1SRw996cCBqi5zPu3dq6V2+1o
 HEZV/G3fR4vmKa7tMU+am30OCuqlLAMg/CdhBNvg2ppV8zzJh6cA8iOAKiQihk6Q3MfH
 6Gqp8oBTGWqszRo5/7ai0tXWcL5X3JrqW3gN3yrtIjL9lsgb9yboNUeYNXqE/CD/6pvC
 eR/c346XFEcoeTfJPJuy3hCLCUUnYW8IR+h9yap4VJTH37YJmhxNo9VjVGx/0t7qh27I
 lK6w==
X-Gm-Message-State: AOAM531OWGqeRU7solcfJRuvghG1cH9oPsE38dI0mZbDAE22HfFabrzG
 YM29PNiZctUJI9lTLdH+c5M=
X-Google-Smtp-Source: ABdhPJw+wxWuUkd8/zzWNmvZKBas8nzXkDiWtDzYM7o0bkS5bAeE85Xo3Z/UMFxITqJnz1z0AXs/pA==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr12991009wry.531.1642588489838; 
 Wed, 19 Jan 2022 02:34:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l13sm7899479wrs.107.2022.01.19.02.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:34:49 -0800 (PST)
Message-ID: <fee596c8-825a-fd8f-e81a-3649b7371219@redhat.com>
Date: Wed, 19 Jan 2022 11:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 16/16] block_job_query: remove atomic read
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-17-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-17-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:02, Emanuele Giuseppe Esposito wrote:
> +++ b/blockjob.c
> @@ -335,13 +335,13 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>       info = g_new0(BlockJobInfo, 1);
>       info->type      = g_strdup(job_type_str(&job->job));
>       info->device    = g_strdup(job->job.id);
> -    info->busy      = qatomic_read(&job->job.busy);
> +    info->busy      = job->job.busy;
>       info->paused    = job->job.pause_count > 0;
>       info->offset    = progress_current;
>       info->len       = progress_total;
>       info->speed     = job->speed;
>       info->io_status = job->iostatus;
> -    info->ready     = job_is_ready(&job->job),
> +    info->ready     = job_is_ready_locked(&job->job),

This second part belongs earlier in the series, I think?

Paolo

