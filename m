Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39D3C140B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:14:39 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TrS-0005BY-5P
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1Tgt-0003kN-K3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1Tgr-0007TB-Qi
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdvzIyaOQid/WsVDpvoK58sZ2264TRhtzkfOb+UYERM=;
 b=GnD2qqGdArsIhL62inHbpoRBXgbfJ0f+uDsUBILs/DRs/0v8Ri6W/vC5ZqgfdCiK2+9LBE
 7zFH0n8kDyBhfUjSIaD1lMBSa6+LXmckOpihDXBS8fD1B1T0J4pvEgkLFzu1eQW7H03Y2P
 51RIJJop16TGeH61WMqjpaO8sP2iX9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-slu78dLtNLCiXWw3NesRMg-1; Thu, 08 Jul 2021 09:03:39 -0400
X-MC-Unique: slu78dLtNLCiXWw3NesRMg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n11-20020a05600c3b8bb02901ec5ef98aa0so1057925wms.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XdvzIyaOQid/WsVDpvoK58sZ2264TRhtzkfOb+UYERM=;
 b=rcjWP6T0HdU5aLqmNh9+Yd0pzV6D3RhMliP7MaD/UguEOgsyAj81gRn+ZVVSNqgWUo
 BJ2vEqv1H8hUo6SoWeh2wVz+IEz51E5QXlf0TEzxHhRSQev3rfPWU68ZHUoBG2NfQN1g
 br9yFOxTpT1FNxlEkF1/Di4stdqSmHzDU3n+FVL5VmMpnoOviJ3mo9D2X81JUcrqbH8K
 x+OffS/lbtj2xCCRC0z5MPZTtzQ9la2nVif9m5EMNBpVa8KZZVz/YpTiNzsu6V0PlB/D
 GcR34zYlTvSS1dnD09YOV0t8IPLoGTMUH/Wf2A6SS3QII5fKu0jI/iPCj48jORx9Dyd6
 DNHA==
X-Gm-Message-State: AOAM533ySOLv2T7NyxODk+oWw0/AfzVfHkSa3CjJOgmTVUBqEHcLt7qU
 AzVn4DnWiX7BbZKn36thOZNt84qH9aarCKibtbvTSiTZt6+l52XzUKyfVfSOcFdM+v2iGhjiEqA
 i6YcXSHqSIEE5XhwyokdR+gqds2TuWQnqsAOVaE0njoI9x9/al7nEYm3BlkKIJdE=
X-Received: by 2002:a05:600c:a01:: with SMTP id
 z1mr5160557wmp.77.1625749418738; 
 Thu, 08 Jul 2021 06:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOqS+MhZNmlLyKbsV9RY2nIaUoiXXJwIqS8NmpPMF61xA93fnawoONvuyPekLDijNxGPyCSQ==
X-Received: by 2002:a05:600c:a01:: with SMTP id
 z1mr5160494wmp.77.1625749418365; 
 Thu, 08 Jul 2021 06:03:38 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23cf9.dip0.t-ipconnect.de. [79.242.60.249])
 by smtp.gmail.com with ESMTPSA id n5sm2175863wri.31.2021.07.08.06.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 06:03:37 -0700 (PDT)
Subject: Re: [PULL 00/15] Machine queue, 2021-07-07
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210707193241.2659335-1-ehabkost@redhat.com>
 <CAFEAcA_UybrCmOffY6HD7eiE=Ubks1LGhKYmXgQ_hYYsKMYfhQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <25625d72-e441-ca94-8038-ff065fbd659e@redhat.com>
Date: Thu, 8 Jul 2021 15:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_UybrCmOffY6HD7eiE=Ubks1LGhKYmXgQ_hYYsKMYfhQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.07.21 11:53, Peter Maydell wrote:
> On Wed, 7 Jul 2021 at 20:32, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>
>> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>>
>>    Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>>
>> for you to fetch changes up to 4dc87143b9dbc0ae5719b67b4e533c824b239f00:
>>
>>    vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus (2021-07-06 18:05:26 -0400)
>>
>> ----------------------------------------------------------------
>> Machine queue, 2021-07-07
>>
>> Deprecation:
>> * Deprecate pmem=on with non-DAX capable backend file
>>    (Igor Mammedov)
>>
>> Feature:
>> * virtio-mem: vfio support (David Hildenbrand)
>>
>> Cleanup:
>> * vmbus: Don't make QOM property registration conditional
>>    (Eduardo Habkost)
>>
> 
> Hi; this generates warnings in the docs build:
> 
> /home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Function
> parameter or member 'rdm' not described in
> 'memory_region_set_ram_discard_manager'
> /home/pm/qemu/docs/../include/exec/memory.h:2286: warning: Excess
> function parameter 'urn' description in
> 'memory_region_set_ram_discard_manager'
> 
> This seems to be because the function prototype for this
> function says it takes parameters 'mr' and 'rdm', but the
> doc comment documents 'mr' and 'urn'.

That should be easy to fix

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 87357a724a..c3d417d317 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2280,7 +2280,7 @@ static inline bool 
memory_region_has_ram_discard_manager(MemoryRegion *mr)
   * #RamDiscardManager assigned.
   *
   * @mr: the #MemoryRegion
- * @urn: #RamDiscardManager to set
+ * @rdm: #RamDiscardManager to set
   */
  void memory_region_set_ram_discard_manager(MemoryRegion *mr,
                                             RamDiscardManager *rdm);


(don't ask me how I ended up with urn instead of rdm)

-- 
Thanks,

David / dhildenb


