Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77B32E524
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:45:41 +0100 (CET)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI71g-0002mK-IA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI702-0001TA-9u
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI700-0007IK-Il
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:43:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id k66so862646wmf.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EzT4kD8g9AMlFzHueA1McmbqzXYPcniqu1xuwyXPtXA=;
 b=j3AmHuQtM0/sgCFfc1ribPBafZ7pde7GGRe+iPmhQqtktX+votvvB7MWDGPKo/u104
 fODJkOrvf1YFJqIJno3jNugYwX8ZweX0+swx859wVNvigYq4yvtf2fcACTdSuFhScHtX
 r2m0x2Rday8HUvUNoDkRV8zcKanxh61uxbV22Fel9a24ObW9+ykmsbd9d6Uo8u4cdhCy
 /KQEr3lgcBRj7rOT0DW1XlAAzH57rEKTNcw02ZNTV/rZuI+elU0WPtrL7b3Ss36GHQkU
 ITjt6GxioDb9hO2as9TGGmSouXfxFjE8UUaA+es7AOiUzQrpKbOiQrY1jXrXJJdHEUEO
 KtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EzT4kD8g9AMlFzHueA1McmbqzXYPcniqu1xuwyXPtXA=;
 b=Scao4zlJ25S6gs/1yfSh6Q4tLDOfsGfzccbkLAXTO/+Y6y/R+Ogryl2moXTl4nHJ0C
 Me3D21VHEfY6TDlf+Y/VbjUDArOS44b9ND+U+1Lt8cn+892WblH75SQl9ErNnUD7Ukm1
 5aMvQufb13Dd8g0hlMDXK1yrYN5Jzs5JmEgdNJ7JcRS4DeqfIfU6JFBgSnODLU5L2prr
 rSuTx7olALSuHdgvKmtrIr9gTjNhhOdslmUM8+SfKSiuNoCeH99nlpu3AwmtrlnfMMwt
 1A/WoO/jnUSf1Pa+gD9tTIVInXWAK7a12wJW7Ox/aJcLEjiAVBd9wTi49GapIsi1rrjU
 ZuTQ==
X-Gm-Message-State: AOAM531fVGO5WnHbp05lwyem60XLoyDlaxqav/WbrUlPB09NdFIsEv+i
 hP+XqZYVmM1VUCaIZuQz4wb/XgHTuek=
X-Google-Smtp-Source: ABdhPJzj5twInTdEPbQOyyi0lscUpMTV2pYgykdOM28GpfQLJN0nD6fc5JnEKJlZkqr+ejw4c1/JHQ==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr8098995wmb.79.1614937435284; 
 Fri, 05 Mar 2021 01:43:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c11sm3776774wrm.67.2021.03.05.01.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:43:54 -0800 (PST)
Subject: Re: [PATCH v1 8/9] gitlab-ci.yml: Add jobs to test CFI flags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210305092328.31792-1-alex.bennee@linaro.org>
 <20210305092328.31792-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92e91bbb-73f4-0dab-9cc9-70dc86d0bfec@amsat.org>
Date: Fri, 5 Mar 2021 10:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305092328.31792-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 10:23 AM, Alex Bennée wrote:
> From: Daniele Buono <dbuono@linux.vnet.ibm.com>
> 
> QEMU has had options to enable control-flow integrity features
> for a few months now. Add two sets of build/check/acceptance
> jobs to ensure the binary produced is working fine.
> 
> The three sets allow testing of x86_64 binaries for x86_64, s390x,
> ppc64 and aarch64 targets
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Message-Id: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
> [AJB: tweak job names to avoid brands]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 119 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

