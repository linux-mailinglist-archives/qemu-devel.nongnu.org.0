Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0E61365B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTu4-0008BR-G4; Mon, 31 Oct 2022 08:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTtx-0008AM-L2
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:28:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTtv-0002Rg-KG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:28:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id z14so15720039wrn.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ga6ccb1iHONeCFfZyneSS/e2TG92zFsyqDva7V4HJfk=;
 b=UU+l7cgs3mid9Nm/bUEz11mvjB9K08Wqxc4G3VEPDSeS35UciH3ik53Xso/Qe0WVTi
 1FONxwSpXT8Nkb8tMtci3+xvWbqe/blCIz4Qt/vK9Rvrsd2iMMQyLi/nOiJJrUohxKyQ
 KZGOavKfflMXFht9a7KVLRcanzMS5cVmhVEnP2SPAMYVYhpFCmgPqhLxhvrcWDvrWGXu
 V+9cAowuibKvQF4X09XTLiP4fnL4dh3HBqybjH6xf06okm7ug+XtsRvgHCJXPNNikz7W
 caOiIr/+VKQDASDXtWJRWmzu7fVA2aQlCA5jTxEvT3mtPCeit5mGcNBMiCDBZFDT7ABR
 Ko4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ga6ccb1iHONeCFfZyneSS/e2TG92zFsyqDva7V4HJfk=;
 b=mCSdXCHo9SqDPoNfxUlhVZBXzGMyXjrb6Qeu55GLrdV9fj05A605gYl/JUv2f6hzU6
 /eKAvTPjB+kuS7xAYWUTmx+ZTuj2zkED5m2iuK/f8gF26lNrDTpWJ2uuPepwqHNzUiPm
 vHUUEc4h/is3ciKpvrch3FgtFsEHwS2xdr2IliKqUap8RPgtsrV1sDeCL1hTlhtNgGX6
 Y2/mLF9C0gKU7MZ/OndB2H/kzqakq/Ii+NS7TyLJvASLmgOcmjpWLpXzgwHpvHe6YhQf
 aFH/XkSIHsS2MwPynvqICSnmwk7M39MZqCn6FzL2T7EKbh24Inxe8xqoUzfJ17NVhoPG
 ZPog==
X-Gm-Message-State: ACrzQf3bsDg7zxTEgOsN1PzqSDHI2axRKQzT7bPTNa8NXufwjKBTmtmH
 WrCsQtsturYfK4lZrM82HXpw7PkV6BKzBw==
X-Google-Smtp-Source: AMsMyM4zVtEMKUTvAY7nhSSVuc9R5rh49O3Z4pnKVCb1tPZbfzzOyYsHBvQm7L+Jg0EO4aIM4bADPA==
X-Received: by 2002:adf:e804:0:b0:236:657e:756e with SMTP id
 o4-20020adfe804000000b00236657e756emr8000654wrm.452.1667219301727; 
 Mon, 31 Oct 2022 05:28:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk17-20020a0560001d9100b0022cdb687bf9sm8517510wrb.0.2022.10.31.05.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:28:21 -0700 (PDT)
Message-ID: <a996553c-b7ee-9d6f-497d-a383c8544d3a@linaro.org>
Date: Mon, 31 Oct 2022 13:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
References: <20221030222841.42377-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 30/10/22 23:27, Philippe Mathieu-Daudé wrote:
> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
> 
>    Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20221030
> 
> for you to fetch changes up to 487099aee951e4966936acd3e9afd24c69de85ea:
> 
>    hw/mips/malta: Use bootloader helper to set BAR registers (2022-10-30 23:08:10 +0100)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> - Convert nanoMIPS disassembler from C++ to C (Milica Lazarevic)
> - Consolidate VT82xx/PIIX south bridges (Bernhard Beschow)
> - Remove unused MAX_IDE_BUS definition (Zoltan Balaton)
> - Fix branch displacement for BEQZC/BNEZC (David Daney)
> - Don't set link_up for Boston's xilinx-pcie (Jiaxun Yang)
> - Use bootloader API to set BAR registers in Malta (Jiaxun Yang)
> 
> Unfortunately I couldn't run my usual test suite, but I ran the
> best testing I can do in the current time frame :/
> ----------------------------------------------------------------
Last 3 patches (53-55) are missing because they contain:

   Reviewed-by: Jiaxun Yang <jiaxun,yang@flygoat.com>

(notice the comma), which my MTA rejected.

I updated to Jiaxun's correct email address:

   Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

and pushed the same tag.

Regards,

Phil.

