Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE21558BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 01:35:57 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4WMe-0003vs-Cv
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 19:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4WL4-0003Fe-0h
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 19:34:18 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4WL2-0007QT-Ak
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 19:34:17 -0400
Received: by mail-pf1-x434.google.com with SMTP id t21so1035937pfq.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 16:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P2BnB1G8m2iLx1wEmHXoCOUvvMo9JEwc/ccKKLTU/mA=;
 b=Z1S9bv8cybVKa5PvyeU2JPWkBYP0E0Y6YlYZqzNYbBt4r33jyMMJdj4odBPy/TSf2p
 hgempgOZVHNHlGblACNUJPDtu5riY5AAeID5ETyjWyvP64Exr/DyQBww7ea6VDhawwar
 pNrxZ+Lq/KarRa/XS0YANh8VurEcy+yDnbzjO1fEV2bcIUxvDUtXRYCRKfuUv1Wv0xEH
 BhowBx4NqIAeCso0O+JKses8+aAbK5FAWj79RfynKCWYW49IhfbPETfy3afL0Gelpp0i
 FYt+kt5sicl1q4PenzV1aSE1/gb9ExXt/zEH5tdWbwImgR3JqH2IMIWSuh+hc/g5hinS
 Zjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P2BnB1G8m2iLx1wEmHXoCOUvvMo9JEwc/ccKKLTU/mA=;
 b=TH7183dsThf4hD/K8NF1/M8skyou9HVI/uuDIkdJPbihU/p0WFml3pnllIS2lKy8L/
 8xOl8xxHZ/gZkJRDUPKQWIGKr13Hkm0rCMe/o/ZGF1hUsCWF5gOi/vKMDJqkp6HuwZMg
 8HjF4y9dRAAa2JMKrBc8ZEPsGaDWkCZt3Cg1z5yZ29UGTg1U2s9SenGvA3x5hjG8r7zS
 GEd4lK4RLrgwTVcgcsRCBO9SfwWmZqVTuAoAxidrb9wcjkRvEcxufRLXhM5cfQcchOy0
 BcqOmOWsXZ6sQeLed3dWy7uSfPssGchqEybu12Q7WMxr0zFoSv3yatXGtz2zyc2nbCKU
 ehqg==
X-Gm-Message-State: AJIora9jrUWuvcha+nk4RCNG5v19BBPo3wRobHbFjPeaauq91jgzzdGw
 tqPp2kX/+3Lk/shzftqcmS3++g==
X-Google-Smtp-Source: AGRyM1tgz7kfGbOZg2FVhbKEdsMggVOmm7jQlbdnHdNT4JErqT4pNdU6O4Qgi4owypJlfM5ndKEFkA==
X-Received: by 2002:a63:91c1:0:b0:40d:33cb:3d57 with SMTP id
 l184-20020a6391c1000000b0040d33cb3d57mr8239167pge.10.1656027254390; 
 Thu, 23 Jun 2022 16:34:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:2a1c:c7:9c03:6173?
 ([2602:ae:1543:f001:2a1c:c7:9c03:6173])
 by smtp.gmail.com with ESMTPSA id
 x3-20020aa79ac3000000b0051c09cdd71fsm200778pfp.72.2022.06.23.16.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 16:34:13 -0700 (PDT)
Message-ID: <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
Date: Thu, 23 Jun 2022 16:34:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v19 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220623085526.1678168-1-gaosong@loongson.cn>
 <20220623085526.1678168-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220623085526.1678168-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 6/23/22 01:55, Song Gao wrote:
> +static void setup_sigcontext(CPULoongArchState *env,
> +                             struct target_sigcontext *sc,
> +                             struct extctx_layout *extctx)
> +{
> +    int i;
> +
> +    if (extctx->flags & SC_USED_FP) {
> +        __put_user(extctx->fpu.addr, &sc->sc_extcontext[0]);
> +    } else {
> +        __put_user(extctx->end.addr, &sc->sc_extcontext[0]);
> +    }

This is incorrect.  Where did this come from?  It certainly doesn't appear in the kernel's 
version of setup_sigcontext.  The only reason the result works for you is that this is 
overwritten by copy_fpu_to_sigframe within setup_sigframe.


r~

