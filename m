Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F174964B94F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57rf-0007Gi-R3; Tue, 13 Dec 2022 11:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p57rb-0007Ec-DJ
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:10:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p57rU-0000Cf-7g
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:10:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so8307325wmh.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5dXN+CD9lhvHiIWiOWgMOkBgxkPBCH5Ovu3I4CfrvzA=;
 b=LHGExF3ZGVk6W8rebTBqv4sSEpWTJi+0k2MA1ZMXftD3i0RrkJRFASer8K/VvsW8qZ
 CxDLbuPDbc+ZnjkhvhyoTrbwcs8ld8QxqERhXyr7FC3ZKZ6cPKXogdQH8FdwZaTkIxJi
 CNMnSFskiBroDNtTw/BIvQu0pyxVRxS6apfEO6bKxJmcfKAdvRPbZxVg1pHRIQWW5dQO
 hrYlcNSlWSQlj5t3ka7XZoqd6e1I5aVMKJrUTX3u+WeouLS0JI1e4cPUJx89YTUenbTq
 scuXh1OrcCIHLu5gJg9SfMv4dq3w7c3I0yeennsNYDHVrV0oYwp3VYQ5WueimrEBFBSP
 sEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dXN+CD9lhvHiIWiOWgMOkBgxkPBCH5Ovu3I4CfrvzA=;
 b=OEwgiEDnOfFzXcYBZ+eujdEE89Ax+Nl3tnH7S9+3/ZUI6jbsdv7BE5nHq+ja9sv60E
 UWyF7/Pzpsd3CJESXnsut8HrEHud11wrAGMqfgc/kbarAcgTE1+dYiuuOkWk2hAgOg/4
 RPR4kP85x6Iilb+1DOlXMsNGak6ir9xrxl7IYjhTm5/RhtQmgSEOsP1TJXbX2terzU6K
 ZmyM4i8PtbBjIBIrKPLSab0LnhXXyNqGNBqIaG5gq3xGzFa10VR7xBYoVjnG/ZitRX37
 PX+oDqjoW4/EmFCn7LSuRw/U2hkUQdmmNjvnRAbgPIeeygjp9y/hx+A/YyCC/XN0YvUc
 6PyQ==
X-Gm-Message-State: ANoB5pntIs+Vy9V9BC112h51etdGCX7mDvTUoqp3sE/TF5vCWY3QQ+nn
 6vmZZDvofocu3HeMZtQdNtUn/g==
X-Google-Smtp-Source: AA0mqf5lwiCvJ8yWeCxX6DBFqysh0TogBoDVGoIJdVUNTXaVmpG5DlPodPhR+3eVCgqm/5eNUc/usg==
X-Received: by 2002:a05:600c:35cd:b0:3cf:973e:c874 with SMTP id
 r13-20020a05600c35cd00b003cf973ec874mr16008397wmq.14.1670947830764; 
 Tue, 13 Dec 2022 08:10:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003cf78aafdd7sm13352584wmb.39.2022.12.13.08.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:10:30 -0800 (PST)
Message-ID: <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
Date: Tue, 13 Dec 2022 17:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/12/22 17:00, Richard Henderson wrote:
> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>> aCube Sam460ex board") were testing on a little-endian setup,
>> they meant to use const_le32() instead of tswap32() here,
>> since tswap32() depends on the host endianness.
> 
> tswap depends on target endianness.

Yes, it depends on both host/target endianness. What I meant
is we shouldn't have system code depending on host endianness.

(I'm trying to reduce it to semihosting / user-emulation).

>> @@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
>>           /* Create a mapping for the kernel.  */
>>           mmubooke_create_initial_mapping(env, 0, 0);
>> -        env->gpr[6] = tswap32(EPAPR_MAGIC);
>> +        env->gpr[6] = const_le32(EPAPR_MAGIC);
> 
> I think this is probably wrong.

Since this is used for the kernel, I'll try to get its endianness
from the load_kernel() calls.

