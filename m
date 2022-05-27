Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D37535821
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 05:52:41 +0200 (CEST)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuR1k-0001Fz-BC
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 23:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuR0K-0000U8-CK
 for qemu-devel@nongnu.org; Thu, 26 May 2022 23:51:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nuR0F-0007pk-4z
 for qemu-devel@nongnu.org; Thu, 26 May 2022 23:51:09 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 202so3364175pfu.0
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 20:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j9jk044M9+cYvVEixSPS19EP9SvL+t/qLlqlyuGxZM8=;
 b=Kb2Tpf83/RKgq6La7zyoqDnn6vsobEKp71dRb7mjiTOPUYH+IgtHlE6f1TsGuBkzlq
 zk8ScHr3clPBi/fp0b0KggejpFlhgAoYM8H/xBtIxZ2v9hGCd1vL5uMVXtIWavL9t4Y9
 JWf4KACOV0+0zz8LnmBlpHFReoWwuSbpazzgp7EeApZRHB0IyewrDmjuNm158ZKeZYfy
 bKp66XYbZMuoWwqPniW8LYvYBSpLq8WGGyhhxmoToYWnpJQTw5BWXghCyDz4aRCDJYN3
 j7TxCnSVkihYuDcfzyecLjBPPde2J9sn0rNsdkfTHMeKt4D6wBdc8Zoh6D42eJB69+QY
 2C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j9jk044M9+cYvVEixSPS19EP9SvL+t/qLlqlyuGxZM8=;
 b=Hv6+1rH522ApwYHKO0NpRdKKVdzs//ebqyjBMcheP9g++oKmdy+tMNxXdX864r5gHL
 0XGEnSXZ4sovT1t6ToCkIOM0sTq4j4r3V8OvBD3eJkSFX1QO73a8I95+FquMkaym21HQ
 g9JDIdGdr93YqgVt5YjAiBbnsQzVAjkLoPsNHob+33dPTmJ9zuZoffRMusFzKGR/nBHT
 4DqLdoXDG7fqwg0PDk1GNjr30d+/z0bsIeMUYGhbH0kka76RAF0rXaEZQv7E5WnOsIFK
 UCvJszruMRD5NuI/+2DhmxkgY9uf7VB8HrksNZPJ51ChGVBtcVJS5I3ZOIlHH+dO7kPT
 07fw==
X-Gm-Message-State: AOAM532Y91ewGJstrlvCbCYOzFhjBqZWTKN6x+BPymHtvVZ9DOcaTa7j
 sP9K77ntmQo1+XeJtVkeWQU24g==
X-Google-Smtp-Source: ABdhPJy3h9b0t9+huzLue6kvbq3gMPhl9OzbyMxsuZP1FK+is3ahv5iuUbCsnMJzlrcDe8zU0831QQ==
X-Received: by 2002:a65:6c06:0:b0:3f5:f29d:e030 with SMTP id
 y6-20020a656c06000000b003f5f29de030mr34969235pgu.22.1653623464792; 
 Thu, 26 May 2022 20:51:04 -0700 (PDT)
Received: from [10.255.70.20] ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170903214300b0015e8d4eb1fcsm2358469ple.70.2022.05.26.20.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 20:51:04 -0700 (PDT)
Message-ID: <d41bf9f8-9ea2-e4be-7e96-d69d2e4ec5f2@bytedance.com>
Date: Fri, 27 May 2022 11:47:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Content-Language: en-US
To: akpm@linux-foundation.org, naoya.horiguchi@nec.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, mst@redhat.com,
 david@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220520070648.1794132-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, Andrew & Naoya

I would appreciate it if you could give me any hint about the changes of 
memory/memory-failure!

On 5/20/22 15:06, zhenwei pi wrote:
> Hi,
> 
> I'm trying to recover hardware corrupted page by virtio balloon, the
> workflow of this feature like this:
> 
> Guest              5.MF -> 6.RVQ FE    10.Unpoison page
>                      /           \            /
> -------------------+-------------+----------+-----------
>                     |             |          |
>                  4.MCE        7.RVQ BE   9.RVQ Event
>   QEMU             /               \       /
>               3.SIGBUS              8.Remap
>                  /
> ----------------+------------------------------------
>                  |
>              +--2.MF
>   Host       /
>         1.HW error
> 
> 1, HardWare page error occurs randomly.
> 2, host side handles corrupted page by Memory Failure mechanism, sends
>     SIGBUS to the user process if early-kill is enabled.
> 3, QEMU handles SIGBUS, if the address belongs to guest RAM, then:
> 4, QEMU tries to inject MCE into guest.
> 5, guest handles memory failure again.
> 
> 1-5 is already supported for a long time, the next steps are supported
> in this patch(also related driver patch):
> 
> 6, guest balloon driver gets noticed of the corrupted PFN, and sends
>     request to host side by Recover VQ FrontEnd.
> 7, QEMU handles request from Recover VQ BackEnd, then:
> 8, QEMU remaps the corrupted HVA fo fix the memory failure, then:
> 9, QEMU acks the guest side the result by Recover VQ.
> 10, guest unpoisons the page if the corrupted page gets recoverd
>      successfully.
> 
> Test:
> This patch set can be tested with QEMU(also in developing):
> https://github.com/pizhenwei/qemu/tree/balloon-recover
> 
> Emulate MCE by QEMU(guest RAM normal page only, hugepage is not supported):
> virsh qemu-monitor-command vm --hmp mce 0 9 0xbd000000000000c0 0xd 0x61646678 0x8c
> 
> The guest works fine(on Intel Platinum 8260):
>   mce: [Hardware Error]: Machine check events logged
>   Memory failure: 0x61646: recovery action for dirty LRU page: Recovered
>   virtio_balloon virtio5: recovered pfn 0x61646
>   Unpoison: Unpoisoned page 0x61646 by virtio-balloon
>   MCE: Killing stress:24502 due to hardware memory corruption fault at 7f5be2e5a010
> 
> And the 'HardwareCorrupted' in /proc/meminfo also shows 0 kB.
> 
> About the protocol of virtio balloon recover VQ, it's undefined and in
> developing currently:
> - 'struct virtio_balloon_recover' defines the structure which is used to
>    exchange message between guest and host.
> - '__le32 corrupted_pages' in struct virtio_balloon_config is used in the next
>    step:
>    1, a VM uses RAM of 2M huge page, once a MCE occurs, the 2M becomes
>       unaccessible. Reporting 512 * 4K 'corrupted_pages' to the guest, the guest
>       has a chance to isolate the 512 pages ahead of time.
> 
>    2, after migrating to another host, the corrupted pages are actually recovered,
>       once the guest gets the 'corrupted_pages' with 0, then the guest could
>       unpoison all the poisoned pages which are recorded in the balloon driver.
> 
> zhenwei pi (3):
>    memory-failure: Introduce memory failure notifier
>    mm/memory-failure.c: support reset PTE during unpoison
>    virtio_balloon: Introduce memory recover
> 
>   drivers/virtio/virtio_balloon.c     | 243 ++++++++++++++++++++++++++++
>   include/linux/mm.h                  |   4 +-
>   include/uapi/linux/virtio_balloon.h |  16 ++
>   mm/hwpoison-inject.c                |   2 +-
>   mm/memory-failure.c                 |  59 ++++++-
>   5 files changed, 315 insertions(+), 9 deletions(-)
> 

-- 
zhenwei pi

