Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B22DB719
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:27:00 +0100 (CET)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJid-0001fB-4e
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJTk-0005k6-NI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:11:36 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJTi-0006CF-B2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:11:36 -0500
Received: by mail-ot1-x344.google.com with SMTP id f16so21083707otl.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lz1xbFKIWO9ONK28it2SNE/LQOKsuqwVt2zWkA8/kL4=;
 b=ca9lEI/qt2S4mVe5bgCP+yms7Hh5PKjFxuvO4LDtYP64XCgxbl3mdbAv/KFqnZXFTQ
 hPhlDv+UC9aGQwgoaSEIWqMfWRlAzOOH4Zyy/SNHs9WEivDO0Rj3AJ412xgdtc03e0ob
 IlpE5l1FsmSqCWMa97LhlkeqZCiF8dU26e18NgVRrwI/R+II6J1S+wJOslRL6LuN8vbb
 8jlIpV+tuUD95+by1N/Rtvtu8Cnph74/xomSjvn0hNdGEY9d2Y+K00ge2i9R4ZRMvr8/
 F45hiHA0fzfivmdTJEK+Gb+GtHtC+SGHb4JfEmGdDbxE1dChgRUenJ5LIsIoRiZiSwOA
 Ef1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lz1xbFKIWO9ONK28it2SNE/LQOKsuqwVt2zWkA8/kL4=;
 b=kpb4QeJ9adaX6jTKrkh7c+VsU9/ls66yx/cMrB6aNLXZD0WNZXQPiEudA0rDV+vl3j
 Wj+FLq4b0LTpu54Ykgzsm1QACiAQwUnLlI4y6MB3SDHUTGdG1Pq3+VQxUDdgfepUS9Tm
 N9ummHS+GpnHcM1ACuv0IJODXJ+Kgfp8c9/5co6HhiAbWkIv19FPr4eqzn6foHy9tHjZ
 Qj9IdBSZhqQPzjtlhL2cVuXFpyydr7plfu5a1Lll1qh/cNi3g0B9ffkuhXjCygXW7Fa4
 tbambh9+puBOjGXJDS1MVYEb3OVAwwtIXYSEYrp3qDgtB5ghlJOBFQrAVmzRJg5/eNd8
 kNUQ==
X-Gm-Message-State: AOAM532lU842xbNX3Fe997AeHEZq3xtJ4BJNM+rRb284TbZbqiUihR4R
 r16ncB6dnCsSYf5ZDQRvMG3V3Q==
X-Google-Smtp-Source: ABdhPJytM5CFdCIBe0hRP/2U/AJegRMLiiY11crEq9JgKyKpx8VdYNdsxHE+Y10SNkUnDPVrXDZA3g==
X-Received: by 2002:a9d:875:: with SMTP id 108mr24825618oty.164.1608073893067; 
 Tue, 15 Dec 2020 15:11:33 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z6sm83054ooz.17.2020.12.15.15.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:11:32 -0800 (PST)
Subject: Re: [PATCH v2 19/24] target/mips: Introduce decode tree bindings for
 MSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bdacecb-b1c1-44a3-2482-c2f2d6d59d9f@linaro.org>
Date: Tue, 15 Dec 2020 17:11:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Introduce the 'mod-msa32' decodetree config for the 32-bit MSA ASE.
> 
> We decode the branch instructions, and all instructions based
> on the MSA opcode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h         |  3 +++
>  target/mips/mod-msa32.decode    | 24 +++++++++++++++++++++
>  target/mips/mod-msa_translate.c | 37 ++++++++++++++++++++++++++++++++-
>  target/mips/translate.c         |  1 -
>  target/mips/meson.build         |  5 +++++
>  5 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 target/mips/mod-msa32.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

