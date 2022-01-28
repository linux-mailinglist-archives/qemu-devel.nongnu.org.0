Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655E49F1B1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:13:32 +0100 (CET)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHhb-00082b-LZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHfD-0005VZ-AJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:11:03 -0500
Received: from [2607:f8b0:4864:20::633] (port=43663
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHfB-0006j0-1z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:11:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id d1so4601163plh.10
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CmHD/KD952UGoY8XcHGPqqybILVSYCuEFXXcb5e8iBY=;
 b=I///97cFRAuol+LVV6dA7S/5ZLqqSVx8e3NJroKjLeRNciYajY9Ck6++GcH7KnFCdp
 rR12RwHxwa03foj5Jn1TEGGTJyLb8eptWrgv2P/bRRkxyeN4wPezUYYIU9Phh6GwLMYK
 pU3fRl6p2MfUGzcvZyeE+8ASSqtw+7/OzOQlUGeQ5dsxzKY7i31u3y9jTYMhZLZsIK47
 CpbYzZlwjbRAnTQLHNq4Ad9NOb/v5yW0wgT4Fl41ye9ApJuBVTcwJ3S4RPB2WmwYKbZ3
 CPA+OSzX9nWGHXA8rh37mxeWcYidf/KfBCB/qyYV4dOxht/cWl+wTquuCvL60UOydh1/
 i19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CmHD/KD952UGoY8XcHGPqqybILVSYCuEFXXcb5e8iBY=;
 b=mN/xG7YXdMnJG8K1vjBWGUt2iel3knvcCkpeerrF8hyUuiPCxwwvH1gtVucRGPQ9f2
 jfea8kp64URPkey9DVrT0M04WIdE+JX3i6WtgIZoPwZDDT/MpQ0TIOLeF7xNgx005nid
 peTIBV0rAyP/H18h1VpixqGVLo0Zzlg7lCMKrR9JnO4ZGkLBNcmGEdWG5xSIppxtJ8aZ
 yK1tFTcVri0k2lqHw0JCL4o0+R7K5CLXHvz+cWB44+bTISWKqoPiZ5Ut/stR/Sv6E9iY
 al3RUal5pPhfX9qe4gHZpK5Vems9njcG5Mb7PqzN139Hzhw+xBq5Wt3d+aeOMNGcXjcr
 oBjA==
X-Gm-Message-State: AOAM532NBejXkf6EhPhhZenA7hNw7Tf/7A15+qNi3/H92qgDz/bphrGn
 4tTYbYvHtD5ropj3UVbFm18gGC3bCTFiSGB7
X-Google-Smtp-Source: ABdhPJznXeTK3JKGmJ/NYZkhCraQjXjFkNkcXRdKlllM9k/1Oyzp/q1Rlqc/M9VG7J43VNLHS0cfcw==
X-Received: by 2002:a17:90a:b90b:: with SMTP id
 p11mr7506308pjr.189.1643339459852; 
 Thu, 27 Jan 2022 19:10:59 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id u16sm7202805pfg.192.2022.01.27.19.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:10:59 -0800 (PST)
Message-ID: <9e38036c-12a5-09ef-61c9-932fd7e1677c@linaro.org>
Date: Fri, 28 Jan 2022 14:10:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS currently has no tracepoints; add a minimal set
> that allows basic monitoring of guest register accesses and
> reading of commands from the command queue.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 11 +++++++++++
>   hw/intc/trace-events    |  8 ++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

