Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4032A43B91D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:11:47 +0200 (CEST)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQvK-0002zU-BZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQrz-0000mZ-9I
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:08:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQrv-0006O3-2V
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:08:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e4so20773497wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9CNgQFiqRSDoGrWQU4W+iZ+MRopXifqFfoHWjRw7+ZA=;
 b=NpuKPmoKR+pLJ5Bx/Ft7eyrhKQnwZ9ZWFYZKZAiZNUo0h8ZrQpGrpdqgzU0AgIPoMm
 PSh/tM86qm47JOFQjxreUs1sk2sDmGl7vcqtofblSxscWVuDSbFL8qokox32/Kg2/NTj
 dtCrMIjqlAqpoaEa56z0x/oaQtoGmC6QvNg4GiyGU3eZDCg8H3h62fsjGx8Gl7Latl0b
 HK2u3miOsy06vhbsLZp+ndPSOhZLbX1zmyZRlaFkNIcWskBZDoV+cO2/+3yC5D8JC7lg
 EPP4uiWu5Ry8QEnheyIn2Lng2CdGOAdOSmj3NASoW1rvYPrjWucwj5Ci+BZ8LlGl5kvb
 FMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9CNgQFiqRSDoGrWQU4W+iZ+MRopXifqFfoHWjRw7+ZA=;
 b=DsS+vYdKqdCJ9TqTBJoS25oZYnbeewfjVvGcv2ODLGqhH7/5KEMcNGeKnjjzwhgfI6
 0ChG+ieGe48R7k0qLRdIGMYaIpv6M5BIR1g9ZNgXNk/BohENcYaKtblTTedGCandcmkk
 QSILhgBrfzjS96AQ4KY+V86mc52IXXWEEjQRvJX4WGb1/sf5vsHI5uG9nBP5oDpoJgmS
 YRtNEQVGzF4h0G5n2TzVzeVpULGVmGx98DUc1AKdrEvItTD0YV1F9hzZf7c0HqOf4V58
 O0l/ogAeOivj3f4UfzBJm/x/NyokfWJ//eI73SPkCsWCxK3f99Cybqh6srbyYTQbLWQD
 WdBA==
X-Gm-Message-State: AOAM531DCQv98GqIKGaUgJTt0gkL59cL1UlLTZo05esAxuUcECeC92L4
 Sp6OznrNGqMpGrw1h0emw3UftmTve1c=
X-Google-Smtp-Source: ABdhPJztSldUeS4hi5N4OF5TJ/0rixtfXxfGyFP8vZuo9ETsZ1QACuYTxvNrosX+TmxWHEzagyqSsw==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr29449694wrq.240.1635271693365; 
 Tue, 26 Oct 2021 11:08:13 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 126sm1226248wmz.28.2021.10.26.11.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 11:08:12 -0700 (PDT)
Message-ID: <1ab43a23-262e-09a3-7dc7-1bc4481ca1e7@amsat.org>
Date: Tue, 26 Oct 2021 20:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] target/mips: MSA opcode fixes
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211022174550.36937-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211022174550.36937-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 19:45, Philippe Mathieu-Daudé wrote:
> Fix a pair of MSA opcodes, and update the MSA_IR config register
> in the Loongson-3A4000 model.
> 
> Philippe Mathieu-Daudé (3):
>   target/mips: Fix MSA MADDV.B opcode
>   target/mips: Fix MSA MSUBV.B opcode

Patches 1 & 2 applied to mips-next.

