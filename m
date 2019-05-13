Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB701BD70
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 20:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQG4I-00010T-RF
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 14:53:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQFy8-0004l1-W5
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQFy7-00056I-CU
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:46:36 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQFy7-00052X-2O
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:46:35 -0400
Received: by mail-pg1-x544.google.com with SMTP id z3so7213359pgp.8
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mfztUT8HThQnL4EPiJVtdwKXVUVQdkxXqoa2KIl4nV4=;
	b=i/VFDbkMoQMJoX6pEeyVAe8gvd+PLxjrK9EEd0yaRjTN19LXINYNbiLCOdA4oN1sxF
	4I/Li3TAC0YQu3sRb82FoCTfA5CXvhZz5CYmv+U7Zoy/BSE8f30eCfv/q0dZies4KDHH
	Hnta+8WoZTWbXmD7Ck4605xo0No7Qg/VxbrnarbwFh+V4Otv4mQP/VrOpLgf6DIDEnTD
	J5VGAd9FrnDxp5MTrcPVTpT7gnMzmbjn4QAjz1fDowvAzDtxVG1lJ6M0rjOshkxoTfZP
	+viWE3s1xcV6yo+tfIKDjrBlUoospK/HggGXGO1fsdDRcVlWXgXSoJTcFujtBvbQJqWc
	KXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mfztUT8HThQnL4EPiJVtdwKXVUVQdkxXqoa2KIl4nV4=;
	b=bFyCHmfNDTMuvgB67FHBHZUT1rw+/sB93S2w8QutssKJzlgHq0B32B+O7geDTT7tqM
	CohqFbXA0rb83xrCCtP7fGa2s9egqjGFc6agRu69/WoxaGrGUaYAWdo95IO8OC6p2Kf3
	JgOtRx+w0QrzEmMdVMTEmZZ9qR8nd63fyvhGfTJ4ecoFmR6bPBwhZ9WwlE3869oTqbvd
	VgiboCsLniFtPOM8iDx/qpWQBJIX+98wroU4RwWJWuEBamNhC0lhTnwpv3wcwehT4DX0
	aIcZhE8mb/V1RKDeb19yXcLzEEYozVKbnGNZ07ZvtzzPyvfOdKJH1+rU/Qkl+gke6yzS
	ZxyA==
X-Gm-Message-State: APjAAAU+OaSbY+lPHMFcVkPHWHPA/37cJ6tzcAH23rHF+CH2OTkeC0Q4
	ttOyXMmPIo3SaosE8sQCE5nJ6w==
X-Google-Smtp-Source: APXvYqzeGm6Y0Hi9OkOkxhjsX58wH4dH6UD4wYD+cmmIFZU3uyMZVni2lFc2S3lh5plE/x6eVCwdOw==
X-Received: by 2002:a63:1a42:: with SMTP id a2mr32676995pgm.358.1557773191927; 
	Mon, 13 May 2019 11:46:31 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	m123sm25519294pfm.39.2019.05.13.11.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 11:46:31 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190512083624.8916-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
Date: Mon, 13 May 2019 11:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
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
Cc: peter.maydell@linaro.org, abologna@redhat.com, armbru@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/19 1:36 AM, Andrew Jones wrote:
>    CPU type | accel | sve-max-vq | sve-vls-map
>    -------------------------------------------
>  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
>  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
>  3)    host | kvm   |  N/A       |  $VLS_MAP

This doesn't seem right.  Why is -cpu host not whatever the host supports?  It
certainly has been so far.  I really don't see how -cpu max makes any sense for
kvm.


> The QMP query returns a list of valid vq lists. For example, if
> a guest can use vqs 1, 2, 3, and 4, then the following list will
> be returned
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> 
> Another example might be 1, 2, 4, as the architecture states 3
> is optional. In that case the list would be
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> 
> This may look redundant, but it's necessary to provide a future-
> proof query, because while KVM currently requires vector sets to
> be strict truncations of the full valid vector set, that may change
> at some point.

How and why would that make sense?

Real hardware is going to support one set of vector lengths.  Whether VQ=3 is
valid or not is not going to depend on the maximum VQ, surely.

I'll also note that if we want to support the theoretical
beyond-current-architecture maximum VQ=512, such that migration works
seemlessly with current hardware, then we're going to have to change the
migration format.

So far I'm supporting only the current architecture maximum VQ=16.  Which
seemed plenty, given that the first round of hardware only supports VQ=4.



r~

