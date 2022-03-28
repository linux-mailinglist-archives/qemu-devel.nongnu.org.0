Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64264E9A54
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:05:42 +0200 (CEST)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqw9-0002Ig-6m
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:05:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYqqQ-0008Gl-4o
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:59:52 -0400
Received: from [2607:f8b0:4864:20::236] (port=43869
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYqqL-0005Zf-5r
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:59:45 -0400
Received: by mail-oi1-x236.google.com with SMTP id w127so15835450oig.10
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/XcCKoN3CK4YBwsdade6zuLIlr7rKJ+uddjOtd+ACyo=;
 b=ZlCCztCOIlb95Rg2qX+vNhkmHBnzoHmBliEx4WJ9pCEtkL5YHlk6NOfegzYRgZjc1d
 KeJo1vnZOgG1nJKg12z6OGCJs1B3dtfI0Ztr3ZeHBgQ/V/dIc3roEFKQJXFySk2xG5Te
 EhCOQYqlBY/ztx0nrW3RySMCQg2lbfp2YKxV9NF/8PKVK1dbARt4zYgx5kUIyd8vfOsX
 G/gb6ONAhv5dI0zEQj07rh0NI/rXt7UQZCfKzqmsIhyBZD3M8ENvmhQOp6kQtl/dcdoH
 PC6YPjS062B8lYDX3AbE7ijvNaUYtN7DS2q+RgXbe50DjWV01FtmelBHU6zxLG55nxKj
 cNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/XcCKoN3CK4YBwsdade6zuLIlr7rKJ+uddjOtd+ACyo=;
 b=W1tWA3tQFH2McbGK/K3DSy2JXt6tT/aPLFS9gjHw2ZEXIiN9uPNpkn+PB6fnrIa3bX
 zrhdbtH2EJMhHN2ZCmEd3ZhXSm5NBITk3gZIWWKZkUCMTZyaae1vBZQ9YHL617AXUOu6
 XYfXmh9w7dySdchuQ7PIApLxcQsEcQulExIRKguvjWoFkGggDOLqd3egd3phgmXjPEHl
 shKXwd2hjnBLOrnZwyAHzkMsHwxL7sN9TCXzCfopFxdnDEyBLVFQM1+0GwrcUbHEel53
 ZMeWNwmDFk/7kHjCz4XJFql6legK/1xOewy4iONGr5dNY7100t5M5ixUurNOC8XBULOX
 G2OA==
X-Gm-Message-State: AOAM533rbK2ZuRtZszPtwqsV/i2EMJJaj29YZ8MhKapUTKUSaQsOk5C4
 wHBaqbySY8tIHewfo659NpIsMQ==
X-Google-Smtp-Source: ABdhPJzRDPOHTmPFtFniEGAdHNhBv84rHL25LMsvxLl6vxgS7jGNfrUt3Erj3DAjCaTg51xkbO+etA==
X-Received: by 2002:a05:6808:1a8f:b0:2ef:87cc:b1d1 with SMTP id
 bm15-20020a0568081a8f00b002ef87ccb1d1mr15275430oib.25.1648479578755; 
 Mon, 28 Mar 2022 07:59:38 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 z26-20020a9d62da000000b005b23f5488cdsm7074501otk.52.2022.03.28.07.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 07:59:38 -0700 (PDT)
Message-ID: <48040c30-a1f9-1b5e-ccbe-15c090393fcf@linaro.org>
Date: Mon, 28 Mar 2022 08:59:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/6] Port PPC64/PowerNV MMU tests to QEMU
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
 <878rsuf7ps.fsf@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <878rsuf7ps.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 08:54, Fabiano Rosas wrote:
> I can't reach the semihosting docs at:
> https://static.docs.arm.com/100863/0200/semihosting.pdf
> 
> Do we need to replace that URL with something else?

It has been moved to

https://developer.arm.com/documentation/100863/latest


r~

