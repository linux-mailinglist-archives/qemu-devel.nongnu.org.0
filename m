Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1979B003B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 17:38:00 +0200 (CEST)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i84gx-0005S6-DU
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i84Oz-0007ru-K5
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i84Oy-0004LS-KR
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:19:25 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:35878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i84Ow-0004Jk-KT
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:19:22 -0400
Received: by mail-qt1-x844.google.com with SMTP id o12so25749688qtf.3
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vP4BMwBAEOHvZhx+hdQUEETkL4LYc4nxNKTTCWQo//s=;
 b=b8awdXdPMI7z0ZJ82vF3tqAVJqQirHY6JIwZ8kBq1aKadqNseDClWTLl44YaAp52QY
 re9lb1bxzy7URr7Oi5VvErAFAngMdnw9WWp5pB6eIwEO+ZChttxuMzyl2henwHF/1WCT
 bU/MTHwcy2NCxkBan6Umy36ks4Ag5/WLzSHQNJnWGkMDMMXX5eti6BwAIGdIsxcZXscG
 qFOtejqxw4I1+JqkWjT1R/WgFey7ZrrGVKbVf7HTb05/wmqnKjAuGC3ScxRiUt251Mcp
 0Cicqf1J0H22XUS7uyYIBgEmXUWIjVM2YWV3eKnaSmAl2bhWkFcPma4mRKGKgnLqJ+z7
 E49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vP4BMwBAEOHvZhx+hdQUEETkL4LYc4nxNKTTCWQo//s=;
 b=lp2DsDz1mveNhZbnCLa+DLSVM1XPlbcRyinsaAWsSHPtw5l7xCRhnGPsqwkO097WJl
 SgfGPJsleR13RA1irY12ELvpSLY5dz7bl4dOJSqKZYCzZ9OzuEjgiyfKhhN7UpElJhgd
 wds+miJ7NLDXj+e+ERu6pvRk+kTecaNCC02Lsk/KPex0iBaOilDhazGrxdpGVpt79KGE
 v5Yq8d0HZ0wBFz0CBoXEeJluaCdgwveM1+zJH8WBlWgfTNsQWsqSk9I+SdeCuhNrTFGV
 RqykpimHOSlq85QxVe1Z473nfXXQf7ASbiL4Z/bb3sjq5wDJDGejlbXe1W46eoZryKb/
 K+KA==
X-Gm-Message-State: APjAAAWYq1VdLcxqY6FlJhvbDxik4x7vGhuUdZWImRX8SUwNOHd6Jb3R
 bbuWUc4oN9MhssgkMVoxrKBpxA==
X-Google-Smtp-Source: APXvYqzhpGIidCaGuxPmPwWl+FD61TkaAgaYkT4ZlpPsLRI8uMT7M88JWHKplz+Jv97CCrRjQU7RUA==
X-Received: by 2002:a0c:add6:: with SMTP id x22mr22752919qvc.203.1568215161166; 
 Wed, 11 Sep 2019 08:19:21 -0700 (PDT)
Received: from [192.168.5.185] (otwaon236nw-grc-01-64-229-69-35.dsl.bell.ca.
 [64.229.69.35])
 by smtp.gmail.com with ESMTPSA id p27sm9315114qkm.92.2019.09.11.08.19.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 08:19:20 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-15-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <11f705fb-f8cd-d12e-de33-be1c3d009373@linaro.org>
Date: Wed, 11 Sep 2019 11:19:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-15-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH v2 14/28] s390x/tcg: Always use
 MMU_USER_IDX for CONFIG_USER_ONLY
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> Although we basically ignore the index all the time for CONFIG_USER_ONLY,
> let's simply skip all the checks and always return MMU_USER_IDX in
> cpu_mmu_index() and get_mem_index().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h       | 4 ++++
>  target/s390x/translate.c | 4 ++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



