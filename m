Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F133E1E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:08:36 +0100 (CET)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMInj-00042F-0q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMImX-0003Dx-3i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:07:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMImV-0004sn-P8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:07:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x13so8272303wrs.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=004yRCy5uwvV0M7ViM5mfXqfcYV5hRW0r7vYMmcv1jw=;
 b=mv9/L6CWopiH4qUTuiT4XxnyaCG4fK7xJ+BrPrn5cnzWpft1DxR9GT3x0kzOxKdF0c
 s6J/kUzNI4OKZVXJGdyD7jG86X8znWlfPx1iCyr8f9R63yvCKKv4xVXblVd5hyOaFdwD
 sqmEH5BhU76c/aVGlDymgyJDRuRgXV1C+NRWT0StvU374VcJWbIRz/GCY3Q2u+Zcb13m
 dXod5wPO45Rzsu4BlL2Nxf8AfaNMjWKrvbL7iT67/7wffiSWx0TjDh7vH0hSuYuOWVsM
 ZgYjE3jupdjyV32cNkBPFv1HLSNr3T1xY6Dt16akoSI0OTG9I4OfcoBTXJOwEBPFHSS2
 hvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=004yRCy5uwvV0M7ViM5mfXqfcYV5hRW0r7vYMmcv1jw=;
 b=E0guB3p1eFpXJgSKF3pXhRjMDt0v8IezLE05R+mahGH5Ux9tjlktHwgIxEL4n6NgCb
 cex6Kbjn54Mh/V6Sp4Gwziz6Cq8mdOpMEnSe/3tvWoTkTt45eTHvzxyzNwbgCFuy3/WG
 NIPU48RiPfWgfWu+ztilDscjN0Iql6JxLHOBJe+TP/ACw7EEDL2WlamD3ni0JXTPDQ1K
 PnZJ6MqHNaHeF1FaDpN5GEJxX2FdHHfc8vgzA1T6AIH+YTN0a8gRJ1FAep/TBgKzSRUi
 HRqCabZ8NdOKNVzaSSPWqIfmwSjBtGTBEnMC4DgONiGhNw7st1CTwz8SHIyHSQb+pw04
 m71Q==
X-Gm-Message-State: AOAM533l2D7El6+q3p5c7IC1DVrp98UVLNu1QFBo62DZI39B5pdDW1TE
 /TRMQ5EM+5kQju6OyQiU1w8=
X-Google-Smtp-Source: ABdhPJxR7wBlOSeapNAsChmqnj70QbhJpGDpemmsynQToeJPq7ELCN74KwUjI45ufAcCW6SGGTVqdw==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr1285372wrz.77.1615936037962; 
 Tue, 16 Mar 2021 16:07:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a17sm665982wmj.9.2021.03.16.16.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:07:17 -0700 (PDT)
Subject: Re: [PATCH v5 14/57] tcg/tci: Split out tci_args_rrrrrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <00ba9a5c-eea6-4157-8765-4729834f7ab3@amsat.org>
Date: Wed, 17 Mar 2021 00:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

