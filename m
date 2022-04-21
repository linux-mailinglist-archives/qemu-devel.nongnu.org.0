Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D807D50AB15
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:59:56 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheqB-0004OI-RQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheml-0007uo-4k
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:56:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhemj-0001CS-KB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:56:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id s14so6662948plk.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=iWxd4KY2qrI5pIH/9RJUyzkI9eM+mNnjkGI7QtTe6SA=;
 b=Wosy9Nm2ifbId/tp7P14TXC9zEchmCO74HtCfjPeAkl0DEfeB0s7Cj32QxCDoK/wNI
 0/qPPczMgfz1V3uXfb6TXFxmLzXkdRAEt9WSoCq71W48dmL3iQJRRZFv0Pguxrip6A7B
 30JV0fY3veMlC/B2c5/X1DaUmpdFTry2N1lj9uR8SqJHji6jMw8IaOTZ0gGxhtlxaU0H
 IzpV5hBMRPMq1+6+HNKkEEBo9bGxdTdTePh8o/UAnqAE23OKal8zmDsVz5DqTsqLTVAu
 6STUzsmdTm5ysw08XEsXrEwGN3xIAelAuEzVz8VnclYTwVQWl6CK6lwsl+2SDrx3bRBf
 Jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iWxd4KY2qrI5pIH/9RJUyzkI9eM+mNnjkGI7QtTe6SA=;
 b=Et6mpzZeH1OFnuKT85G1TqL6ke38uS5NIoG1HbcAwHruyIRR7auIIRNyKH+LTQvsc2
 KOAuYkg5NFPibMGdDieKqQstGey8rSURJxessylyaFca7LTSfaH6O/UEb+wCEUKA2LiG
 Q/9ta0V4I2HxmzflakO7WsjkXkrS8tEHNk5mT8w89PtT8GJ+uKiDnE8gc7/1cY8y1i2U
 9H/NT3xXd9PVJUcDHeqdrIZonBNeZTurGpMsFODUph7qclsMPfymGm+l8B9pW9QczUH2
 2F2diwohtXj/QN6juhpzu7z7qQnt03SjmI39pKTt1n0vH5Az42p97Z1cHn/Tf9OTS+kt
 xG7w==
X-Gm-Message-State: AOAM532TDoMaPY6Mi3uNzitzAXr9xYjbsuHqUdgmF+GOGUUcQdTft0DP
 a9X6K52+Whq9n0T4UHw139wHggYCv8fbkg==
X-Google-Smtp-Source: ABdhPJyg6BZwC0Hcs/QuSQTv4fr/gkg+aahSWwmC2Xrt5qCdW7VI/4pjEGaGKxx67iLngfn23kEFFw==
X-Received: by 2002:a17:902:aa84:b0:156:6b35:9681 with SMTP id
 d4-20020a170902aa8400b001566b359681mr1547906plr.48.1650578180176; 
 Thu, 21 Apr 2022 14:56:20 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm2707190pjl.3.2022.04.21.14.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:56:19 -0700 (PDT)
Message-ID: <b4e3ca2f-09cb-0f43-aca2-407cea9886c8@linaro.org>
Date: Thu, 21 Apr 2022 14:56:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/6] target/xtensa: use tcg_constant_* for FPU conversion
 opcodes
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-6-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-6-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 14:39, Max Filippov wrote:
> FPU conversion opcodes pass scale (range 0..15) and rounding mode to
> their helpers. Use tcg_constant_* for them.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

