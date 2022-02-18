Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C684BBEC2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:52:40 +0100 (CET)
Received: from localhost ([::1]:39404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7Qt-0006kg-DD
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:52:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7Ov-0005Br-HD; Fri, 18 Feb 2022 12:50:37 -0500
Received: from [2607:f8b0:4864:20::102f] (port=50957
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7Ot-0008Rd-M5; Fri, 18 Feb 2022 12:50:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y16so1042502pjt.0;
 Fri, 18 Feb 2022 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z8xF7F09+ASZRQeAFnMumuZJebLhU23U8TwXIiviPHs=;
 b=TjGdnzoCNTRtyVze3Y/iVQN+J5nKsmo0Ky+lT/gzxq2SDvb4YpaQ3jlr3rKrxDSTh8
 iUCkoGPN1n2AOZz/+1PKdlPf8rRDqeM4V25906xVmQ7o0Nl+vmwvQlgcr/9wf6Z0nHPX
 RD0O+qUfpHoIIFlNgHOkt+6NVnHzYJcRNnAJW8c4AMrK0UJcbA1bh33mKqb9/2CosT/v
 ravhsIsqn2gTbadIZGLjpqmN2skqoYh9Vy20Vsr/Fyggsjbp02swPz4ez4Fqh7eWTfOo
 MUeNeYh9mm/nsAahTJmIgBUz8EvHOVfOxb5j/MQZqwxh2jIJ3a+N30+Ci19CQ68FcH5c
 WuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z8xF7F09+ASZRQeAFnMumuZJebLhU23U8TwXIiviPHs=;
 b=zbJUfOCspnaFcm8FaKGVRdRDjLB/cd68Z4pJAJhD0azHdDLnxc3yJUAG60U5mVonRC
 3fcvWibA9zrQRYt2VWYPzMG/qspg8v4lE5VuZV5975sKQtnpgYpaEVatFPbcaGL/GKZt
 HLDTOHPtgEN4mTw9lVBE8OqPDwXaS2LJJ6E2OMxPKLZCKPu9dskaETeqXOmOSSDEvpD3
 vEJnHScD+bb3KRPXcHTFFIm21wiNdRpbIT7u2URR/nM0ThLSnStbhGFRrG9uIvjgvRFT
 IyIy5ZHTo4E/6adHOiLj/BxGm1lnrXxaNlv1zO2mQN+Z3kUis2wqJnAW2fINLeU7bsWv
 U0NA==
X-Gm-Message-State: AOAM530ojfq/8idOa57re3L8k7iY3Dyjq7wvQcYCVvwpA58r/2h4px2q
 jYLG3dzyTdvCSC2n/kZRdUI=
X-Google-Smtp-Source: ABdhPJyhtGCBGHspE5vY6b2NgeA/LxLZcbBE+7fmu3CEsqXAgBZkwfrioFtOCiGA1Ol7QvPponTqWw==
X-Received: by 2002:a17:903:32d1:b0:14d:3bda:1144 with SMTP id
 i17-20020a17090332d100b0014d3bda1144mr8449771plr.37.1645206634124; 
 Fri, 18 Feb 2022 09:50:34 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id 69sm11736985pgc.61.2022.02.18.09.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:50:33 -0800 (PST)
Message-ID: <0d07086a-dac6-1a32-acf1-95aa81d2e816@amsat.org>
Date: Fri, 18 Feb 2022 18:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/7] aspeed: Introduce a create_pca9552() helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20220218081815.641169-1-clg@kaod.org>
 <20220218081815.641169-6-clg@kaod.org>
In-Reply-To: <20220218081815.641169-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/2/22 09:18, Cédric Le Goater wrote:
> This unifies the way we create the pca9552 devices on the different boards.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

