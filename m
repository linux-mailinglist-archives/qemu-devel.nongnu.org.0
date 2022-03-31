Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC34ED5FC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:42:18 +0200 (CEST)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqNl-0001Pm-Fl
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:42:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZqJQ-0004UN-1S
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZqJN-0006Jh-45
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648715864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phayYJ43pULDQ8zD+w8DLkWjQ7uzi24D+DNBX6YouGo=;
 b=YavPHX2RLeCq7qHVDl4IxNOv+JwITYML9ccMU4vPqAsuWpJhnkLwWt4ICa3OvgZ0pqEQOZ
 3Bz+r1Ej0z6XbpMu1gjQmOVqm8YBGm6730plTMoZ3aLmhVv/WZUyHeSfXTAGu6PKSt5njX
 Odrn3vKrfPiftbrKr9cWGNhDK64Lnbw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-4jNzat6VMhOzIVmmAme1fA-1; Thu, 31 Mar 2022 04:37:43 -0400
X-MC-Unique: 4jNzat6VMhOzIVmmAme1fA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a05600c214200b0038c7c02deceso887105wml.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=phayYJ43pULDQ8zD+w8DLkWjQ7uzi24D+DNBX6YouGo=;
 b=Yk9Zsk58UgiChppVzQM/9+3UOjdro0YxNvm3xO/XVuFOuaq/z8+qup48MCBU0wVsau
 YB9w8nXlE44B976qTQ0iOV2M8/jJFR6xmUx+lL3qOcwIgHR02/lvUvdVvy60mEfDNsSd
 AScQGp/5GlccwJ+mcgi5kRvSAcUEfkYaRRIRwbpT9sqdRLHpjroa1R9ShBJomRdwmIm+
 1UzE8GWDPFWe/wOxnLieR/5eNzUiDvBlrKVqrScTPC3slnBNA3vyR3acIqc4JTULAfGK
 tEKU2nYmtn3j6shs/I5MVbIGUI2H4UjJHbZ06RiR4UBQLOwYrJJdoggC7DCfmTHb3Z/3
 tvqQ==
X-Gm-Message-State: AOAM5327YHMwVi4jTN1xesqfJVhB/314bVBM6k4NvSiTpCao4/bW7djE
 Z0L679DqVVpreaAc1aGr+97OTcKNPdefEDgjwvMmFd6Qq5Jo91cA6AWyZqnTMz37FEIPVIPpVYF
 KAmshtndtjZc/Mvo=
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id
 h17-20020a1ccc11000000b00389e8aaad4bmr3646837wmb.79.1648715862040; 
 Thu, 31 Mar 2022 01:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPQWw9hh6TPVW8aY7PauZrVPtYWjWXgGV8y8cjcyRtxkRmTMVznwZfOm+x9vij0FrscOL+9g==
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id
 h17-20020a1ccc11000000b00389e8aaad4bmr3646802wmb.79.1648715861650; 
 Thu, 31 Mar 2022 01:37:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:ac00:381c:2e8b:3b48:488e?
 (p200300cbc707ac00381c2e8b3b48488e.dip0.t-ipconnect.de.
 [2003:cb:c707:ac00:381c:2e8b:3b48:488e])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d48d0000000b00205cf199abcsm6278825wrs.46.2022.03.31.01.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 01:37:40 -0700 (PDT)
Message-ID: <3888d585-c090-24b4-3be9-7be3f03ddadb@redhat.com>
Date: Thu, 31 Mar 2022 10:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
To: Andrey Ryabinin <arbn@yandex-team.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220325154013.16809-2-arbn@yandex-team.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.03.22 16:40, Andrey Ryabinin wrote:
> The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
> function calls leads to leaking some memory.
> 
> ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
> for new memory. These blocks only grow but never shrink. So the
> qemu_ram_free() restores RAM size back to it's original stat but
> doesn't touch dirty memory bitmaps.
> 
> After qemu_ram_free() there is no way of knowing that we have
> allocated dirty memory bitmaps beyond current RAM size.
> So the next ram_block_add() will call dirty_memory_extend() again to
> to allocate new bitmaps and rewrite pointers to bitmaps left after
> the first ram_block_add()/dirty_memory_extend() calls.
> 
> Rework dirty_memory_extend() to be able to shrink dirty maps,
> also rename it to dirty_memory_resize(). And fix the leak by
> shrinking dirty memory maps on qemu_ram_free() if needed.
> 
> Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>

I looked at this a while ago and I think the problem is more involved,
because we might actually generate holes for which we can free the
bitmap. I think this patch impoves the situation, though.


IIRC if you hotplug two dimms and then hotunplug only the latter, the
bitmap for the first dimm will remain as long as the second dimm isn't
hotunplugged.


-- 
Thanks,

David / dhildenb


