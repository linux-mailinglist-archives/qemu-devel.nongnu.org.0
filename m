Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAA411A47
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:47:19 +0200 (CEST)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMRq-0000MK-3n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSM8R-0004OV-O4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:27:17 -0400
Received: from [115.28.160.31] (port=40302 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSM8P-0007Ku-0t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:27:15 -0400
Received: from [192.168.9.172] (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 279E6600FF;
 Tue, 21 Sep 2021 00:27:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632155228; bh=Xy7obiLIBzuP8ryk2QRSKMokXr6lrMga6Ju29aNTGLQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=eLIf7Esgg9sVHZn/usw1YIX8z6IWXMHR7IsGXlVGLMX9QlaiqHCAllcmgAQb/dpsS
 6pOfxiJQo0V4E9Lsbr/BsPNkTQwVLdNq9Hdiu7TTs7MGKObmD/V0J1zxtj15yJFzzW
 w7iB05hlxRmE0XbAGG30Yu2jFIZK80GTRGPioCmQ=
Message-ID: <63a11eb0-81a4-7049-4635-104bd1e415f5@xen0n.name>
Date: Tue, 21 Sep 2021 00:27:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 05/30] tcg/loongarch: Add register names, allocation order
 and input/output sets
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-6-git@xen0n.name>
 <f34ba038-83ad-d6de-24b4-2e366f9a5782@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <f34ba038-83ad-d6de-24b4-2e366f9a5782@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/20/21 23:57, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> +    /* Argument registers */
>> +    TCG_REG_A0,
>> +    TCG_REG_A1,
>> +    TCG_REG_A2,
>> +    TCG_REG_A3,
>> +    TCG_REG_A4,
>> +    TCG_REG_A5,
>> +    TCG_REG_A6,
>> +    TCG_REG_A7,
>> +};
>
> Generally I'd place the argument registers in reverse usage order.  It 
> means that we'll try to use A7 before A0, which may work to our favor 
> if the called function has less than 8 arguments.
Hmm, is that a trick already employed by other TCG ports? I'll check the 
code and adjust if that proves beneficial indeed.
>
> But otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

