Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAC49CD43
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:04:33 +0100 (CET)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjqZ-0001ct-U9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:04:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCjhO-0007wj-AV
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCjhM-00052p-Jh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643208899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFZM50LFk2sGenQiAMDXGm7+a/+PcUFyoz/vIFoUlIM=;
 b=UIX+IwlRPxFysfvwALuYpo0P8145NqiuN6UepFC+m49mFfmES+79oqVRywSGExF5rf0ckE
 ZLaAmSKiD/Z9/j4Z3nKchtfP98Fn2mcweO0nEeVjr2nzCIgyWtuluF1AvwBXNmKjkN5Ron
 JJq02KQXh3oSSocQAr0yKf65HafYNw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-XjiCu0-VN8CFB7N0lLqZ_Q-1; Wed, 26 Jan 2022 09:54:56 -0500
X-MC-Unique: XjiCu0-VN8CFB7N0lLqZ_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso3402969wmc.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 06:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yFZM50LFk2sGenQiAMDXGm7+a/+PcUFyoz/vIFoUlIM=;
 b=gi1t5X+OiVktkJVkVvJwpz37ap0objoVOrnqnVlLeZsxjsl/NQ3zeaqspxR3X2GGRK
 e+fxkA4cb9hM7+CxrRlRYpFuyHXbWGLkSUpmZjTnq6//xZaUfr5wCixEBbb4oYuuGQiC
 Fgl1JbwmrMXyslw0kSTIQCcChmB+ilCjJTrtIWOrBxricTMf06X0V34Sl6lxm25LLXQ2
 mK2pHH9p6BRmw7CsoDqxWyxMzmwGchaENPt1lc8zncDlezDSp3fvxXDfW9GmaO2aRgUd
 PWtK2o0WaBD4X22qPxsJTtklcoHsIWrFPRu7CSrWosIG7wLJ+vPSv7BlyMh/LtPjb/fH
 IhlQ==
X-Gm-Message-State: AOAM530s7qA4ii00T7xAahpFOqQNkTguKfN+tp0JiO0xzqLsUinqoFAZ
 eMYgJEyc5cRfADVTLVk9xWNpKTcCwGS18dXvGvS3O7vguxHBIH/noia9wfuvgBL9U+UHr6RgNPk
 Bv//yJSy8Lqj0LwY=
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr7563685wmb.9.1643208894751; 
 Wed, 26 Jan 2022 06:54:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyydKVJpfpF+d10CemUvWL6YJtMH8AMLE9S0TGBcfuBCBWv8zYWtjKo8L+ywmfcsdWEkClBaQ==
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr7563655wmb.9.1643208894459; 
 Wed, 26 Jan 2022 06:54:54 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 6sm20529821wry.69.2022.01.26.06.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:54:54 -0800 (PST)
Message-ID: <3271c5a7-937b-cf3c-be5a-544c6e32e501@redhat.com>
Date: Wed, 26 Jan 2022 15:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 30/33] include/block/block_int-common.h: introduce
 bdrv_amend_pre_run and bdrv_amend_clean
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-31-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-31-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> These two callbacks will be invoked by job callbacks to execute
> driver-specific code while still being in BQL.
> In this example, we want the amend JobDriver to execute the
> permission check (bdrv_child_refresh_perms) currently only
> done in block/crypto.c block_crypto_amend_options_generic_luks()
> to all its bdrv.
> This is achieved by introducing callbacks in the JobDriver, but
> we also need to make sure that crypto->updating_keys is true
> before refreshing the permissions the first time, so that
> WRITE perm is temporarly given to qcrypto_block_amend_options(),
> and set it to false when permissions are restored.
>
> Therefore bdrv_amend_pre_run() and bdrv_amend_clean() will take care of
> just temporarly setting the crypto-specific updating_keys flag.
>
> Note that at this stage, they are not yet invoked.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/crypto.c                   | 16 ++++++++++++++++
>   include/block/block_int-common.h | 13 +++++++++++++
>   2 files changed, 29 insertions(+)
>
> diff --git a/block/crypto.c b/block/crypto.c
> index c8ba4681e2..f5e0c7b7c0 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -777,6 +777,20 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
>       return spec_info;
>   }
>   
> +static void
> +block_crypto_amend_pre_run(BlockDriverState *bs)
> +{
> +    BlockCrypto *crypto = bs->opaque;
> +    crypto->updating_keys = true;
> +}

So I see you decided to leave actually updating the permissions to the 
caller, i.e. blockdev_amend_pre_run().  Why?

I’m asking because:

(1) If the .bdrv_amend_pre_run() isn’t implemented, I don’t think 
refreshing the permissions in blockdev_amend_pre_run() is necessary.  So 
if it is implemented, the implementation might as well do it itself.

(2) The way you implemented it, it’s actually kind of hard to see why 
this is even necessary.  Both of these functions 
(block_crypto_amend_{pre_run,cleanup}()) don’t require the BQL, so the 
explanation for .bdrv_amend_pre_run() (“useful to perform 
driver-specific initialization code under BQL”) doesn’t really apply.  
If you want to explain (and we should) why this is necessary, then the 
.bdrv_amend_pre_run() documentation needs to state that we will refresh 
the permissions after this function has run and before .bdrv_co_amend() 
will run, and so it’s also useful to put code here that will change the 
permissions on permission update, but that just really gets complicated 
to explain.  Naively, I find it simpler to just say “Put BQL code here, 
this will run before .bdrv_co_amend()” and have every implementation 
that needs it refresh the permissions itself.

(3) In patch 32, you add 
block_crypto_amend_options_{prepare,cleanup}().  If the functions added 
here (block_crypto_amend_{pre_run,cleanup}()) would refresh the 
permissions by themselves, they’d be exactly the same functions, so you 
could reuse the ones from here in patch 32.

> +
> +static void
> +block_crypto_amend_cleanup(BlockDriverState *bs)
> +{
> +    BlockCrypto *crypto = bs->opaque;
> +    crypto->updating_keys = false;
> +}
> +
>   static int
>   block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>                                           QCryptoBlockAmendOptions *amend_options,
> @@ -931,6 +945,8 @@ static BlockDriver bdrv_crypto_luks = {
>       .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
>       .bdrv_amend_options = block_crypto_amend_options_luks,
>       .bdrv_co_amend      = block_crypto_co_amend_luks,
> +    .bdrv_amend_pre_run       = block_crypto_amend_pre_run,
> +    .bdrv_amend_clean         = block_crypto_amend_cleanup,
>   
>       .is_format          = true,
>   
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index cc8c8835ba..9d28396978 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -189,6 +189,19 @@ struct BlockDriver {
>        * the GS API.
>        */
>   
> +    /*
> +     * Called inside job->pre_run() callback, it is useful
> +     * to perform driver-specific initialization code under
> +     * BQL, like setting up specific permission flags.

I wouldn’t necessarily state that this function is called by 
`job->pre_run()`, but rather paint the picture of how it’s used together 
with `.bdrv_co_amend()`, e.g. something like:

“This function is invoked under the BQL before .bdrv_co_amend() (which 
in contrast does not necessarily run under the BQL) to allow 
driver-specific initialization code that requires the BQL, like setting 
up specific permission flags.”

(Though this comment should be much more specific if we keep updating 
the permissions in the caller, because then the comment also needs to 
explain that we do that.)

> +     */
> +    void (*bdrv_amend_pre_run)(BlockDriverState *bs);
> +    /*
> +     * Called inside job->clean() callback, it undoes
> +     * the driver-specific initialization code done in amend_pre_run.
> +     * Also this function is under BQL.

Here too I’d omit the job reference and just say that (e.g.)

“This function is invoked under the BQL after .bdrv_co_amend() to allow 
cleaning up what was done in .bdrv_amend_pre_run().”

Hanna

> +     */
> +    void (*bdrv_amend_clean)(BlockDriverState *bs);
> +
>       /*
>        * Return true if @to_replace can be replaced by a BDS with the
>        * same data as @bs without it affecting @bs's behavior (that is,


