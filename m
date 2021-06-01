Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2D3972F9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:06:23 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3A5-0000mQ-HV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo36m-0006yU-GX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo36Y-0005mH-QD
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622548961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t89OdcUENcVhMcQ0zTdeWk3PJtvnnURBk4Q+QxiSaK0=;
 b=JrLHoRRinIwLsT0CMhhAh8CjHeNURrJswDfIg1lRe3bXOxeZ5+Z+mdIt8bYK0GiNMA97Vb
 dxjS1jwRxB3qPAI4ror9VIOsjqzdtGE4PnF8BkKmhelr1dDGI/qLAbvX2epMIUeZ/zXxHe
 DhXmU9Mg6LkWpkZZTXZwjU6u2+IZYqM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-_sAAN3bXMtiZ0aVSOa3mRA-1; Tue, 01 Jun 2021 08:02:39 -0400
X-MC-Unique: _sAAN3bXMtiZ0aVSOa3mRA-1
Received: by mail-ej1-f72.google.com with SMTP id
 b8-20020a170906d108b02903fa10388224so345226ejz.18
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 05:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=t89OdcUENcVhMcQ0zTdeWk3PJtvnnURBk4Q+QxiSaK0=;
 b=cTiRgt5H9f6AVlSzeGt34TVCp59q5/X3MIcee6CHmbOC5O23FWX0kf9SLaL7eSWZCM
 kd3TEKLIRONbO4bWDBTPFi3FtoWlW5dvJLIWMWK0bBvX4UlLWx7CCqHkoZh/xmNbN0Yy
 zjRz21Gx7nv7rcP1j63QFRap+k8rbaUPaSY0ru19uXKRNSyR/KwxFUAFLfdQNhGaHzMM
 kDoO1WlgINOwJf9M2shtk8uwF9gaNh/yf+XstmY8eftVlf7e2KxAsIMOdq5sItxvEFas
 MGEzF8UOAL5sfNpHi9GQa3Ti+SaPHFSOBA0q3FidmfiK1XuSG7GLiknnIxtLy9YLro63
 Rj/A==
X-Gm-Message-State: AOAM533FGpzoZ9kntvrZfn3mLPB+3v3PTVh5bM7Uso7spTH+Xwn+TFVU
 6i0KRExp0irKIZjMYCFxH7T6CJjV8LwhXnCrwPkIO7X6+KXsBxGeDHZBXiEeh83JVOwaw8qKYwx
 EEjlgSSggmCOgF9A=
X-Received: by 2002:a05:6402:5249:: with SMTP id
 t9mr23762029edd.290.1622548958241; 
 Tue, 01 Jun 2021 05:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhUdLkU0sAr1zu617R7HcuevFB09SwP5VuXD1fU6fWgQv10oVFJWQ74Z4bXzQLdC+Hpaw44w==
X-Received: by 2002:a05:6402:5249:: with SMTP id
 t9mr23761987edd.290.1622548957938; 
 Tue, 01 Jun 2021 05:02:37 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e6sm7153233ejd.31.2021.06.01.05.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 05:02:37 -0700 (PDT)
Subject: Re: [PATCH v2 33/33] iotests/image-fleecing: add test-case for
 copy-before-write filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-34-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0a545efe-df90-710c-518f-97f52449d5b6@redhat.com>
Date: Tue, 1 Jun 2021 14:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-34-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:22, Vladimir Sementsov-Ogievskiy wrote:
> New fleecing method becomes available: copy-before-write filter.
>
> Actually we don't need backup job to setup image fleecing. Add test
> for new recommended way of image fleecing.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 50 +++++++++-----
>   tests/qemu-iotests/tests/image-fleecing.out | 72 +++++++++++++++++++++
>   2 files changed, 107 insertions(+), 15 deletions(-)
>
> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
> index e210c00d28..404ebc00f1 100755
> --- a/tests/qemu-iotests/tests/image-fleecing
> +++ b/tests/qemu-iotests/tests/image-fleecing

[...]

> @@ -90,12 +91,22 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
>           'backing': src_node,
>       }))
>   
> -    # Establish COW from source to fleecing node
> -    log(vm.qmp('blockdev-backup',
> -               job_id='fleecing',
> -               device=src_node,
> -               target=tmp_node,
> -               sync='none'))
> +    # Establish CBW from source to fleecing node
> +    if use_cbw:
> +        log(vm.qmp('blockdev-add', **{

I thought this should work without ** now.

With them dropped:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +            'driver': 'copy-before-write',
> +            'node-name': 'fl-cbw',
> +            'file': src_node,
> +            'target': tmp_node
> +        }))
> +
> +        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
> +    else:
> +        log(vm.qmp('blockdev-backup',
> +                   job_id='fleecing',
> +                   device=src_node,
> +                   target=tmp_node,
> +                   sync='none'))
>   
>       log('')
>       log('--- Setting up NBD Export ---')


