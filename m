Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207096714ED
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2gr-0008A5-KS; Wed, 18 Jan 2023 02:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2gm-00085U-ME
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:16:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2gl-00059j-4z
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:16:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id j17so5428391wms.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OL+bFgb/TveaFS3P+uYArk8sWQIrwWJfZJDpKb879KA=;
 b=A9oxhfUY4dXO6esArJL+IyZvRvgpYsggir5IJZyMFXT641KYnGLVibGMyckUcF5wn0
 J0Bhe90Zo0v+y6ofoSrS4yRMage4L6L38WUFGzJ5Y8DkLGkGkBD9uGk9OtK/PchnRLPk
 JoXEXymKG/dCcVTGdCR1VfqJelDu4a7fjzwdYlKUTU8f0ysI6A+WzpBz5R0smmXaVO7q
 8LrC39J902TMb3Vdo/mTvJZGmcffQEOUrWwrLLTpnzI43QnVzXzajbCjCWX1Yzgi8Pz7
 bE+2X+/4nu7c6+outePhmx4gOZkJzs+MNhOCCZyOZ6Zf3Z5X25ginIpErpLN4O29Pai1
 f2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OL+bFgb/TveaFS3P+uYArk8sWQIrwWJfZJDpKb879KA=;
 b=u6QXeRAM4eF0slU+XIMyy+skMMHcTANkEoBkaQ3+5/PxBhSyINSwTAcZKDG3fwU/sf
 XhfaLliGLtsjhtTGU7lV4yb0RGycjE5jqGxZ5B5a5qb9/+Lmp3O/nk0/riGiRuaHSEKc
 1fesyfxBXorP+X0bpAE9kslLPfq+zVBOsusqfPIi3cvDZ3qJBtySIxCKEhckjt9aikXH
 wuJN65tmB3ur8HCcSg/FxSoQCxScuuuPVSk1BO1ipVMY7ixnvzxJLO5Mjeeb2XbL+DrB
 iU97+SD8m2pkeO/YcVptjqmeB8r5Y2QuCR3vWwhUUdEq+g1UNggs8bFOVM2kM3uV15kI
 745w==
X-Gm-Message-State: AFqh2kod6uCyuWYvLh3vmnj8sfdQvoFRT1SbucBupkuGjvFpPM3wffE9
 bEsE+UyJSnWCV1gmWzu8nZ7nZw==
X-Google-Smtp-Source: AMrXdXscvWT+aVfHXnA42+KuArXilqtQDliVdJcm8qqgyslvfUZZZsSgO1cPVZWAShch2JfeIwjwVA==
X-Received: by 2002:a05:600c:3088:b0:3da:1bb0:4d8a with SMTP id
 g8-20020a05600c308800b003da1bb04d8amr5906979wmn.16.1674026208793; 
 Tue, 17 Jan 2023 23:16:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003d9e74dd9b2sm1078702wmp.9.2023.01.17.23.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:16:48 -0800 (PST)
Message-ID: <82cf668e-1050-69d4-6370-30156274edcc@linaro.org>
Date: Wed, 18 Jan 2023 08:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] hw/misc/macio: Rename sysbus_dev to sbd for
 consistency and brevity
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <6c79d6903fc11e153f8050a374904c2b5d5db585.1674001242.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6c79d6903fc11e153f8050a374904c2b5d5db585.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/1/23 01:32, BALATON Zoltan wrote:
> Some functions use sysbus_dev while others sbd name for local variable
> storing a sysbus device pointer. Standardise on the shorter name to be
> consistent and make the code easier to read as short name is less
> distracting and needs less line breaks.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 78 +++++++++++++++++++------------------------
>   1 file changed, 35 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


