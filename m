Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E655179A7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:01:58 +0200 (CEST)
Received: from localhost ([::1]:33482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle7B-0000IP-K1
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3k-0005on-1v
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3i-0005Qn-59
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so501875pjm.1
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MXeH01eMfk2WaKvqIoN463sgzvZIcvA328rKPC/xZAc=;
 b=XgCEQP7TASU/oWORgfyWpto8eRC5PlGVNlevQZGItJktkZJg/BO5a+2wBo3pu82h9T
 Uneb15AJe+Ffqr787DjCGGCAr8uMNnJOdOeojJV8O+YjYsqQtz3p4zWXcqUo7ISOawKx
 ZVGx5gxjFD423gvzr/gtk98JBNdfDHloBtRirCYcatcDK5hyT/Ihl0IpfMe0ci4ppqx+
 ZOucZszaKVyTxKuLWSZIfnxe9g910e2R6p7+d/GhDJ2zl1IvImS83Ubbr3FFv+uO+Wm6
 JHXTbuizIVrO3SjKCysa2JnSkiPXGGIlXZokEYJ96ksbNO37Bzpun2EmMN+SLihW8jd/
 ewng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MXeH01eMfk2WaKvqIoN463sgzvZIcvA328rKPC/xZAc=;
 b=nIwnh4n7mNBGpa8vUiexARVgIOtHJe+055dS7EcbjRcqgs6GaBlDki7RfcuqDhpCLA
 LXCyUyOUNlm4KgGR8fxRE174Wki/mVIBG6TLf8cxgkS8+PINMFtcz0MPfeCKE+JUrJ3R
 AxExaDK6MxvcnMrCQDnJ0rjOaaq4C6paObpixsWFDSvlLMGMWd1uhUN0qmHIPmRdd0ds
 qGvZCtaR99anh36Pz8zI+e7iDcAM+hHtvzIzV2c/kBxaBnT6njImaM0pr0Y8Bhz9YfnU
 hRk5gPcWKavPhe6yhji13hVxvi8ri+4+Xx78HJT0ac/5GULyq53nkJGWBYGHRifvn+KD
 xG+g==
X-Gm-Message-State: AOAM533W67wkGIqn8D6BMl9NWvn2hVEn6WjFinjoS3qG1FbI2ezm3Ya1
 wVKQkP8l8OocgKg6n04RThEALw==
X-Google-Smtp-Source: ABdhPJwJO/SPnrTDZ9BRVr9530saYInoRMJc4FkGsTnHL2wMAUiq6Sq522YavmhA38pQBOvQoFvv/g==
X-Received: by 2002:a17:90a:fa06:b0:1d7:765d:111b with SMTP id
 cm6-20020a17090afa0600b001d7765d111bmr1287030pjb.185.1651528700941; 
 Mon, 02 May 2022 14:58:20 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a63554d000000b003c14af5062esm11558617pgm.70.2022.05.02.14.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:20 -0700 (PDT)
Message-ID: <1aaa7d3a-e872-ae3f-4721-9dc2548ca82f@linaro.org>
Date: Mon, 2 May 2022 14:58:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 08/21] target/ppc: Remove msr_ce macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-9-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-9-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_ce macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

