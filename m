Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFD26976A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 23:08:38 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHviH-0005nv-Ai
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 17:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHvhD-00050H-3I
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 17:07:31 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHvhB-0001T9-7T
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 17:07:30 -0400
Received: by mail-pf1-x441.google.com with SMTP id z19so600243pfn.8
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 14:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lvifpOAZ07NxbsJSd1tgXoFjSvH5DgviEXxabNXI1T0=;
 b=SdOmBfBlJoIRIQp5gyoYDZoNw0gsGY6npFXZL5IA8y1wamI/Csj9zeRe1wjZMLuaxY
 2Di7BeDZZ2D8JUuu1E6IZ1UzyAmhSEZRD4mA5OtPlNrOV55Yg7tBjxPvZ2oesJzXhhZF
 VZuZ2/6ZdhBpR0JwAU883hSyFYsG4jXqol/YVpbgJ8QSoYuKAk1ty3/CpnOfM5z1WM99
 5+CZeMQv6owMllKejNhHMmYH5oGo5lLzeXH2vp+/BB0k35FLVG+UkATUP6pTtBqVOCsX
 FGySgTC/SugM2kh4XnFikOhg/geApKr8xh4RieoLuTAfTwSHtnXuivWdCQ/0jqhrrteD
 4HeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lvifpOAZ07NxbsJSd1tgXoFjSvH5DgviEXxabNXI1T0=;
 b=WMaYzQMRKm/KwBGiA1JhmXhT98YFM34IB/JZDXgscEBosPKgnjGeh/f9jVj+BqFsGN
 qNS9UM2YUUqNWSAAI6sO3DPr8DZhDb95XEPqgEp22k7tKR8I/J1aHXdJpfq5z8zaOeT5
 Btm68N1Bbfz5UouhfbuQH7omaMDFkGFZIGWLYjJEA7oZTlkUsEIsWop90Sggy3gpZtNn
 vYxDt/x45ka01VHWow8wB2qw97DOullQJhhJkLBJr91a467UlUvBynD02K/uBbGRwPnT
 YYAkXjXQcGyEzyZsCV27eirMqQsLnurbFvcLWfvmhHtQNe4OMmz/mDL7nIgzhGWMcFBU
 pk7A==
X-Gm-Message-State: AOAM533cHrfnCukBU+OJruCL1rxL1UsFZHDwApQW+rVGk0lhmjbGMnok
 /bOnqOYNJfmBqSKtKGfSjKx4Tw==
X-Google-Smtp-Source: ABdhPJzquPxfdDsPQM/R6iGqofxGQMnGvYhY9bInjm9Y2UDJ5Vnwm2JuR0hTVanrz198dFwQshks+Q==
X-Received: by 2002:a63:4404:: with SMTP id r4mr11368067pga.29.1600117647140; 
 Mon, 14 Sep 2020 14:07:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id bj2sm10249352pjb.20.2020.09.14.14.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 14:07:26 -0700 (PDT)
Subject: Re: [PATCH 11/11] disas: Enable capstone disassembly for sparc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200914000153.1725632-1-richard.henderson@linaro.org>
 <20200914000153.1725632-12-richard.henderson@linaro.org>
 <85136547-9be9-f89e-eabb-fb4a0117c46e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <664ad3cb-7c27-41a0-9a10-3c6fd9cfdd5a@linaro.org>
Date: Mon, 14 Sep 2020 14:07:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <85136547-9be9-f89e-eabb-fb4a0117c46e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, luoyonggang@gmail.com,
 alex.bennee@linaro.org, thuth@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/20 11:23 PM, Philippe Mathieu-Daudé wrote:
> The old disassembler is easier to follow:
> 
>  ----------------
>  IN:
> -0x4000d214:  lda  [ %g3 ] #ASI_M_FLUSH_PROBE, %g6
> -0x4000d218:  sta  %g6, [ %g4 ] #ASI_M_FLUSH_PROBE
> +0x4000d214:  cc80c060  .byte    0xcc, 0x80, 0xc0, 0x60
> +0x4000d218:  cca10060  .byte    0xcc, 0xa1, 0x00, 0x60
> 
> ^ lda/sta opcodes not supported (there might be more).
> 
>  ----------------
>  IN:
> -0x4000d22c:  sethi  %hi(0xf01f0000), %g1
> -0x4000d230:  mov  %g1, %g1     ! 0xf01f0000
> -0x4000d234:  jmp  %g1
> -0x4000d238:  nop
> +0x4000d22c:  033c07c0  sethi    0x3c07c0, %g1
> +0x4000d230:  82106000  or       %g1, 0, %g1
> +0x4000d234:  81c04000  jmp      %g1
> +0x4000d238:  01000000  nop
> 
> ^ hi()/lo() macros not expanded (easier to read!)

Hmm, yes.  I'm going to drop this for now.
Maybe revisit if this gets fixed upstream.

> Can we restrict dumping the encoded hex content for debug
> profile only?

Why?  Including the hex content was in fact requested when I first added the
capstone code.


r~

