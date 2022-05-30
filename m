Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB49E537632
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:02:27 +0200 (CEST)
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaM4-0004QI-UU
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvaDe-0005KV-Ep
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvaDZ-0002ni-Dd
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653897216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW8fZRkPKfhJnNOw18gq2IWP/lJEsxr/x1aT3dj708I=;
 b=EVdq1vb6GFLwPcpgzJ2oIB67YxbGMlffnoEhOWmZ5vij6tQk/qSzRWPugBlLVGjBDqZnRu
 DjV2RrP+whRZWaEt13teJc3yEL1cHifYgo9AvzAIjiq+ImD4WWmwLvIChLiNtd2jnztfOY
 j8t6Pt/GUHYmfmD82oABQR2sjDHX1Kk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-LAzwSrk6PQSdFUcvJTDVFQ-1; Mon, 30 May 2022 03:53:33 -0400
X-MC-Unique: LAzwSrk6PQSdFUcvJTDVFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t8-20020adff048000000b002102a5877d5so439628wro.21
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lW8fZRkPKfhJnNOw18gq2IWP/lJEsxr/x1aT3dj708I=;
 b=hsZbRN4R/553JkpH6YPZfwBBnT4NZt+Mj2w7QUmfX2E4IFQTZd1KaKZbd1L+ZIxhzR
 a6A0CfmuzimyBkkSD98sQU1zewc7S2srvobbPc0sateG6dfGmzVBkjxrAn2O1yiDK+aX
 +ap0lJ2cgCsK6TUFaPZUloaqiO+OoVz3DQd2j6mlZ8DETtgHOQ1PO8ah74eL6Ys5HdZP
 Qqo3x6/N6i1BWN+qDplN4PN8zk1WTv5oEM9XGbuYYGWpJMuqBhd7AVPYZqCTWxAOIm26
 1JIXYBmqI9l0LoVQLf4VfiRqe40xiDd2wPdFOsyP2Nm2w21GS+SEPbxujgkQAa2tQ1AI
 iGuA==
X-Gm-Message-State: AOAM530kVj17zUyet5Saa2Ijf7t6j5meMmGXd2lVEwIWQdEAzGfNhLAe
 vK00KhwoCkB/avOBHc9Fjz7OJlY0p4N6j02cvxh2VHBUiEZln53BnU00G6mTu3R3xH7Gp4vkzVV
 MNGNmWGgxLhAO7e0=
X-Received: by 2002:a05:600c:3543:b0:397:7565:ea4 with SMTP id
 i3-20020a05600c354300b0039775650ea4mr17556018wmq.86.1653897211919; 
 Mon, 30 May 2022 00:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXMX0mVia1YfTVILgUPjxKu9Fq37hgGHboYr/arqWNq5GxPQTIQAE8Q8/KSnUDs6PSNUeh1A==
X-Received: by 2002:a05:600c:3543:b0:397:7565:ea4 with SMTP id
 i3-20020a05600c354300b0039775650ea4mr17555999wmq.86.1653897211629; 
 Mon, 30 May 2022 00:53:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adff486000000b0020c5253d907sm8266521wro.83.2022.05.30.00.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:53:31 -0700 (PDT)
Message-ID: <fdbdb249-8f8f-5ca9-509c-6b4a4b94236a@redhat.com>
Date: Mon, 30 May 2022 09:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>,
 Sean Christopherson <seanjc@google.com>
Cc: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-4-pizhenwei@bytedance.com>
 <Yo0zmP28FqpivlxF@google.com>
 <79d17b10-3532-57d4-e70c-3ccf1ab0d87d@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <79d17b10-3532-57d4-e70c-3ccf1ab0d87d@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 25.05.22 01:32, zhenwei pi wrote:
> 
> 
> On 5/25/22 03:35, Sean Christopherson wrote:
>> On Fri, May 20, 2022, zhenwei pi wrote:
>>> @@ -59,6 +60,12 @@ enum virtio_balloon_config_read {
>>>   	VIRTIO_BALLOON_CONFIG_READ_CMD_ID = 0,
>>>   };
>>>   
>>> +/* the request body to commucate with host side */
>>> +struct __virtio_balloon_recover {
>>> +	struct virtio_balloon_recover vbr;
>>> +	__virtio32 pfns[VIRTIO_BALLOON_PAGES_PER_PAGE];
>>
>> I assume this is copied from virtio_balloon.pfns, which also uses __virtio32, but
>> isn't that horribly broken?  PFNs are 'unsigned long', i.e. 64 bits on 64-bit kernels.
>> x86-64 at least most definitely generates 64-bit PFNs.  Unless there's magic I'm
>> missing, page_to_balloon_pfn() will truncate PFNs and feed the host bad info.
>>
> 
> Yes, I also noticed this point, I suppose the balloon device can not 
> work on a virtual machine which has physical address larger than 16T.

Yes, that's a historical artifact and we never ran into it in practice
-- because 16TB VMs are still rare, especially when paired with
virtio-balloon inflation/deflation. Most probably the guest should just
stop inflating when hitting such a big PFN. In the future, we might want
a proper sg interface instead.

-- 
Thanks,

David / dhildenb


