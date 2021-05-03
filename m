Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A737235D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:02:10 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhZp-000419-Lm
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhC7-0003Eq-5J; Mon, 03 May 2021 18:37:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhC5-0003jw-Jz; Mon, 03 May 2021 18:37:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id o127so106865wmo.4;
 Mon, 03 May 2021 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wzrwuirHTROMH8Z8lLwYjyJXrCfVH4WuhTaYUFy2XDQ=;
 b=Kpk+4U5NJsLfwCN4BM39uyyh+cxNEKx6TWrPQWRQJeQDUTN4ApTz2//LRSiQsvtzCi
 LAhW/Ifd+H8dOftxBOza28qU8Ye+vJL5kT+rSITKJXouEXVMvFyzOa54h9+1gB5+N+Kw
 HaxlpNIu+G748MNuhWi2/VIt/ddw7anRlGrtHcn10earhrM87zgVHNa/S7wZVaEt8V1R
 CSr12MFQzft8SEc26u72ykNkn2qo6Cr0I7nKTdN0kYEpX/qhAm//KemDeIwXWORgj0NO
 6Dmn68LlmskDZ/KVKkei8VLHCHEONlJ/ivI4JzwKSPbF+ikR/kppC3grp9/3TI2ajRnf
 DtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wzrwuirHTROMH8Z8lLwYjyJXrCfVH4WuhTaYUFy2XDQ=;
 b=VHaViAIULOP3CTr6OYf+O1H63cdrHxom57vb5h1A/2dAQ2ROCklG8Us6YUvmP7JO+i
 1YIlxbJtQWLsCfEoDDvq+uUN0i3sVIEANyZcY6g6C3KkZPvpztgXQlO/f0dyN5M2pApY
 G0MW3aO+dbYY4EXHu+Qyo0FFvp3zFSaUGIW9QFr2R5UA8i48xlLPaML63QwSWmQ5r48X
 Jlekdkgol7pQfJdU+kutsqfRIQk8v3FC2vuuPu07VXcdjDywl5KKuadOlQFKp2cCJHlP
 RlTYPE4sN3OqYlPGpbD3luaA6ZpnWGL/v1PhlQpnOw46NVPUvlWn9PhDEq4vMQ99yMrh
 FgWg==
X-Gm-Message-State: AOAM533aIM0lUCYCCOG7gdDxmSwqiqyhH0/wG7jTDNr8nmNzNAcY3bZz
 W49h+kiMvfj1SWLlINiQYwE=
X-Google-Smtp-Source: ABdhPJxt6AX1Yc1eDcEg/2JPCbkU311d0ELQtOqrNOlKSgcPnAhFTHstJAbc5wnQps5Uc3Gj6YmT1w==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr816151wme.111.1620081455659; 
 Mon, 03 May 2021 15:37:35 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a9sm13225632wrw.26.2021.05.03.15.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:37:35 -0700 (PDT)
Subject: Re: [PATCH v3 22/30] target/ppc: Introduce macros to check isa
 extensions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05e5509c-4d95-fa07-1146-3373ed79daa8@amsat.org>
Date: Tue, 4 May 2021 00:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:15 AM, Richard Henderson wrote:
> These will be used by the decodetree trans_* functions
> to early-exit when the instruction set is not enabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

