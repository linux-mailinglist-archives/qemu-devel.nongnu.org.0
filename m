Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B875628C8C0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 08:44:34 +0200 (CEST)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSE2z-0002OA-9u
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 02:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSE1w-0001y6-Qt
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 02:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSE1t-0007bJ-Dj
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 02:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602571403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sh/gmJbHrcAyYO0m21LzCsHCpjzZZC38c6UquA+tkIU=;
 b=LLqXPbKl2pnuTvcpfDj/W7+G+AFFI8jHHC/uhZTD/t9KMCjJnzAh5/8n3VIHr/IXnu8NjP
 r5vH+8X2bo0I+IrsCS3i4Tr8eniWiLCP3Fgf6VJuNKYX+ghrgsZc9SSnR2ebpdqty4NNic
 e5ZnMuAYswKq7/Om7LFD2qI8YkWRU3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-oJh13t_6N7Ck1SsoSVyiyQ-1; Tue, 13 Oct 2020 02:43:21 -0400
X-MC-Unique: oJh13t_6N7Ck1SsoSVyiyQ-1
Received: by mail-wm1-f70.google.com with SMTP id r19so6384502wmh.9
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 23:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sh/gmJbHrcAyYO0m21LzCsHCpjzZZC38c6UquA+tkIU=;
 b=MMTGubGADJnPy1aUV7ud97NQo/fnLlgYmLa8ImkNM8UJLTZXCVX0F/3dJdbMLXNdZn
 4xRzVDpzsPCJMh0MdBLePOlallw9sv3m7A0u44K9eiQzA3977Hn3dBqXvPK4A9AiLQ5j
 XCNTj0SSmY1yKj9Db9LYlney7cRfxGpPrkAdKQYPMyDmTYL9V1nyp1LiE04O4lCoIlJj
 kvkC33FOizyJEhnzV8zNFWEP2suavSMcwikQP4EY6MVHBHRkIkLRcbC91pbd5fF4wks0
 63QPmQbqBPjvPODbN/68gn03wQ1SawSg2Jv+WL1Yv/4RfjOhX8BpynHN84PE+T/3Y82R
 nfTw==
X-Gm-Message-State: AOAM5309t9/YdwaJOLLMhoTDgPK8pYXO6gYNvHwPzOeCjeWD2KazS/z0
 s6jrNDUdpahGEBgzYHfEbO7K9JZIJoMWNnyfHIcnHXEcQZEcmUL4bfRSNDMceKK3U+NQF4lDLAB
 dAEC+c5UK8Jad124=
X-Received: by 2002:a1c:2901:: with SMTP id p1mr14380864wmp.170.1602571400470; 
 Mon, 12 Oct 2020 23:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0EYswdSavfjYuV4awNjUjusOU6B8ETe+iSqQIMt+ZYiNDz/7lg+H3DKt2xnKiFzfD8ji2JQ==
X-Received: by 2002:a1c:2901:: with SMTP id p1mr14380845wmp.170.1602571400238; 
 Mon, 12 Oct 2020 23:43:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:61dd:85cb:23fc:fd54?
 ([2001:b07:6468:f312:61dd:85cb:23fc:fd54])
 by smtp.gmail.com with ESMTPSA id i33sm29149514wri.79.2020.10.12.23.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 23:43:19 -0700 (PDT)
Subject: Re: Why guest physical addresses are not the same as the
 corresponding host virtual addresses in QEMU/KVM? Thanks!
To: harry harry <hiharryharryharry@gmail.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
References: <CA+-xGqMd4_58_+QKetjOsubBqrDnaYF+YWE3TC3kEcNGxPiPfg@mail.gmail.com>
 <47ead258320536d00f9f32891da3810040875aff.camel@redhat.com>
 <CA+-xGqOm2sWbxR=3W1pWrZNLOt7EE5qiNWxMz=9=gmga15vD2w@mail.gmail.com>
 <20201012165428.GD26135@linux.intel.com>
 <CA+-xGqPkkiws0bxrzud_qKs3ZmKN9=AfN=JGephfGc+2rn6ybw@mail.gmail.com>
 <20201013045245.GA11344@linux.intel.com>
 <CA+-xGqO4DtUs3-jH+QMPEze2GrXwtNX0z=vVUVak5HOpPKaDxQ@mail.gmail.com>
 <CA+-xGqMMa-DB1SND5MRugusDafjNA9CVw-=OBK7q=CK1impmTQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a163c2d8-d8a1-dc03-6230-a2e104e3b039@redhat.com>
Date: Tue, 13 Oct 2020 08:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CA+-xGqMMa-DB1SND5MRugusDafjNA9CVw-=OBK7q=CK1impmTQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, PLING_QUERY=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/20 07:46, harry harry wrote:
> Now, let's assume array[0]'s GPA is different from its corresponding
> HVA. I think there might be one issue like this: I think MMU's hardware
> logic to translate ``GPA ->[extended/nested page tables] -> HPA''[1]
> should be the same as ``VA-> [page tables] -> PA"[2]; if true, how does
> KVM find the correct HPA with the different HVA (e.g., array[0]'s HVA is
> not  0x0000000000000081) when there are EPT violations?

It has separate data structures that help with the translation.  These
data structures are specific to KVM for GPA to HVA translation, while
for HVA to HPA the Linux functionality is reused.

> BTW, I assume the software logic for KVM to find the HPA with a given
> HVA (as you said like below) should be the same as the hardware logic in
> MMU to translate ``GPA -> [extended/nested page tables] -> HPA''.

No, the logic to find the HPA with a given HVA is the same as the
hardware logic to translate HVA -> HPA.  That is it uses the host
"regular" page tables, not the nested page tables.

In order to translate GPA to HPA, instead, KVM does not use the nested
page tables.  It performs instead two steps, from GPA to HVA and from
HVA to HPA:

* for GPA to HVA it uses a custom data structure.

* for HVA to HPA it uses the host page tables as mentioned above.

This is because:

* the GPA to HVA translation is the one that is almost always
sufficient, and the nested page tables do not provide this information

* even if GPA to HPA is needed, the nested page tables are built lazily
and therefore may not always contain the requested mapping.  In addition
using HPA requires special steps (such as calling get_page/put_page) and
often these steps need an HVA anyway.

Paolo


