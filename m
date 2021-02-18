Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628831F325
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:36:36 +0100 (CET)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsqZ-0007UJ-1K
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCsnq-0004hA-Id
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:33:46 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCsno-0005af-GP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:33:46 -0500
Received: by mail-pg1-x531.google.com with SMTP id t26so2296986pgv.3
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E/s6I513YNp9eKROBrdkysLgVkCt/eFWxoyeqvMogIk=;
 b=heMx6FxC8CVFVrcME8h69J4N3s3rxz5LuRe4cA3C14tVBvUT4lZBmBSY4jrJCrh512
 adMje/Y2jNTt6YBfm4y6Wq9apGiU3ULsgOe8x3YGnjS2OdCeBDTtiltnuaiZB8qv7AVA
 cBzWGW7IKPLuy4Rcxzx4t6O5ceNtZRVF2NgbeECJ1faOU31nW9iyIWYvaq2zIZTN9J1S
 gVM3RZllOBpWWoNtEbb0xZxxzpzIcW/bI3oy5kOlkX3S+e2DqWUukBbrcb2v4dUjGbq+
 ZjnJ+AuuWj/DMWWLL+kxpYOcoz9mNx4xtEWqolpm+ZB4cY1vRmeUf+DCb8S9o9W7V8yw
 B5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E/s6I513YNp9eKROBrdkysLgVkCt/eFWxoyeqvMogIk=;
 b=nVvuKbVsnmjbk1P9akSpmFBi0O4S/GQloacFJTMhQ/IfaUbY0YLF3Y1fK0MZ4jogWz
 aNTCilN8bDPm0sIgEeA/JUQJOeO1r5Mw2dq1SyOKnSY5Frhw84q9aicRlAnZ5L3GV1Ka
 LuH88X6KoyVFJVB/cbi4su0qX2dzVCzUKI8FDUivTsvk1AroEe/kkf1SC/fNLBqWFTE8
 gxpBMg4SpetNBRJcBcYvoINa80ZvNMN7a9z/r/cQKa0PjR8VWoNu6nP3m0GbHK/K6BWC
 oeHJQ8+eGnNkxcfjsMgmmdsV8bP10KOF6Xo72Dr1gaOAVt/56TAxZP95Sq7Auqkm5uk6
 sVlg==
X-Gm-Message-State: AOAM531kmPHPmQOx+ZCNVSg8OkkK1PfZ4XpiYP7+khcRNR1LojRgNkpm
 r4R6HyArF8oM+BkvdreWYmPytQ==
X-Google-Smtp-Source: ABdhPJwvcpYf7CMiM79T+e6LqDe9CCCxR6gMiaAuisHpqsocwfPPk0opXBAK2G0LfnMDHvzsgGYvFA==
X-Received: by 2002:a63:c90a:: with SMTP id o10mr6055333pgg.172.1613691222868; 
 Thu, 18 Feb 2021 15:33:42 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 6sm6828989pgv.70.2021.02.18.15.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:33:42 -0800 (PST)
Subject: Re: [PATCH v4 05/71] tcg/tci: Remove tci_read_r8
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-6-richard.henderson@linaro.org>
 <7f634553-3e1c-2cd6-a712-31c335e79508@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e95c957-4e06-a6c5-280b-c6ea7829bece@linaro.org>
Date: Thu, 18 Feb 2021 15:33:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7f634553-3e1c-2cd6-a712-31c335e79508@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 3:11 PM, Philippe Mathieu-Daudé wrote:
>> @@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>>              tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
>>              break;
>>          CASE_32_64(st8)
>> -            t0 = tci_read_r8(regs, &tb_ptr);
>> +            t0 = tci_read_r(regs, &tb_ptr);
> 
> No need for tb_ptr++ here?

Done in tcg_read_b, called by tci_read_r.


r~

