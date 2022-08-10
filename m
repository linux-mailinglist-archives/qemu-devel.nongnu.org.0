Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C158ED1A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:25:25 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLli8-0005nt-78
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlJB-0004Ob-KY
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlJ9-0000vK-Qd
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwoUzGLS3LHU7Fp+H6fj/OMTXVWnQO4phbdwjd90iZ4=;
 b=fjoZxI9XU/mgYTno4XDHORZHyRgy7JHWaVWcBvdWcsj1HlDyKYlJ/GSiSm59UAZwiGMngX
 lMZUssnyEpOQErOnB1upZl43R1Cml7d5wFXUX60qgSAOWZLjqXzrw4ywFTXM3HPYucbfvt
 vvdhbBBsXaVkzbZSuDyPGW8spXVyQGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-DnBt6hqvMk-AFZRKA8JI4g-1; Wed, 10 Aug 2022 08:59:34 -0400
X-MC-Unique: DnBt6hqvMk-AFZRKA8JI4g-1
Received: by mail-wm1-f72.google.com with SMTP id
 r5-20020a1c4405000000b003a534ec2570so1055209wma.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 05:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=NwoUzGLS3LHU7Fp+H6fj/OMTXVWnQO4phbdwjd90iZ4=;
 b=IGAwsFE6xpBqrBdJWTYED6ypegtt5VNDVpBoE96/rGaGgDe0+BufaVLOohWWqRYUbb
 I+FFBgzYGGRgJEeZVLYExMp8bFMyPOiaqmBC8RJl9KbY6z6o0hAeYxPAAroJI3dNQGLJ
 FoIRYBSMkUZBHOJtL/CWTRB2RdlJpqfZlEiSuZXcfPHxOuKfCEVWLUDnJDIEraB+KIj4
 L3o5EtdYnp6LMIUt0HUiKL5KcNWaGcX0hM/yTYEzCkylPhDEiMpsWYyuSSd0CM45Y08a
 CSh/vxSb+nULHqcqF8ek6iIvvv64mhEbOpkC7fqZvKwgk8sZ9KEBGE/O1kWc16DWKnIs
 8fAA==
X-Gm-Message-State: ACgBeo3WwHd8U/p+K9TxxafZFZFZrZNUWvi9HACY5kKV/f48Qr2KCbwJ
 9kDdiJ6ywavdXh/ubUu6/x30foo4z6jQWc11ag4YAdkz0rrBmVgRRiKBJUxCSz5k4m5Wzu1t4Ok
 5NE9ziafXY7kTRAk=
X-Received: by 2002:a05:600c:3d0a:b0:3a3:561c:a9c9 with SMTP id
 bh10-20020a05600c3d0a00b003a3561ca9c9mr2470755wmb.1.1660136372941; 
 Wed, 10 Aug 2022 05:59:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7RPkVnmfj146uZHzyc9rJzzRckvtEr82uIx4eb02uWAruRt3WX0aCKiXX8jw2yrrQ8avD9pQ==
X-Received: by 2002:a05:600c:3d0a:b0:3a3:561c:a9c9 with SMTP id
 bh10-20020a05600c3d0a00b003a3561ca9c9mr2470740wmb.1.1660136372712; 
 Wed, 10 Aug 2022 05:59:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1600:a3ce:b459:ef57:7b93?
 (p200300cbc7071600a3ceb459ef577b93.dip0.t-ipconnect.de.
 [2003:cb:c707:1600:a3ce:b459:ef57:7b93])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a1cf710000000b003a4f1385f0asm2328069wmh.24.2022.08.10.05.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 05:59:32 -0700 (PDT)
Message-ID: <b26ef69b-fd40-cd6b-495b-99f804abd62f@redhat.com>
Date: Wed, 10 Aug 2022 14:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] backends/hostmem: Fix support of
 memory-backend-memfd in qemu_maxrampagesize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-2-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220810125720.3849835-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 10.08.22 14:57, Thomas Huth wrote:
> It is currently not possible yet to use "memory-backend-memfd" on s390x
> with hugepages enabled. This problem is caused by qemu_maxrampagesize()
> not taking memory-backend-memfd objects into account yet, so the code
> in s390_memory_init() fails to enable the huge page support there via
> s390_set_max_pagesize(). Fix it by generalizing the code, so that it
> looks at qemu_ram_pagesize(memdev->mr.ram_block) instead of re-trying
> to get the information from the filesystem.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  backends/hostmem.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 624bb7ecd3..4428e06738 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -306,22 +306,12 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
>      return backend->is_mapped;
>  }
>  
> -#ifdef __linux__
>  size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>  {
> -    Object *obj = OBJECT(memdev);
> -    char *path = object_property_get_str(obj, "mem-path", NULL);
> -    size_t pagesize = qemu_mempath_getpagesize(path);
> -
> -    g_free(path);
> +    size_t pagesize = qemu_ram_pagesize(memdev->mr.ram_block);
> +    g_assert(pagesize >= qemu_real_host_page_size());
>      return pagesize;
>  }
> -#else
> -size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
> -{
> -    return qemu_real_host_page_size();
> -}
> -#endif
>  
>  static void
>  host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


