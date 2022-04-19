Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BDF5078F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:40:37 +0200 (CEST)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsmD-0007Rr-12
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsiF-0003Ys-QB
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:36:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsiE-0001QF-CQ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:36:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id md4so16216909pjb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r/zdBNB2dxAjCF4Wb4VBgDd44rwGPgy/PXsMu2IE7A4=;
 b=VRLAjPXY24Cg9Zmpwob51MZWXLGeNXEd+UANomPsv+vSI4D4eNXke/hx8UA8f7fUxl
 uEPFEcRO28rLsFjamY3IoJMxPbB9E3LMfrFDtvzyIK7UkQtx9VV9TJLq8XYvPLG3kIrM
 Bb++In0q/6+rJ34FEl8y7c8+JgTJ7kK8UVJoHXmBsQixCMz14J5H2uykKSXCYSAzHJAp
 HmqESOtzSKD+0koQVUoUPdB0P0vOZkj831CmDoXlTmZoY/B0bl6PgV9krAQ7oDNJORRP
 UYIUIxoDTn7j5zHJM66z7bA92zPFK2mOgT3z/EPYVIsayfH/EhMAgrPvekLTDGNf/lRI
 W2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r/zdBNB2dxAjCF4Wb4VBgDd44rwGPgy/PXsMu2IE7A4=;
 b=IDYzu7RGJD953jp+GGMghnvHmReiRXFuHYHHfAJVlFDFrGEuONqGxymcfUScAbw9iv
 HT80hAbpgK36+ZW7zkuC7cuUg8tFyukpEaxxXE1Syqqu4Nu3KZRZGrrJiEMpvAwf87g5
 WQ46BbfFn/pPCkYP32qDAkoejDIQntb/XsRRUTVrRXlUF0UOQRjylB3Vw5TjFIgxvbYn
 8qOf37/mKAkhmk2aDdc1JDxsaVKiKrQ+xywyYdd0kTB4Y1T8cEoplVBOa30d0lZ/yBUm
 XmObHglDcxodYDc8n7bkPEW6Vy3GoWqrHz4L/M1XEL4Aordx9MyB/wrK1KR67ksLCIjk
 ytLg==
X-Gm-Message-State: AOAM533eJxJFmbb9T3LSjEBzap4LyK+Nhqc2QIdi9eH0m57QfDk72dPl
 koNsodbMwsmI4tfhQWJxZEF1ng==
X-Google-Smtp-Source: ABdhPJzX2JdVB8iN1xI8kSMKlqZXhPhIgl29eVuIMFRKEo+RveOQ84U/9mqiZ2+cncnK3JDzoTlUDg==
X-Received: by 2002:a17:902:e8c9:b0:159:4525:fe with SMTP id
 v9-20020a170902e8c900b00159452500femr6749406plg.131.1650393388996; 
 Tue, 19 Apr 2022 11:36:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p42-20020a056a0026ea00b0050ab776f6a2sm868887pfw.103.2022.04.19.11.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:36:28 -0700 (PDT)
Message-ID: <57032547-a843-aea8-bea8-eeacf406f955@linaro.org>
Date: Tue, 19 Apr 2022 11:36:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 06/25] tests/docker: remove dead variable
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220401141326.1244422-4-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

