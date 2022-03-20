Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0544E1E18
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:01:54 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3cX-0000Dy-RK
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:01:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Zc-0006Wp-2v
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:58:52 -0400
Received: from [2a00:1450:4864:20::333] (port=46684
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Za-0003kO-Lq
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:58:51 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so7465160wmp.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=egUEoJCkN3YcHocl/eTWCTG31eaDI1tFlhtFhOLmTIY=;
 b=DqS9y603CckyH+kL6bHumkATguTc9gNCUpktWnOHQ1wQ6Ypi/3BYEzECNT2HrHPWSD
 /HzCq2advDX+lVcaDyFz1cpD3d1gNte60yBDG9wshdsajX8YUNrfyVK3tYPUmxLjJZax
 8kP1wE4tkyoBWMAsmzMMsoP9oMqdoidV2KVjGVILMqkvtvcpIdcmge8SSjgTVka9oiAr
 b2Sb53EK0ih+MPwkElJ1LntzyVuJaiTS72OCx6QjIboo7ai7eb0mX4t4L3mGphTf8Zyn
 NQVJOlewnH2lZsQ2ryNyDbjvu/h5XsK8Ucirm4LE150piFEZGu6coAwxv2mYlSR5gKxC
 Mpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=egUEoJCkN3YcHocl/eTWCTG31eaDI1tFlhtFhOLmTIY=;
 b=HnlLH5rPYFNYbHb3vxOHkx6qk9KEBo5nVRtRuNcGYGjIrBShV1WZLhQEbcD/KQ7gyT
 S/SChKT2JwloSFFAISgqFUTEC6pkIu1MiiefzC8b5moyarzpne1xjBD2EIH7rqfTna4T
 d5345mtR7H7fAfLGng4RtLTyBOC3WvwCagsdcf05XSQorZf3tN5O8Ogm/ZR5YgHysgm6
 mOHw2Zr43K1J7/E5rxHrdToGS2zQvt+wLsVba25GNUx0nt6mUMKTqcUfOYZX+npGiCbZ
 Kw9clOLHzc0bQdCzmy8ziMYxEV1cdIuO9JB4/jMgSFCgiFhKT7ALPF3ChWUFd4D+9G4k
 y23Q==
X-Gm-Message-State: AOAM531wDKVbkDUijavNEVNOhDiWR6mwUgel+GrPdbNzX9YkU8nytFmM
 3PzGobs5VgGuDWHNIkeKtxWDmoKT7M6yoA==
X-Google-Smtp-Source: ABdhPJw8IO+G++vZpfM534dZSQ/ABSca26I3WxmjquKlJuIm1WGiBALYLBKoqsmrU5V5ZfKk1AyWkw==
X-Received: by 2002:a1c:c907:0:b0:37b:f983:5d4e with SMTP id
 f7-20020a1cc907000000b0037bf9835d4emr17021597wmb.174.1647813529326; 
 Sun, 20 Mar 2022 14:58:49 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5d63c5000000b002040822b680sm4650373wrw.81.2022.03.20.14.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:58:48 -0700 (PDT)
Message-ID: <2f051562-c38a-16ec-f994-a3b5defbf4eb@gmail.com>
Date: Sun, 20 Mar 2022 22:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 32/36] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> Only call is_daemonized once.
> We require the result on all paths after this point.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/log.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

