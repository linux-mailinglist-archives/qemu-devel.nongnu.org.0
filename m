Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB848AE5C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:23:32 +0100 (CET)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7H7b-0003bI-QU
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Gg2-0004V0-Lc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Gfx-0004HQ-MB
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641905694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2q6h+8nCBB+6jnQJEWEin8nSobDQdlUVBQAG/QcwlI=;
 b=Ae8JCXE/OVivgy6uLunUsMpIcGDWJM35holp5w1ztjkSD4L6NwtVP+lREdAW/sRECTK+rV
 jUlmDhKv4j4zbi50tPj+h365kOL7iW2DLUb05bm+xt30wCqn/kx0YqrtgMW1duGd/Ervms
 MFTx7ZCe0HS/q02tRQ+tdf1J/mTDJwg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-9ysswLDzPZKQfBH3zcuLaw-1; Tue, 11 Jan 2022 07:54:52 -0500
X-MC-Unique: 9ysswLDzPZKQfBH3zcuLaw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z9-20020a05640240c900b003fea688a17eso2277470edb.10
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k2q6h+8nCBB+6jnQJEWEin8nSobDQdlUVBQAG/QcwlI=;
 b=5yBOE61YaeEI8H9wsNd3U7SfQYz2DKmazFxqiCjIJmc9E0O/AYarza+X0avxOqsBlQ
 Hb+cuGuLPdt+744Dp2yTN7geKZNxBYnqFFC4G5UQg7DMZGsZ8GNLc6QTE8EqPfVhYWFY
 e7xcsZjqUvc23ZsnE16mkkwszj0iPqHpj+uWxbxsI+/9zOEGk+iEZ/icFKRPc4w2z2Km
 YAKn01IavaYue+EYugoMBstVKK3OE65KzMddLuzsHK7jh2kuIcDn++i+akwVV+c5i7uN
 xvSTfYgbD1/l/ITkWp1V/qKGMJNKbhx+9Clq23PlKLeGLkxmYHp3tZFxMmUtJud0CwMx
 9SSA==
X-Gm-Message-State: AOAM531xOvI3toWhWhihgpQg64CLWGECy/K4sU6PTvaLYBzDJDu2wdon
 MaOvJnuI/TX9JpAqTmpHftRP1JDrWr6lM5ZDqP3NycsHCl7Pk0k4UkhVulSyMUKw4xQeKN5XL/X
 vh9NCawgyZjMYqlCCvGUpvbLK+KJ3tql2spWNA5Z72hcyG+ynUqV9rbAXgJX185E=
X-Received: by 2002:a17:907:2d9e:: with SMTP id
 gt30mr1164862ejc.704.1641905690666; 
 Tue, 11 Jan 2022 04:54:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylqgzKshEVh7UbNKmzUcbXLTL0+YK0VKiKl/dr6DdJx12DOdMFM7hx6uOrq6JpSTGcCNhT3A==
X-Received: by 2002:a17:907:2d9e:: with SMTP id
 gt30mr1164826ejc.704.1641905690276; 
 Tue, 11 Jan 2022 04:54:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6800:150a:bea9:f03e:c4da?
 (p200300cbc7026800150abea9f03ec4da.dip0.t-ipconnect.de.
 [2003:cb:c702:6800:150a:bea9:f03e:c4da])
 by smtp.gmail.com with ESMTPSA id l18sm3572847ejf.7.2022.01.11.04.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:54:49 -0800 (PST)
Message-ID: <bcc2a972-d086-5177-8366-a745f1e07a98@redhat.com>
Date: Tue, 11 Jan 2022 13:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
To: qemu-devel@nongnu.org
References: <20220111123939.132659-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220111123939.132659-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.01.22 13:39, David Hildenbrand wrote:
> For fd-based shared memory, MAP_NORESERVE is only effective for hugetlb,
> otherwise it's ignored. Older Linux versions that didn't support
> reservation of huge pages ignored MAP_NORESERVE completely.
> 
> The first client to mmap a hugetlb fd without MAP_NORESERVE will
> trigger reservation of huge pages for the whole mmapped range. There are
> two cases to consider:
> 
> 1) QEMU mapped RAM without MAP_NORESERVE
> 
> We're not dealing with a sparse mapping, huge pages for the whole range
> have already been reserved by QEMU. An additional mmap() without
> MAP_NORESERVE won't have any effect on the reservation.
> 
> 2) QEMU mapped RAM with MAP_NORESERVE
> 
> We're delaing with a sparse mapping, no huge pages should be reserved.
> Further mappings without MAP_NORESERVE should be avoided.
> 
> For 1), it doesn't matter if we set MAP_NORESERVE or not, so we can
> simply set it. For 2), we'd be overriding QEMUs decision and trigger
> reservation of huge pages, which might just fail if there are not
> sufficient huge pages around. We must map with MAP_NORESERVE.
> 
> This change is required to support virtio-mem with hugetlb: a
> virtio-mem device mapped into the guest physical memory corresponds to
> a sparse memory mapping and QEMU maps this memory with MAP_NORESERVE.
> Whenever memory in that sparse region will be accessed by the VM, QEMU
> populates huge pages for the affected range by preallocating memory
> and handling any preallocation errors gracefully.
> 
> So let's map shared RAM with MAP_NORESERVE. As libvhost-user only
> supports Linux, there shouldn't be anything to take care of in regard of
> other OS support.
> 
> Without this change, libvhost-user will fail mapping the region if there
> are currently not enough huge pages to perform the reservation:
>  fv_panic: libvhost-user: region mmap error: Cannot allocate memory
> 
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

Note: I was assuming rust vhost-user-backend would need similar care,
but vm-memory already does the right thing by supplying MAP_NORESERVE:

https://github.com/rust-vmm/vm-memory/blob/7a5e0696dc4170f590ac9b837e65cc4136b30e38/src/mmap_unix.rs#L264


-- 
Thanks,

David / dhildenb


