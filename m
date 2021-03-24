Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECAE3480CF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:40:00 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Q5-0006BH-Mc
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP8Jz-00029B-L5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:33:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP8Jy-0002y6-4h
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:33:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so1759210wmi.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lE4h8TL5V6HfqwMuF/LdnCvyJKb4RQuNx0AVS1T5ihA=;
 b=XQ20U6nYnpmA0YabOGDv81b4wpIIvTKG1TCEbaAyuA2aNmFWbOwyFstB8B8x9F+GMK
 0dx65+IQNmnaBjkRmc+hNEvKUPp/nd9oWNkLd2kDsgTwwV7P7uPbLZOS1bU/43Kn3bZZ
 D8PnKjll9O154sfqCX4/K8lYnvTYOlgUnLHPD0VbJ3nTX5D/HdL89TzAirZTTbA28HJ3
 6lSU17AzRX6ajEDGg8RtlK9rWPB4Mq/j1IBmF/x+yFztWWJ4lVCa9EUzniKldSBf6n9R
 ueqZWekcAe9gu7bxdaInwB8kULniN8c179zTrt+DSE7Vh9Ebu8F7pa8PVvBM7h6wH0XS
 6wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lE4h8TL5V6HfqwMuF/LdnCvyJKb4RQuNx0AVS1T5ihA=;
 b=opgKfzcU6l+lHrhKDsjQzcW0Nu5kF1ZaUIEgck/9Bk8jWiT8Ne6vbEpAu+zum9GR+3
 W25/ZEJZHpbguHf/XbnpFuc2wDVvMDuZeHXy7dzEPTWut/3pU3OQyGBCdXPPso2pqkgA
 nxhy0noHW6hHmuPK0UuF6im6hBTVqAWsKAthLPcvxufSwtLfJb8QPDeub5I9RpGi6/Zi
 l6EKVyIAHVr4i3tgUw19dmTf3RggRIfduCDt9u9d571LGuljTh4dbW+IIMeFcrbAO9ex
 +wzYm9xt0RlKpRovPaXQwnjrFQq5P/9IWGSQQ/WI4BFIeBZj7k2sWW6Jx5YsU0si1HnZ
 vmzA==
X-Gm-Message-State: AOAM530q1SyQaB4H+dd0ng/Pw/PXE8hqNPiJYH7wWqYl2GBeqYcaR+y6
 FIqB+UFmNrOAUmaE6vKZ+ao=
X-Google-Smtp-Source: ABdhPJw7OZr4RujS0PenaLZp6+BqfDA9P+hzohGEelLr806DlVKbNacvB2PttWaqddD7S4expDgiNA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr4213348wmi.170.1616610812422; 
 Wed, 24 Mar 2021 11:33:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r11sm4209082wrm.26.2021.03.24.11.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:33:31 -0700 (PDT)
Subject: Re: gitlab-ci: Only build /staging branch?
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
Message-ID: <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
Date: Wed, 24 Mar 2021 19:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 7:01 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Peter's current workflow is push to /staging and if his
> testing succeeds, he pushes the same commit as /master.
> 
> IMO there is no point in building /master branch, as it
> has already been built earlier as /staging.

Also this might be the reason why the /staging "deploy" job
fails with "input/output error".

