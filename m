Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C7478B64
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 13:33:00 +0100 (CET)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myCPu-0001uf-Op
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 07:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myCN6-0008Df-Ul
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myCMy-0008Og-TR
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639744191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWZRMcqaxbCRU+StNpnGJYU1CxfjyZeL9UX5HAinwx4=;
 b=STm0d/K/IEqE+8Zt25a/+hHvpmRAOCFU6+1MDchCFQrkXMhIi7IkeWN9n24W/yL+uwv7d9
 g7CfWTBr7UWJJ7IbwWN/eLTkJNxg0hbq/YbgVE2DckEGpW0i7V8OgZBe+qtfW01chuL+XJ
 E6c3MGbEDDFSdXARqXvW233O5n1R2lI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-yS66k05xNme-xFD8cltF7g-1; Fri, 17 Dec 2021 07:29:50 -0500
X-MC-Unique: yS66k05xNme-xFD8cltF7g-1
Received: by mail-wr1-f71.google.com with SMTP id
 k11-20020adfc70b000000b001a2333d9406so574718wrg.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 04:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rWZRMcqaxbCRU+StNpnGJYU1CxfjyZeL9UX5HAinwx4=;
 b=2PA/mPmeYTfUQPzAN9E88Nc3fSTlN7d6WDAe+5r/ooXsvckBgZPL78ZcnH51HW2315
 2glac7DfCHaG29byYvuBa9r7/4Y4hFuSfZvZkXb6xVf3Dpzkr9XzSGEJh4jcnl0BVFdd
 yjh/jeG4eGdkPsQ7ZaaVUbvoAzp8mBIF7IxYxd2+eLY7GNPz9vzZWGbAezXVQf7+40an
 nS1XL4wdMmVeNthBrkxy+ttg8889CiJxD9csoYNdj8tyS7Y705X7ulMzc3/88xgkAZcX
 uoqMfo/OuXiaZyoMXlPk4eWYNcngBdUFh/4DKqMbz9OF9XJuHeK040lw93DUyiwQhQ1M
 B5Ow==
X-Gm-Message-State: AOAM531yl/JHhh98T/1yjw0FWGOaoqaYk9HhyEf2rRNjrT3zwJNMCplD
 a6KYHrC9r4z+jOvS3h6zTV/6dhPprorjEPK8i1FzjO/V0vFXOC1+dMEGYa37FXvPN4GYa0qsHUM
 ZGZuoHP31V6ZQVj0=
X-Received: by 2002:a05:600c:3b25:: with SMTP id
 m37mr1255967wms.130.1639744188567; 
 Fri, 17 Dec 2021 04:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUjtujofE/AkfVTYIZ4DEurZSB3rCYx+ZLPZMDC5aeMQjc/FqhDN2oKxPRq3MQpwTvnxioDA==
X-Received: by 2002:a05:600c:3b25:: with SMTP id
 m37mr1255933wms.130.1639744188221; 
 Fri, 17 Dec 2021 04:29:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k33sm4034459wms.21.2021.12.17.04.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 04:29:47 -0800 (PST)
Message-ID: <ab01f9e1-447f-6c84-b409-2737548679d4@redhat.com>
Date: Fri, 17 Dec 2021 13:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 30/31] crypto: delegate permission functions to
 JobDriver .pre_run
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-31-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-31-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
> block_crypto_amend_options_generic_luks uses the block layer
> permission API, therefore it should be called with the BQL held.
>
> However, the same function is being called ib two BlockDriver

s/ ib / by /

> callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).
>
> The latter is I/O because it is invoked by block/amend.c's
> blockdev_amend_run(), a .run callback of the amend JobDriver
>
> Therefore we want to 1) change block_crypto_amend_options_generic_luks
> to use the permission API only when the BQL is held, and
> 2) use the .pre_run JobDriver callback to check for
> permissions before switching to the job aiocontext. This has also
> the benefit of applying the same permission operation to all
> amend implementations, not only luks.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/amend.c  | 20 ++++++++++++++++++++
>   block/crypto.c | 18 ++++++++++++------
>   2 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/block/amend.c b/block/amend.c
> index 392df9ef83..fba6add51a 100644
> --- a/block/amend.c
> +++ b/block/amend.c
> @@ -53,10 +53,30 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
>       return ret;
>   }
>   
> +static int blockdev_amend_refresh_perms(Job *job, Error **errp)
> +{
> +    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
> +
> +    return bdrv_child_refresh_perms(s->bs, s->bs->file, errp);
> +}

I miss some documentation for this function, why we do it and how it 
works together with the bdrv_co_amend implementation.

I was trying to come up with an example text, but then I wondered – how 
does it actually work?  bdrv_child_refresh_perms() eventually ends up in 
block_crypto_child_perms().  However, that will only return exceptional 
permissions if crypto->updating_keys is true. But that’s set only in 
block_crypto_amend_options_generic_luks() – i.e. when the job runs.  
That’s exactly why that function calls bdrv_child_refresh_perms() only 
after it has modified crypto->updating_keys.

Reproducer (amend on a LUKS image with read-only=true, so it doesn’t 
have the WRITE permission continuously, but needs to take it as an 
exception in block_crypto_child_perms()):

$ qemu-img create \
     -f luks \
     --object secret,id=sec0,data=123456 \
     -o key-secret=sec0 \
     test.luks \
     64M
Formatting 'test.luks', fmt=luks size=67108864 key-secret=sec0

$ ./qemu-system-x86_64 \
     -object secret,id=sec0,data=123456 \
     -object iothread,id=iothr0 \
     -blockdev file,node-name=node0,filename=test.luks \
     -blockdev 
luks,node-name=node1,key-secret=sec0,file=node0,read-only=true \
     -device virtio-blk,drive=node1,iothread=iothr0 -qmp stdio \
     <<EOF
{"execute": "qmp_capabilities"}
{
     "execute": "x-blockdev-amend",
     "arguments": {
         "job-id": "amend0",
         "node-name": "node1",
         "options": {
             "driver": "luks",
             "state": "active",
             "new-secret": "sec0"
         }
     }
}
EOF

{"QMP": {"version": {"qemu": {"micro": 93, "minor": 1, "major": 6}, 
"package": "v6.2.0-rc3-50-gdb635fc4e7"}, "capabilities": ["oob"]}}
{"return": {}}
{"timestamp": {"seconds": 1639742600, "microseconds": 574641}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "created", "id": "amend0"}}
{"timestamp": {"seconds": 1639742600, "microseconds": 574919}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "running", "id": "amend0"}}
{"return": {}}
qemu-system-x86_64: ../block/io.c:2041: bdrv_co_write_req_prepare: 
Assertion `child->perm & BLK_PERM_WRITE' failed.
[1]    55880 IOT instruction (core dumped)  ./qemu-system-x86_64 -object 
secret,id=sec0,data=123456 -object  -blockdev


I believe this means we need some new block driver function to prepare 
for an amendment operation.  If so, another question comes up, which is 
whether this preparatory function should then also call 
bdrv_child_refresh_perms(), and then whether we should have a clean-up 
function for symmetry.

> +
> +static int blockdev_amend_pre_run(Job *job, Error **errp)
> +{
> +    return blockdev_amend_refresh_perms(job, errp);
> +}
> +
> +static void blockdev_amend_clean(Job *job)
> +{
> +    Error *errp;
> +    blockdev_amend_refresh_perms(job, &errp);

Do we really want to ignore this error?  If so, we shouldn’t pass a 
pointer to an unused local variable, but NULL.

If we don’t want to ignore it, we have the option of doing what you do 
here and then at least reporting a potential error with 
error_report_err(), and then freeing it, and we also must initialize 
errp to NULL in this case.

If we expect no error to happen (e.g. because we require the amend 
implementation to only release/share permissions and not acquire/unshare 
them), then I’d expect passing &error_abort here.

> +}
> +
>   static const JobDriver blockdev_amend_job_driver = {
>       .instance_size = sizeof(BlockdevAmendJob),
>       .job_type      = JOB_TYPE_AMEND,
>       .run           = blockdev_amend_run,
> +    .pre_run       = blockdev_amend_pre_run,
> +    .clean         = blockdev_amend_clean,
>   };
>   
>   void qmp_x_blockdev_amend(const char *job_id,
> diff --git a/block/crypto.c b/block/crypto.c
> index c8ba4681e2..82f154516c 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -780,6 +780,7 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
>   static int
>   block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>                                           QCryptoBlockAmendOptions *amend_options,
> +                                        bool under_bql,

This name makes sense in the context of this series, but not so much 
outside of it.

I’d rename it to e.g. “in_amend_job” (and invert its value), and then 
explain that we don’t need to refresh the child permissions when running 
in an amend job, because that job has already taken care of that.

OTOH, given that I believe we need some separate preparatory function 
anyway, perhaps we should just pull out the bdrv_child_refresh_perms() 
from this function altogether, so that we have:

block_crypto_amend_options_luks():

/* sets updating_keys to true, and invokes bdrv_child_refresh_perms() */
block_crypto_amend_options_prepare();
block_crypto_amend_options_generic_luks();
/* sets updating_keys to false, and invokes bdrv_child_refresh_perms() */
block_crypto_amend_options_clean();


block_crypto_co_amend_luks():

/* No need to prepare or clean up, that is taken care of by the amend job */
block_crypto_amend_options_generic_luks();


(If we decide not to put bdrv_child_refresh_perms() into 
prepare()/clean(), then it would need to be called by 
block_crypto_amend_options_luks(); and if we decide not to have a 
block_crypto_amend_options_clean(), then we’d need to inline it fully.)

Hanna

>                                           bool force,
>                                           Error **errp)
>   {
> @@ -791,9 +792,12 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>   
>       /* apply for exclusive read/write permissions to the underlying file*/
>       crypto->updating_keys = true;
> -    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
> -    if (ret) {
> -        goto cleanup;
> +
> +    if (under_bql) {
> +        ret = bdrv_child_refresh_perms(bs, bs->file, errp);
> +        if (ret) {
> +            goto cleanup;
> +        }
>       }
>   
>       ret = qcrypto_block_amend_options(crypto->block,
> @@ -806,7 +810,9 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>   cleanup:
>       /* release exclusive read/write permissions to the underlying file*/
>       crypto->updating_keys = false;
> -    bdrv_child_refresh_perms(bs, bs->file, errp);
> +    if (under_bql) {
> +        bdrv_child_refresh_perms(bs, bs->file, errp);
> +    }
>       return ret;
>   }
>   
> @@ -834,7 +840,7 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
>           goto cleanup;
>       }
>       ret = block_crypto_amend_options_generic_luks(bs, amend_options,
> -                                                  force, errp);
> +                                                  true, force, errp);
>   cleanup:
>       qapi_free_QCryptoBlockAmendOptions(amend_options);
>       return ret;
> @@ -853,7 +859,7 @@ coroutine_fn block_crypto_co_amend_luks(BlockDriverState *bs,
>           .u.luks = *qapi_BlockdevAmendOptionsLUKS_base(&opts->u.luks),
>       };
>       return block_crypto_amend_options_generic_luks(bs, &amend_opts,
> -                                                   force, errp);
> +                                                   false, force, errp);
>   }
>   
>   static void


