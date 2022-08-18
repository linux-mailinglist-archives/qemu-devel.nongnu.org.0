Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576E59881C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:54:40 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhqx-0000fc-6C
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhp1-0005ey-63
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:52:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhoz-0000ws-Fn
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:52:38 -0400
Received: by mail-pj1-x102d.google.com with SMTP id a8so2077635pjg.5
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uoMyDG0hJqGLcptjfXW3sJ9xVCYYNxhple9K1UMyt+8=;
 b=oi1lzYwZ1j3EQ4VtchBWyw4YznLP4a8xwnm59lWsB6NBkbk04QkZl2BFiI8n7RPCyp
 SI5bC6GHsQM08F4ecGYpZ5/FUCkIrt9i7hUean9cxQKo5x20QblymaJIuuYiv5TCG7RB
 c/qnBOA3PPsc6D9y7wVDot+C51G16aBt6lyjo6S9yrvt98Q6tQ7rsFsi79cA7lsiSmCL
 5C/Ad1FB+Ll4thYoQ035CoahXMvE8GS0X7jorIrs1exsXpox9yYSs8EyjEqdvW55LBgf
 PEJ4p1nh4uPnIimLgwMbLMBm2+W8Ty491xpslAWpeFji5l2e2BwWhQTXZpnLYVqlgCHT
 Zvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uoMyDG0hJqGLcptjfXW3sJ9xVCYYNxhple9K1UMyt+8=;
 b=cU0sZFCRS8U+72n0rjVlpqOm5KoHpT4MzgGxaz+q/MrZwKWwEziSF0e/IJz8zOoZ1b
 JE2zQUV2vSmdGKNDY3Wa3JNolQz3gN3ivccDTSk9+Zc3E7lu+7VRxZ8qd6zQYixhvAXM
 msYq3wyl0SvouR6YejNHYbK9r0ltUVyRFq1ICkMjUCZvsleZkCjKTxlwxYGOA752l5qB
 IfOxXfBJd4T0TU9XX+f7S5e1tJoyT7Rg4WLw7IQGnsvllAVEAmrSAI0fhVidd7LZqfcT
 A893qacX8md178ZaItQ9akIWEY1F4wPIlXLd42craN8gv5Ul3Z3czYAqJUIbvd7KZf1W
 psIQ==
X-Gm-Message-State: ACgBeo1WHxsITduWyY19kswA0pBwAvrBZ6iKmg95SW+OWnih+ljGT+qZ
 +ATTC3GTFPYis8MYKghZnKe2Kg==
X-Google-Smtp-Source: AA6agR4onDAO4O5P8GPUMMvMcjpWanKbTUoQbG4C9sNeWh/UUge7r0id08TaOFvzijdfwYbRyF6B3w==
X-Received: by 2002:a17:90a:bc8f:b0:1fa:bdb4:96c8 with SMTP id
 x15-20020a17090abc8f00b001fabdb496c8mr3754180pjr.236.1660837955709; 
 Thu, 18 Aug 2022 08:52:35 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b0052e6c073a3csm1820080pfg.142.2022.08.18.08.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:52:34 -0700 (PDT)
Message-ID: <c45718f9-df89-aeab-f39a-91ec61365904@linaro.org>
Date: Thu, 18 Aug 2022 08:52:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, gaosong <gaosong@loongson.cn>,
 chen huacai <zltjiangshi@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
 <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
 <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
 <ac55b78a-602a-e875-5bf0-c5040d7de2a1@linaro.org>
 <daca3a69-08b3-be35-04b2-e6fcfe8207cd@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <daca3a69-08b3-be35-04b2-e6fcfe8207cd@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 8/17/22 19:31, WANG Xuerui wrote:
> Hmm, I've looked up more context and it is indeed reasonable to generally name the QEMU 
> models after real existing models. But in this case we could face a problem with 
> Loongson's nomenclature: all of Loongson 3A5000, 3C5000 and 3C5000L are LA464, yet they 
> should be distinguishable software-side by checking the model name CSR. But with only one 
> CPU model that is LA464, currently this CSR is hard-coded to read "3A5000", and this can 
> hurt IMO. And when we finally add LA264 and LA364 they would be identical ISA-level-wise, 
> again the only differentiator is the model name CSR.

Indeed, I believe that I pointed this out during review, and asked for loongarch_qemu_read 
to be moved.  But apparently I missed it the next time around, and it snuck in.  There's 
nothing in that memory region that is related to the core.


> And by "not high-fidelity", I mean some of the features present on real HW might never get 
> implemented, or actually implementable, like the DVFS mechanism needed by cpufreq.

Certainly we can add stub versions of any such registers.  Such things are extremely 
common under target/arm/.

> Lastly, the "ISA level" I proposed is not arbitrarily made up; it's direct reference to 
> the ISA manual revision. Each time the ISA gets some addition/revision the ISA manual has 
> to be updated, and currently the manual's revision is the only reliable source of said 
> information. (Loongson has a history of naming cores badly, like with the MIPS 3B1500 and 
> 3A4000, both were "GS464V"; and 3A5000 was originally GS464V too, even though the insn 
> encodings and some semantics have been entirely different.)

That is a good argument for your isa level scheme, at least as aliases.


r~

