Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165331200
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWk7H-0005Y4-F0
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:10:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWk4p-0004Hn-Rx
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWjs4-0007WU-Ji
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:55:10 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWjrz-0007P5-OC
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:55:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id l17so9685320otq.1
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dJIoo3FoDYrfwKVv+e1PdhX66/zpDJWGTJue6+SvGvE=;
	b=W+7UPl2TTpZxviuoU+9wGzAS8zwwUd+UguT/TZ/z9942c3Iz7D4KbQfgAz7JjSECK7
	kW71vjJ0nFXo29u+KEZRhy0cf2rR0GfzjsSQZKu9ABx0vkleTFT6wuwxvtMjoU6LIkFC
	P1ZjhDrEnyEjRSIPR00plzAjPWOpq/wDIbY0B6upgrcYObqc1l+o+JqiE40aChzWzxFP
	zcHkYaMx/FRdabKHJYgAe1DnRZjR4mmgBFYCT0oWi/vtsiWQJcbJocvLdTm4XbWo926c
	1QsW8Rj1aWZGgmj+6mCJkjy3Fs4tC9GZ4QHgsM4MGWyHGQ+329L7roPKET1Y7yXt9QNh
	pZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dJIoo3FoDYrfwKVv+e1PdhX66/zpDJWGTJue6+SvGvE=;
	b=pHLCrsF8lV/iVsn4qG7ebGetlhWtu78WmM1u6kt6tTyC6x1WedILwuNMew3qX2pxiY
	XusOnO+0vmUrdwcu9AsdWH8yz+R51a3XsQ7dqNY6v/09b/F7aOYZSmov04J9GNZ6dPUo
	ltXbKj7vBfzM2OeTdM52fm/OvIZu6KZ1Glpz6AwcQPFTwl2M3ricQ11O9pm8slR+QOmT
	23DUrC+Jc0Xvs5WS43tEcSDHcubv0lQABzCpDsod6xABHbFgb5psmQRu9hrzBFSwsndp
	fbA8cN8YR+Y+5fDOtM0zhTt2W7KsUbq/N2R9CrNfpl6i3cC4WHFyKtOS8FRLCgg4MsXH
	1QPw==
X-Gm-Message-State: APjAAAUylcIq4IOzdhExzuUWd2UU/nH9TPpb1PxXBkUDTrueIIpYNGTF
	zdNexGSWdg9prI4XUfLPgfQoXg==
X-Google-Smtp-Source: APXvYqzVykpZlkeOEqZbIIQTZ82MaQC0DeXeUbP3ZzLCQIttxO6JuaxFmYO1ypSSr+i3fS5psfgjBw==
X-Received: by 2002:a9d:7616:: with SMTP id k22mr2302669otl.142.1559318102654; 
	Fri, 31 May 2019 08:55:02 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	p12sm2100053otq.57.2019.05.31.08.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:55:01 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <870abce5-2af2-7825-140d-f0c9f9638f0a@linaro.org>
Date: Fri, 31 May 2019 10:54:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
> +static uint64_t vfa64(uint64_t a, uint64_t b, float_status *s)
> +{
> +    return float64_val(float64_add(make_float64(a), make_float64(b), s));
> +}


You don't need either make_float64 or float64_val.
I've been intending to strip them out entirely; we
don't need to add new uses.


r~

