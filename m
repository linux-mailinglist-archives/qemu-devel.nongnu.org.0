Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BF410CD8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:20:02 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1Q1-0000WH-M7
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1OJ-0007aO-Ca
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:18:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1OH-0000gN-UO
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:18:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f62-20020a1c1f41000000b0030b42643f72so5471327wmf.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9S7IvjQJfNFY9G+OtsoxRiuMNR0svknR/JVxntihErE=;
 b=b7qgEu7L+ELoSDaVIOuhJ6W60BEZJuTL9gBhuOQbKepow9V18Fk6Q9K1TBS69Ipo9I
 pCJcb3kESBXlzeTxRdRBrTFE+2RPPppmuIztFRVs84rx/2gaVlnYqOEbGjTNWNDkekvP
 Essi6B//+I5JiOFRT/XQPptEHzuibNy4fPkXXa9zdka3Q480pMoMCiS21tHmo+TPWZ1c
 Z6FemiagID0lb7Di4DnypkweHLjAA9/U7lYU6LUbgF+ego+59ma6YNTa2UrC8OceZjeZ
 C4bZDM7b0Y39AsMxFLybSu80HnQiinNu3iBDdONvCRP8whX81d8SB1MdDFLUrlKf/usj
 5kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9S7IvjQJfNFY9G+OtsoxRiuMNR0svknR/JVxntihErE=;
 b=egpkeXVD46hJ6lpYw30BG2hfrsNIJ3IRLpshcXM+ODdTcB9A9joLlljPhVZSgjWayt
 YEZXPj8OSCfsqlJ0uiYSO5FDLok7HL3EQ/WDaDV/HjUK5Ogw6o4z+Kt9ndFxky8j9Fd6
 eCqj8zP6/1ENmyN6QebAHrsHxJj0GO3h61surxvPWCw0c5b/y83nrfIDUW0w7bNtLB1r
 hAxUEgF+rSCWWZrYeIFVGbKbI2dkCs4BpdKSZ5MW5MvhTc7RFIuh9ziLrjbIt1zS6rQ8
 1eAELgaXf8q+PuyreycoCfir5LCNXbYBCYO1xYo/4+Op+Vcyagd4gV605O4a92gHRNOv
 qrPQ==
X-Gm-Message-State: AOAM530EUYuAFkqyOUuaJC00Q35O4m2Vmyw6tcMFadRZJzzHmq/iTu8e
 FBSCkJgfcKpaiU0Q1jbyyANUFyMReqE=
X-Google-Smtp-Source: ABdhPJzGUWKuIgUcS9wncIIfmrjs12HMALf4t4dXgJfkJFDfMoEBLOm7DMBsQO49DTUX1kqQUZ/xmg==
X-Received: by 2002:a7b:c014:: with SMTP id c20mr20730444wmb.81.1632075492112; 
 Sun, 19 Sep 2021 11:18:12 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id u29sm10736100wru.34.2021.09.19.11.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:18:11 -0700 (PDT)
Message-ID: <0fe52804-b8d8-8cc8-e400-6e8de2ea4413@amsat.org>
Date: Sun, 19 Sep 2021 20:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 18/41] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> Now that all of the linux-user hosts have been converted
> to host-signal.h, drop the compatibility code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 12 ------------
>  linux-user/signal.c     | 13 -------------
>  2 files changed, 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

