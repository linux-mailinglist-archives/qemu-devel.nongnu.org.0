Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FE400765
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:19:38 +0200 (CEST)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGb3-0004TO-RP
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMGWl-0006gu-9x
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMGWX-0003ij-Is
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630703695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKKjhL+HpQ6aSK5Mve6G6r1C/eZqCFc4GZy7hYfLCYg=;
 b=XYplMi0f174CfjfrDoT1KB4+iOnBPhjWvW0KJnp9GLuBodF6hBimNFyOMoWyHg81u0H4W0
 K60/0hQflJ34iFmjxi1IZvVFFcMKLdJTHtGfD3wNl1L0SO0y0FD1vEj2UkG1vPGASQTt6P
 BWPZJsT7uwyWIGUMg4Y34I6P7DVKI0I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-fRgz6Pg6MGCCH4Ut9VbEWw-1; Fri, 03 Sep 2021 17:14:54 -0400
X-MC-Unique: fRgz6Pg6MGCCH4Ut9VbEWw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso216345wmi.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKKjhL+HpQ6aSK5Mve6G6r1C/eZqCFc4GZy7hYfLCYg=;
 b=gUD6Yqo19LsxJzxPvPX6Gdyf3cm3zkDDsUNWN60BZctcldk2NkfLnGgo2Y+fC+BZwc
 YS21VT9G1DbrxSyPCT3+TqXSjOR3Fby0VXV+qfZtA8987c5R1/1KluwLkcigE0Ut2oju
 T/ZdknNw6XlKTxfjGKCS/6KJ6UFFE6O5yrAKPOTwSA2b7mkDEbr383n7x+OL6E+g0U9Y
 2SC133FTRlXJMEFCaFwQcrE2FkE7iXzMN8uIoeOK/KNQZVxwp1Cl9opy2Avsth39wYXf
 v2WL7ji1rfpqdGXrZtvn0OpwTlm7Cj1kPnOXFhwYXIW/m/LJQkS8YxrEGJa4aoRcdE9V
 08rA==
X-Gm-Message-State: AOAM530JiWA/nJkZvn+TsoibHRZDDvsbVU94dxDvhKtZTOLcZ00mcKUK
 yNyvE77VVtgiqp+vQ9xViZ3MxsyG4I+blTekKR9LXztfllKcN2B7Fc/iOO/mL2cs/R1rh7duY9z
 prTlRClQU6U55ZyY=
X-Received: by 2002:a05:6000:160f:: with SMTP id
 u15mr1003537wrb.166.1630703693409; 
 Fri, 03 Sep 2021 14:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsufQGO7ZKUklwuVc6kB4Z1lYtTumzSP8nD7GTru3Xt6biJ9ncTT1gEXAjNBH3LQ5gkw9dOw==
X-Received: by 2002:a05:6000:160f:: with SMTP id
 u15mr1003522wrb.166.1630703693236; 
 Fri, 03 Sep 2021 14:14:53 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y4sm394108wmi.22.2021.09.03.14.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:14:52 -0700 (PDT)
Subject: Re: [PATCH v3 05/28] block/qcow2-bitmap: Replace g_memdup() by
 g_memdup2()
To: Eric Blake <eblake@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-6-philmd@redhat.com>
 <20210903211322.n5isnkxin6jlkxrf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <51de5796-3137-6ac3-c935-eb097fc4ca45@redhat.com>
Date: Fri, 3 Sep 2021 23:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903211322.n5isnkxin6jlkxrf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 11:13 PM, Eric Blake wrote:
> On Fri, Sep 03, 2021 at 07:44:47PM +0200, Philippe Mathieu-Daudé wrote:
>> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>>   The old API took the size of the memory to duplicate as a guint,
>>   whereas most memory functions take memory sizes as a gsize. This
>>   made it easy to accidentally pass a gsize to g_memdup(). For large
>>   values, that would lead to a silent truncation of the size from 64
>>   to 32 bits, and result in a heap area being returned which is
>>   significantly smaller than what the caller expects. This can likely
>>   be exploited in various modules to cause a heap buffer overflow.
>>
>> Replace g_memdup() by the safer g_memdup2() wrapper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  block/qcow2-bitmap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
>> index 8fb47315515..218a0dc712a 100644
>> --- a/block/qcow2-bitmap.c
>> +++ b/block/qcow2-bitmap.c
>> @@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>                             name);
>>                  goto fail;
>>              }
>> -            tb = g_memdup(&bm->table, sizeof(bm->table));
>> +            tb = g_memdup2(&bm->table, sizeof(bm->table));
> 
> Trivially safe.  It might be worth a comment in the various commit
> messages for which patches are trivially safe (because the argument
> was directly from sizeof), and which would require a larger audit of
> callers to see if we had any (unlikely) bug (such as patch 3/28).

Yes, will do.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


