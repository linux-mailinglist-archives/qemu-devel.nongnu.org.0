Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA24650800
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7AOA-0005eb-Lr; Mon, 19 Dec 2022 02:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ANx-0005cT-L6
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:16:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ANw-0001Au-4n
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:16:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id co23so7690179wrb.4
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 23:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GeHgIz0sqGlSu2rcvEInVwovdqUnDvnq7KjYvgrf6CY=;
 b=CYiL6NL7iSoHmYDaz/Jg5WIkihagJDrj/ksf11OpfPOrgrLTrvfI2JBCxCAc6sl5EM
 /cqBOgUNI1ZBFT999Fd4Iuv76TBY/79xKqH6FagW1f5NN6BRArI9fuzLUk16SPWK64Eh
 n05IVEJ/wfw3oGnItqwKTe6IzVFBleJEM1iJUI3cB2GWDA9k+bTFj8baIzgUj7WsX1EC
 zBe2z/3aap+aETAuGfdtglC3CDs/xhdknwdeBb8YobkDY2gdfMEu7qOVR73z9w1qPDis
 2jZQMLKbPHeoV2iJcWoillUTVkQ332eLflodRnb1/qNV5hKi+1r/0hY+NofirI2XQ6Kx
 ubbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GeHgIz0sqGlSu2rcvEInVwovdqUnDvnq7KjYvgrf6CY=;
 b=DpNldsMcXHO4CMoVWvvriEcNdbHZSNnsDqZYibkSuYQIMX/D8Dhv2j5Tl/nO0yn0xB
 Lit196ry/nTokOs5buNWvrefs8kImwTYkH+CVqA4395SZwv6/X66niQDORWp5AjOApBc
 +CTA6dGewtzv/E12xhjj0t4nmEJ41GMWS+b00EshwKPQu7jC4q7xiQ0BBYmf/JJVj7uW
 9LY4+fq+XRTmz7G6CrdHyjzn+WtgZXDV5jNTMWZvQHlW1XnwgFzOj1pcU64tZcDHrHWf
 KUUpjloiOafPUwIt5C+G78fv80sOskfTvGHQ+sgT+9Czk+S1XyAkz7SElVJj1/cL40qR
 NdMA==
X-Gm-Message-State: ANoB5pkDPR7a/ESKt8L4ya3lIOYBIr3YCeBC7/hiYdjJwSAxsMieurXd
 o0ey8AMdnHmaiueuN1HZu0chyw==
X-Google-Smtp-Source: AA0mqf7f/pB/apwlQX0soMpfNkJWSvVWFHsPSi9XtHOteUHr0Oknp6tvG9tsfEc2FuzfDEJHoQrF9w==
X-Received: by 2002:adf:9b09:0:b0:248:ab8a:5144 with SMTP id
 b9-20020adf9b09000000b00248ab8a5144mr23778572wrc.63.1671434186059; 
 Sun, 18 Dec 2022 23:16:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056000170b00b0024258722a7fsm9221535wrc.37.2022.12.18.23.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 23:16:25 -0800 (PST)
Message-ID: <cc8367df-4baf-1ca5-8770-214398a418fa@linaro.org>
Date: Mon, 19 Dec 2022 08:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 20b/27] tcg: Vary the allocation size for TCGOp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
 <20221218211832.73312-1-philmd@linaro.org>
 <20221218211832.73312-3-philmd@linaro.org>
 <aea9ed5d-93d7-6684-1e47-9aaf4860641b@linaro.org>
 <765ef583-ae13-bc35-7f3d-032f4e6dd427@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <765ef583-ae13-bc35-7f3d-032f4e6dd427@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 23:44, Richard Henderson wrote:
> On 12/18/22 13:49, Philippe Mathieu-Daudé wrote:
>>> + found:
>>>       memset(op, 0, offsetof(TCGOp, link));
>>>       op->opc = opc;
>>> -    s->nb_ops++;
>>> +    op->nargs = nargs;
>>
>> We can move this assignation before the 'found' label.
> 
> No, affected by the memset.

Oh, I missed that, good point.


