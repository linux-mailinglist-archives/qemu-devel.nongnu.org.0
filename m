Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF5532FF1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:58:37 +0200 (CEST)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYnk-0001H1-8v
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntYmC-00005W-Si
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntYm9-0003Yk-Sh
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653415015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAFiIltxSxt560lhgmoYa6w6dgHkvMij/GnxI5nT8p8=;
 b=e56kDZNdSPcY6YzzZ3A/Glmm03T6KDRG8DVmXhPq8V5hHlOrCeKGAtjClahEfB/X5fW+pc
 ZRuknS4fdi6mxHCTjagLosq4yOvUYUJ3DoBljWehx5O/XKnSzX/1CJfNxSrCUdHRn0aYgp
 fSX4KwjSJth1nlL0rec0iy4XqP90o48=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-cHDSGknWPqK5ElDZR_oICw-1; Tue, 24 May 2022 13:56:54 -0400
X-MC-Unique: cHDSGknWPqK5ElDZR_oICw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a05600c1d1000b003974df9b91cso1620519wms.8
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 10:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YAFiIltxSxt560lhgmoYa6w6dgHkvMij/GnxI5nT8p8=;
 b=ZdFO4o/++UP6SLb033+b4C/MMv5+Tzv7BITeD8pHk2g2Ou09CIoXJbDiJDMc6u6yHn
 WDaQHIGaZz+Zhtwes5CW/sB02kfLs/ArXdneYLcleqiMWhP4vePi9we9nBo2H3oaAaQH
 VUmcvQVoB19KOU5DjFpZkkyE0dZO/ClOD6nkxpP+ju8S7bhpD2Ap2QDMcbpanzgVoETm
 CxKWBTp4Raih3KZaRo11jgmw9zWoMOpFrRsNJz8jtOF4HNNyTmEMEeVukQ59S0f1krWq
 8V5pn0GYZsWXiHYuEV2t+5wz8bD+QWOppWotlDhpIopxXgVQ119mhtzvtqDh9Txga0cF
 sGaQ==
X-Gm-Message-State: AOAM530ikrN9S+EwIIsc4KLt4P1XbGv8ClCpphHGaii3wKju37iCjz48
 0bqaKX6wM2xISGy6xohgI1HTc+h9X3tHnn+/ejvkAdVvF45346jKmjLJogQsbz6UcFBxoEGYbOo
 cYKBHamffEgk6Y7w=
X-Received: by 2002:adf:ebc7:0:b0:20c:d65d:3f19 with SMTP id
 v7-20020adfebc7000000b0020cd65d3f19mr23990720wrn.613.1653415013468; 
 Tue, 24 May 2022 10:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7eWFiueS38G0YpwO5w79akSvwoyMHoLhWyX5ObV5IV66w8n7y5CgUobzRyJh82Hfx8yBywA==
X-Received: by 2002:adf:ebc7:0:b0:20c:d65d:3f19 with SMTP id
 v7-20020adfebc7000000b0020cd65d3f19mr23990698wrn.613.1653415013190; 
 Tue, 24 May 2022 10:56:53 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a5d564b000000b0020e68dd2598sm53830wrw.97.2022.05.24.10.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 10:56:52 -0700 (PDT)
Message-ID: <5debc575-cc9c-57a8-6dae-48ccee55c83d@redhat.com>
Date: Tue, 24 May 2022 19:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: aio_wait_bh_oneshot() thread-safety question
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com
References: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
 <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 24/05/2022 um 09:08 schrieb Paolo Bonzini:
> On 5/23/22 18:04, Vladimir Sementsov-Ogievskiy wrote:
>>
>> I have a doubt about how aio_wait_bh_oneshot() works. Exactly, I see
>> that data->done is not accessed atomically, and doesn't have any
>> barrier protecting it..
>>
>> Is following possible:
>>
>> main-loop                           iothread
>>                                  |
>> aio_wait_bh_oneshot()           |
>>      aio_bh_schedule_oneshot()   |
>>                                  |  handle bh:
>>                                  | 1. set data->done = true
>>                                  | 2. call aio_wait_kick(), inserting the
>>                                  | dummy bh into main context
>>                                  |
>>   ... in AIO_WAIT_WHILE():
>>     handle dummy bh, go to next
>>     iteration, but still read
>>     data->done=false due to some
>>     processor data reordering,
>>     go to next iteration of polling
>>     and hang
> Yes, barriers are missing:
> 
> https://lore.kernel.org/qemu-devel/You6FburTi7gVyxy@stefanha-x1.localdomain/T/#md97146c6eae1fce2ddd687fdc3f2215eee03f6f4
> 
> 
> It seems like the issue was never observed, at least on x86.
> 
> Paolo
> 

Sent the fix as a separate patch:
https://patchew.org/QEMU/20220524173054.12651-1-eesposit@redhat.com/

Thank you,
Emanuele


