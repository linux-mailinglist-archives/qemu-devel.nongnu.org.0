Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA929D1CF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 16:39:32 +0200 (CEST)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2G9a-0003dc-Vs
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 10:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2Fsr-0007H5-Cp
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2Fsn-0003Ty-8z
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:22:13 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43873)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2Fsn-0003TK-1F
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:22:09 -0400
Received: by mail-pg1-x541.google.com with SMTP id k3so10701992pgb.10
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hvX2IgcA6To3cqLj/XY5JH0hdQ6d0A3q7JHY/7GU3QY=;
 b=xe9EcXe7Cb8ix1a5hMsqgzCJ5wqLGy38Q5ZJ3kqJSKCe8ZMNokqbGvlsVnQn363NRh
 xIA1Ra30m+OfT3bIlqs+ZbV4XcYPfD714WrAUECmvre9iVy8/9/ChgtcEA4crOj8P7KS
 B8hC1XRofvLPsR4qtjhHV77nRD86Y3AOCXWhBw3UAsysfQFs2mAb3/Wmvt85MLDCmEvF
 jKi8EcJh/4871/cprW03uK3qfD9smO1BzGvzMDnCsMIuHWDgD4zdUylHuihEyu/oSKwa
 OSCWYNS5NRTPrBxRKA87DHXol6jFsiZc1VMYau2bWhr0uP5uQ9WlX53uWoXj8aGfGbVi
 mjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hvX2IgcA6To3cqLj/XY5JH0hdQ6d0A3q7JHY/7GU3QY=;
 b=ly51GeUJyqQw5JvUV7Uqv+UHIm/ANCnxLPryoCKDRFNZXuU2LqRL8f6sDKVCyKVlSg
 Qwkfgmi19MlgAGwbA41vPVxErIlIkGJnMXxpiksnnSsEMrMLs/OS1ZvRtLKvGoJ4rkrc
 hu2YxWiP7ndNyoRIdHZ12XDzHHs1GogujUsuxp640LN1npaXFAnoBmGx92+ET9CKYydo
 IAOgHFQIwH5f1u45zqcv6YU1dx9r1nBMjUTLqEz4PPjrBz2nv5qiHm7xrgyypYyT7l/Q
 zkH0+QkW/sTDe7Dy9rM9QoRSDqfeRGm1IzrDTMWORy0fRCS99OKSVUeeNtEsIYPTN7DY
 4OBA==
X-Gm-Message-State: APjAAAUTv42ZPgajQr2XBzxHR4qKmNJsYv1xxbVQWMIgU8cxzVFN3J6c
 ZhbgM7e8GvFG0O1sUDJlqNmFUA==
X-Google-Smtp-Source: APXvYqwNbAfPP0JlaMe49vrIk8v9SgBeIZIUTvgb7JTN2cSXBYkHXJaGLwh81PaMzL/KbZzsBGOKTA==
X-Received: by 2002:a65:500a:: with SMTP id f10mr443011pgo.105.1566829327657; 
 Mon, 26 Aug 2019 07:22:07 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a15sm13205336pfg.102.2019.08.26.07.22.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 07:22:06 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190826075112.25637-1-david@redhat.com>
 <20190826075112.25637-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82fd082d-e2d5-d8ed-4b82-055729f58b14@linaro.org>
Date: Mon, 26 Aug 2019 07:22:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826075112.25637-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v2 3/7] tcg: Factor out CONFIG_USER_ONLY
 probe_write() from s390x code
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/19 12:51 AM, David Hildenbrand wrote:
> Factor it out into common code. Similar to the !CONFIG_USER_ONLY variant,
> let's not allow to cross page boundaries.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  accel/tcg/user-exec.c     | 15 +++++++++++++++
>  include/exec/exec-all.h   |  4 ++--
>  target/s390x/mem_helper.c |  7 -------
>  3 files changed, 17 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

