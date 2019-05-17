Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A2211D2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 03:45:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRRvt-0005Sh-HI
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 21:45:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRRuo-0005Bo-AE
	for qemu-devel@nongnu.org; Thu, 16 May 2019 21:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRRun-0001O5-4T
	for qemu-devel@nongnu.org; Thu, 16 May 2019 21:44:06 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hRRum-0001Mp-Qn
	for qemu-devel@nongnu.org; Thu, 16 May 2019 21:44:05 -0400
Received: by mail-pf1-x442.google.com with SMTP id g3so2804880pfi.4
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LoQwB5oT1MMr0zEZXrIruOLCwBG+tJLj3gLb5d1XU68=;
	b=dNjQJ3BygFjT/ruoDRNs5eU0m/vkVIVyTOr2QQZm6OPiJO5K7QHafU817Zui9dno3O
	sXfkQ6/W7LQr4YD3wlLm8ZhRPtx/vlFFyg8hrubS1QEsp1BZnxNdpJkvApALXtIMOvRL
	5GYULvwMAWwQzMbLpMgS8HuhCnf1xA61rqGI8FmbfOpW6yrFo93bHP28uYfeMJJIDH3n
	TctW0C5mpmvVsB9DUEJQh90CJTLFSFiaPV7lfqoHT/QBSppOHZYV40mBEupom5ymPWYa
	5b2Fx759Hlj71Nwy78maeaqjRekgiqRvM0052/LYp2sBKbaZJPdZUmIjmd9tGQLTKEF1
	sMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LoQwB5oT1MMr0zEZXrIruOLCwBG+tJLj3gLb5d1XU68=;
	b=koJp+X5tDd6zbE+ptjbh2Yk0e+FucZ407zFDKBYheLC/7iRDEXQLIN+SE4UHdZVRvQ
	qcWbmrzjbHs9Nb7jAqtugLjSxSc2gRPsrnwcH0eftPgSS9lxHAucYu40qojAIsjhxEaN
	ZnktbMrCvM0/7ZD+Uiz7/QJFxlFnsEKBmkSUumhl13krUttsh2alItaEfDPGV0ksNtPS
	IlYOyRnae+hgWKyeYjsSPOa0Swdj0Awr7CwlZJGb3DYBcelPVjhWr6GFL/VK619yG4bt
	jlyEOzZkeLsDmgRi/Kun/0mWdxh7fGCTfjtP95wD2Z4/2Ma+ALLZN604yI7q56QO1TK0
	KKJQ==
X-Gm-Message-State: APjAAAX/aBAul5nyfd+A1UsvQL2hyXkBuEIcr7u/rv0ExWWOkHLnXZS7
	63utHNho6/TbR4XU/IFtHomEMw==
X-Google-Smtp-Source: APXvYqxJG5q2vmy76WHgl4ePQyYn7S9HqPIDV8TBkCJ+RNp5YdiGkr6dmSyMrW24AZIVrH75/7YIiw==
X-Received: by 2002:a63:4f16:: with SMTP id d22mr10540783pgb.148.1558057442754;
	Thu, 16 May 2019 18:44:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	q75sm10006438pfa.175.2019.05.16.18.44.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 18:44:02 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org
References: <20190517005114.19456-1-richardw.yang@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <33194332-f79c-433f-ce55-5d1f7224ebc8@linaro.org>
Date: Thu, 16 May 2019 18:44:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517005114.19456-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH] hw/acpi: ACPI_PCI should depends on both
 ACPI and PCI
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
Cc: imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/19 5:51 PM, Wei Yang wrote:
> Pointed out by Philippe Mathieu-Daudé <philmd@redhat.com>.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/acpi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

