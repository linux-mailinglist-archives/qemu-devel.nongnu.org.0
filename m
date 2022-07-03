Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBF5645A9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 09:54:11 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7uQk-0007is-BY
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 03:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o7uPL-00070j-E2
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 03:52:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o7uPJ-0008I5-B6
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 03:52:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m2so6000788plx.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :content-language:from:in-reply-to:content-transfer-encoding;
 bh=peeYdNeJPx+4AgbCe+9HyHiLKFSTEdlEScJB8BUBTKw=;
 b=ExFRqOfu9W5M9xj8PLzpnGtBMiLFSsVG5CDntys86JJMraZMlUbOB74SThSHmR2R2u
 YOqj824rXvWTQLI0QCP3LsnCo8nAV7xL3Q4ECnjeXYKpXWssOmGTUgZe1INY5Q7ep1vE
 buL0bfRJSuDdPU590cg/9uEscqExyoHbN/Ng8cgXs10QaUJm3RwnB2A8MeI1vDGoLns1
 KAXcWIIMC2kZ7H8plaw+w0DNT6jLwOfd0F+Iq84CWz4IY5IsLUikRCnmn8xmWdW5ystJ
 Djoe0DmeJki0xszNVgm6q1ue0vfL/bqBJsxFBmVuaUVeNpuUcUFcY4ODPzHO86McYBJC
 bk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:content-language:from:in-reply-to
 :content-transfer-encoding;
 bh=peeYdNeJPx+4AgbCe+9HyHiLKFSTEdlEScJB8BUBTKw=;
 b=Dik2VAH+pTR1cWeyKbdtM7IN8JkRcCawGiXjQvHVOTaZvfBc0MAINcGNauUI0ZOMeA
 K35IjEq2ild0l57ZIGV0q5YTqy93Rj73St4+Ptc6XNx0aGwjAHDmaHOjt5NasNMC9Tru
 yULBltTYqKFYatXhm7Ld2l30A+NmgvjyN99Qe/z6C1+Fp0WcoW60tTiEususceJChBLp
 oyJxa+xKXtfDz+7PTHj8xQfEejtLUuaDnqYGyvQAfFRlq6EOz+FJ48KpkVAYS+DZIonD
 a7gChuj0+z8MeEyjjIGD0dFrMP7hsSIzF48fh6wJPCiM/r3b7HJUOnVZ/JCEXhjO7pWT
 YkDQ==
X-Gm-Message-State: AJIora/ZWLEXb/NJHoPA0v7MKhdstj0nYxzTUyOAQf/4qGbeN4BNzHuD
 +9MgVdrggfI4VywIYKmpdjg=
X-Google-Smtp-Source: AGRyM1teLAyIxg/J894aRsHhaa53LaIiN2MWa9MLYWXZNOIy0jfo1oUvRlUg/KBcm83QKOBacUkHZA==
X-Received: by 2002:a17:90b:4a03:b0:1ed:2071:e8c with SMTP id
 kk3-20020a17090b4a0300b001ed20710e8cmr29776108pjb.216.1656834757911; 
 Sun, 03 Jul 2022 00:52:37 -0700 (PDT)
Received: from ?IPV6:2404:f801:0:5::ce? ([2404:f801:9000:18:6fec::ce])
 by smtp.gmail.com with ESMTPSA id
 ru10-20020a17090b2bca00b001e880972840sm7342252pjb.29.2022.07.03.00.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 00:52:37 -0700 (PDT)
Message-ID: <0923b31f-1c59-a44b-303b-5bc2056f1e69@gmail.com>
Date: Sun, 3 Jul 2022 15:52:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH V8 12/39] memory: flat section iterator
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-13-git-send-email-steven.sistare@oracle.com>
Content-Language: en-US
From: Peng Liang <tcx4c70@gmail.com>
In-Reply-To: <1655304746-102776-13-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=tcx4c70@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/15/2022 10:51 PM, Steve Sistare wrote:
> Add an iterator over the sections of a flattened address space.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
>  softmmu/memory.c      | 20 ++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index a03301d..6a257a4 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2343,6 +2343,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
>                                             RamDiscardManager *rdm);
>  
>  /**
> + * memory_region_section_cb: callback for address_space_flat_for_each_section()
> + *
> + * @mrs: MemoryRegionSection of the range
> + * @opaque: data pointer passed to address_space_flat_for_each_section()
> + * @errp: error message, returned to the address_space_flat_for_each_section
> + *        caller.
> + *
> + * Returns: non-zero to stop the iteration, and 0 to continue.  The same
> + * non-zero value is returned to the address_space_flat_for_each_section caller.
> + */
> +
> +typedef int (*memory_region_section_cb)(MemoryRegionSection *mrs,
> +                                        void *opaque,
> +                                        Error **errp);
> +
> +/**
> + * address_space_flat_for_each_section: walk the ranges in the address space
> + * flat view and call @func for each.  Return 0 on success, else return non-zero
> + * with a message in @errp.
> + *
> + * @as: target address space
> + * @func: callback function
> + * @opaque: passed to @func
> + * @errp: passed to @func
> + */
> +int address_space_flat_for_each_section(AddressSpace *as,
> +                                        memory_region_section_cb func,
> +                                        void *opaque,
> +                                        Error **errp);
> +
> +/**
>   * memory_region_find: translate an address/size relative to a
>   * MemoryRegion into a #MemoryRegionSection.
>   *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 0fe6fac..e5aefdd 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2683,6 +2683,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)
>      return !!mr->container || mr->mapped_via_alias;
>  }
>  
> +int address_space_flat_for_each_section(AddressSpace *as,
> +                                        memory_region_section_cb func,
> +                                        void *opaque,
> +                                        Error **errp)
> +{
> +    FlatView *view = address_space_get_flatview(as);
> +    FlatRange *fr;
> +    int ret;
> +
> +    FOR_EACH_FLAT_RANGE(fr, view) {
> +        MemoryRegionSection mrs = section_from_flat_range(fr, view);
> +        ret = func(&mrs, opaque, errp);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +

Hi Steve,
I guess a flatview_unref(view) is missing here? Because the return value
of address_space_get_flatview has been flatview_ref.

> +    return 0;
> +}
> +
>  /* Same as memory_region_find, but it does not add a reference to the
>   * returned region.  It must be called from an RCU critical section.
>   */

