Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98B5640B1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:18:11 +0200 (CEST)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dwn-0004aE-M4
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dsO-00007a-D9; Sat, 02 Jul 2022 10:13:36 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dsI-0004nO-A8; Sat, 02 Jul 2022 10:13:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id c65so6143474edf.4;
 Sat, 02 Jul 2022 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7XLha7YMl/2xMpFZof+Voqa5XXrpvlQdyTYH2c6mNDo=;
 b=FJJ4rPAH7kP6Qha1aowKPFD+ZkL9qXsaAYxlfhGjOa8mbmejmv8azjkUwso1S9IiOg
 JIxDkPqvnD5Kpq+igVLP4IU3s9YPTtm61HGWCyNMaTJ9kQIrKsitkiycOd+6AqgLS6je
 b1ROo7rST1ivEwxA4ydeuqAdsak8YRD+u+aZv0qoTJJUnEkH0jeIiJ8v7ehV7s7+AzGK
 2VRLAAAyddXAs9e7hR4Lc9ad+ix17K7TaptTn17lYA51JXp3Dwglzm0kBRjom6yEbMFI
 zFImtNr6vaRAxXSmqhQZK3tW6LhWZ38+X2NFl7iYPY2hw73W8JdaOQaxb0ObYal3Fotf
 BOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7XLha7YMl/2xMpFZof+Voqa5XXrpvlQdyTYH2c6mNDo=;
 b=z1idvdxb+UZQgTVGRDbQkx90uxIThNPI43TY4hYNoj0CV/qHPd+UY5fSPJNJ01m1wO
 V44Zs7RA/i7qvVjfrsaxjp0e7RnnxqVGBx8q7kA4bhuvoHfMHgzqwHdAIv1jNKLSHtvo
 zw8ocagOm2CDim1MxoCaQgHjAlUZb50wnLXPh5jN6FHpc0BBKXpPR37WqniQfER4jTHQ
 YvKyN+x7jKCFcy6cEmCfcY1/xzl8sJ52fLc0/1qdac8hbx+JkpItBOuWw3SlMOzwzpKH
 gTRnwqXq6S3f1bZVQoJ1ES7Q5mVgKTPHW68EhOJJQlkJFQG85Wyeojt2yhykqghvyUR7
 TAPA==
X-Gm-Message-State: AJIora9vc6mPnsYtlMVRDh2XSkBaeNv311NWcbEtQMQexVu+OxZc0R2/
 Fym+2LX68ar0aiVssZ0Glck=
X-Google-Smtp-Source: AGRyM1vnC/oHpg56lVg2J5cAz+8cLZWch8vNPjrhCQ8o1WHxSjgDexp+LZCshkvdMw7NZA/GiWTwvQ==
X-Received: by 2002:a05:6402:1104:b0:439:cf4e:5a1b with SMTP id
 u4-20020a056402110400b00439cf4e5a1bmr2715919edv.261.1656771208310; 
 Sat, 02 Jul 2022 07:13:28 -0700 (PDT)
Received: from [192.168.242.248] (93-43-142-212.ip92.fastwebnet.it.
 [93.43.142.212]) by smtp.googlemail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm11636879ejt.212.2022.07.02.07.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:13:27 -0700 (PDT)
Message-ID: <9ed28055-2420-823e-02ed-fdbdcbcd9bae@redhat.com>
Date: Sat, 2 Jul 2022 16:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC 4/8] Fix some direct calls from non-coroutine_fn to
 coroutine_fn
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-5-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220702113331.2003820-5-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/2/22 13:33, Alberto Faria wrote:
> @@ -1537,8 +1537,9 @@ static void blk_aio_read_entry(void *opaque)
>       QEMUIOVector *qiov = rwco->iobuf;
>   
>       assert(qiov->size == acb->bytes);
> -    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
> -                                 qiov, rwco->flags);
> +    rwco->ret = __allow_coroutine_fn_call(
> +        blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes, qiov,
> +                         rwco->flags));
>       blk_aio_complete(acb);
>   }
>   
> @@ -1682,7 +1683,8 @@ static void blk_aio_ioctl_entry(void *opaque)
>       BlkAioEmAIOCB *acb = opaque;
>       BlkRwCo *rwco = &acb->rwco;
>   
> -    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);
> +    rwco->ret = __allow_coroutine_fn_call(
> +        blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf));
>   
>       blk_aio_complete(acb);
>   }
> @@ -1716,7 +1718,8 @@ static void blk_aio_pdiscard_entry(void *opaque)
>       BlkAioEmAIOCB *acb = opaque;
>       BlkRwCo *rwco = &acb->rwco;
>   
> -    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
> +    rwco->ret = __allow_coroutine_fn_call(
> +        blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes));
>       blk_aio_complete(acb);
>   }
>   
> @@ -1772,7 +1775,7 @@ static void blk_aio_flush_entry(void *opaque)
>       BlkAioEmAIOCB *acb = opaque;
>       BlkRwCo *rwco = &acb->rwco;
>   
> -    rwco->ret = blk_co_do_flush(rwco->blk);
> +    rwco->ret = __allow_coroutine_fn_call(blk_co_do_flush(rwco->blk));
>       blk_aio_complete(acb);
>   }
>   

These functions should be coroutine_fn (all coroutine entry points 
should be).

Paolo

