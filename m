Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56176410CE7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:30:16 +0200 (CEST)
Received: from localhost ([::1]:58072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1Zv-0004gG-5G
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Wj-0000uS-Ne
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:26:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Wh-0006Zw-G8
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:26:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y198-20020a1c7dcf000000b0030b69a49fe9so1858254wmc.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1pmEIVET0KIv77E1aa3Gf/iEcReBFEv44+C/Hw8oAIo=;
 b=HcZicgVwMzlvdQPCflVNKD4JUeOscPWO/ye/yvP/8B0T8oFwwb2LwHNxLLSYcuBo2Q
 sXgwqiFxuX1lhSo49Sxw+gjNYjB0oo0Kmgc4OiOKuAqXmTTOpiLAyrL3d9lEyrC0EtZk
 fuX9PK8F6UUk7E+lNWqrJLYtlKcWbdZWI8aexXo+ptmTHkU/gPYeit2x4TYgf7KLZ8Oj
 8/HtOBYfgfQmLgV95au9SS8Uu6oEIuBSDfXcgy080ezrC8Y6Is1ik5Bn172A437pYtyT
 0nkKHYIQD5P6etbLw+4icergQJv/9TehttOoNK8a3E1zk5PLql1exCPMQPq2EJY1v9+l
 MM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1pmEIVET0KIv77E1aa3Gf/iEcReBFEv44+C/Hw8oAIo=;
 b=y3WyrjIO/PoKHCmn1R+Seq1DNt6ZHWPpYxXIUgn8+23QcgLqDreJYciLwYrou9egQK
 J8jKa4DcFPYXrV+hkWSDcijQgKnYj9DuiJnQdfgGn9hC6QxTpfMqAY+UbMdkvU2I2l70
 m1ZbdtyQMJEkTznyno+0SCDnldHZL7znGFNWFBohNUueGPvUYQC886L8RPcO35nfrAYW
 6J9rE2pZ7xRjOxnP4JEqELg8AV+p19ai2oZc3DNRVVJv4AiWaAh5E7kmYvV4bFAaT6+7
 6dytCFbR1r38jdq3vCM9PrqEwFOwqL6FVsZOEH+Xf21jo3lM1o2zRt4pLX1QVj8tV5Iu
 yI9g==
X-Gm-Message-State: AOAM53059D3RoijP5/02z8QJ6n6F560vBR9Tc8aKt2OQv9Qc21nfzE0I
 w9upYoYmWI9NJMUPe7vViSM=
X-Google-Smtp-Source: ABdhPJw/J4m+1A2zfdmnXQsplFsUG5SVsBXlv/+Ct13c179jgMCG9pjBM8Rr7TaDM/IbzjHlhikXxA==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr26131529wmh.133.1632076014031; 
 Sun, 19 Sep 2021 11:26:54 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id g13sm12132674wmh.20.2021.09.19.11.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:26:53 -0700 (PDT)
Message-ID: <5d7ede39-5889-5510-247c-f578f0d923ff@amsat.org>
Date: Sun, 19 Sep 2021 20:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 20/41] linux-user: Add raise_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
> This is a new interface to be provided by the os emulator
> for raising SIGSEGV on fault.  Use the new record_sigsegv
> target hook.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 15 +++++++++++++++
>  accel/tcg/user-exec.c   | 33 ++++++++++++++++++---------------
>  linux-user/signal.c     | 30 ++++++++++++++++++++++--------
>  3 files changed, 55 insertions(+), 23 deletions(-)

To the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

