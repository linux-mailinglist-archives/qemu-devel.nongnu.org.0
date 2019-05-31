Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E7313F7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWlTR-0008Un-R2
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:37:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlSU-0008Be-Cd
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlSS-0003Fs-GC
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:36:50 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWlSP-0003BH-3u
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:36:46 -0400
Received: by mail-ot1-x343.google.com with SMTP id 107so4172251otj.8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gGqgCjOluC/yND5TGvQqqa2N7/FI1BLoOc2UG6fqHWM=;
	b=FvIxye+qcbg/MGUqz9X+nlsfqSzjGr6MQ+Gl7Mq5IdQoqpSMGT6tsNicTz3LQnIOQF
	Rf/VvrdonfAA0W9xXc7eeLBziz3Bs4NDCXBTJL2AKhr7Nc9zBxyLVlYmFNvPEsiNv47s
	m16ZusX+/TkawUcSddWAlesV05+FdKi1O07u2XGqjlHPzwLBkEFKy12v59nCUnOcYBxv
	W8QIUV42ZdAY0QlA4v3vKs2uNv2JkSUAKt3eau6T7jP+Ugq/RwPKdIKtFMnIkowbeP53
	AxhHKIAil6OaucTIMb2kagwCDJo3q0QBVg17WXeMpnP1JRp6EFvHVi75SQofzih1mrzB
	o54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gGqgCjOluC/yND5TGvQqqa2N7/FI1BLoOc2UG6fqHWM=;
	b=RO6G9nHUfgbC0qpr48FlfOsKKyeDj1n+PaBRKGJj3u5a4k1Rrr2tJE9MK64Y+OgvIM
	UfCJcNdPLS500Gh/0XXnz86S8BpcFD31H5+Se4f8JyqcJUgY7Fa7d1aRt0o76r9KsJeh
	Traae3HfgrITXDhSAFlt+NH4p9wax8LOZKa0GaMO/9ee2x7gUl9OieG3CeFRx8Ndc4G2
	NT1JeXNkvNVJXobgK1q1Ct4SeMXE7n6rpgWytyFhpoDFijEb2uENEC2yyz+wQBbYSBRW
	0sbdvvHPwSwlhNju+/146FlpBdSH4xHKyjLq4pkzO4H1sZ0eqxljv/8FFyPdWH0Mq7DZ
	I9yQ==
X-Gm-Message-State: APjAAAWH1vDJSfuPxDbdLk2v2xpTjK0UgkuQBi5P6Pr4lzGKau0/R1/a
	Woi9hXTk25hUHt/wAm72QiSlAw==
X-Google-Smtp-Source: APXvYqycwWhVy5mQMoB+YDFs6lUt98ZodLAohCoZNymwy0PjGcKJN0b/W9ukF3JDWGbE19om3j0+og==
X-Received: by 2002:a9d:480a:: with SMTP id c10mr2689191otf.10.1559324200858; 
	Fri, 31 May 2019 10:36:40 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	k17sm2175067otl.13.2019.05.31.10.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 10:36:39 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-14-david@redhat.com>
	<c2c09ef3-10f0-7dd7-c1fb-df6583ca5464@linaro.org>
	<7166dad4-831b-1978-fd23-2f9742ec940c@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <26558069-098b-46fc-1b2f-22a1ab179436@linaro.org>
Date: Fri, 31 May 2019 12:36:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7166dad4-831b-1978-fd23-2f9742ec940c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v1 13/23] s390x/tcg: Implement VECTOR LOAD
 LENGTHENED
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Denys Vlasenko <dvlasenk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/19 12:35 PM, David Hildenbrand wrote:
> On 31.05.19 19:33, Richard Henderson wrote:
>> On 5/31/19 5:44 AM, David Hildenbrand wrote:
>>> +    for (i = 0; i < 2; i++) {
>>> +        /* load from even element */
>>> +        const float32 a = make_float32(s390_vec_read_element32(v2, i * 2));
>>
>> I suppose.
>>
>> You could also reuse vop64_2 with
>>
>> static uint64_t vfll(uint64_t a, float_status *s)
>> {
>>     /* Even float32 are stored in the high half of each doubleword.  */
>>     return float32_to_float64(a >> 32, s);
>> }
>>
> 
> Then, I wouldn't be able to indicate the correct element index on
> exceptions via the vex (has to be the 32-bit index).

Ah, tricky.  Missed that detail.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


