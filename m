Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46814524739
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 09:43:57 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np3UK-0004ZK-8U
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 03:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np3S1-0003IV-Nx
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:41:33 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np3S0-0007J5-4Q
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:41:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id y21so5235363edo.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 00:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RaYOnkzrV2PMhVoTZK0I+FxAlMxGtFo0Key2MTZXJEU=;
 b=Ak2X12+MZhUyRU0frofQi+4Gq+UUoJX5+B8QCjSIX8+T9nlpO2mROx3lc8T6nwgwcC
 EUj//1SLO/dIvStnlRzuopQVr3qc6xLIDWB86RuQEJw8VfDNGRfensjLaGeOv3welby6
 Ty3kkmG7uOfA2/MmB2GQzqjNPDge69uyYliyftse9t9y/ap90Anc1c9B+z9gZrrXqqSY
 qNBGlibgSuEG+2QHq5IxBW+/AIpgj6oh9ohixrZkEGYm1+x0EWUMBSWrsGw61QgAX9wm
 6FKJjkcqZv9nfNgZayegg0/z7TYjJfn5FFZyAWBw6ykCxfyrlYojRdyV4nChyQdVL7nO
 JEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RaYOnkzrV2PMhVoTZK0I+FxAlMxGtFo0Key2MTZXJEU=;
 b=i0Fr8Qp7VSjtdolsBRqn89TvgG/3oUJHPbzZyxEYL4mLWqKZrTqJo0zODcK57rtlmZ
 R65W2dAj8VexCqBJi/BcWvTczN2UULZUFscWEt9Phm/aSGJj0eGCM9+Ox1SAebdkHAxj
 gFFRAJ+sbdk+6F5oMGlqowECBXX+VZGPJJUst04pnYlwk5/y1ixze7qTwjWPLPCZxuWe
 w7XJH7J3xyqdAAPCpXWQNZmqnay/YcJVDHF5WX1Xpr5fxSOynIUjSTcQ4mVLGt4UJyrT
 dj8jfOs1KggUDg5CkeKmVJg2kBIPn0PbU1UK5jEtQYcJLGuGCdXTqx4uS6/JiGmcJNGB
 4JeA==
X-Gm-Message-State: AOAM531UwJfraPEmYLk3Rc/ZuF1O7qFuA7pwqN1rO6broHtnpA+Dsqgk
 aCUPjdf9Zfd+h6vyK6ZegeY=
X-Google-Smtp-Source: ABdhPJyVsz4JrduuxrzV9OA1EgzwMqZ+KBGkTF0hHixGPQK498WCvF52oDukPE7w3+DreEt+FzGMLw==
X-Received: by 2002:a05:6402:190e:b0:42a:3b3d:d061 with SMTP id
 e14-20020a056402190e00b0042a3b3dd061mr1414492edz.106.1652341290484; 
 Thu, 12 May 2022 00:41:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 p2-20020a170906614200b006f3ef214e41sm1818956ejl.167.2022.05.12.00.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:41:29 -0700 (PDT)
Message-ID: <04938ba0-7ff4-df3c-348d-b679eac4fbac@redhat.com>
Date: Thu, 12 May 2022 09:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
 <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
 <YnuLe7cVlEYsw78o@redhat.com>
 <5374a249-8389-3d11-1b30-b0b6e6910a51@redhat.com>
 <YnvqYO8p/Z/7/DrO@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnvqYO8p/Z/7/DrO@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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

On 5/11/22 18:54, Daniel P. Berrangé wrote:
> On Wed, May 11, 2022 at 01:07:47PM +0200, Paolo Bonzini wrote:
>> On 5/11/22 12:10, Daniel P. Berrangé wrote:
>>> I expect creating/deleting I/O threads is cheap in comparison to
>>> the work done for preallocation. If libvirt is using -preconfig
>>> and object-add to create the memory backend, then we could have
>>> option of creating the I/O threads dynamically in -preconfig mode,
>>> create the memory backend, and then delete the I/O threads again.
>>
>> I think this is very overengineered.  Michal's patch is doing the obvious
>> thing and if it doesn't work that's because Libvirt is trying to micromanage
>> QEMU.
> 
> Calling it micromanaging is putting a very negative connotation on
> this. What we're trying todo is enforce a host resource policy for
> QEMU, in a way that a compromised QEMU can't escape, which is a
> valuable protection.

I'm sorry if that was a bit exaggerated, but the negative connotation 
was intentional.

>> As mentioned on IRC, if the reason is to prevent moving around threads in
>> realtime (SCHED_FIFO, SCHED_RR) classes, that should be fixed at the kernel
>> level.
> 
> We use cgroups where it is available to us, but we don't always have
> the freedom that we'd like.

I understand.  I'm thinking of a new flag to sched_setscheduler that 
fixes the CPU affinity and policy of the thread and prevents changing it 
in case QEMU is compromised later.  The seccomp/SELinux sandboxes can 
prevent setting the SCHED_FIFO class without this flag.

In addition, my hunch is that this works only because the RT setup of 
QEMU is not safe against priority inversion.  IIRC the iothreads are set 
with a non-realtime priority, but actually they should have a _higher_ 
priority than the CPU threads, and the thread pool I/O bound workers 
should have an even higher priority; otherwise you have a priority 
inversion situation where an interrupt is pending that would wake up the 
CPU, but the iothreads cannot process it because they have a lower 
priority than the CPU.

So the iothread and the associated util/thread-pool.c thread pool are 
the wrong tools to solve Michal's issue; they are not meant for 
background CPU-bound work, even though they _might_ work due to their 
incorrect RT setup.

Paolo

