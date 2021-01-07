Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C712EE99E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:12:19 +0100 (CET)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeS2-0006hq-Jl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdrU-00074G-0l
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:34:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdrS-0000Aa-9i
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:34:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i9so7157857wrc.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=inqzMwIbHEhRmksZNhY+RmQT7ewMopiNiKoEKcrtGWM=;
 b=JiyCv3tdWrY+W5IV38jqazvljTzNfUHsq+psZAIQXltf092zx8U/7jnY6jFigsTLu/
 Af1im/EfzDETWNX/rNRlJpVLXZzgyCEIl5RTAHNMEnS8dkvmQwMXQ1DLwRcs6fvmDE3Q
 dAvn/d9HBou87Kw96w4UP6JHxJTfUDjU8G1ulVap8v8TU9F7RcXetfIIusAljjQvIA93
 hJQtWLac4j7kZsaLdmXvwql8Z13zvmV1Q+HS9ChBcj+2HFRLlDQDNzLsNGeCyUcm9z9J
 U6W6gtdlPG7/J+VxC4RSeBXpgU+S7Bp7T7H60QZDOB3zMpOoV3yAHKEANl5wzgyzJ5cA
 MbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=inqzMwIbHEhRmksZNhY+RmQT7ewMopiNiKoEKcrtGWM=;
 b=WBQvPKVd+/IylYlQwJx6Duf3fD6Y5l3hFPlpBu1AdUalLZMCR0Ev5EuISu+IlOMrNU
 cBkN40Q+stqPjGrVIpU5914RUZW+5oK6sjyTl/M1FS6re9ApZomkZotAXuOliohpVCbk
 MM9b0FV4uNdAvNA48Bs7UcePLuA1J7kRb1oukB22w3M4E6Sc51nEsLYbVZ98C0ECVFDx
 YRcwQj9QuSzshdD2yb19+Qjqm6FzvBkVrdj2t02Y5hddqJ0CbVinBhJV/zTHHhLpOVZc
 T6RoFqzBfIg/7cqZjFp52QftwBGt++pLmHsOWh6NqUb9JBqAoeGeeN6XAO0x4n0d+TMG
 l2sw==
X-Gm-Message-State: AOAM530iKA/yY/A3UszSVIzt2emrSWQ4Qr+0PlJk1/Tpf808iBpAoK0X
 XFwqXtuYL+enO6ES0XxcDNQ=
X-Google-Smtp-Source: ABdhPJycQl81Bme+Z5yIogCRUT3pvwazj0aT9qsxJ1Cd0z2OTNpcqKMmLAozmUsiXByrA4E1RpM5NQ==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr720081wrc.240.1610058868959; 
 Thu, 07 Jan 2021 14:34:28 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id g5sm10477744wro.60.2021.01.07.14.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 14:34:27 -0800 (PST)
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: qemu-devel@nongnu.org
References: <20210107222253.20382-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e658e795-63ff-eb0f-1ff0-dcf93fd77384@amsat.org>
Date: Thu, 7 Jan 2021 23:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 11:21 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1d3:
> 
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-060121-4' into staging (2021-01-06 22:18:36 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/philmd/qemu.git tags/mips-20210107
> 
> for you to fetch changes up to f97d339d612b86d8d336a11f01719a10893d6707:
> 
>   docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-07 22:57:49 +0100)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Simplify CPU/ISA definitions
> - Various maintenance code movements in translate.c
> - Convert part of the MSA ASE instructions to decodetree
> - Convert some instructions removed from Release 6 to decodetree
> - Remove deprecated 'fulong2e' machine alias
> 
> ----------------------------------------------------------------

I forgot to mention there is a checkpatch.pl error with
patch 23 ("Move common helpers from helper.c to cpu.c")
due to code movement:

ERROR: space prohibited after that '&' (ctx:WxW)
#52: FILE: target/mips/cpu.c:53:
+    cu = (v >> CP0St_CU0) & 0xf;
                           ^

ERROR: space prohibited after that '&' (ctx:WxW)
#53: FILE: target/mips/cpu.c:54:
+    mx = (v >> CP0St_MX) & 0x1;
                          ^

ERROR: space prohibited after that '&' (ctx:WxW)
#54: FILE: target/mips/cpu.c:55:
+    ksu = (v >> CP0St_KSU) & 0x3;
                            ^

ERROR: space prohibited after that '&' (ctx:WxW)
#81: FILE: target/mips/cpu.c:82:
+        uint32_t ksux = (1 << CP0St_KX) & val;
                                         ^

ERROR: space prohibited after that '&' (ctx:WxW)
#89: FILE: target/mips/cpu.c:90:
+        mask &= ~(((1 << CP0St_SR) | (1 << CP0St_NMI)) & val);
                                                        ^

ERROR: space prohibited after that '&' (ctx:WxW)
#116: FILE: target/mips/cpu.c:117:
+        mask &= ~((1 << CP0Ca_WP) & val);
                                   ^

ERROR: space prohibited after that '&' (ctx:WxW)
#121: FILE: target/mips/cpu.c:122:
+    if ((old ^ env->CP0_Cause) & (1 << CP0Ca_DC)) {
                                ^

ERROR: space prohibited after that '&' (ctx:WxW)
#131: FILE: target/mips/cpu.c:132:
+        if ((old ^ env->CP0_Cause) & (1 << (CP0Ca_IP + i))) {
                                    ^

total: 8 errors, 0 warnings, 433 lines checked

