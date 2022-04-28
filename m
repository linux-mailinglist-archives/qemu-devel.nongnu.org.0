Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF5513E79
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 00:20:49 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkCVE-0007vX-Vh
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 18:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCTk-00076x-Rl; Thu, 28 Apr 2022 18:19:16 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCTj-00075v-ER; Thu, 28 Apr 2022 18:19:16 -0400
Received: by mail-ed1-x52f.google.com with SMTP id p18so7066856edr.7;
 Thu, 28 Apr 2022 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gLKM2ScWZMMb7vPTG5yPN6KdzcYWJuH35dM9jfXt6Co=;
 b=UzboSPSTojE5ibuEgzrEvFjROUz7iiJhCZ6yT18PhONEIVk+5qo2Y+KPKP8CsuCRaD
 u4qgWLNOU5x3C6l+y+YtQdY9o6CYMkz3PgmvLQTtOuW5q1YTEFmI2YgYJZZ5q/vZ78pu
 ONw8lePFfxtt0NkthTmDr4F+7//UGb4ORXiTnb1zGRlDtg9exOiPd0h5LbciCV9XJppb
 hDA/m2iYFoLOWOvxpOZ6IC2RL16QUp1952HHLABI7IdwIJyUF6P7H0E2Id6sK3F9RAAs
 qrz9PP4GLB1gBsc01yxa1aI1zQQpzEyTMi3fgeE5xlmuF9D5IhAbmu9M5c+L0TcVmaGU
 +Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gLKM2ScWZMMb7vPTG5yPN6KdzcYWJuH35dM9jfXt6Co=;
 b=YUnXsy4NE0sADhRYWrxbyxqkql2WjdQJRQxCdAeIxoa7IZ2P5K+lRRZiXGg6Nnxs8L
 MiY+tLEqMIJvo83SCNv+dcW2SV+jZz9t3SVy1uAT6Qtv/pp4Wh5ObLjEuZDOwmPZ2aH3
 jgAtfzyxjxabmgZ7uSkYj5uRoFn7mGOcWhrP8T9NfpcOEiB2Y43UacxA9/L/rNScP3y0
 sloRxYbcSNDbV9Alq9kbns/lN+/jMooUcecB6K7aBojIG5ynNTpnjSmimI7Dvp8FivQc
 UzNiQR3e0dRq/EGKzY+C83T3bHA6DyluxPPdI0zz/4jrMcSZpuVjqis7L7iJBiQStQHZ
 VZVA==
X-Gm-Message-State: AOAM532Xm4qUmqpXR+/KX9Cvgg84fDxHzp4RVc1EfK+rF2w4AzN+a7yX
 8QUrCf39GtatQiVN0+5FdXY=
X-Google-Smtp-Source: ABdhPJxMKC1e/AyzWeCw6b9drZlY8biFaqQRYs+qJi3AuiH7oGSu4C2aB+QXDTDZ+Fa5/ME8q6hvKg==
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id
 e20-20020a50d4d4000000b00425e6bf8b81mr24135918edj.209.1651184353570; 
 Thu, 28 Apr 2022 15:19:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm70691ejc.9.2022.04.28.15.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 15:19:13 -0700 (PDT)
Message-ID: <1a92eaed-9557-ae93-8143-17ef559ad965@redhat.com>
Date: Fri, 29 Apr 2022 00:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 4/8] async: register/unregister aiocontext in graph
 lock list
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-5-eesposit@redhat.com>
 <YmqaxkbQqOVOHhlP@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmqaxkbQqOVOHhlP@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 15:46, Stefan Hajnoczi wrote:
>>   
>>   if have_block
>>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>> +  util_ss.add(files('../block/graph-lock.c'))
> Why is it in block/ if it needs to be built into libqemuutil?
Maybe register_aiocontext, unregister_aiocontext and 
aio_context_list_lock can be placed in util/async.c?

Paolo

