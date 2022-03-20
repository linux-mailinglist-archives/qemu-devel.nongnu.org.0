Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6C4E1D88
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 20:08:59 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW0vB-0002Xh-Pn
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 15:08:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW0u8-0001lH-Ti
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:07:52 -0400
Received: from [2607:f8b0:4864:20::634] (port=39889
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW0u7-0002P7-Gf
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:07:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id d18so11010624plr.6
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 12:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xpU5IxxJv3aBMTtW9szSsFcekz55tqki9VnUOaFjuqk=;
 b=nSE1vOFAp8kw0JaOwra3vR1M3uAit+SLJ4+3gIm6RlmYaAfWRM5G1KF3T2sUqnVjf1
 xQrAje0thu1NPJU9jThOcKlErNsLcf+SLjXBfGbo7RllrBZZKrTPATvu9xp1Z9Xqop3h
 l+c9FnL7Qj+2tgH/CBbsx47t8dUQIQq8/qEXZihM3hnkL8QRq/XFXXHt5cDdx+fum9Rp
 imqg+MmzCQ9KeVLSA4W/5dvQfp6c+4HHUwwe/aHpMOqTHu327y9+gk1l3tkfxfb/hqcF
 BZGz/HjMJkrJGfGCwWDTqAK0dgQdwdPtA6PeBsEDBVNjCS0ETcNziJIh64z3t3BoGJIX
 4ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xpU5IxxJv3aBMTtW9szSsFcekz55tqki9VnUOaFjuqk=;
 b=QN/26mIL9h2iVhtbcwfE7iOAXRZYDCRLDD8BeCqwjrOpY5inSbp3JVimen0MqwUQ4+
 0UIW6pI6dBS5Wu5nVBVI9emqY4twm0UzKzScyycIB73trG7Qs0mKbVhFqxY1ukY1lcaX
 JHyETqme3YzY0gmGByKiIUh7g0B19XjhP7OP1q9AQuxryi3GvI+zMUX5BXjNJf4Z7Zyb
 FMPZsjFuFsafJJgoaelTTuOvw91O7sRoNVG3u3Pl+e5r448mJqHILnSmURm49TiQ1ia6
 eyXg4t9MDpTamCcqURbd0D1wLH6yVyqVWnEjz2nnBWlahBg8pI7KBECZNO4cGT1JGkiw
 OISA==
X-Gm-Message-State: AOAM531MQ89nU8vERkscsCr9cSrjayb8Ft+vIoOw/i0mzNrgbEx1lxXf
 BFF/Fc/uZ35wFKKrry0btwvbXQ==
X-Google-Smtp-Source: ABdhPJyYim+eNEfACSVagHEYGUgxcmVnbYiusnftzRZcCvzCaNSicMs7auh07KjMZX/lHnaRVsEQ5A==
X-Received: by 2002:a17:902:6a86:b0:151:f1c5:2fa3 with SMTP id
 n6-20020a1709026a8600b00151f1c52fa3mr9453324plk.77.1647803269907; 
 Sun, 20 Mar 2022 12:07:49 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm15895320pfj.128.2022.03.20.12.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 12:07:49 -0700 (PDT)
Message-ID: <5389600e-2bce-3db4-3826-1d46221dddb0@linaro.org>
Date: Sun, 20 Mar 2022 12:07:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] fix cmpxchg instruction
Content-Language: en-US
To: Wei Li <lw945lw945@yahoo.com>, pbonzini@redhat.com, eduardo@habkost.net
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
 <20220319160658.336882-2-lw945lw945@yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220319160658.336882-2-lw945lw945@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/22 09:06, Wei Li wrote:
> We need a branch to determine when the instruction can touch the
> accumulator. But there is a branch provided by movcond.

There is no branch in movcond -- this expands to cmov.

> -                /* store value = (old == cmp ? new : old);  */
> -                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
> +                tcg_gen_brcond_tl(TCG_COND_EQ, oldv, cmpv, label1);
...
>                       /* Perform an unconditional store cycle like physical cpu;
>                          must be before changing accumulator to ensure
>                          idempotency if the store faults and the instruction
>                          is restarted */

Your branch invalidates the comment -- the store becomes conditional, and we no longer get 
a write fault on read-only pages when the comparison fails.  OTOH, we're already getting 
the incorrect SIGSEGV behaviour, since we get a read fault on an unmapped page instead of 
a write fault.

The faulting behaviour could be addressed with a write_probe prior to the original load. 
Alternately, we can use the tcg_gen_atomic_cmpxchg_tl path whenever mod != 3.  While an 
unlocked cmpxchg need not be atomic, it is not required to be non-atomic either, and it 
would reduce code duplication.


r~

