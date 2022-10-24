Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313060ADF5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:42:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy3S-0005v8-48; Mon, 24 Oct 2022 10:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3J-0005eL-06
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3E-0002C2-G5
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id bp11so15867369wrb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iOEzNkb+i3MCoSeq9AMBndjKjwz+qUqM3JIjhwvPAxA=;
 b=H1vx65sLxUd/JzT/lthSSilitCYhLBCFlpsEz4mEMVDazONsTbxowdCREiJ8tET6KA
 CuooKDfudWNXKwxNvMzjCckXfiedqAT2ITvpoMpOi635jHpcF8DGB1QHvgLkchCUYgOb
 2YoQVDBW/FcMUL5CN3Sa1HMK8gHPrW4dlZURgkufsdzViO8lrHnjYJllJ5uxGHblYr5U
 QVIYg1rDJUQtchRFmsIk2u3DYQQon8rJ8eUZuzQaK8rFhDtYCDKV4lsZX33YeNR5DKOq
 FYmcSMrpDLOyGHXW3jtHUKpl8olvkwongb8rvn+us+z7EM8OUwvO4fHCEqcYYO53Jf6d
 Dzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iOEzNkb+i3MCoSeq9AMBndjKjwz+qUqM3JIjhwvPAxA=;
 b=iZM6TlklRNnF8mzCLX8Bf0mb6ZoQ6rd793+z5TxgYPVVmKpSfjIVY5IgIiZygaHkeG
 z04JtOD84OzX/128r86pzklttqcKHb6E/WpCJVNACvrcA4UK79txREwW4ZcF40qFKJdY
 UaWyVri2OI+46TNNd9Mw8iPuvtWKxCOkKMu0ylntTfDP4czrIf9eshBKXac2tR+lT8PU
 pvuxmbO9OYJ5sVkZjF8d9CUlLYCDImGc/6xWl5oZ7taiNUC08MRq9DW9Co0S79WuruN1
 XCFLcIAeUYvitl0DuYF++/NyY3RbICF7741POviOFOeW2BDNZ+ycmvGoYg1pFPH/tiCW
 vZqQ==
X-Gm-Message-State: ACrzQf21PbQFTfdkq5oNZkVlMwxph5G9HHofGdY3EElQ26U27vw8wF/T
 vP4mSeHhpiuTMJcVEdFawMu2aw==
X-Google-Smtp-Source: AMsMyM5Z52TQanIpNtM8GGiCcuVDR70QzetiH7Rgm9O8IHKgh75dA7yMGiy0Rwnq4M0PBrpZoQLKvA==
X-Received: by 2002:a5d:5711:0:b0:236:598d:83ed with SMTP id
 a17-20020a5d5711000000b00236598d83edmr10236236wrv.190.1666620206254; 
 Mon, 24 Oct 2022 07:03:26 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003c6bd12ac27sm11573293wms.37.2022.10.24.07.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:03:25 -0700 (PDT)
Message-ID: <c9f9885d-484d-d205-5669-8f6a9c0fcc28@linaro.org>
Date: Mon, 24 Oct 2022 16:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 16/29] target/riscv: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


