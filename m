Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3A31444
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:55:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWlkb-0008Lm-TI
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:55:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlja-00084z-2U
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWljZ-0004AO-5f
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:54:30 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWljZ-00049n-0j
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:54:29 -0400
Received: by mail-oi1-x242.google.com with SMTP id y124so8387531oiy.3
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LSegKwV3cCfs6Mdgo0z43l5HwlE2a37RZ8whWhehDyc=;
	b=ccvV8ZprJ3FYAn8ZFx5ALD7mIfjfaTl7486yajzq2xoWw/mhxwR8LDaysCMLKEi8me
	AfxgYjs42ixVuzSQJFQLyl++jL1k0yJTCQCufzsMkAgaSG8VsiR1EaKVEGI6aT+xvIex
	zi8iZS+gGyt6etYPYC9Qh/YNhOAEJ1gTBwMGFPKKOYC0Y5UZLMbZeqgyvjvNqcG9nljg
	YqOIayV7Paj4DVcJGglR9gePzEI6mmGiyRBDPpPFnifRO0XFVz7p819zZJjsrlEGlfEx
	TIDZ6RT7wR87ipy08Q2VgMShz6sRktUFQWEw1gkUjE7562N2nDQ1ulL031DuwFx0BWZw
	CqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LSegKwV3cCfs6Mdgo0z43l5HwlE2a37RZ8whWhehDyc=;
	b=pNsJLQSNEg1wyzULN+/6nCOP4qmiL+Afdso0QJA7imuh2hUwWabJltnRVjVoYWFtUf
	X27m6acmFAhfpUhyG6aXbrcsHLQtq4IhNNrj1VQoKa/2NUmnFADnhnMg2bUYqWPGacL0
	fkmjcFuceB07fvPWOjDsKxFRQDrCO5Jy4xnx4DLvKXTo+p8ONAMm/f5HfVBOWYsnaG5p
	X+0h0xzvh9MiJu7zU5Tq4NkO6x8xI3BVOM7Cko5EZNansRhCBZaWCs/tt+PsMymgqB4/
	zUL2uL/vkVrzzA2j5aqJ3ssB691Vct1mpQtEL/yeQ1x1al7jb0Fnxgr3YhaCi15cC36n
	InWw==
X-Gm-Message-State: APjAAAWNM3HlfD9ayee0ihx3I+ZpFqn6Gc7FwZK1xy6qJMB9BojbWM2I
	hYcEgcuWYhdhu9tShbqnm5Ic1Q==
X-Google-Smtp-Source: APXvYqwBQEHqxJNDF0sAbUbLZGKnOTTTPbvzWWg8ZzetwQDrRN4eL/NfarTvwlflSAzwI66lNqxJrw==
X-Received: by 2002:aca:bd04:: with SMTP id n4mr1021639oif.37.1559325267690;
	Fri, 31 May 2019 10:54:27 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	f137sm2421425oib.27.2019.05.31.10.54.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 10:54:26 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-21-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6a562d5f-12fb-dfff-77ea-3757149acaae@linaro.org>
Date: Fri, 31 May 2019 12:54:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-21-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v1 20/23] s390x/tcg: Implement VECTOR FP
 TEST DATA CLASS IMMEDIATE
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
> We can reuse float64_dcmask().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/helper.h           |  2 ++
>  target/s390x/insn-data.def      |  2 ++
>  target/s390x/translate_vx.inc.c | 21 ++++++++++++++++++
>  target/s390x/vec_fpu_helper.c   | 39 +++++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+)

Modulo the cc value, as discussed,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



