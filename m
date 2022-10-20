Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C67606730
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:40:39 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZGz-0000Z0-2H
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnQ-0006oV-4K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUK9-0001Yy-PR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:07:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olUK5-0006Ui-Rt
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:06:57 -0400
Received: by mail-pf1-x435.google.com with SMTP id i3so20052604pfk.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rKuSigNuMkbE92QOQoq7OJxD5u0jCtmY/qcnH45fJis=;
 b=itd0NZjM1bvjdSgo7Em1x1IL1WQZap2loSkezf6/ZjU3cMP3bwlakGuxu7llhMzIcf
 TNM9KPP1xbzBvq/dZdhqhLvuYwwRHarQNw9O4ai8yRVk67iR/YowlqrCBcFbdlILvyO2
 FwvyqIOJ4yQ4hbusjzBrevPtq9/IdcvD6l6gAsZj0BNl9Hw6e5BrS/NESQgK8tOiu+2e
 z/QrLgZVzo01iI4uAsPqGJQZ+UNaeFmqBNJz0Q4gVRWSPsMTuRQkQSaYAuAssB8yCiau
 2k9oPI5WCfEUXTeYcPMBnRDdUaPn6j4SVFVF5W/kXJ/GM9rEdLzHQUj4B24sLPRZO2/R
 2Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rKuSigNuMkbE92QOQoq7OJxD5u0jCtmY/qcnH45fJis=;
 b=PAFm5BdaNuXDCJ3AyTSw7Crtod0OhbJwVsUmdfGW7lz43Y9hlwG4UkvqOxMk3aKjMb
 HwQlccJG1qKwXAP9tqct5urBSDwEkB/ViNPzvsKTkTShoIOLS3tGpFpUA7D/hTi/4nOl
 ihuDhIy2qAOYIk2uBc9MZ7RCmW4AbFv/fOiNXRnX7tc1r1h7kXlQYq+78AoJvwi0qHfj
 YCDCpsqcaMVD8Wy4ShUx14iYZLNlcvvSJhKzeBX4hGFitegS7L50HYLeLmp7GAoRNP7Z
 Cumd6nikedu6Zj500zPHVNTO2byqVxJpSELFWj/HmUrJjroRklT78jo1hy9f/8AVb2Ps
 A7KQ==
X-Gm-Message-State: ACrzQf1gQk/pZXAcXpDTlBidlmyPcpeDRyNuQ+JS64UwpqFOmbeoxQNK
 xNPYk03EJPWkyKbqskRiIUjC0yvGxqoZrOWm
X-Google-Smtp-Source: AMsMyM4w/3s4k4jeCoq2giL3XFNdjh5ioD1PzCRIuk6linX/TSnYhL7cGUyI0p1N4xRqMlSFhMUOEQ==
X-Received: by 2002:a63:1450:0:b0:439:3806:9b91 with SMTP id
 16-20020a631450000000b0043938069b91mr11448567pgu.407.1666267612271; 
 Thu, 20 Oct 2022 05:06:52 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170902710f00b0017f8290fcc0sm12462830pll.252.2022.10.20.05.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 05:06:51 -0700 (PDT)
Message-ID: <25874b9c-d8b5-8b6a-d9a5-2a261ecacb74@linaro.org>
Date: Thu, 20 Oct 2022 22:06:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 24/26] target/s390x: don't probe next pc for EXecuted
 insns
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-25-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:52, Alex Bennée wrote:
> We have finished the TB anyway so we can shortcut the other tests by
> checking dc->ex_value first.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

