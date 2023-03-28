Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841866CC010
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:03:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8xw-0007hf-T5; Tue, 28 Mar 2023 09:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph8xt-0007gB-Qr
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ph8xk-0001Z3-9H
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680008527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHKOGp/1r+x4IU5J+VMDuQ2lB6EfDNbWwv7NOaP+sWA=;
 b=jLdPlTJ40Mzzd5s8iuY+HJCT5HYtRsF4ciAwh88jAFg8K7vk34uEVPliEyFJbq4fRHQfVf
 f/1VUdRD+vOv9SBlxMKOqXIKBGZuJdAZky4JHS0JK69r9d9Rn2C9HZWE6bz2fEUkPXyqNA
 0Ca7voJr77tDDr2LKu8IIIjLamt8QFU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Sc5lGQmYMV6wY0V91Cgcyg-1; Tue, 28 Mar 2023 09:02:04 -0400
X-MC-Unique: Sc5lGQmYMV6wY0V91Cgcyg-1
Received: by mail-qk1-f198.google.com with SMTP id
 195-20020a3705cc000000b00746a3ab9426so5563769qkf.20
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680008524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YHKOGp/1r+x4IU5J+VMDuQ2lB6EfDNbWwv7NOaP+sWA=;
 b=bbxi2FiRKTKhuWdtmLkkTHll4Srfi1zQ4HO4EL7cMslr2N47NVjGosof3J0ZJ9QXkL
 7B3mPI0uICoD27Kz+yi8d5V8irwRUlZsTAoqWpOfauAkyKe4KIF9C8K/tkaPCF86LPlY
 wfnOuczPaAdMCqSwAbWRhGmj5CtPsrIRrE0yBHpYjMG3TPiA/WcQm0sRiQnVkJf0LSp1
 0hWk18w78KtW5yWUJJ0yBOTk8P1NpjBa4Jqpk/W0PUHPr4p4qzkHizvRqOS4Vzx0FIxC
 Kh9CnNy3dar8mqoT7FoC8Wlbf0Vgz2E40VSUEpp3Q5FBcm7mkFPz3MO1nJnb+rtnc5ec
 R9gg==
X-Gm-Message-State: AO0yUKVsHwG4FQY3TSyv9E17pTI+KmbkauWxTD9Equ8fbdnp36M7AYSc
 qyiwP3QsZUG4OpTAGNDQb7uRwr0FfakZBLpv8tppTD185pBHZ9edYN2kviDU8RBVn+IrMYTheAw
 KS5wnDApRv+2FbTo=
X-Received: by 2002:a05:622a:15d2:b0:3d6:4351:f357 with SMTP id
 d18-20020a05622a15d200b003d64351f357mr26927230qty.24.1680008524138; 
 Tue, 28 Mar 2023 06:02:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set93gCSh1KLkLEd38jJoDCdEkH+X6rNZL+b2pYXEu3rJC3+5nW1O7YrWNG0J+0rqd5BhqM+IWQ==
X-Received: by 2002:a05:622a:15d2:b0:3d6:4351:f357 with SMTP id
 d18-20020a05622a15d200b003d64351f357mr26927172qty.24.1680008523618; 
 Tue, 28 Mar 2023 06:02:03 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-113.web.vodafone.de.
 [109.43.179.113]) by smtp.gmail.com with ESMTPSA id
 t4-20020ac85304000000b003e3870008c8sm7553438qtn.23.2023.03.28.06.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:02:02 -0700 (PDT)
Message-ID: <84eebff9-54b8-9354-5b48-822937af0405@redhat.com>
Date: Tue, 28 Mar 2023 15:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: s390x TCG migration failure
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Blake
 <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230324184129.3119575-1-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/03/2023 19.41, Nina Schoetterl-Glausch wrote:
> Hi,
> 
> We're seeing failures running s390x migration kvm-unit-tests tests with TCG.
> Some initial findings:
> What seems to be happening is that after migration a control block header accessed by the test code is all zeros which causes an unexpected exception.
> I did a bisection which points to c8df4a7aef ("migration: Split save_live_pending() into state_pending_*") as the culprit.
> The migration issue persists after applying the fix e264705012 ("migration: I messed state_pending_exact/estimate") on top of c8df4a7aef.

  Hi Nina,

could you please open a ticket in the QEMU bug tracker and add the "8.0" 
label there, so that it correctly shows up in the list of things that should 
be fixed before the 8.0 release?

> Applying
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 56ff9cd29d..2dc546cf28 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3437,7 +3437,7 @@ static void ram_state_pending_exact(void *opaque, uint64_t max_size,
>   
>       uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
>   
> -    if (!migration_in_postcopy()) {
> +    if (!migration_in_postcopy() && remaining_size < max_size) {
>           qemu_mutex_lock_iothread();
>           WITH_RCU_READ_LOCK_GUARD() {
>               migration_bitmap_sync_precopy(rs);
> 
> on top fixes or hides the issue. (The comparison was removed by c8df4a7aef.)
> I arrived at this by experimentation, I haven't looked into why this makes a difference.
> 
> Any thoughts on the matter appreciated.

Juan, could you comment on this, please?

  Thomas



