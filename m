Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2A19536
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 00:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOrUK-0006sC-Mg
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 18:26:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrTG-0006WE-UY
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:24:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrTF-0004i3-Vh
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:24:58 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36259)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOrTF-0004hX-OQ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:24:57 -0400
Received: by mail-pf1-x441.google.com with SMTP id v80so2052865pfa.3
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 15:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=If8FSYdfgbsx+8WDesLEbG6KSM0V5C7scqtz0C69AVA=;
	b=LwE0egeX07OgttZB1UdIxOPU37OomZG5enBxDwFnMwNmLIZPorylSIFnXbbzUWSb25
	xhwKXuE/RMX3fmEYIO/tSmsLuBrM5EtZiVUnegyeRsd2fukc9GUfdtmkfoSMLkL3BIBo
	yHuM1nRknb39xtjUjfxTeo3L8FC/FEF3WdXiW/iyg9bmoh4icI+ixjsbKzgcDt9ghWsV
	FPnq7F8RILQBTF/iS37ElXQp3/0I0bZl7B0a1VQlJDX4CXXZZDb9YwWhDNpjQ49PPKOt
	0MfWDRWFIOgHFqtE2XJnRuhT+vdpfuV/d4sP5SjhNVvRzoY+cQPs1ZsEj/X9LnonOqPu
	9FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=If8FSYdfgbsx+8WDesLEbG6KSM0V5C7scqtz0C69AVA=;
	b=a6Uv323QJYMkCTIe/HLaBpvk8kASRwTCyIhA9bi/fYcOUlHUZG1uZSAhvYDTElFiUT
	WfZHJFnS03JjMrIthbDD6Btr5OdXb2/wf6cS6+9yt8kgkPh1oSCUq7QWtobBq6jmzsI7
	/pdrxgmyO47EfE4O4efkf+eL+gRYTbCw4LLpKnYy+fcrlptLPNNsv5fuH6iEINarpe4e
	Sah0mXe85/jqx0OyafnQ9V8MNbEFiIo3NrVCFyu42hrwhAvZfLUOOygvo00vDucMb3Nt
	EYw+mhJpYuzH3fiE4J9Cf+EDvqN4dx+z6/oKv1oMpGmNtmRHaYxXMhe5Ts/dPV/FW/LV
	okxQ==
X-Gm-Message-State: APjAAAV9pQairGhfujFbiagJyRiVA5Qtr2HsYQECmRrdwPZxBe+syqPB
	2KPOYM4BZH1zKf2NykPUCRIEWg8zDCQ=
X-Google-Smtp-Source: APXvYqzosDfxQ2+G9MiAW3w+fIBKhA9Ds74D/PytT1a2qS1Ve2KajJkt2Z5pchDYM0DbislZd8yAVQ==
X-Received: by 2002:a62:2805:: with SMTP id o5mr8919021pfo.256.1557440695775; 
	Thu, 09 May 2019 15:24:55 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	u5sm4197806pfm.121.2019.05.09.15.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 15:24:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-27-richard.henderson@linaro.org>
	<CAFEAcA_TJJ7V3apxmGvhoiRk2dxzT77SapcyMuopGwqmeQoosw@mail.gmail.com>
	<b6518e96-e77f-8ae7-0890-091e42334a12@linaro.org>
	<CAFEAcA-Agc6KWMqAA3V7tA0aNYF8NhDuC6Opw2Qx5qVey-YTfQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d790a33a-bbe8-70a7-f9e2-65387b8def45@linaro.org>
Date: Thu, 9 May 2019 15:24:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Agc6KWMqAA3V7tA0aNYF8NhDuC6Opw2Qx5qVey-YTfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 26/26] tcg: Use tlb_fill probe from
 tlb_vaddr_to_host
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/19 1:56 AM, Peter Maydell wrote:
> On Thu, 9 May 2019 at 06:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/29/19 10:41 AM, Peter Maydell wrote:
>>> On Wed, 3 Apr 2019 at 05:05, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> Most of the existing users would continue around a loop which
>>>> would fault the tlb entry in via a normal load/store.  But for
>>>> SVE we have a true non-faulting case which requires the new
>>>> probing form of tlb_fill.
>>>
>>> So am I right in thinking that this fixes a bug where we
>>> previously would mark a load as faulted if the memory happened
>>> not to be in the TLB, whereas now we will correctly pull in the
>>> TLB entry and do the load ?
>>
>> Yes.
>>
>>> (Since guest code ought to be handling the "non-first-load
>>> faulted" case by looping round or otherwise arranging to
>>> retry, nothing in practice would have noticed this bug, right?)
>>
>> Yes.
>>
>> The only case with changed behaviour is (expected to be) SVE no-fault, where
>> the loop you mention would have produced different incorrect results.
> 
> OK. If we're fixing a guest-visible bug it would be nice to
> describe that in the commit message.

The commit message now reads, in part,

But for AArch64 SVE we have an existing emulation bug wherein we
would mark the first element of a no-fault vector load as faulted
(within the FFR, not via exception) just because we did not have
its address in the TLB.  Now we can properly only mark it as faulted
if there really is no valid, readable translation, while still not
raising an exception.  (Note that beyond the first element of the
vector, the hardware may report a fault for any reason whatsoever;
with at least one element loaded, forward progress is guaranteed.)


r~

