Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1543E1E2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 15:17:49 +0200 (CEST)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg5Hw-0004nx-EO
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg5Ea-00041z-1B
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 09:14:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg5EX-0006jH-MT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 09:14:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so973605wmj.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Rr0B0gYCzFKml/86YqR5oo+cbAFpOinI68BIpYukb0=;
 b=ihwA7VD42e7pU7c17QCLDc9cjgYQUVtX+DMlAAyezhInQSa6BEDaHmgRXHk2PLDPic
 jac6rusBaYIU7hEMS4KeAXWV8OjG5WcIkE2g1QQvpVmA3rL9MJP4JUVsITYGReqv2UxB
 eh1EU9OhqKiJN4v1giOS6rMjYxgbgjzZHEISZCytd1z4qiYdQx1/VAm871rkj3rVARsX
 3HI/b/bbc3IIVdKO/Tf1PIxj0XqAhMO1N29ZqIE//MhLpLmgCQAh59PXhP9+Hex3u+Jo
 P+FsfFZpmcdvY+j4yRzoHYF4umjVXr2hIXM3n/UTKEW+HK4B5MyDq9acSIXPi+uDLKzi
 uUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Rr0B0gYCzFKml/86YqR5oo+cbAFpOinI68BIpYukb0=;
 b=KpXAQM8zr6/2RmhUjC4M+0XOKmYmnidThCeufhpshKOS446Rj8RLBrRICJRTJjroWM
 FVOxO9J7kUrdzI5qtD1RadWtLmx/+b+5uGqVap3B5AAdsm7y2YOeFn0Ed87e117YU58I
 ZkEYxpIjbQLZGXT8hGmDMG+I58Gu+7kAfhvRCEzidj3YJH7dU5+mV3bLmtjJHYuUQgos
 uedlOhRDoPlQyrxCj36EhasfZIJ39Epp1culsu2eM9oGbXzMEkPXc1jPyFLGmRNrtlb6
 SQstwtEQ9Yj3idFoyJ/wkz5wBir6KfadCUVXTgxqWRV9oJMeE4ofSnpPQSIzPMwht3IJ
 qoSQ==
X-Gm-Message-State: AOAM530QkkTRXtNzIvyhZdQnZ6Wsklv6vcx9W385EeAgB6ucyBH5O858
 dLs9yx8qQlcpbn5PrBS9000=
X-Google-Smtp-Source: ABdhPJwLy3Mb1nDZIbjsLj+S4bU+3PFSc9NyIWDt52CgtCXouuVSYzZogxyCa5mWUiOxysLRWiCRJA==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr4524034wmi.15.1635426855876;
 Thu, 28 Oct 2021 06:14:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x6sm3396059wro.63.2021.10.28.06.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 06:14:15 -0700 (PDT)
Message-ID: <09797dd5-2b60-a398-5921-c07de39a7375@amsat.org>
Date: Thu, 28 Oct 2021 15:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 18/32] target/mips: Convert MSA 3RF instruction format
 to decodetree (DF_HALF)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-19-f4bug@amsat.org>
 <1cea57b8-fabe-65ff-ad2b-c26cc305714b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1cea57b8-fabe-65ff-ad2b-c26cc305714b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 23:53, Richard Henderson wrote:
> On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
>> +@3rf                ...... .... df:1 wt:5ws:5  wd:5 ......  &msa_r
> 
> Add DF_HALF to df during decode?

Yet another tip, thanks :)

