Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4595860C1AA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:26:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9do-0006UM-1c; Mon, 24 Oct 2022 22:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9dl-00069c-AA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:26:05 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9dj-0005Gk-En
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:26:04 -0400
Received: by mail-pf1-x42a.google.com with SMTP id e4so6674741pfl.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WuFAKnJnm9Vdq7rwM3bK9knwaAa4nBUL0enZb9VuOP4=;
 b=PNCtTd7Xmwxo+fkO87Ag2eX6o0i8aFPx0PCwMMeMrs9uXjrR5iTwn3NWcDHjg1axUC
 hxJXI1JILFnRvRdQFKyqMj46Huh1vL8i6geuifbz/o3EdFGC2Jvc1ImdYz0Xd3TxB7qV
 AqKx7Kj+KjVVvWiIl2t/iJr82MOp8gDkojgR8HSfRKKrHAnu56YEai2GrGJz0k9fYMca
 Ho6FSPIb+nLmLEg9xTukcVNNJuaoqU3RaAcs+y/7ZCHR4gwFYMpmuut5XKCuHeLS635p
 Vv9iTyT4vWpPzMysmDNalBYkhoM1yjQ8uGtGU8vX5jwGUWfx+hQ2muU7P7ZKce9gXfT9
 AiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WuFAKnJnm9Vdq7rwM3bK9knwaAa4nBUL0enZb9VuOP4=;
 b=2EaiLHW4oIMR1bSQ+7+IkRLrYkZeB4o/oea2lPUGPMYc29j6lBQrCJSvO0VAc5bN0Q
 GIysOXagIE95ueatIumWKIRrfhdtaBWUEfXBgCnWAVGMSJLNWVx7tcMNVS3YBLcD90kt
 gkTveoKDwvRVu5biMP1cOcZR3jtJqBqsg0jLamqzWbRW9HN7CriNvr1aFc0be/tHV24P
 M/9tfEXbD4OEOwnf6dQdymn9citpFElUGSJq2WnUz6d2lkP40BIvcL20x+OIlJ66LXGq
 sSrAsVoAQoR/Z3R76N3OFzqRcX7gRC5Qok/aocUCts+iUQYXF9BEkFbNSGW8ffgs/RnZ
 twIw==
X-Gm-Message-State: ACrzQf2bYkbdgkv5ks8cmLE8DOAGSTUBWZ/BU3AWrdETSaUe/cWF+duj
 M6gI0iJCDF4rZHGU/sxVchaFVA==
X-Google-Smtp-Source: AMsMyM75xwXGJzVlAzlEDbBgEvSWNrB7O4XCwWgkYiV2Hd4Mw+5tXD5oWFSGFNfRGk3hsxeGGho8Uw==
X-Received: by 2002:a63:db42:0:b0:45c:9c73:d72e with SMTP id
 x2-20020a63db42000000b0045c9c73d72emr30040851pgi.181.1666664761902; 
 Mon, 24 Oct 2022 19:26:01 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a17090a00c600b001ef8ab65052sm503877pjd.11.2022.10.24.19.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 19:26:01 -0700 (PDT)
Message-ID: <e3d81adf-d47f-98ad-9f41-f55c1f73e9c8@linaro.org>
Date: Tue, 25 Oct 2022 12:25:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
 <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
 <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 11:57, Helge Deller wrote:
> On 10/25/22 00:35, Richard Henderson wrote:
>> On 10/25/22 06:18, Helge Deller wrote:
>>> When the emulation stops with a hard exception it's very useful for
>>> debugging purposes to dump the current guest memory layout (for an
>>> example see /proc/self/maps) beside the CPU registers.
>>>
>>> The open_self_maps() function provides such a memory dump, but since
>>> it's located in the syscall.c file, various changes (add #includes, make
>>> this function externally visible, ...) are needed to be able to call it
>>> from the existing EXCP_DUMP() macro.
>>
>> /proc/self/maps has all of the qemu mappings in it as well.
> 
> I'm not quite sure on how to understand your comments above.
> Just comments or NAK to the patch?

A question.

Did you really wanted the host mappings included?
If so, fine.
If not, pointing out there's a better function to use.


r~

