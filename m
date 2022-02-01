Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C64A5AA3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:53:41 +0100 (CET)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqn6-0002Yj-GG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqkq-0000kU-NG
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:20 -0500
Received: from [2a00:1450:4864:20::533] (port=42573
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEqkp-0000JB-AW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:51:20 -0500
Received: by mail-ed1-x533.google.com with SMTP id p12so33367727edq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M0hgBloliqO6kdA2A98z9OM8M/F/C+9UBdvccCcnTyM=;
 b=C+zwc5J+Sob70W+nZ5HX7qObU72cyBHFHoK7N0RvYJEmWtUn4qOZxd1MGi1veSWbU1
 pDxPIWQB5htMsVVPfBdZqgAwzh+cX4v0WvPaG/1M8L00LzJ9tf7A+GBpCTykHnvwqYro
 AoXSM5cu0NOCLNj28mjoY8i9E61AB9XHat+a5ERrRfcnfyxyV3a0exWwYj+ZjBcu5aVz
 YorJsIQyd3kTP6jEMhWRGDKUpO+nBJ7JgTARSkUti++iDz0Vzy/1oY5jyeODwf9iRSll
 2CJftRscMZXJJ3kEtQezN3CCC3O9vdJ1NqNIcX93fKyo0fv8QZBCp3s2aeir/pktE8EU
 oDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M0hgBloliqO6kdA2A98z9OM8M/F/C+9UBdvccCcnTyM=;
 b=xwPp6kZfLS4iIDPjYahT1sonphQfqCenKgEsdTLV+T8TYd417624lUlnCNYrFJ6A5w
 /QePfCfHpZ9fyb5yS39LKbkqWQL+7hqJ0kdIl7Wq2wA9JOLJ7WG3+0e73Q7R8b2WIbhX
 6KUx0SE5rEX7VZtLQ0lsuxWwnakMxhceCtE3LJV2j2TahDR1jyAfhZsusQUC7txlsVpE
 fhpZCG/rlL2/6FccP6zickLhTeldnY1kMPqJHuqTicD0HbMhlTD0dBrArYp8bxAKQvgo
 GE7/of1Qp8Okzm0/R/cmSHUhzZf6UG3SITWyvT6wOPrSNpoXRnNfllqzgqEurfKHbJ7F
 97tg==
X-Gm-Message-State: AOAM5308HSwa79njCJB/F2DZDMhun+suxpOsMZDFi5eVNZG6NrCSjP6H
 BqV2M0jHx888Of9e6YdbWb8=
X-Google-Smtp-Source: ABdhPJycTqxX+jPT0xVb0BiV3qgVBhr+fuXCffewU6lDuEtPYSAJT8fbrVhE356nKEuTkRvbuoQlag==
X-Received: by 2002:aa7:c6c8:: with SMTP id b8mr24875027eds.392.1643712677815; 
 Tue, 01 Feb 2022 02:51:17 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id cz6sm13912696edb.4.2022.02.01.02.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:51:17 -0800 (PST)
Message-ID: <6b3f5a30-6f66-5aa7-293a-d6ee59487158@redhat.com>
Date: Tue, 1 Feb 2022 11:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] kvm: Support for querying fd-based stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-4-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220131194312.1192626-4-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 20:43, Mark Kanda wrote:
> 
> +    for (i = 0; i < header->num_desc; ++i) {
> +        struct kvm_stats_desc *pdesc = (void *)stats_desc + i * size_desc;
> +        size_data = pdesc->size * sizeof(uint64_t);
> +
> +        uint64_t *stats_data = g_malloc(size_data);
> +
> +        ret = pread(stats_fd, stats_data, size_data,
> +                    header->data_offset + pdesc->offset);

How hard would it be to cache the descriptors?  Ideally, a query-stats 
command would do only one pread.

Paolo

