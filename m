Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F13300A21
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:48:04 +0100 (CET)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30XT-0001fJ-BI
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30WU-0001BR-2e
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:47:02 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30WS-00042b-On
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:47:01 -0500
Received: by mail-ed1-x529.google.com with SMTP id n6so7496512edt.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xaoOOdiHGCHvgvc2ocrpOIejonhazhC2/WkBzmG4upU=;
 b=CXn/nb9b/qgpozL++mvs5vZwlQH8bvTjtfdPLP7jS3avB5A+X7MJCDLJsp5FYMKJWc
 5kCnGCGF7zvHY8BJfF3pI4b2L5wVh6KZzmiUyqCVqf2dQDoFjHmGikZsIDmQiVMMiD4F
 fGzHvKh55XvIOYvH7hmaxc5znldLWnhImTfNZajoyCi20zfP+fIoipqvDEzX9eAifCae
 jBeCaDOPHRBKrhLAEo60NDBXPID4WEns7Q29tPvh2a/RpIRY4Z0qmI9uHpOgVcm3xhsx
 unz9kiQmfP6g6bfDMzGRGIPWsN36+BHtWhN437yHinvphex9DfDbVD+yJVLJnPD+jRis
 bz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xaoOOdiHGCHvgvc2ocrpOIejonhazhC2/WkBzmG4upU=;
 b=qKIruf5YDvweV+iqO6CWNQHH1+nQrFdfdB2mYnV40FkcDGyCiWCAVfiKLpB1owCziA
 BGeFa/B36jTTVA6yv9nger/nolQ5tv4CtR3DqP1rXNa8FGId395Ewo8Zbfmp14KkWRAb
 XqiKX8mxtHPiTdp+JP3V4D/53J8oLN/mLFeI/5LHlPCX1G4wh45frbbWcAgNkP355zKe
 0L5O9+8JtwSeObR70ajezk/x15fVmUunPyzAEDMDglTWgdwfQSiUIVK5+ZbSlhuuBlWo
 /4xODe9Z8sk7cLMUcD1UH4Jz3i+Z/JqBTApF8mbmhIup3fKH7InAxl5OseklnBF2BFVI
 47xg==
X-Gm-Message-State: AOAM530+RnYGmMLEmh2xgxmV9Q0o4L2Mz8gAIA2wO0rFiFsd8JUhhqT1
 3TzpSTQZMzrnHQWsAEqvtLM=
X-Google-Smtp-Source: ABdhPJxJKOGFXcqqX6rFZdhP9IIkvvVPaptzsz8TXzCga+peQRzttHXz1x/tFwXnSUhpBL4JwIp9WA==
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr4082849edu.273.1611337619015; 
 Fri, 22 Jan 2021 09:46:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s18sm6050232edw.66.2021.01.22.09.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:46:58 -0800 (PST)
Subject: Re: [PATCH v7 06/35] Hexagon (target/hexagon) register names
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-7-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0068b56-76cc-817a-fb2a-d95ecdd1c834@amsat.org>
Date: Fri, 22 Jan 2021 18:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-7-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/hex_regs.h | 83 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 target/hexagon/hex_regs.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

