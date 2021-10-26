Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E761C43B523
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:09:31 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO4x-00065z-1F
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNyZ-00076G-Nn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:02:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNyW-0002KE-Eg
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:02:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k7so15172453wrd.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ndrlob0ik8z2WCfmOCQkivM/QPfLUxeYNioXVGV1kTc=;
 b=IRMNqY5ia5vFs2wOQ9gHi+3XUjwuqu6iI/Z4N9dHWzPLeFauT0zPxdPv0myLMJHPai
 6XJxXAvo7Zxc8h988FN1hxqViz6OmC14hDmAhzylZBGTSRn7zcxISJO73Gab4jVV3YhJ
 iLjfDsTAkQjZAzJdxjdy2sIzJrB7e0ziL8MX1nJHk8Q7H7hm88FTJKc2S9+UFp40lv4d
 aNZUXQI+flIAWw6yTF8k/iGaNv8JrdnA9/0aQYzjqEcGBrb/93C+tba/9kuK7RjO2zCQ
 2IeU+6gH1dAzDo+VW5ilZrzfuqqseOpeXlFiqPPotmDBtuatZwH4CBUSWKjP6Tm9HA3V
 3+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ndrlob0ik8z2WCfmOCQkivM/QPfLUxeYNioXVGV1kTc=;
 b=BVBUw/v5NNlZIOL/zGj/xtDSbZKi8aaaKBnP7inz38wHoT11y1FZC5kqUp9/vipOFL
 UhKP47xn05lWuQejqOiNR8c8RCLU/Ddy43ikXEXpnL6rJ1zvo/zml6Jv7bcGTa4dJmvv
 xHA6c7S2k903VfAaVHHsDb5Sb95M6KPtK6Keo8Bs/2hR6BqdCVrClVLHKcWVaWxb5Gkc
 0s19dD/PRAs0cLsMhlAyT+MpgCjx6C2sMz1J4xDyNYUtrW5YG796pldJm7QhH1WS2C6u
 n3iP4ikaA0/VSC3SDa/s0CJeznwG29kDVqFEi1NfGfg7xYT65mLEWYF3ie55PFSyRZMg
 RqmQ==
X-Gm-Message-State: AOAM531VNwS/eHN33W9prSMSZnsaD+toftVxsXBOEEQecgBmhw9n9pvH
 r10DGm5E12fPmFByRDAN9Ks=
X-Google-Smtp-Source: ABdhPJx2bNRJ4eYp4BSsubrPr8S4xUd9DnIF6VZ1d9wRyuVlLq+i5x22mQA5Rej6AF4WbZSZ7M0kgA==
X-Received: by 2002:adf:e310:: with SMTP id b16mr32863779wrj.309.1635260571065; 
 Tue, 26 Oct 2021 08:02:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm949122wmc.3.2021.10.26.08.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:02:50 -0700 (PDT)
Message-ID: <94c56661-01f8-f854-8424-2bb73e9fc739@amsat.org>
Date: Tue, 26 Oct 2021 17:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 06/28] tests/docker: Add debian-microblaze-cross image
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
 pbonzini@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 kuhn.chenqun@huawei.com, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Build the entire cross tool chain from source.
> For this reason, default to caching.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [AJB: Update MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-7-richard.henderson@linaro.org>
> ---
>  MAINTAINERS                                   |  1 +
>  tests/docker/Makefile.include                 |  6 ++
>  .../build-toolchain.sh                        | 88 +++++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

