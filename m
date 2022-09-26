Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9B5EAB59
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:42:49 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqFs-00009Y-Df
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ocpUT-0005oZ-P2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ocpUQ-0008SH-8y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664204024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiDPhoXeiEYDPNNsZkNx5skNUhZVDc2YhX8tUxT6Z4I=;
 b=I69vIwIbKD5SlFoNXWwmisHRh1gfDj4W1VbsTcoveEhKWzXVCJ+/OD1y3ILWdkLXq2vvZ/
 6Rbzv4SDinkS+opYa15ncFnyqceuB+2CSdpWvdsKB01mpGcoGm0UedhmQ8omGJYSgPkxID
 FxgI6Oz12G4lgYZ1a4xkmVV6BtmxsIk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-vJ_HnjkwOTywNQUr7g-AGg-1; Mon, 26 Sep 2022 10:53:43 -0400
X-MC-Unique: vJ_HnjkwOTywNQUr7g-AGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s5-20020adfa285000000b0022ad5c2771cso1262184wra.18
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 07:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=JiDPhoXeiEYDPNNsZkNx5skNUhZVDc2YhX8tUxT6Z4I=;
 b=uCvVAyqiH8CXyFKxo9XL29J4e/vikGBC5FGz7s6nA2/iJdWKHpHw5XioBjRegi3QEI
 yQ1unj1cGSoOe3Px+PMMvAx1eFSrkVidvbPJvVvVJLvG/9eimOckvirkMfOKAJVBqRga
 BhOhRBdcaI75H+bfaFsRtM2AhVuKd1AtrdLxq8lYsHXhdaYnapw3dyvtCXKxEr5HK0fe
 MX+Dmg4IL+uzhkbnLlKYvOD+vBLW+UEB22BCoiboC/FpDcRFnysz5YZaU7xEvQkqTRIP
 d4PaILnmaFXVFm5pm7m1GCZQLsaOho0rt9wcyaLxxrLfpbrfhy6IgLaFNeuWwMVU/D3C
 wJ/g==
X-Gm-Message-State: ACrzQf2NcATIADdrYbDOK+sbMjp7Tn8uSO2xh9HOCSZ1mm0gJpLXUtvL
 bnB763OlrrSLV3UhX/jq/ybF+zeLfMU+dd6wD5akSNyzLv9mjFYc5eiWMpWQEJcbsAYNaDLyua8
 vTPDoz5sbzTspVRw=
X-Received: by 2002:a05:600c:a07:b0:3ab:945:77c4 with SMTP id
 z7-20020a05600c0a0700b003ab094577c4mr22424218wmp.97.1664204020702; 
 Mon, 26 Sep 2022 07:53:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4F1aj6dFmsu9oiMooh87XJHOqSDiWx3ICISxNlRpzSCeG1iwk0ewGaZ3Lrv8KXjMX88Z1kZg==
X-Received: by 2002:a05:600c:a07:b0:3ab:945:77c4 with SMTP id
 z7-20020a05600c0a0700b003ab094577c4mr22424160wmp.97.1664204020377; 
 Mon, 26 Sep 2022 07:53:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7?
 (p200300cbc7034b00e0907fa6b7d6d4a7.dip0.t-ipconnect.de.
 [2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7])
 by smtp.gmail.com with ESMTPSA id
 r64-20020a1c4443000000b003b4935f04a4sm13954042wma.5.2022.09.26.07.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 07:53:39 -0700 (PDT)
Message-ID: <0a99aa24-599c-cc60-b23b-b77887af3702@redhat.com>
Date: Mon, 26 Sep 2022 16:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <20220923005808.vfltoecttoatgw5o@box.shutemov.name>
 <f703e615-3b75-96a2-fb48-2fefd8a2069b@redhat.com>
 <20220926144854.dyiacztlpx4fkjs5@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220926144854.dyiacztlpx4fkjs5@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26.09.22 16:48, Kirill A. Shutemov wrote:
> On Mon, Sep 26, 2022 at 12:35:34PM +0200, David Hildenbrand wrote:
>> On 23.09.22 02:58, Kirill A . Shutemov wrote:
>>> On Mon, Sep 19, 2022 at 11:12:46AM +0200, David Hildenbrand wrote:
>>>>> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
>>>>> index 6325d1d0e90f..9d066be3d7e8 100644
>>>>> --- a/include/uapi/linux/magic.h
>>>>> +++ b/include/uapi/linux/magic.h
>>>>> @@ -101,5 +101,6 @@
>>>>>     #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
>>>>>     #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
>>>>>     #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
>>>>> +#define INACCESSIBLE_MAGIC	0x494e4143	/* "INAC" */
>>>>
>>>>
>>>> [...]
>>>>
>>>>> +
>>>>> +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
>>>>> +			 int *order)
>>>>> +{
>>>>> +	struct inaccessible_data *data = file->f_mapping->private_data;
>>>>> +	struct file *memfd = data->memfd;
>>>>> +	struct page *page;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	*pfn = page_to_pfn_t(page);
>>>>> +	*order = thp_order(compound_head(page));
>>>>> +	SetPageUptodate(page);
>>>>> +	unlock_page(page);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
>>>>> +
>>>>> +void inaccessible_put_pfn(struct file *file, pfn_t pfn)
>>>>> +{
>>>>> +	struct page *page = pfn_t_to_page(pfn);
>>>>> +
>>>>> +	if (WARN_ON_ONCE(!page))
>>>>> +		return;
>>>>> +
>>>>> +	put_page(page);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
>>>>
>>>> Sorry, I missed your reply regarding get/put interface.
>>>>
>>>> https://lore.kernel.org/linux-mm/20220810092532.GD862421@chaop.bj.intel.com/
>>>>
>>>> "We have a design assumption that somedays this can even support non-page
>>>> based backing stores."
>>>>
>>>> As long as there is no such user in sight (especially how to get the memfd
>>>> from even allocating such memory which will require bigger changes), I
>>>> prefer to keep it simple here and work on pages/folios. No need to
>>>> over-complicate it for now.
>>>
>>> Sean, Paolo , what is your take on this? Do you have conrete use case of
>>> pageless backend for the mechanism in sight? Maybe DAX?
>>
>> The problem I'm having with this is how to actually get such memory into the
>> memory backend (that triggers notifiers) and what the semantics are at all
>> with memory that is not managed by the buddy.
>>
>> memfd with fixed PFNs doesn't make too much sense.
> 
> What do you mean by "fixed PFN". It is as fixed as struct page/folio, no?
> PFN covers more possible backends.

For DAX, you usually bypass the buddy and map /dev/mem or a devdax. In 
contrast to ordinary memfd that allocates memory via the buddy. That's 
the difference I see -- and I wonder how it could work.

> 
>> When using DAX, what happens with the shared <->private conversion? Which
>> "type" is supposed to use dax, which not?
>>
>> In other word, I'm missing too many details on the bigger picture of how
>> this would work at all to see why it makes sense right now to prepare for
>> that.
> 
> IIUC, KVM doesn't really care about pages or folios. They need PFN to
> populate SEPT. Returning page/folio would make KVM do additional steps to
> extract PFN and one more place to have a bug.

Fair enough. Smells KVM specific, though.

-- 
Thanks,

David / dhildenb


