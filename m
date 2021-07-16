Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777913CBA60
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:09:42 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QPF-00013J-Ay
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QOH-0008UW-Ez
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:08:41 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QOF-00076g-U4
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:08:41 -0400
Received: by mail-pj1-x1035.google.com with SMTP id l11so6688977pji.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gAQH7IyArg7qtsUOHGjWRNau0e9aSU/joZS31bSGxi0=;
 b=CbNhqqnrNXTAb15Ydlc0ozrwVEjj43wSJEgg0l9O8TfaCX8NWhuHH0cn611t7X2ft2
 JsavVMf9TnmzvK9ZBLI5EDIPPFUm3linERNphiT470agmv24GqZnRJ+/cwjaTuxmshV/
 gHPIBh1WJXDc6V7Sa20Ao0AG6jqHyG31mQdZtHlBiE41sA4TxMPKBmHMUMQqBIN0fHMN
 8VkOaJvrW7gnDQy2K+amJsBzA+CQS5PJ4zuEk0MCeIhI5nAppag2wfBYg0U4OXbVf0U2
 lUTifsdWosk36kkwK04QxIvrVjex0XZCoRM4zLY5Hk8bH6IFddxntGnKhGeAcU8PtAck
 qWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAQH7IyArg7qtsUOHGjWRNau0e9aSU/joZS31bSGxi0=;
 b=ifGWL+egtCskEmfANkEZdPF9hNzwAlHh62p1h0xI70RIKc/Y2SKivJUJmvJyEirfSE
 gYrbyHqhdR6Jtr6j2xk+3sxlo5GHWXlDaargkd3BCdaEyrPg/uiGQGgvtwNNQEO1ewEC
 Jy2nmJHyqeMLwWhU/I+67zMhxh1SAZu+u80y0Zy7pQ3oZ3Fmkg29s5bcTZhceIBmHPnw
 jI0T0ZjQjViiZypvXf12WHL3ML0a2aq8yf86Fz8orEuqcqRziqBRJ4ZoJ+vxUrd7BQ7M
 TaFWuA4Uwi7tdq0h5yjh39neCCs1oXGi4pEIhlBLT9oy+0Q4AUtBQAWEUHSPAKuS31ej
 CASw==
X-Gm-Message-State: AOAM531gVZwp31egT8bEGgivf83S8C/5r9Rmkxs/e43X6u9U3W10xDmU
 5z0Mz2MpRwHMe4v0VXKv6/vOEABgk7Z+LA==
X-Google-Smtp-Source: ABdhPJxvYJYj+s1izDhhnvd2Fr2erhsOfJms3u6GVSf07n9PsrSgmHseNRWHl5PfqOeIAu56CyIoqQ==
X-Received: by 2002:a17:903:4049:b029:12b:2429:382b with SMTP id
 n9-20020a1709034049b029012b2429382bmr8385710pla.47.1626451718371; 
 Fri, 16 Jul 2021 09:08:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 22sm10431947pfo.80.2021.07.16.09.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:08:38 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] configure: remove needless if leg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6e7d662-50d7-75b7-1b05-f25e1f48384e@linaro.org>
Date: Fri, 16 Jul 2021 09:08:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714182056.25888-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 11:20 AM, Alex Bennée wrote:
> It was pointed out in review of the previous patch that the if leg
> isn't needed as the for loop will not enter on an empty $device_archs.
> 
> Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210714093638.21077-5-alex.bennee@linaro.org>
> ---
>   configure | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

