Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E05313FB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 19:39:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWlUy-0000rY-2l
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 13:39:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlTU-0000H8-3K
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWlTT-00040g-4X
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:37:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWlTS-0003zo-Rc
	for qemu-devel@nongnu.org; Fri, 31 May 2019 13:37:51 -0400
Received: by mail-ot1-x344.google.com with SMTP id g18so9955338otj.11
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=50tDTUOv2u7OC9QdPFya6RrI5mcoqwqMADWJFToiGvY=;
	b=BhfnIP4uwTge28oWkXwojZMEuOJCn3HNQivuk60ljvAPF872LPIsCAB2rkFRDfQ0j4
	pGpetHypsmoJuu0oiZuwekj1g7xdyAKddUWP9EwY69fE/+/Q7TIimY2V/gnrMn0XB9QE
	P+HvzQlbrU3cWfa1X7fYsEDUxgXrj64BvS7rm7bNUrqEWS3z+5aHFCI1+kTE3R226kPY
	a98V9lD1F0Jcrx7wvvOiumvcOCW5cDxFUj3j/Pob919i+qF+RQ461ZwJf+DVJtOf8q8B
	LT/8wl0vbjQJaYj67YWH+1eydyZX/jaag7qsKDDaqbwl7KKCbjNRJbZnRTmqXH3IWUQX
	8Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=50tDTUOv2u7OC9QdPFya6RrI5mcoqwqMADWJFToiGvY=;
	b=O4g3DSQOyxqHWB25m45F2xcWNsaRgvKSFnpjDDV+j5HRwGSBdqymHxcUKCugwp2yGx
	5sQcv85aqSiSLR2nb65BuG8bWuIwrSRdxLLMe2W6NOtKw1MkA7SaVN6XjgkO2pxaE/n3
	Pc6av0JdddkFMcQRtwBU8R38bHw9xo+7CfD2zkAUhFlTGiO+J2dWdESqI1WAORkH+zpI
	tO/e5+2bJ6Vd4j81tFrjrMC7hInys8cvlovn72Cij0EsX3aqZ3fhsb7xXzY55Hu3vIFq
	SLry2i8LYJ35yCJLxwR61Jz9OAsn3ln1l2BA+0PCdcugB1duWjAM9QnAM7fm6p1Z2RPc
	2t2Q==
X-Gm-Message-State: APjAAAUOXYCr4JMUgD681CkXADgblmHuwZMO8/RRmB6PFnfqMn14sfwR
	f1IxzDQ8Ei1tt/yhR/tlmuy/Zg==
X-Google-Smtp-Source: APXvYqyeF/4e7vgzR36BHMKRHxgPPzN8xkiZ6xbfLRG4VprQXEpOyEVS+pXz6wzXW0PxGlOkwsyHEQ==
X-Received: by 2002:a05:6830:11c6:: with SMTP id
	v6mr2613147otq.26.1559324270046; 
	Fri, 31 May 2019 10:37:50 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	t139sm2450078oie.21.2019.05.31.10.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 10:37:49 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190531104432.29379-1-david@redhat.com>
	<20190531104432.29379-16-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <951558d8-8a61-63d7-49d7-2c41e55c7827@linaro.org>
Date: Fri, 31 May 2019 12:37:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531104432.29379-16-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v1 15/23] s390x/tcg: Implement VECTOR FP
 MULTIPLY
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
> Very similar to VECTOR FP DIVIDE.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/helper.h           |  2 ++
>  target/s390x/insn-data.def      |  2 ++
>  target/s390x/translate_vx.inc.c |  3 +++
>  target/s390x/vec_fpu_helper.c   | 17 +++++++++++++++++
>  4 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



