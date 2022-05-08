Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A83051EAE2
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:19:52 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWWV-00021k-3h
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWUV-0001Hp-L2
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:17:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWUO-0000Gd-GP
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:17:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso14161730pjb.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FGmynYtd5f+6SuGd+CLczNshxTuCRsXir9QL57gbkHA=;
 b=bB6FBnKle0QTdzjSrjPQ9yxuI883kAIET4MM13t57rRZ9UFlP6aRLhgv+LQzcFtZXB
 26+aifV+phHFBIyffqJYTcqAo5jN3IsU/7GWdWtoOUzvOM67S5RwYyktsEhQ3UO52fBn
 rt2hf2VflkachFRzegRK5/gSZCBOgKdVBfwMUL1Md0uJ7dKfTZso4W1GJ7M41ODMilkt
 /77e/VQZ33o3D988EwjKUzR7/DjKiU3+/dtX2LGe3JTvewkuxrkLWDI4UUcoy9TavAsN
 /jdd20QeK9KeXXu1ibN0tsOcNYR2FgR/PNRaF96aEIayb/PWIIby3AbObZ+NXra14WS3
 HBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FGmynYtd5f+6SuGd+CLczNshxTuCRsXir9QL57gbkHA=;
 b=4kGn8orGTdYgrUJRSUOa4FnGf2UEi7ga+uZpkdOV1pU7r2NLdeIqQgD4fsyU/aebr0
 wZdwlHVCHdyulQ7CqWFee/+W+kK0deMGXg5ruEUZkvBqz+IMDKpWEKE0r+d/En/zmNou
 URCi+DBWbp5OX1VH4QyW5dNCYo12c3N9nkRRlhDFRI/rp8WvsHnlyHt1R5XmIZm1Tdgk
 DnSxqGuLqW9Ot2C2WiQfqKu5IHfFLZ8GWGvKzzTrHf9ZQgmTTgbdlCzZyZBGOLAsYHC0
 gIEB8u+GAK99qXEXU+UVFsXK1lLOtbi4dGQ1l06fNjqjmzUc/n/d4nUct5yK1WkCwv6N
 BQSQ==
X-Gm-Message-State: AOAM532tllhbUh6uS7ilIFZXks1cJ/JTAZIxqmmFJJizm7F/ipCwU9er
 V8twQRB5Cn+Phg8QR7IRgCEnbA==
X-Google-Smtp-Source: ABdhPJxpR86OxqVSRwCbZphg5zYvWM4grQUVD7/v0rpcBKbbaVzd+lrkeFUDDAfFGGyMGWycDXXNSg==
X-Received: by 2002:a17:902:ea06:b0:15e:d3a0:d443 with SMTP id
 s6-20020a170902ea0600b0015ed3a0d443mr10455377plg.10.1651976258572; 
 Sat, 07 May 2022 19:17:38 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 d15-20020a170902b70f00b0015ea0a679ddsm4269029pls.251.2022.05.07.19.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:17:38 -0700 (PDT)
Message-ID: <a779c42c-f022-f8d0-5f8e-e91b62b8b714@linaro.org>
Date: Sat, 7 May 2022 21:17:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] linux-user/s390x: Fix unwinding from signal handlers
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
 <20220503225157.1696774-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503225157.1696774-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 17:51, Ilya Leoshkevich wrote:
> Commit 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
> removed an unused field from rt_sigframe, disturbing offsets of other
> fields and breaking unwinding from signal handlers (e.g. libgcc's
> s390_fallback_frame() relies on this struct having a specific layout).
> Restore the field and add a comment.
> 
> Reported-by: Ulrich Weigand<ulrich.weigand@de.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> Fixes: 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
> ---
>   linux-user/s390x/signal.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

