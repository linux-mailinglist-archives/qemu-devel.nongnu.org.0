Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F86D0515
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrcH-0005Nd-T3; Thu, 30 Mar 2023 08:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrcG-0005NU-60
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:42:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrcE-0003P2-KI
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:42:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id r11so18922514wrr.12
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680180173;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mqv4F/dkTCDUPRerMF38jKPe/3BVp0/r8hJHI/9utGo=;
 b=GHeXncOy99FBI9HfKMPBRuZoUS+xG6SF7w+0um7nUDXUhGzIBB0eVDccyRfub65gbJ
 3hyUDJZilMRW/e8cuLQL4HRZkpWWiZlh7pZ3O5hMKcfacQuEz3jHMPWqp1zpcDbloK2O
 sCBrgVUQnXYRk4afItwTaATC90XGeQDQvzVhFtF/gZL3h+emi/Jex6tz5/fC37P3ZFXe
 dJNsJM+8GjAulxCoBJIwl4hODllCYKciQMnDiZjaiTCa1eWRTn1gs1p8KXJ/EwYciSy7
 AbheO9V/DXF2YtyX8m64rSUUUH962NE9O7sDsgNPquwnkBL7gKnhEOmmH1OG90/GlSrs
 OWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180173;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mqv4F/dkTCDUPRerMF38jKPe/3BVp0/r8hJHI/9utGo=;
 b=Juo7yjp2OCP0bjFvaAHwsK7bvPdbp75XBJtahBXgZ/BGIYK1+z57I0KKSqzX2pb8Bh
 5rKyeEVqNWRIi1NedOPzWYttteLjOR1fhso33UY8VYn5qVvohSAQVEqmMbZ440K0yPgf
 J/OxmsgSLmKhe/dF7KsvC2Ei58c0uEP6GhwwP0q02q4evk7xEiUGhsx8Bt+ZWYzQVfmH
 aZAvPeRb+wRXSrdYeLWmHq+2UBpDFXWrB7VS1wT5B/EorsPhGiCaEaYNjAmyosvxoq//
 nQvf2LKMiu27R9ffuHGmuwVRUGjsIbI2XMQ2GCxBBhnwA2w+FpByI8+TptnrwXVFdOVh
 OzoQ==
X-Gm-Message-State: AAQBX9dIS15/oY1YH8N308+jltKgrhgJiuTdvBjk0zTNldhpywnwdXnx
 Uv3P6I/5YdCdvsHUzrFx7cgtqSCRkQNcSa7g04U=
X-Google-Smtp-Source: AKy350arEeCqSLLeFO/D3BPfCYBlofeiAu+dIMzs17b2C6WKZJ2xCR6r747wBrixHWlW8NOE65Fsiw==
X-Received: by 2002:a5d:694c:0:b0:2d7:4c3c:cfa1 with SMTP id
 r12-20020a5d694c000000b002d74c3ccfa1mr18306547wrw.34.1680180173135; 
 Thu, 30 Mar 2023 05:42:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s11-20020adff80b000000b002d6f285c0a2sm26650543wrp.42.2023.03.30.05.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:42:52 -0700 (PDT)
Message-ID: <9e883627-5aa2-8440-6faf-7f0c79d41416@linaro.org>
Date: Thu, 30 Mar 2023 14:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] meson: add more version numbers to the summary
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230330104622.29087-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230330104622.29087-1-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/3/23 12:46, Paolo Bonzini wrote:
> Whenever declare_dependency is used to add some compile flags or dependent
> libraries to the outcome of dependency(), the version of the original
> dependency is dropped in the summary.  Make sure that declare_dependency()
> has a version argument in those cases.

Hard to prevent keeping doing that in the future...

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


