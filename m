Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00043790B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:30:09 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvYe-0006K2-F0
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvF1-0003Ba-7e
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:09:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdvEy-0003dx-UP
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 10:09:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso2562920wms.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNRFhIL+twCapSd5hf4u2m1Q0DMTxI45kumlGUIDFGI=;
 b=CxmAm7MSqstoDsst1rO01zxVcFXVlLVJHgo9fJ/0RKdZWfTQ30xBpD9wjY1aBbX00s
 gwp4ZotovHMi0dBeSDBrz4QXSgQo/CCOIFIS3oIe3j5QGAid619LQXXBbULUGqeCvUgw
 LInqJWoOLcXYiyZNmq4iWgM7NwgOKnE9feUFV1/d6XFS1Zvk3tP49+AXLcppH5eMsMnn
 Kpz+GFxl5t2nGoh8fI9VHLhSopt8cKx48gSJSOocvaQW1bMwlv89RTDax5dtOexNfaji
 3SlV+ed4o62wwtRymkY54N9M80br/kFpsGivlHIPfNYW5pPymaFjQaWCHEB2FPAaxBtN
 5Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNRFhIL+twCapSd5hf4u2m1Q0DMTxI45kumlGUIDFGI=;
 b=zz++PoCZs5UBKDcADEvALRx16J2IrKSYNGWPltTHLLBmaoba11cuWvHBlM2jHalnZX
 SIBBinzGn4rUV0ihl7kysZiq9rY2Q1tBFwAAwStVU+O3yqba3e3A0tQ2XX8DyD8M5moV
 gjG3Inb93Bvwy/Qx9xbzMqG04B4kRvJU5zOCfgra/B2a1QB8iAzeujqO0wiLXpcZ156f
 eB3juyLZCUZzk2BKwQUzENZf/wTgqIEjT51jJmUJnoL60ETDmL60xfXdYnmCTyDQl31E
 cdL+PfzhCpCGDlYqliu2r5oO2gyW1rpzZnVRqe/6aZjtuXdO5KkQn5+/fnPSOoZjdycb
 FCRA==
X-Gm-Message-State: AOAM5313Aqt0YqdsqKLLmdJ9fSAPxkzf/uTxLrhwJ5p61xMerHKF9MPq
 wye1Ao2zuTk0fDVHZuU6+AhVo1D+7bs=
X-Google-Smtp-Source: ABdhPJzZBBShhGgpA4ErtkhhP1g8v9LQuaKtNeg9Kl3+aP93Klc6io8qE8eaxt+P/EktJsDbH2MyRQ==
X-Received: by 2002:a05:600c:4150:: with SMTP id
 h16mr29571087wmm.145.1634911787508; 
 Fri, 22 Oct 2021 07:09:47 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id f3sm10917436wmb.12.2021.10.22.07.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 07:09:46 -0700 (PDT)
Message-ID: <4aa25735-29c3-b94f-e1e3-13044a3ed127@amsat.org>
Date: Fri, 22 Oct 2021 16:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 25/48] tcg/optimize: Split out fold_deposit
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


