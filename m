Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E002D3763
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:07:56 +0100 (CET)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmn1P-0005k9-R2
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmz0-0005ER-Ti
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:05:26 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmyz-0002Hq-AU
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:05:26 -0500
Received: by mail-oi1-x242.google.com with SMTP id p126so514210oif.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MmDUknZbPdoOOOe7WkzxUZQ1fpq6zqZ4xwNAy8krZNU=;
 b=b1hcCLKDRny55X7kM4SfG+K3WbqEOqAJGiusqUOUVVsFRXakdW7RelaLI4UbIrxb0S
 5LnWnS3GbhR62PdMJ1iZ6bu4fe8npetcr/Lihga3B9wqOHMBcqONQLDsU/80K7Jzd5wx
 RPTbiqHRqCe0GLSYHPIhJdehmdF+/W0G1d06isSRx6klC7kq0byqIaKbAk+EsgzgyWyp
 kox4jbj7l9VF5FVdnVLRSqtgi8uk+PSqqK7yNMuUiMJeu3b/cgdEmnjuAn4ga+xHqYzj
 H7NJZXe58W5rVKM1jycqQl2zzXCLh7J9cQ0hF39EWBof9FK8Tozj9AmoquLlGPlSte3i
 2G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MmDUknZbPdoOOOe7WkzxUZQ1fpq6zqZ4xwNAy8krZNU=;
 b=rTEWG8NElETlmuzKm/wD//GiGwR52cXeIvaSv5ocDPwNYpUZ1fZF8J+g59VUVwlc6H
 dWs1TyY4M0UEqCOg3qCnkBWT+qylPLndH8C7vMarYce7Y4oDmm703fqUbppTqtR6L51v
 OdF/VeUvdKh5Fvk+dvRgeiiHTFMnyaP2Ywbfy68Vr62nPWwH84Jxr+qrL/XnqlePLdnJ
 FKBOP63dkLwxZMablVDFvClVqkCewKHpZ7gOzDyefJODjbfAM8O6/dcyRPhMqlBaXdpM
 3IB0Od5ZrTc5+xNXPLlyTgGTRKB5B8SFS/gD0hjyPiAcDEWpoVmUWTj97qUyvINQ9iLV
 XcsQ==
X-Gm-Message-State: AOAM530IumFaFGu0kwi7VBPMctF4yknvrHPt74kJdNNwelnKaDFt/jKn
 v/53LFU3magNaVz6eOOCsjHFzg==
X-Google-Smtp-Source: ABdhPJxQUw34FDhia5F1bFPgZKf08UqJf1dqRMoPcDDU7488cayhesVtgx8SYUmL7PhDSr3cBog13w==
X-Received: by 2002:aca:f3c6:: with SMTP id r189mr301659oih.83.1607472321823; 
 Tue, 08 Dec 2020 16:05:21 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k13sm85929otl.72.2020.12.08.16.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:05:21 -0800 (PST)
Subject: Re: [PATCH 16/17] target/mips: Introduce decode tree bindings for MSA
 opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c36ea51b-59e0-22a0-ebb1-9f1224df32b5@linaro.org>
Date: Tue, 8 Dec 2020 18:05:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208003702.4088927-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:37 PM, Philippe Mathieu-Daudé wrote:
> Introduce the 'mod-msa32' decodetree config for the 32-bit MSA ASE.
> 
> We decode the branch instructions, and all instructions based
> on the MSA opcode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h         |  1 +
>  target/mips/mod-msa32.decode    | 24 ++++++++++++++++++++++++
>  target/mips/mod-msa_translate.c | 31 +++++++++++++++++++++++++++++++
>  target/mips/meson.build         |  5 +++++
>  4 files changed, 61 insertions(+)
>  create mode 100644 target/mips/mod-msa32.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


