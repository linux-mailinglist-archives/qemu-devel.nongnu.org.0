Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA54B1DF0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:34:11 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOZO-0003hA-Ls
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUs-00048S-BX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=46999
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUq-0007ba-2G
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:30 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso7779010pjh.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QujREavyHjmRyVtn3Sec19fnsM/maasBrFxN0alYsQA=;
 b=NTmAHhpzf63/9DGRlUAhaOm4hyH1YDRbyEWzwJThQbgIyS+7PAVT1xsBmdpM75S4Rb
 u18kruXElM3qF7GLTxyBEaYfTvMTAT8KTRh+vd2LKVwULrqFqI5i8gIb2EEt4u1ylALO
 4Z3MV7cT/IOSDWTV5H+1L9G7+GIfmF1Gy8GiZam6zIL3HJFPpfnqwGk5SZFF658yHIzk
 s6e5UR2giqM9c3YVSdvLnu9hVsTz0gPN9niki0jJQa9BdKTR002c0EBqkGBGTo1YPTnH
 21fBPesTO7E1TxR4N+Ea35WS01zJwCJxKVfFazqw8LLhoW329WALhzjWDRTStFthpaBJ
 h7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QujREavyHjmRyVtn3Sec19fnsM/maasBrFxN0alYsQA=;
 b=awNnp43p0bWFSIkm8EYO5SftmNvDK07MAuWpgBezoz28nloUQrzII0nUkqfUhKeAot
 LbFYo7xGZ8eBf18UGXMxPZWtbo8QOSIEXdC/oIhi1j/4wbaJuUVQyZL1kPVRbn4seZ8y
 d78F+E9L5w358LkP+fz+sErSUBIfdL/f3u7wRqbulON+NRBnIEAFevhS3eln8XzsNMLk
 1Pg1ZhvFWCSzLkzlM79M9wjUxZoB70RQVknF2YKousWzlnIyNAb+tJv3bsfGWPO0IXTz
 VbQipj/K5EsROsAHWPfk5HHnd3sppFVTuFTrS/H7vb3X2M7HQJjqEvGzkKewQ7dv0RmU
 uTdA==
X-Gm-Message-State: AOAM532aTH+LNaDxyEULf0WgJyDDYVTTEdkRHlpsfcE7umqyHwhLjEw/
 JamBB3K21HEEUH12R8wKW67RAA==
X-Google-Smtp-Source: ABdhPJxNz3BYwIryfoD8lM7jYdkYF5W9oP7Cz3qYjlCBeB/X0XQmnLvsLn3w3sV0GcL4rfky19+SLw==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr984018pjq.162.1644557366500; 
 Thu, 10 Feb 2022 21:29:26 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y191sm25680026pfb.114.2022.02.10.21.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:26 -0800 (PST)
Message-ID: <6b51d891-690e-28a7-bb08-2dbc776fa106@linaro.org>
Date: Fri, 11 Feb 2022 15:55:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 13/37] target/ppc: Implement Vector Compare Quadword
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-14-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-14-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vcmpsq: Vector Compare Signed Quadword
> vcmpuq: Vector Compare Unsigned Quadword
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  6 ++++
>   target/ppc/translate/vmx-impl.c.inc | 45 +++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)

This one is complex enough it does warrant branches.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

