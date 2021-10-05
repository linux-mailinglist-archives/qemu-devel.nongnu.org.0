Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96E423486
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 01:38:25 +0200 (CEST)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXu0t-0002Wc-1L
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 19:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXtzG-0001Ma-Is
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 19:36:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXtzE-0001te-TT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 19:36:42 -0400
Received: by mail-pj1-x102e.google.com with SMTP id oa4so93971pjb.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uvDN5+3ZzSFYabHVnSetB1KqRwhB2ghl6nOu+76kQrI=;
 b=m4sktw3aLLRtE1CPHPtMuJdQANH/CFzVzHPa6xxNVqoD+lZTDQjKrTDw2lzBdysN+B
 /UIS9+6qnsUkIDDBx4rZ2F2Hx13NWgGqCkp88/2qpHdMmVrxVICebodshhKCEAOYB5Uw
 K51m4h6NnDhFydVDzbCKKNnv8caN3VmIvAq/YmAHLH7s0VFeKtbmmPlI5e8k7dGblVoC
 cW2JJDnWCtf7VJgoiwMDoZOIvPJf5yR4mkc/VHrd1ESClUy7Rfz/yJCfYnggg3dXTOxZ
 D3BAG9/VeOC/pG3dx59G88T47rxYsqNWUCaE5VqvnrtKJYAxLYVX+2moQ9HJkxjXUeSM
 JX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uvDN5+3ZzSFYabHVnSetB1KqRwhB2ghl6nOu+76kQrI=;
 b=fzLhxNWxxluRteyE76O/m0crWTIXwyXKeGOII/p3g5l+2IVMA7l6/u8Mk3Typs1iZL
 X1CuVOQZXpviU5uiukNDouasQeuLj8+hSEmObphc1+3vQptjGXcxTwt5KhM07eyzvRFf
 dAsBm4/lK5TBjoazHcYEoLRTwl0TdBkhmbYaA1wvMlGpG63Esz3wb+LlpqP9x624YCHc
 fEpdGfMAXSTwfpsnDqKC4hk549UXGVBYHAHPTXJbNXzb1Kk3shxVvsAEkip6b2Q+axbG
 AHSBfWs3WynD+pCqEU0+00BmrQf50LoRlrPtY7oFRouX5ySA4Z5XPW3sy1/gndJEvtof
 rLFg==
X-Gm-Message-State: AOAM532Hjk//r1LOkJ5LG4tQcWskOXablVeTYuKv9ttuGacFc+0eBzoF
 0AOh6C2oLsGGBdJ01TW+AyVd+g==
X-Google-Smtp-Source: ABdhPJwSvzEs7WGa7Y2e29GKGxsCVv2PJsgu1+fd/WLtatuyPp/rGNo18a7W4kP6iNrA69caTyCUfQ==
X-Received: by 2002:a17:90b:17cc:: with SMTP id
 me12mr7074137pjb.147.1633476998855; 
 Tue, 05 Oct 2021 16:36:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e12sm3232656pfl.67.2021.10.05.16.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 16:36:36 -0700 (PDT)
Subject: Re: [PULL 00/57] pc,pci,virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
 <20fc357d-586f-5178-6d2d-d44769f0a233@linaro.org>
 <20211005173128-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23392012-022a-ecd4-46a2-1ffa2f7a53be@linaro.org>
Date: Tue, 5 Oct 2021 16:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005173128-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 2:32 PM, Michael S. Tsirkin wrote:
> On Tue, Oct 05, 2021 at 10:21:43AM -0700, Richard Henderson wrote:
>> On 10/5/21 9:00 AM, Michael S. Tsirkin wrote:
>>> The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:
>>>
>>>     Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>     git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>>>
>>> for you to fetch changes up to c7d2f59cf940b8c8c52c29d5fa25613fe662f7b6:
>>>
>>>     hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI (2021-10-05 11:46:45 -0400)
>>>
>>> ----------------------------------------------------------------
...
>> You missed updating the stub version of these functions:
>>
>> ../src/hw/net/vhost_net-stub.c:34:5: error: conflicting types for ‘vhost_net_start’
>>     34 | int vhost_net_start(VirtIODevice *dev,
>>        |     ^~~~~~~~~~~~~~~
>> In file included from ../src/hw/net/vhost_net-stub.c:19:
>> /home/rth/qemu-publish/src/include/net/vhost_net.h:24:5: note: previous
>> declaration of ‘vhost_net_start’ was here
>>     24 | int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>        |     ^~~~~~~~~~~~~~~
>> ../src/hw/net/vhost_net-stub.c:40:6: error: conflicting types for ‘vhost_net_stop’
>>     40 | void vhost_net_stop(VirtIODevice *dev,
>>        |      ^~~~~~~~~~~~~~
>> In file included from ../src/hw/net/vhost_net-stub.c:19:
>> /home/rth/qemu-publish/src/include/net/vhost_net.h:26:6: note: previous
>> declaration of ‘vhost_net_stop’ was here
>>     26 | void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>        |      ^~~~~~~~~~~~~~
>>
>>
> 
> Indeed. I dropped these patches for now.
> Could you refetch from same tag and confirm it's ok?

Yes, that works. Applied, thanks.

r~

