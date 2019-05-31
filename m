Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450F31265
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:31:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkRc-0005xX-F9
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:31:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWkQ2-0005Pq-FF
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWkQ1-00071d-Gv
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:30:14 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWkQ1-00070p-99
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:30:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id j49so9748485otc.13
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vDHWb/vjJEtCHLGlyN8+Fso/8qZ52QsvAca+qFV/9Eo=;
	b=lgwvd/JoXTJc/pxAonxVqASVU8xFrjvnHD6/Ee11GVMcYg3f5HYCPBwl4PGG8+7X18
	pjdUgQtr4ubjnhgS+emM5/kkj/DxKL5djCL9od4qUa948nyK76hABGy22bJa2hVsZ8nY
	UqfnwHrOFzX5Nr6ERxNOO4BnU+UBevHmu6onSpIlkFiEUbqzixHOcTAec8lLpHDef/UY
	+Ffy5IY+gpnVqh27yJfJ8dDvQPcv47Tby9lb5ZMdufLI/txxBTieRE1cJBupmQ+l8+Co
	vhS0OamUp5zjJBJBNJVTNzqCk254+OoitMQsXQqgPIV5Jy1w14ei4HsXHc/nhmbCkzok
	2DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vDHWb/vjJEtCHLGlyN8+Fso/8qZ52QsvAca+qFV/9Eo=;
	b=awknGEvhwR+xCcvSz+Y51aJjMIBnEdOwbV2O/viW2KhCp1wdji7Bwjl6GlyEp+DlCy
	glcZYTlXsRwQTXh+lBXwilFrHwe+yIY3O7HyG+CpvWQNMM6AYKYFl1ZUpAhe7HMZa1F3
	u3kB2zgaOeUO9jO4yac1r5niYLcoGBujv+Xg7EniIOw5gy2DGppVd/ElNINMQQBosMCt
	27BFY6jvs0tGP7ZaRq+e46OM2PQGne1ELo4cQ8zaIqAryPIOjUYbWW4jnD1jxLXpRKE6
	55CzkKJCnZOIAFo1HmVQFw6u2ub58E/6Vgf1W4konXSbItFosggoti1e11n4J72HrGWc
	d/GQ==
X-Gm-Message-State: APjAAAXZNkKo7VAgkAqVSHguJc0kOnLir/ro8no0j4zT+kQD+e6NXBqM
	ryKDkcOaNTrh6Kh/jhH/XgOeFw==
X-Google-Smtp-Source: APXvYqyjXzYQYYVhFQjjuhCvzT+UtrvQJ2ziclXf8QvxgHz+vPUJHsZp2lS0ucnMH3EmKrJUCu0L1g==
X-Received: by 2002:a9d:1d22:: with SMTP id m31mr2620474otm.23.1559320211979; 
	Fri, 31 May 2019 09:30:11 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168])
	by smtp.gmail.com with ESMTPSA id m32sm764889otc.55.2019.05.31.09.30.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 09:30:11 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e6a275b9-1466-656c-e6ea-f4f51daf4636@linaro.org>
Date: Fri, 31 May 2019 11:30:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v1 04/23] s390x/tcg: Implement VECTOR FP ADD
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

On 5/31/19 5:44 AM, David Hildenbrand wrote:
> +void HELPER(gvec_vfa64)(void *v1, const void *v2, const void *v3,
> +                        CPUS390XState *env, uint32_t desc)
> +{
> +    vop64_3(v1, v2, v3, env, false, vfa64, GETPC());
> +}

Given that make_float64 is banished, I guess you can pass float64_add here
directly.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

