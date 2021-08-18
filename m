Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA333F0DE1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:07:35 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTig-0002ND-O2
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTh9-0000bY-6X
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:05:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTh7-00074J-26
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:05:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z9so5757576wrh.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A2yZJgJ0PDx6opzOwkks9FCE9iAVi+9LSL2KbhlhgLA=;
 b=NDvbqC5TpuGLZYo+JLuZurIzWTiENdcKgugcyomz1xOnQnvYZt31i7e1wiBCqF1b61
 xBmQ3XtUHYDWpvptbi9qsFJDMniLc9DH0nc/3DyInytzktEK6VTV/8QmRJGlZhbLQ+u6
 cdvRONjv2jGcLlLL9oh8oJnUeEub5RxBbN1IHnAsRjhZ27mwsLbHJ4K3sjvFyYVwLNmK
 Qhl7hfzTHjcR9q7O0fYU4bIu27RielYfQ1UA7ipBhk+a+D6LDIuI8WrtOqpLH0vlhIFS
 yiRBEDR2XKz+lxi+pCws6MId6CpVQJn3a9Tnj6fps4zpyrmLxjXcTOCCFTj7zTlQMDo2
 g+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A2yZJgJ0PDx6opzOwkks9FCE9iAVi+9LSL2KbhlhgLA=;
 b=LTeH8prnNPBvjBW8rt3v/2suOL2rkl79A4QyaVyg5Bb3Q781cONnCo4EGMyv4orQEU
 dw3Q5zta9qbeMjzkyjmffuJfUX6oGYSf77eiC/vIVZD45UWQdRPKp15j4IQ0zcVI1yoM
 TGn26YyETSh8Z+74ziq/dt3DeCETLyxs0QETN9zvSV4RmZ5jdP7VF7OGJXeWF+YctGEo
 eRjOLPCcK0pdyOXr+ZNOze9MGrNRj9+88yd5dbrYU79INHZEdLEpnzy5Do/BZPhewcGI
 +PBAbUfmWD41UpT8AAhD6zzOEoFqd1idgdOELVG2g/SDP8LKvqbHYfMUiq43ZKcBEWYG
 990w==
X-Gm-Message-State: AOAM531jy2k3JM8y3luaoX1KSvRPDR3SleUrENPyhEQbYyObM5aOXc/q
 XBZQRzwDdx7ndUTizChnLx0mMgIeBHc=
X-Google-Smtp-Source: ABdhPJxX9aY2DjnmoVPWYn1zjio3SfeU1glgHVpJsKLmL4aRoUf9OimwtNuEGGomGi3S0HVZYR0Lnw==
X-Received: by 2002:a05:6000:247:: with SMTP id
 m7mr13346975wrz.335.1629324355497; 
 Wed, 18 Aug 2021 15:05:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm1050189wru.41.2021.08.18.15.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:05:55 -0700 (PDT)
Subject: Re: [PATCH v3 12/14] tcg/arm: More use of the TCGReg enum
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2015ccb2-4b85-4df3-fec9-ea849bc7d503@amsat.org>
Date: Thu, 19 Aug 2021 00:05:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818212912.396794-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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

On 8/18/21 11:29 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 65 +++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 30 deletions(-)

I like it :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

