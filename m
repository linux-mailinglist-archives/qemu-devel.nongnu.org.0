Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F4011553FD3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 03:01:35 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3okQ-0007Bn-QR
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 21:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ohE-0005uM-01
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:58:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ohC-0002DX-Fi
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:58:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id r1so13980453plo.10
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XlwEu6eDlYZosY8WpIoFaBoBML6QsP4gViQYg5GpzQs=;
 b=MyvVc6HJHh9Y3SBCp9GDlqL38EGWuwpmej5Vyh5bONPrVC0LJE24/yMfA/TVzV8chJ
 3s/aXHqig9nxFvOfJSB71Fti6nElkDVHYSV0wLxQwjeL5ujFQyqRVFzcnRkHiq5RC0td
 qS5BsuNDK6aVzaI3WCrnvdKHcN32OF8VhyMES8Dib1CCpQ5TkD66OwUY8axxeyfHu5UM
 ca+IxI2zRAJfSDp0XwMIRFIMOT6sM4e0oLXRe9ECpj9ssdb6nMnXA0lLzV5DESNrSONJ
 ZqtaWxZVs9puJxvq0jGrJKEdgEEZJUBCkbQNNs/b5puFcXiD2k7hepspc+rlh49U3nBu
 NuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XlwEu6eDlYZosY8WpIoFaBoBML6QsP4gViQYg5GpzQs=;
 b=4qDAmzWXgdt8L91YEhhB1kH3PvxpHTlE5xZbMtrpETYd1VN8X1tCa7kjt8zal/ZUz4
 XeacjJ+YvNQziM+a31ziO3yV6wAW+j1d/RMpewrLO3CoWQ/bsY9Ju/R0HAuanuqEgMZd
 AvE2G+NLLNsf/m8tPayXQLmrczeS20AdtrtAMMU+ewYcCptfVdhKnVJXwPVIk9YCFJvv
 /NmdRAN+FynEzgiy40cEu8mAwVQYQY0tWL6AANqPhHTtOXMZOxb30f3NGIVUh/O2KS+E
 a3g8IOKLWpj69bkXJdVtUTAd65KMIgBi2f7TbzZf7h4m2CFH1XV0fRa1qQ5edPlZIEHI
 RC1g==
X-Gm-Message-State: AJIora8/vHOhjWiYcBezWRL+VtSoWqhG87CkOz3McKcEvQ2R1frQEU6U
 23QnOvIf3LhiUk2IOUHu1p+sNg==
X-Google-Smtp-Source: AGRyM1tc6OzK9iC5P0Ik6xfrZpWqVlRcdTdz7kKquamvOpby3Ts5aYq3LgPuD4tQklbcQ0jffxuOrQ==
X-Received: by 2002:a17:903:245:b0:168:efbc:c10 with SMTP id
 j5-20020a170903024500b00168efbc0c10mr31318739plh.71.1655859492876; 
 Tue, 21 Jun 2022 17:58:12 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090a928c00b001cd4989fee4sm13023453pjo.48.2022.06.21.17.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 17:58:12 -0700 (PDT)
Message-ID: <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
Date: Tue, 21 Jun 2022 17:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
 <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/21/22 10:23, Peter Maydell wrote:
>> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
>> +{
>> +    if (!dc_isar_feature(aa64_sme, s)) {
>> +        return false;
>> +    }
>> +    if (sme_enabled_check(s)) {
>> +        TCGv_i64 reg = cpu_reg(s, a->rd);
>> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
>> +    }
>> +    return true;
>> +}
> 
> I think we should define functions that parallel the SVE
> vec_full_reg_size() and pred_full_reg_size() rather than directly
> looking at s->svl, for consistency with how we did the SVE code.

I had actually been thinking of removing vec_full_reg_size, at least within SVE. 
However... done.  I've propagated the new predicates forward through the following patches 
as well.


r~

