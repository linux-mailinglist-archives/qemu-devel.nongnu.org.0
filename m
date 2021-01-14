Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16F2F6B43
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:40:48 +0100 (CET)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08UB-0003RT-G5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l08Rh-0002Jx-SL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l08Rf-0007sw-Rf
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJWa34xrqF6QuTqeROtO7elVavrhMnJHwGEc4V0AkZ8=;
 b=i76A1+rc8F9djBHD2AqOmoNBjYxLDQ/fX9iuxbdwMCJLV9LWKVBZvQp7a/iVzgQi3saRod
 K0F9+sSU4JqReMOKgU0l0JxGzAk8r5xqlHXbKLoHSgZLK4K8rImm1tG3oqoWqwNdw3mEZi
 eTHn4mgUAGH03eV47AhqffQ6OollRYE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-6npENWTJPzWfAXsHrJKEsw-1; Thu, 14 Jan 2021 14:38:06 -0500
X-MC-Unique: 6npENWTJPzWfAXsHrJKEsw-1
Received: by mail-ej1-f70.google.com with SMTP id u25so2647509ejf.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gJWa34xrqF6QuTqeROtO7elVavrhMnJHwGEc4V0AkZ8=;
 b=YcmzXJ+0oAxkUKtwTKwRnQZgCK+UAZUXKfJfWwhfXLaNvw351Q/86Iz/TZobdkWtSL
 oO8Td6S1R+SHAcCcrfW0RDmrdqbo0Ra5KLLHjyWvCZupI4FtJOpJU76v+OTo/szgJ7Vs
 toafggRa14vvhnvK6c+ChDSIdsJnbQdIEZPxnL6vN9Tmh625S+byVHj3fbKcgmHPTiVf
 shyRB1i8REJBhaXPERdwczAo3pO4PQ8qAie2mtsByDSgb3Wu9IRCJJCOXbeT52rRvUD3
 a6OiF1FIZA7dZUBQ7TUiYcbwRJUD67t8OBBCxUCpxbHK596aT39uS3gRHWTYnyQ5+oB7
 MH0g==
X-Gm-Message-State: AOAM530EK+dq4obvG2jqWbq37ZX/EHAMQoxr+wLGRFIjMp79FL1whfgq
 2GGjPIS1bviH6u0OcOshUaxSbqTVn6gBWOaEGfcFpY6UvOPeWFK0saDjIFbLf9uS4gE4fLCq1hz
 fnJqrIImWIk7tm30=
X-Received: by 2002:a17:906:7156:: with SMTP id
 z22mr6274821ejj.441.1610653085078; 
 Thu, 14 Jan 2021 11:38:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/Ny2ivo/t92m5vGPjZxhxB7AkF7vHPEPCww7VcuMzD+wwe2JVca1z7kbU3WFHB5a/DESS5g==
X-Received: by 2002:a17:906:7156:: with SMTP id
 z22mr6274814ejj.441.1610653084872; 
 Thu, 14 Jan 2021 11:38:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d6sm2305619ejy.114.2021.01.14.11.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 11:38:04 -0800 (PST)
Subject: Re: [PATCH] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210111222729.757402-1-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd1d537d-034a-149d-d3a6-99b150afddad@redhat.com>
Date: Thu, 14 Jan 2021 20:38:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111222729.757402-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: mprivozn@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 23:27, Igor Mammedov wrote:
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
> 
> PS:
> While at it add a comment to x-use-canonical-path-for-ramblock-id,
> to make sure it won't go away by accident.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   backends/hostmem.c |  8 ++++++++
>   qemu-options.hx    | 25 ++++++++++++++++++++++++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4bde00e8e7..f6f4e818c7 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -497,6 +497,14 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
>           host_memory_backend_get_share, host_memory_backend_set_share);
>       object_class_property_set_description(oc, "share",
>           "Mark the memory as private to QEMU or shared");
> +    /*
> +     * Do not delete/rename option till 4.0 and older machine types exist,
> +     * Option will be used by upper layers to override (disable) canonical path
> +     * for ramblock-id set by compat properties on old machine types ( <= 4.0),
> +     * to keep migration working when backend is used for main RAM with
> +     * -machine memory-backend= option (main RAM historically used prefix-less
> +     * ramblock-id).
> +     */
>       object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
>           host_memory_backend_get_use_canonical_path,
>           host_memory_backend_set_use_canonical_path);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 459c916d3d..c02628bd26 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -35,7 +35,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>       "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>       "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>       "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
> -    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
> +    "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> +    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
>       QEMU_ARCH_ALL)
>   SRST
>   ``-machine [type=]name[,prop=value[,...]]``
> @@ -96,6 +97,28 @@ SRST
>       ``hmat=on|off``
>           Enables or disables ACPI Heterogeneous Memory Attribute Table
>           (HMAT) support. The default is off.
> +
> +     ``memory-backend='id'``
> +        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
> +        Allows to use a memory backend as main RAM.
> +
> +        For example:
> +        ::
> +        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> +        -machine memory-backend=pc.ram
> +        -m 512M
> +
> +        Migration compatibility note:
> +        a) as backend id one shall use value of 'default-ram-id', advertised by
> +        machine type (available via ``query-machines`` QMP command)
> +        b) for machine types 4.0 and older, user shall
> +        use ``x-use-canonical-path-for-ramblock-id=on`` backend option,
> +        if migration to/from old QEMU (<5.0) is expected.
> +        For example:
> +        ::
> +        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=on
> +        -machine memory-backend=pc.ram
> +        -m 512M
>   ERST
>   
>   HXCOMM Deprecated by -machine
> 

Queued, thanks.

Paolo


