Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6464982A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:44:59 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0aX-0005cv-Sp
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0X3-0002h1-PH; Mon, 24 Jan 2022 09:41:21 -0500
Received: from [2a00:1450:4864:20::52c] (port=46689
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0X0-0000VU-FO; Mon, 24 Jan 2022 09:41:21 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m11so56881919edi.13;
 Mon, 24 Jan 2022 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HhprdJOcYl+29ddxswiDAnJ5EFqc4NZ6ZZzxgeGYw8w=;
 b=ozcIzjT8tKxvjOWscavyhALKfljE35wxMkZOWb1zSel4uoYmFTBOOf8dz0f4hoH30s
 /Aq6sPiNAPFGcGzBlpthShng4PK7lPr9+T60aKai2OfJZF4dPg57r/6GgYsyfBnwdcrv
 dwrCeyOfHHzsOsJs7/gyPxzmUPeZ2p0O3c3iEb4vvgIFAHzXUD43gDzqxnu2XpZUldrP
 N73mIiJpRfRGNivtk7GHcDE5hzmjnyUOar06TQq52kGUbvSfdsI1mJWtyHFVI9wtgyhs
 TrgYgnaJ+e73Lg6bGWs7VnK7t/udu4cuScPlKaN+ARGi1gfwFofJVBToSaUdODNE4k3d
 z6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HhprdJOcYl+29ddxswiDAnJ5EFqc4NZ6ZZzxgeGYw8w=;
 b=5x11mGKnKBRzMfZhq2uASUn8eQCu+9RR4+WUPeA2fjG2jw3sBGpDy4h8UzOVQzo222
 dnwky21HwbGMExjA0SvXNZ/HD1rJAoDYX/7E4X8XGCeiGNYaEZC10pluVMdf8H0rvsRa
 242Py/EFTMU5uEVyIOqMZyc22L7laT7PnouTow2AMRwnhPCXc/4UtxincEBVPypXsXmp
 FzHAVKUhixmsxHT1h2fYdrJ1VmT5QbJwwv84CFrLFVVm99I4CwbFq+mqhkY1qPhkXYev
 bakejKELhkhKxRix6XIJZY8kA54MBLCK/dRX5wGHt+3bIELE8pT/xAiRKV1OzgmVjBuO
 IXjw==
X-Gm-Message-State: AOAM53290Y8VCFr5SQqwtr6zP2iA2fiXSlb3ARD5UksYbUuOACQRvkxT
 4SEtG7PjsdBTGm8nDTDsZNI=
X-Google-Smtp-Source: ABdhPJy/R6TbJERZFOXJmPD5jqOKMvr8hripDffFDEnxFoC6OBkycTjbXEqSnl2iWVSg5NJtWXf7lw==
X-Received: by 2002:a05:6402:5178:: with SMTP id
 d24mr11357950ede.272.1643035276241; 
 Mon, 24 Jan 2022 06:41:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id h20sm6346414eds.9.2022.01.24.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:41:15 -0800 (PST)
Message-ID: <8bba6ae2-07e3-4e65-56dc-1621a6262963@redhat.com>
Date: Mon, 24 Jan 2022 15:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 32/33] crypto: delegate permission functions to
 JobDriver .pre_run
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-33-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220121170544.2049944-33-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 18:05, Emanuele Giuseppe Esposito wrote:
> diff --git a/job.c b/job.c
> index 39bf511949..cf0dc9325a 100644
> --- a/job.c
> +++ b/job.c
> @@ -967,11 +967,24 @@ static void coroutine_fn job_co_entry(void *opaque)
>       aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
>   }
>   
> +static int job_pre_run(Job *job)
> +{
> +    assert(qemu_in_main_thread());
> +    if (job->driver->pre_run) {
> +        return job->driver->pre_run(job, &job->err);
> +    }
> +
> +    return 0;
> +}
> +
>   void job_start(Job *job)
>   {
>       assert(job && !job_started(job) && job->paused &&
>              job->driver && job->driver->run);
>       job->co = qemu_coroutine_create(job_co_entry, job);
> +    if (job_pre_run(job)) {
> +        return;
> +    }
>       job->pause_count--;
>       job->busy = true;
>       job->paused = false;
> -- 2.31.1

This should have been in patch 31.  Might not need a respin, unless 
someone wants to have these three patches reorganized(*),  still worth 
pointing out.

Paolo

(*) for example I would have done:
- first job->pre_run()
- then blockdev_amend_pre_run/blockdev_amend_clean and 
block_crypto_amend_pre_run/clean together

