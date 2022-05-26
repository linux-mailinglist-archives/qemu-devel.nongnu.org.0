Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF0534F5B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:38:30 +0200 (CEST)
Received: from localhost ([::1]:55554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCl3-00019I-FT
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCKH-0006bJ-VX
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCKG-0007XP-1o
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653567039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uwpVVW3hG2Z+i8ugpf97HRZXRCtC2Ba7gljOO0Glm4=;
 b=TtX45t/3uyNtrOr5vA/nE1VyFj/XxJHeg9rFJHxUYOmoq8BwkCjyJQ66wJHxE+bmFm1UOt
 CmkQHQDWV3VRQHK8psMtJVwgLJDJBxBnk2qHkrjNINRx6am02PXcE4AJ4G4xzVXkzG7FMG
 037kD8YE73jcOF3iuehEyFI1G4SB4+0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-STHh_yAFMvW9_NbuPaLsKw-1; Thu, 26 May 2022 08:10:38 -0400
X-MC-Unique: STHh_yAFMvW9_NbuPaLsKw-1
Received: by mail-ej1-f70.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso721347ejy.19
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2uwpVVW3hG2Z+i8ugpf97HRZXRCtC2Ba7gljOO0Glm4=;
 b=xzNU+hZ5uLP3olDxUDdwD7AxRmi6AUFl6tVJOIQhetzpqAIBDR58sb/NHkUrIxVqb9
 F7ITG5jz9kt+9aEtQbKgoDFN9i69qP2lOEDYS6vkpQQ6bwAN4tB9K9VrUNA3bRuTcKCf
 FOoWSYbWQ2IkZ0/k5fOYZOqoMmBpTtd/aB71C8SmDhg9Xz80VIr0zOwWYGt93h4fu7cg
 inODsWRXoc9jFgeWkkoJwLLoOgtDWl0fgNZlRtzi+zhEtdJYPtVMNAxMJAgIA6t+YbpT
 ib8f7ICLjDF1HxnB/42nwDAEuxJjr1Df0ip6Ajc9wHm89RN4TQ1V0f4fl95FWtwbW+hw
 A1UA==
X-Gm-Message-State: AOAM5329nASlAzkam1zps2RWOt7lG7WCAjxK8jA9bQLwlecpUoUNTW52
 3BIdhhkEhj8ipJli+f21e8OFxgS8szlDaVX1Mp9ujmyUY1e/YSCBF7w7etnoeNUR5jhQItQEls7
 rWNOafevm9beYOBQ=
X-Received: by 2002:a17:906:656:b0:6f4:ebc2:da81 with SMTP id
 t22-20020a170906065600b006f4ebc2da81mr33163075ejb.757.1653567037021; 
 Thu, 26 May 2022 05:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbSxBuUqx06ZBSVrdpN4ckk6c/4NEVc5V9bmrxWBDi4T5ljHTpm9qmvYHWakGJkUE49i7rZg==
X-Received: by 2002:a17:906:656:b0:6f4:ebc2:da81 with SMTP id
 t22-20020a170906065600b006f4ebc2da81mr33163055ejb.757.1653567036807; 
 Thu, 26 May 2022 05:10:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 wn18-20020a170907069200b006fec56c57f3sm471971ejb.178.2022.05.26.05.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:10:36 -0700 (PDT)
Message-ID: <5d36f941-8958-f42f-f3dd-aed3a92d270b@redhat.com>
Date: Thu, 26 May 2022 14:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, crosa@redhat.com, f4bug@amsat.org
References: <165355470196.533615.1219754093587154582.stgit@pasha-ThinkPad-X280>
 <165355471287.533615.6762485479325805298.stgit@pasha-ThinkPad-X280>
 <7a7d78b5-5c8a-3817-ec7c-27789586076f@redhat.com>
 <a841cf3c-2cc7-3d87-8352-ed23c3b1a186@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a841cf3c-2cc7-3d87-8352-ed23c3b1a186@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 5/26/22 11:51, Pavel Dovgalyuk wrote:
>>
>> At least aio_bh_schedule_oneshot_full should have the same effect, so 
>> should this be done at a lower level, in aio_bh_enqueue() or even 
>> aio_notify()?
> 
> Not sure about aio_notify. It can operate with different contexts.
> Can some of them be not related to the VM state?

All but the main AioContext one would have current_cpu == NULL.

Paolo

> Moving the notification to aio_bh_enqueue.


