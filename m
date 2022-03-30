Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC64EC950
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:08:37 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZas8-0002s9-32
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:08:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZam1-0006yB-Lv; Wed, 30 Mar 2022 12:02:17 -0400
Received: from [2a00:1450:4864:20::62d] (port=39436
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZalz-0007iC-Ro; Wed, 30 Mar 2022 12:02:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dr20so42419910ejc.6;
 Wed, 30 Mar 2022 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z8SNzNgw7VIctRDbFIBEv7GHKu4lArqVAfSWlWl1THQ=;
 b=qPlYziJLPIcrrGGdsw2SCn3M7uPEYqOuYgSNddkEtZ9roOg9LsfnxjkThtJSNwbfB6
 otRhgmf6ts8f+NluXWxaHdT8ZCJWZQkBiWDbfBm0AIlBM2IyFQvOnl2uroepoBOxJA3A
 tkavXJXqGWO06gXu7VmemzBPHtctHx8wYAsjgQ8aHCC2WwCwAwLJacjsCgl/rJhkTuNy
 E5Rfv7nYIg0bh/DbxKSRh3GBFEhwMXAjDBK3K1Af1pOX+rYTt2vM3QNzamfh8uNYOn/Y
 dJeHUJegj1Y40q/QBhGrFtDcU9K/UCVzNPo0V2Ybi31PjycqyfqWpur6FibZkZjk4AOO
 nQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z8SNzNgw7VIctRDbFIBEv7GHKu4lArqVAfSWlWl1THQ=;
 b=Fj6LuFofkG9mrQ/qxYl5fHXJkTRwzjO7JxM7K8o9F7Y8Y+jDnQ6vys2YnitB46ByY6
 gUvG9cqPUfVPm8XoL1FodtyC8qj0pT8GDwHwu2xzqueO73lfLA0W0v0YcMl6z5M9iDYk
 cPM3mJknoZchvPA8b4RTwtqd3awECT/VeOoEPXOyseu7KMP1kKbVMzh1UkRaPYuNz/gt
 Xo/5LVPw4LmURyP/DfHI0OSJktneSP0RBSeiH7t5GyQuyAwy9C0xKXBdm28QifyCmK9N
 slq/Nb2S0bujx+de3rd9jaKq/kyw0C22W6c5sffqibTw+0NOof3vGoVt2wIMyTjnTRmE
 IudQ==
X-Gm-Message-State: AOAM533XBWHfXAgaj4+ffpvB8fGeolg9jNUulvWfUaajziKNT1HdNM/3
 JGfjdx4NGZIncRYVoRye11Q=
X-Google-Smtp-Source: ABdhPJzZwqTgBRxB8QFab/828LWX8hhy3i8CIYFkelMO+4Y8U4+3qKDOz/PIekZmYPlezE7fOYG45A==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr165909ejb.737.1648656133957; 
 Wed, 30 Mar 2022 09:02:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020aa7c949000000b0041b4d8ae50csm2687808edt.34.2022.03.30.09.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 09:02:12 -0700 (PDT)
Message-ID: <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
Date: Wed, 30 Mar 2022 18:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 12:53, Hanna Reitz wrote:
>>
>> Seems a good compromise between drains and rwlock. What do you think?
> 
> Well, sounds complicated.  So I’m asking myself whether this would be 
> noticeably better than just an RwLock for graph modifications, like the 
> global lock Vladimir has proposed.

A global lock would have to be taken by all iothreads on every I/O 
operation, even a read-write lock would scale because it has a global 
CoMutex inside and rdlock/unlock both take it.  Even if the critical 
section is small, the cacheline bumping would be pretty bad.

Perhaps we could reuse the code in cpus-common.c, which relies on a list 
of possible readers and is quite cheap (two memory barriers basically) 
for writers.  Here we would have a list of AioContexts as the possible 
readers.

The slow path uses a QemuMutex, a QemuCond for the readers and a 
QemuCond for the writers.  The reader QemuCond can be replaced by a 
CoQueue, I think.

Paolo

