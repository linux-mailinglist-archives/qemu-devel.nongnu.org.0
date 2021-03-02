Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85454329B23
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:56:46 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2hp-0007o8-Ix
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2gC-0006Jv-HB
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:55:04 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2gA-00008d-Vn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:55:04 -0500
Received: by mail-ej1-x633.google.com with SMTP id dx17so6820269ejb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 02:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RBmSkbypvCk2NR5r8mLoCrDAwSw1tmM/yudeLosDj+U=;
 b=Qq4s2MF+9f6c6OGO8tnWQgTZTHJatnvCXSdu2EZdCZlUTRqjoJGXZtrkcbAuNjxRWB
 rZlFBQo7ABUseVJ7Np3jp6C6lPYaCSIfbLsayxJQsyqpoi4RHpqSfNUcsVLtPn4DFllJ
 9DWeoKfEVAq2UOymAFd6boaVb//QiFLun8vcLme8wzgBJJPcZMOZ24LcZ//aUrLGBVPu
 19U3f4Ofvz2WMPf+30v5gb4z3SpVRvuNgDuqPKOXiO38A/u8Hdd3zYrYDLyC3ZAw0oxx
 MyL6g5G9zlKq/c0PPthEApezIrvuIxWLmib7TaEl/wXRva4+rJs9at/ipefJZmbvrV7B
 rq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RBmSkbypvCk2NR5r8mLoCrDAwSw1tmM/yudeLosDj+U=;
 b=EVkw7Elf6CCxJ6lnetscbKmUNTjMpRpycpMlNAPwsRfQZKRwW14J4kutT+lUC3oHqD
 d1mkr9rcTfHnCVrGjj1VT3if+HOekcmdhyAwURMTUJH43LwhRJu3928gbUPZQVshdqHT
 cYjGEMDC+YNqIhICelUEs+/BtmnsoOlHorHNrS3fMCgB3DTX7sBef5B3hoVCPay8GByh
 T2SYhU9VNTxmp0BvF/M9OKc2ATw0WjEG/XTj1jfZ9GXyrqIPPPZh5rYsIksiClR7Lq9E
 /jJbHLpKRY1h0HpfqPUw1qXujIuCDSFBhMHnZEgsGS/yXScr2XYjQmWDfn8FFYkr98SV
 q/rA==
X-Gm-Message-State: AOAM532bdKrFZl9njkJvewfkf+3QvORtOcccXwuxXyW2o/ZJc+SabMEP
 iZvrRMQF9ezReq5vpbch/k8=
X-Google-Smtp-Source: ABdhPJzFP7jadDluocw7HJrQdGDfXGR23XRgDp/F3EarIzO1g1gJub3a3Cb0Ll7AWZfTFtuh8ngxTQ==
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr20449074ejk.141.1614682501279; 
 Tue, 02 Mar 2021 02:55:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm17317888eje.34.2021.03.02.02.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:55:00 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Disable vhost-kernel in build-disable job
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210131104621.221602-1-f4bug@amsat.org>
 <60e7663d-e270-6499-adaf-217fa0a911ab@amsat.org>
 <91f47ea3-cf8c-8790-6f57-c03bb9f1632a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3acafe6b-5752-94f0-2e4a-ad874c3163e1@amsat.org>
Date: Tue, 2 Mar 2021 11:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <91f47ea3-cf8c-8790-6f57-c03bb9f1632a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 11:28 AM, Thomas Huth wrote:
> On 01/03/2021 09.20, Philippe Mathieu-Daudé wrote:
>> ping?
> 
> pong:
> - https://gitlab.com/qemu-project/qemu/-/commit/3473f6ed88169e755123
> 
> (and I even did not forget to put you on CC: for the pull request:
> https://lore.kernel.org/qemu-devel/20210219075738.2261103-8-thuth@redhat.com/
> :-))

Oops sorry :S

> 
>> On 1/31/21 11:46 AM, Philippe Mathieu-Daudé wrote:
>>> Commit 299e6f19b3e ("vhost-net: revamp configure logic") added
>>> the --enable-vhost-kernel option.
>>> Disable it in the build-disable job.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   .gitlab-ci.yml | 1 +
>>>   1 file changed, 1 insertion(+)

