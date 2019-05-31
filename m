Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97839313CD
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWlIl-0002bC-QY
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:26:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlHH-0001pf-QV
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlHG-0000N8-Vu
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:25:15 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45881)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWlHG-0000MQ-Q1
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:25:14 -0400
Received: by mail-oi1-x241.google.com with SMTP id b20so4713331oie.12
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FZRU5XvA/IdSKcjjKlqPIqG0nKdwaUs2Diump3KApP4=;
	b=XMTpn9M0dyu77HQfFiCLcKkT/5y3dpTIrl2tHzFVmpKSdaYPjMj6vxccRxRpXxJB/K
	w8qJWgIxvLQolbKG/kDPpq0o8F9cO4YD4Nd6H/KJ9NAHcSyZFXW4bo/1bnGvtnw4ovnC
	RxBilm22BNiAYbBz9K3Qd1Pfk+qJJNrJRZEtveOroRlcRPEs+6moQYQWXdLANYcl/IWy
	eV9TWtM/yyIlenAUYkg24AG4oaE2TaY6dfmTLoPKA6soGdnseHHzieotpd5BX3uL1qEA
	3ZYmsrWd7J8jljR/NdMpIJre22TYz39Nj+8Yximtmj5StHevM5LrkGc06NKknu1ErBD/
	GWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FZRU5XvA/IdSKcjjKlqPIqG0nKdwaUs2Diump3KApP4=;
	b=o3D5Du3unizak354N/kDK9s1auYsRps4L+NBBcemKJJ+PgX0Apmz25WNJ+IYzcQwW6
	lpuGQWtM6xdfdssaN3mSSfBBa+P8OYjAWyYa+4N+4Av6+SaWAN2ul2oFPg9gzWkrvJZD
	XUkeP1jsf6dpcvW1oCmIIOwFkgNaJ1M3u85Q8KhLbynxmCUP4dPICBUDrtH2IPLKAOl/
	dCJAGhrTc1nawPyp6KV6CdOiZFj26YL0vfU4dzXVgIqDmy5jmve21Q4jXlj/vhrR6ece
	IfbaqroTgDELCZvkH6JiC2X9G1IzjjKJAa6yenZRi+dUq6vGj1iDXvdYaaXxbBV6/em/
	m6xw==
X-Gm-Message-State: APjAAAUnU1x4kUjXwPE6XWHmE69Vtbc4msPXQlMyn+1+rYWjzQc9LoAW
	h2MkGIA3SCXHCBYCy7CPWCL6Iw==
X-Google-Smtp-Source: APXvYqy3cSGBZ2sAeMPM1b8P6qIZ+hOzaMvF+/keTdCoR/IF3Mp9n4O4iX8pPP819REowI5GDjGF1A==
X-Received: by 2002:aca:45c3:: with SMTP id s186mr1509140oia.89.1559323513781; 
	Fri, 31 May 2019 10:25:13 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	b127sm2505979oih.43.2019.05.31.10.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 10:25:13 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-11-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a718428-b96e-cd38-5088-d8fc5ddba0bb@linaro.org>
Date: Fri, 31 May 2019 12:18:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-11-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v1 10/23] s390x/tcg: Implement VECTOR FP
 CONVERT TO LOGICAL 64-BIT
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
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/helper.h           |  2 ++
>  target/s390x/insn-data.def      |  2 ++
>  target/s390x/translate_vx.inc.c |  3 +++
>  target/s390x/vec_fpu_helper.c   | 23 +++++++++++++++++++++++
>  4 files changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



