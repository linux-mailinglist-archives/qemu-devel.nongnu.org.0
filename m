Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7FB3FB2FE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:17:36 +0200 (CEST)
Received: from localhost ([::1]:35034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdQ2-000720-Go
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdOG-0006A7-Ti
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:15:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdOF-00079y-Fv
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:15:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q11so21375136wrr.9
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AmvX6Hcfi1x3rFXEPJ9s1C4nQRXdE1RPnmPmEXNpN54=;
 b=q9nwU7TwRCJqtWpDl5vIU/GAvVC3WdCgHZHP+aSsjjV/iFZQIz5f1SIgJ5S1hlOQP3
 ObYdBXuI1AwQ2Y1TwKVNJ1IRY3/2DWG3JsYlkPLI16P2rcAh3MPS5s6/hwU+MX2lDVsO
 0ZKZz7CANVFt1YqSn0/J+6wOJ2keM0A8Kmw7kIm3tnRB86dqxnKZGs3h1cU7BsO3vPxF
 we4JjVfXHORjWe/1gNae2cs/c/aRalhmBYEnYNRvAvGXZsZaUVe/G+sAqj9qcToMk9rM
 UxvFHFhS1xlTfwd1XrW5bctwPf48BUuadHwDFLOAr9/IXg4m+72IXiWQoAJYP+WuSjsc
 4JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmvX6Hcfi1x3rFXEPJ9s1C4nQRXdE1RPnmPmEXNpN54=;
 b=ncoAeTK8NFB0Njfbr4OO4brDX9OhMYrXdpc48hQ4rV5iU0F2xk9J6TagvujJBmr2cS
 Lq81Y4PgkrlneNv9O8CT9V84Gog//Ox8OXqhe0UnfqEh/ZBBo3P6x7GMdNtdRSeS9t8R
 bNQVzaOTNURjJLlduTGi50nDGXfoVhD45oBsavRMuvLzcx89t6TCAttIj1x3AwCOj6+0
 a3Q514DbkYc96FDpFZergyj2ZqoszESTqHYGSHDv/sfS0558iCDWYYsqYj49Bp/paGS2
 G7sCoNwOSUCrhazYy0NrgZzr4pKorJMlDAQaEmbiCQEcCv3IxR1xYJEeQc4GunIIFPbK
 3Q7w==
X-Gm-Message-State: AOAM532GumQKRRwF8FIm3LWpDe2LdUUxk7LE/d3wtmxjwJfs94ZUYoc9
 I5hfJbH64//jhYulp+zbkDDe6hKFrrM=
X-Google-Smtp-Source: ABdhPJzhpQtNCTKjgg1Tip03m/cQuRloRGvb2zjtD6PQjw0s/ykuu/8L4Lqxma662xoA9mewZCb8+Q==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr24424653wrq.213.1630314937613; 
 Mon, 30 Aug 2021 02:15:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z9sm10777828wre.11.2021.08.30.02.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:15:37 -0700 (PDT)
Subject: Re: [PATCH 01/48] tcg/optimize: Rename "mask" to "z_mask"
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <99c0d173-24f9-d540-9ff7-fc2b5304236a@amsat.org>
Date: Mon, 30 Aug 2021 11:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.58,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Prepare for tracking different masks by renaming this one.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 142 +++++++++++++++++++++++++------------------------
>  1 file changed, 72 insertions(+), 70 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

