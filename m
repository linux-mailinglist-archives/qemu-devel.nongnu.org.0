Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8A31968B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:26:25 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALLs-0005vv-PN
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALIk-0004mV-Q2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:23:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lALIj-0007Fi-DL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:23:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so3545393wrx.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ycTvT0zUexHJQeO4/x54cHMramQh33qzxI2wcBGsGXI=;
 b=T2me2Z7KG56YpusvDuztmqcTscFN4tcPK4MoieL2fQy345SDyamkIVCdiQEB1Uavoa
 3P45StmtZMePYpDRaNw0DCYpgStyDk0QtdJOtcBSgd1Y1fOOGoX/RnCMJy4nv3FyAG+m
 790zB33h/h+Dbg3FL60F5RIAXDow237AdlarLnOpSFV8X0+LAqxOUTF7ub1CNemIWG9C
 T9CQj3VCwNkkDlpsBliceOvXej+Byl/96J9gL6/GdRdSjrZilrtSfVpjGRIOl3H2yWHf
 MMfGmW5M86z2LqJCcZDvAn8Y11WdhkK3Qx2h6gyppQg+EGwidFOgG623OSqw43D3YOGB
 eU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ycTvT0zUexHJQeO4/x54cHMramQh33qzxI2wcBGsGXI=;
 b=hv6Td5UKVouaz3skEi5yYaGip+oMJFgW+kGrYCJI9v1HX6nbPUHELpNtEywuuzLd9N
 J0iF4rBofPBk/iejUkz6rgE9aLayss4oE+9TKV996Y8f+ROskMZ62rF1a5Qp+YdHxV9a
 LeWkcLw9oHCkZcbTHSHYgBCIKtehkL9Mz6E2KVZEvg1g4iwjsp1o576XuJ4nm0XuFEHz
 MCYyxaeFDV1GzlHOjJh/hUs+0uJfmqlGKwyGYk0TJeer+4Xe3amaMo8W9NHDL8o98HJM
 /Vz15TAe+7rMzf01sVeBsp+y14oeKCvafl1mJnS/8gT4xFUKsCkE2jyGyOkAXeAB9TOe
 1xuw==
X-Gm-Message-State: AOAM532uLaQrc/FH7/5ezKY0WX+qpXhsDeEKcRgu3immjfVJrCmqrIdj
 xCMSYpZlmfBtVcr+5wcAuonJy/oUIhc=
X-Google-Smtp-Source: ABdhPJwe1TKUL5hGyOL8l/q/ozQHsW2YzIn8GhJ0L0f1C9Z3tFE5qUxlOgDhkKS5JxH2K9uG2foU2Q==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr136196wrq.411.1613085787461;
 Thu, 11 Feb 2021 15:23:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 2sm7788940wre.24.2021.02.11.15.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:23:07 -0800 (PST)
Subject: Re: [RFC PATCH 03/10] target/hexagon: make helper functions non-static
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-4-ale.qemu@rev.ng>
 <60f20674-0b70-832e-8b03-56423a99fad2@amsat.org>
Message-ID: <0dbe3cb5-a56a-4501-30e3-5e334b549f1b@amsat.org>
Date: Fri, 12 Feb 2021 00:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <60f20674-0b70-832e-8b03-56423a99fad2@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/12/21 12:04 AM, Philippe Mathieu-Daudé wrote:
> On 2/11/21 10:50 PM, Alessandro Di Federico via wrote:
>> From: Paolo Montesel <babush@rev.ng>
>>
>> Move certain helper functions required by code generated by the
>> idef-parser available outside genptr.c, moving them into macros.h.
>>
> 
> ^ OK
> 
>> This patch also introduces the gen_cancel and gen_fbrev helper which
>> will be used by idef-parser.
> 
> No, it doesn't. Probably old comment?
> 
> Removing it:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

Missing Paolo's s-o-b?

>>
>> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
>> ---
>>  target/hexagon/genptr.c | 13 ++++++++++---
>>  target/hexagon/genptr.h |  7 +++++++
>>  2 files changed, 17 insertions(+), 3 deletions(-)

