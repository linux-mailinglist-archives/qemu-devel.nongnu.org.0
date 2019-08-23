Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4C9B33D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 17:24:15 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1BQE-0000WU-G2
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 11:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1BOq-0007xE-Qu
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1BOp-0007ig-TP
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:22:48 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1BOp-0007iA-Lg
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:22:47 -0400
Received: by mail-pf1-x442.google.com with SMTP id w16so6665135pfn.7
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JR/xbsJbdGvh4q5foqnF1z50zj2S+UxaaH4oXYc5/b8=;
 b=C71Ul2TVFIBHxlGe6orpS/IY68iM5ZhTyA2g0q3SipzS/hLVuEXYKBee+rlN1Lq7I5
 iuF7n2eeFCJipsrjEcGCG9gRxrBqSEdrE/Q0dhJB1yrdqKVT4GxwvfiXzgJeLN9ZZNU7
 hyASpeLGRvJ8HRt2br1iTl1iEiK9Wlv/mcmxmNQZweT/UCizi1KNvV1LE/swVcPfyKx1
 d3x6D/Syb7pWy3R+QQ+ld7sgPygND4gSfAn4vXqdz2W37RVKFShq02gNd+Et36kvlpoY
 Mdu3OmZQY9OLM64Q6+SKhGVFund0OcVRxrCEQhesACqZMIW4flvv2R5IyZgY1UTscjTd
 5ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JR/xbsJbdGvh4q5foqnF1z50zj2S+UxaaH4oXYc5/b8=;
 b=ZH42QYgaKPY/+qDmPAxNZsd+K3/vrvWMV75JaK0l/c3k/xPewXK2+BcqA3kdVggYmx
 nWunzLRN3ctLWYxmFilRIqjKfzehrELW9p1zE8fdmBL14Lo2AQ6+YB/hDDwyweG3lj3m
 EQRKlgWSbylGekX45RfihZPc6X6rFpM3fFc5aXRRDApygBKQRmIxApFQh4Z69YGOwCNi
 nim7abVx3KL2bG8EXhXlX5X9c6PPn6kCaXFqIXAyIZwxKkKUnVzZWk+erK7wPDPvIL8Q
 krE2TvvuxQeEbdWic0pZX5JrqaWqi8TN5SvwcfPIALNPAEwZ/ahwjr7soLGtmFZIT+vs
 IIQg==
X-Gm-Message-State: APjAAAXbMXkdcUN04yP8ER4JhE2Ql3XwXA1tC3zis+dzvEnBGXSlnc8k
 DvtuuddwTW8Np3gNxBv1qHr6xw==
X-Google-Smtp-Source: APXvYqw67mn/C6o2B6Hhuu5yLbtbFiuncxxwnfvs1PLV5R+P3wDBwHIDnU1c81ew3pLC4f4DPqnhoQ==
X-Received: by 2002:a63:a35e:: with SMTP id v30mr4313148pgn.129.1566573766163; 
 Fri, 23 Aug 2019 08:22:46 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 185sm3001557pfd.125.2019.08.23.08.22.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 08:22:45 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190823100741.9621-1-david@redhat.com>
 <20190823100741.9621-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <de422b59-7e1c-3d51-573b-b15ee617f5d8@linaro.org>
Date: Fri, 23 Aug 2019 08:22:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823100741.9621-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v1 3/9] tcg: Factor out CONFIG_USER_ONLY
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

On 8/23/19 3:07 AM, David Hildenbrand wrote:
> +void probe_write(CPUArchState *env, target_ulong addr, int size, int mmu_idx,
> +                 uintptr_t retaddr)
> +{
> +    CPUState *cpu = env_cpu(env);
> +    CPUClass *cc;
> +
> +    if (!guest_addr_valid(addr) ||
> +        (size > 0 && !guest_addr_valid(addr + size - 1)) ||

I think the interface needs to remain the same between softmmu and linux-user,
and we should not allow size to cross a page here either.  Which also means
that the second line here can go away -- we only need the one test vs the
single page.


r~

