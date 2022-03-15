Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB34DA270
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:34:50 +0100 (CET)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUC0P-0006pY-QP
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:34:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUBxm-0005ZO-8b
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:32:08 -0400
Received: from [2607:f8b0:4864:20::42f] (port=40630
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUBxk-0003ro-3A
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:32:05 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d19so332861pfv.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7aLZzfLlS5VnBfl4PdKBny5F4Y7tGcpGiEVcQMX10x8=;
 b=pNQRu/q9bzNE5HinS2GO8s7jv32Z1Qa5myxG4WhEawKFk/qPg317rURHmtywO5xCXB
 yTQAup24MamMi+MmTKdvq1C3+YmlzQtd+VdZVIiWQ0tacpoTiGKWvhR7S1Fw1IUaMMDG
 zMvsPFw0PMUlhR5eMaIeGP4hEeBCiIMeVIDNRQMHVfTK8SQ7ImGZb8OeJz4HzhibailW
 wXjK0ND1KusGalyLLGRedIjclFBzm4/x1heMLpBMnJ+Tp7iaB7LC3vaV/9h/c63+oWBc
 1duvvo7JAwV0VMmCF7fgcpOMteEljftphPDbKLo76kVX+A/YfmY5PFAAP3HDZp0CK3IQ
 wynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7aLZzfLlS5VnBfl4PdKBny5F4Y7tGcpGiEVcQMX10x8=;
 b=TpspGO3nZWIcsTejEugG3agkwznNKEbar6AqEvNmGcffcf/dBidu6qnBq5cNw+yB8g
 7vkufSbwcCoS3pxRdnnamewB+pKDkvoIO5epGCJ54R+HPCI5vyncvgg0zKQ3MPL1buWA
 OZ6ExvlAeKQ/uyXL6LrwCxpahEBaxZN0kE/drh31uZhrsAiUoLs6+bCbv224dOKvud2r
 DyW2hpL1LqcovEb1wFA00gToAnTktvJYpTY6zPC/sc9wHOcugpDw5A8w0YjC3y8GZnZp
 OFoJXC60hDFnAPykLD6d0N6yBupFX+OCkj/P9DLyTx3qjuK9YmQ8xC2idJ2TkQCQXliT
 EOTQ==
X-Gm-Message-State: AOAM533b8LrHgUjPF+Faibi7Gex/p0hfI5U8rVyI9dkvXuuYgTcNN/24
 rxtnDn1wyTXM7VhQOB6pojTysA==
X-Google-Smtp-Source: ABdhPJy8YL7zCyA+H2ICkxx5nwBftekVlJQonBowSFNbFoPEA6JM5cqM2ByN8KoRGgAVC2UBLV+hAA==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr29764256pfm.3.1647369121618; 
 Tue, 15 Mar 2022 11:32:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004cdccd3da08sm26168241pfl.44.2022.03.15.11.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 11:32:01 -0700 (PDT)
Message-ID: <75a17177-557c-6a47-9724-2a8bb5aa6dbb@linaro.org>
Date: Tue, 15 Mar 2022 11:31:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with
 host atomics
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-4-richard.henderson@linaro.org>
 <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 11:18, Peter Maydell wrote:
>> -segv:
>> -    end_exclusive();
>> -    /* We get the PC of the entry address - which is as good as anything,
>> -       on a real kernel what you get depends on which mode it uses. */
> 
> This comment about the PC the guest signal handler is going
> to see when we take the SEGV is still valid, I think ?

Yes.  I guess I could move it to the block comment in front of atomic_mmu_lookup, because 
it would apply to both the SEGV and the BUS raised there.


r~

