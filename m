Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC374CD7CE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:30:55 +0100 (CET)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9tM-0007Fk-JJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:30:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9G6-0005oZ-NX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:20 -0500
Received: from [2a00:1450:4864:20::42e] (port=34600
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9G5-0002o3-Az
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:50:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j26so2686635wrb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yeugmeny9qhtt9DSuMJQhjxlvN9/PffYcS8pvXFRqrI=;
 b=EFeyEEkPQ4NHZdY6Vpa5cuqW5YGoG+HpcrIarOKbaxeei+9TTGrLuQEjgc5U3sYqsa
 7pFNokre5oVVppvZDGygyfFl62j948OacTV9Y8KFMs3mitv8pV0wze2lTvGPerGVwJ71
 25YiG4qhLKsMWEUzcE6NwJatRaXwrW/XPy0l3rC65ZsGtdt8Ec7jSnFsprabF6V2VXRY
 UPJ9+oiyw+Ytjg+lwJkbsZeX3+brqp2DfPxl/I+2L3DN9YOA2V4i/K//rPJQSoUtxmZN
 v2HmNJBrBkhZKbcCzDpImRSlCxxrZsvFWYFXSZhDCdjjEmn/5mRYADgsgo8nh72xqosH
 w84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yeugmeny9qhtt9DSuMJQhjxlvN9/PffYcS8pvXFRqrI=;
 b=ckRA1cABJSyRCGi+YNZ0NucEY860M+w+fGUxLNKKw/3d7TamaEhyskPdLcWb+RXmFa
 qD98e/+68lvbLqabpsX93CXrE2DqIU3j+sq6WsunOM4VzkUpGQLumZY5FrQtnItzr64T
 SuJ31rAHkC8PvTF1rcEu5YzCQXxgXJSVKyJe7LpvbgDvrT/NkWbsF+D6PgzyZcouQEbn
 y6/qiFX/9EuR96eai0TAwa2mGabmfg5LGZx+zOqM/Uy0NgzJf3x8OdHI79KzpkitDnyt
 Wt89Gyy6VK6cN+2Q6RerFvJe7fRg9XRc0F8OKnXFdaRB6m2khX5WLR0l394sELdEuhuP
 z2Fw==
X-Gm-Message-State: AOAM531zoPzPGAUnrHxDzUMmQrL1xDemmgxKWEMHVR5xFOEFyQTTX31M
 MwFLfcXC/Ic8g7TcYm7Va4c=
X-Google-Smtp-Source: ABdhPJxEJ2G7wBZ7flgWp/7897MUyLuZ14jQZUbelM/NNgAAnpNgwUGfzpp7PSBfy3MuyiesRx8yJQ==
X-Received: by 2002:a5d:6da1:0:b0:1e3:2bf5:13c with SMTP id
 u1-20020a5d6da1000000b001e32bf5013cmr31816359wrs.316.1646405415548; 
 Fri, 04 Mar 2022 06:50:15 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b003884e826642sm4826384wmq.12.2022.03.04.06.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:14 -0800 (PST)
Message-ID: <d87b6338-d1ea-3e9b-ffc0-fc822d98d26f@gmail.com>
Date: Fri, 4 Mar 2022 13:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH V7 08/29] memory: flat section iterator
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/21 20:05, Steve Sistare wrote:
> Add an iterator over the sections of a flattened address space.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>   include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
>   softmmu/memory.c      | 20 ++++++++++++++++++++
>   2 files changed, 51 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 137f5f3..9660475 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2338,6 +2338,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
>                                              RamDiscardManager *rdm);
>   
>   /**
> + * memory_region_section_cb: callback for address_space_flat_for_each_section()
> + *
> + * @s: MemoryRegionSection of the range

Nitpicking, can we name this @mrs?

> + * @opaque: data pointer passed to address_space_flat_for_each_section()
> + * @errp: error message, returned to the address_space_flat_for_each_section
> + *        caller.
> + *
> + * Returns: non-zero to stop the iteration, and 0 to continue.  The same
> + * non-zero value is returned to the address_space_flat_for_each_section caller.
> + */
> +
> +typedef int (*memory_region_section_cb)(MemoryRegionSection *s,
> +                                        void *opaque,
> +                                        Error **errp);

