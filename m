Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CEC529A53
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:02:58 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqrEP-0003co-BU
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqrAm-0002Pf-JV
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqrAj-0003GI-Nu
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652770749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bUtxGzUry5ly0Er5rRubrBF2gV2e0puWqpB8HnCllGI=;
 b=LUNtjdnxTLK3sec2nAfzvD9Q0BuoVvjFcdQUE5CNVHjaEfrH0qxNtS77YZdL3/KXlymt8H
 TU/MVAELEWnNX0zto7arLXKSYHFzghZ/DOmJwyvdbUxh4K27mkiiSVjWLkmmzbvw40XrkH
 P+shAuqHwvIxE4uDwKQVUDSUV8ZeLt8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-L0byGxS1PS64OpN2ctNRAA-1; Tue, 17 May 2022 02:59:05 -0400
X-MC-Unique: L0byGxS1PS64OpN2ctNRAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso3353088wma.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 23:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bUtxGzUry5ly0Er5rRubrBF2gV2e0puWqpB8HnCllGI=;
 b=y7zrm0bQzi5r9MLMAZvQ778hgIBO3wGGNTmZjSr/dD6O9qFqBYaAWfFt2Zb8JXqIHi
 zX7glLXQ7cXIE+c5zWTXPv+8TU9faah5Pmz3WN9doPH8iARFupaCuLBGqY7OeZMhwJXv
 E5qkQQxvmQty6GhGEHl0ONwHj6FQNIJ2r6nmEFbtDzF479MvarZiZZfdpoapaokUlTJA
 RYEauGKEgPDozHwEsCaqgUR6JTSw8BobGhERi6AHnHpWWzSu1xsTRIz0nbLevxC+AwxM
 FvCL4Z9JXvLa8RMN8UTVhjqOE6AG282EV+CmfWkBbfop+EiVhr8T5lDTvGLi2UTsyQUy
 lRBw==
X-Gm-Message-State: AOAM531MhSHkPUAnYZ1F9N5OA6FPK/MN0rdUOMDZRYzOsHcJdp6+nZZ4
 b03gm/sxZN8SsJwminc9Dm31JOF4kG/epvKs6LXK1naqL3s2O+QGaSiFbfNh9QdpSXdyI2lF6Qi
 pKrzv94V0ra8fanI=
X-Received: by 2002:adf:f105:0:b0:20e:5939:9a96 with SMTP id
 r5-20020adff105000000b0020e59399a96mr895118wro.268.1652770744584; 
 Mon, 16 May 2022 23:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo19+tTf7bJJvP4KNrGJtl+7RQOnLkErMBPkqIRL36uCT/2SjrQFA6T0lUtwWjxhmsDM3iLA==
X-Received: by 2002:adf:f105:0:b0:20e:5939:9a96 with SMTP id
 r5-20020adff105000000b0020e59399a96mr895095wro.268.1652770744293; 
 Mon, 16 May 2022 23:59:04 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 h16-20020adf9cd0000000b0020c5253d8casm11027426wre.22.2022.05.16.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 23:59:03 -0700 (PDT)
Date: Tue, 17 May 2022 08:59:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Tingting Mao <timao@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu block <qemu-block@nongnu.org>
Subject: Re: [PATCH] block/rbd: report a better error when namespace does not
 exist
Message-ID: <20220517065900.bx27sdjv63qc77rv@sgarzare-redhat>
References: <20220516100324.61122-1-sgarzare@redhat.com>
 <CAOi1vP-LeTROyyHFoP8-MySCk-n8C_1qB13WLtdhemcpyaPQgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOi1vP-LeTROyyHFoP8-MySCk-n8C_1qB13WLtdhemcpyaPQgw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, May 16, 2022 at 08:26:53PM +0200, Ilya Dryomov wrote:
>On Mon, May 16, 2022 at 12:03 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> If the namespace does not exist, rbd_create() fails with -ENOENT and
>> QEMU reports a generic "error rbd create: No such file or directory":
>>
>>     $ qemu-img create rbd:rbd/namespace/image 1M
>>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>>     qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory
>>
>> Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
>> does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
>> to check if the namespace exists, reporting a more understandable error:
>>
>>     $ qemu-img create rbd:rbd/namespace/image 1M
>>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>>     qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist
>>
>> Reported-by: Tingting Mao <timao@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  meson.build |  6 ++++++
>>  block/rbd.c | 24 ++++++++++++++++++++++++
>>  2 files changed, 30 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 9b20dcd143..e6c0afd62b 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1828,6 +1828,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
>>  config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
>>  config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
>>  config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
>> +if rbd.found()
>> +  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
>> +                       cc.has_function('rbd_namespace_exists',
>> +                                       dependencies: rbd,
>> +                                       prefix: '#include <rbd/librbd.h>'))
>> +endif
>>  if rdma.found()
>>    config_host_data.set('HAVE_IBV_ADVISE_MR',
>>                         cc.has_function('ibv_advise_mr',
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 6caf35cbba..0ff23c5b26 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>>          error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
>>          goto failed_shutdown;
>>      }
>> +
>> +#ifdef HAVE_RBD_NAMESPACE_EXISTS
>> +    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
>> +        bool exists;
>> +
>> +        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
>> +        if (r != 0) {
>
>Nit: r < 0 for consistency (librbd errors are always negative).

Yep, also error_setg_errno(errp, -r, ...) makes sense only if r is 
negative.

>
>> +            error_setg_errno(errp, -r, "error checking namespace");
>> +            goto failed_ioctx_destroy;
>> +        }
>> +
>> +        if (!exists) {
>> +            error_setg(errp, "namespace '%s' does not exist",
>> +                       opts->q_namespace);
>> +            r = -ENOENT;
>> +            goto failed_ioctx_destroy;
>> +        }
>> +    }
>> +#endif
>> +
>>      /*
>>       * Set the namespace after opening the io context on the pool,
>>       * if nspace == NULL or if nspace == "", it is just as we did nothing
>> @@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>>      r = 0;
>>      goto out;
>>
>> +#ifdef HAVE_RBD_NAMESPACE_EXISTS
>> +failed_ioctx_destroy:
>> +    rados_ioctx_destroy(*io_ctx);
>> +#endif
>>  failed_shutdown:
>>      rados_shutdown(*cluster);
>>  out:
>> --
>> 2.35.3
>>
>
>Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks, I'll send a v2 with the fix and your R-b tag.

Stefano


