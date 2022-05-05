Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736DD51C266
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:23:35 +0200 (CEST)
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmcOE-00045d-1g
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmcN2-0003D5-Jt
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:22:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:55436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmcMy-0005EH-R9
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651760535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkhAWcVhJqL4s1ykislV5VUffOd/HdV8eIols2nSoQE=;
 b=Bdrh2J6M/uHDReQtYI7KddnS9LsIzIxFwWOa3FCEHpboJ6zbDaIOlLwi74zWquO0bA2rU6
 WybFGJQhq8Sw53x0D59ENGHuDHU4Q+tTJJncjksxBaSLiZ4X7S7KclXNsCeimPkgHXggIf
 yRZEj7Dr+jrml0WrGq3icXjFulTLeS0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-DBr1cvL0NKS0SQ6TGKDkEw-1; Thu, 05 May 2022 10:22:14 -0400
X-MC-Unique: DBr1cvL0NKS0SQ6TGKDkEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso1515840wro.23
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 07:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=GkhAWcVhJqL4s1ykislV5VUffOd/HdV8eIols2nSoQE=;
 b=5t8QzLkPZYNZW0kjLP6C7qOd3CKBUELRRrhlFu/y7w3lJG2ITDX4+rtV8D8JDFVa5E
 v0YEK3KTSvvhxXZ9eg5koK9nI+PGAZg3PWP5G5GzveMN0whBzuOsOcNvbBiPGeH3lEoh
 PTepmb/Td+zHQtTVukL3eeHTzAsPQDV+wL6UMi6imygBZ0PGYhgI23yzFqZ/X+J5fRlA
 pl87ynZrBgj1YXT5Rd0hVA7bTQA6++85wcxk2aF0DFiIor1dzKaCO/rPVbQ6nM/0vJEQ
 5GvziSSlkPy0KQBFnyqhAnT9YnCqor1DyyZjS82Ex2ZI//KEX3bMI90AV+ei9fXTtull
 zeqw==
X-Gm-Message-State: AOAM5334tfVIoaoMFZZeQCPupdzcnh5+EN742DFlWbVZF2bZrwR7qk5l
 +uoXkI03qAeMl9U4LmLJo0IiazDCAu2uUlq+eNfwFwZcxu5P9NH2y+W+HjYlHjnEv0zPqNx9R5m
 kJgfFKNsQVF7BaUKxG2QiydLr90i8Kq4iSJ9cw/B8TnnrsRrOIzWceH/odDlodXM=
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr5146438wmk.58.1651760532450; 
 Thu, 05 May 2022 07:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB95Ul4hQEwWcipGlbFXIIUmisBmPToA2C+2nZegqaSoIN1FJNN7tCB8qbghtGAijVZkQTEQ==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr5146405wmk.58.1651760532119; 
 Thu, 05 May 2022 07:22:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056000118300b0020c5253d8bcsm1360822wrx.8.2022.05.05.07.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 07:22:11 -0700 (PDT)
Message-ID: <c229d1ce-dad5-468b-4b69-451cc40071ab@redhat.com>
Date: Thu, 5 May 2022 16:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] accel/tcg: Fix cpu_ldq_be_mmu typo
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220315002506.152030-1-richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220315002506.152030-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 15/03/2022 01.25, Richard Henderson wrote:
> In the conversion to cpu_ld_*_mmu, the retaddr parameter
> was corrupted in the one case of cpu_ldq_be_mmu.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/902
> Fixes: f83bcecb1 ("accel/tcg: Add cpu_{ld,st}*_mmu interfaces")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This really should have affected all big-endian guests regardless
> of the host.  I have no idea how the referenced test case fails
> on s390x and ppc64le hosts, but passes on x86_64 host.
> 
> 
> r~
> 
> ---
>   accel/tcg/cputlb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 3b918fe..2035b2a 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2174,7 +2174,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
>   uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
>                           MemOpIdx oi, uintptr_t ra)
>   {
> -    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
> +    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
>   }
>   
>   uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,

CC: to qemu-stable.

The problem apparently also broke some versions of Python, see:

  https://bugzilla.redhat.com/show_bug.cgi?id=2080519#c14

So in case we're doing a 6.2.1 release, it would be nice to integrate this 
patch there, too.

  Thomas


