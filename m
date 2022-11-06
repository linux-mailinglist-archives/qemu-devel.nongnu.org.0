Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7B61E52B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 18:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjuI-0008Up-P5; Sun, 06 Nov 2022 12:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjuD-0008TY-2e
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:58:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjuB-00035D-Lb
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:58:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id v1so13262096wrt.11
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2YQot9hJi1G5YP6MuNSDMHmjFtnUkJAOot+bcETMw4=;
 b=mpo+BTuQNxTsoLD9C6ycd6dIpTk+s8LWbLVmMWRcVdmWPXFJ7NhZQ6FEyTIDlCfafR
 wbzKmDrO2EML+tmtHj2bgASzr/W45YixwhTT+/oNigCJKlzj38h4NsJsI+MJK53Jar86
 M7cj1U6Hwdf6/3XdtB0+u90jLIdrMJmIoHokWR6dpGqplBRPwij98y5E3UxJm1VNXxEv
 g3v4YQ5yTjmtHq2OrVw09DA1HvFek2cI1qYr9dEQu8o+Y8GmsbAn4cbqbXgtieQ94rfn
 x+qklmtbC4vRvd0WR13RdQT7QyvXXVQ7SwR8bKoRtlggR6SELmnFpahM7K4o1jzF97aD
 L1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2YQot9hJi1G5YP6MuNSDMHmjFtnUkJAOot+bcETMw4=;
 b=1NxlqAHlWXhxBqm+HHBuCcFi35FVxaFlyvs2lex+wupzLCKrS9x+GsvZYcfqSusXXV
 fpQ877I3wSIAuJw0FhXbTWoHKuc4E6FvWRs2ItMfKwt6of9ERUVT70CS2Fbndp+qj5Ng
 heITkQeFh67Qcq0jnlRge8OLep515VlzRZZszuBv33WBCSJeGSBwN8GkxGLO9CxQ9g4e
 0BeRcNS4ylCIssim6zX4TPIFwdcRsGAS0d+Fon7ZgUoxmYlLBtCrGJLOc7IzgJ4TMw0c
 KVFzAvbODposzAuw28GdEVNMlh3xkuNgWjIV060wzeaiDOUCmEW9O05fXXujfB3/D0Pr
 FCmQ==
X-Gm-Message-State: ACrzQf14QfVa/32burHTPBt2Rgk3KL2JhGdIWXzyW9C5iVI3EffRijzr
 UU0rZhyNVdo4LS6UyBvGU+ZVp77tfBl37Q==
X-Google-Smtp-Source: AMsMyM5ckZ0UUO1YpD/f+2Wu6jAqdPlOQcJbpcmOvhTDSODY+7xLyItI0E/9RVJpeHnKrq3/2pdrCQ==
X-Received: by 2002:a5d:6408:0:b0:236:a69f:f3ef with SMTP id
 z8-20020a5d6408000000b00236a69ff3efmr29201678wru.176.1667757478381; 
 Sun, 06 Nov 2022 09:57:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003a6125562e1sm6109773wms.46.2022.11.06.09.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 09:57:57 -0800 (PST)
Message-ID: <6d95c26d-ef3a-838a-c3c0-e6478c82739f@linaro.org>
Date: Sun, 6 Nov 2022 18:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 4/6] disas/nanomips: Tidy read for 48-bit opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/11/22 03:37, Richard Henderson wrote:
> There is no point in looking for a 48-bit opcode if we've
> not read the second word for a 32-bit opcode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/nanomips.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


