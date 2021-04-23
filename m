Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDA369D22
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:06:35 +0200 (CEST)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4sc-0002WD-1v
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pD-00082Q-Si
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:03 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pB-0003xv-44
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso1962202pjb.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8HRxuEm6RYBSVr5s7Sr56IuCxixUBh33+OoSOD4n1bI=;
 b=VXqNvD7i+IZnEOyeMPxdUcQxAMmEjQewBYmfbvLrrKahq+nKmfDzuyVr5wRdzLWEK4
 gTHKwaSX1E/kn1+GNoN4TXXkn4FPxVk+1MvbABB2YtTzuyGM/PhmPyrCT9aBp5oswvmX
 IwVClp9h2m/NP/JjNW+3Koh83FoQX4EfSb9rWSKuPjqlmqJIxsol1+hHw6qqtBy3jIEM
 WHIhjD325tU5FgPlkc1jpW0dQPJYjOw7Drdbp3uBUKGxRbTPgBcwhh+aEo55hGjcw1ix
 wHoXV9SWOYkpSBRVelGFdW9oYBmDgSb9T6ysYgk8xP4XPbhv52xN8bB5RgKHEX2euVNu
 MQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8HRxuEm6RYBSVr5s7Sr56IuCxixUBh33+OoSOD4n1bI=;
 b=DuKqTugwtjNoiZ1WEg0NzHku1D7LRTrruQegvw5m6v5cJoGyr/XgEKlDya2XnJ8W2e
 XelcX9uezwE9YwqLFzORiZlLnMB+26rN22d/dB7OMNs69PfINAEW/y7851A7oWFI0erB
 xA/IVMGJ/VDLkI2ioogXVaWw4ryLGpzFj467qgKhaTwtvvNkM8/23S65ZzXuftaRGFF5
 F8BmHGHK9FLSFF9wG1aPYcbQjBqn6Y8lmD+4PIkWfERmNkCelUfPqAu9oTYhIpR/sKjK
 zdSljWaB8VLNXLNCx8kC9kUQ1HdPZUFUfxHe8VEt8sgmK8QO8GQ5TsLpfzDkxFUHHd0g
 TQWw==
X-Gm-Message-State: AOAM532mp80oxRG7kG58iHMpv6ofskFpbi25gnzMeUl00918kMGoVFbj
 olVopvCyG2UO6al3iu1yZJgHNA==
X-Google-Smtp-Source: ABdhPJw1GEbk0xQewimdEDrupgUBH+9wISmW2/2pYoFTTVMtqI6Y764mn3mzPnu4Ey95qR1hzi4ysg==
X-Received: by 2002:a17:903:18e:b029:ec:b394:981f with SMTP id
 z14-20020a170903018eb02900ecb394981fmr6277128plg.6.1619218978877; 
 Fri, 23 Apr 2021 16:02:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id d71sm5337802pfd.83.2021.04.23.16.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:02:58 -0700 (PDT)
Subject: Re: [PULL 02/24] bsd-user: whitespace changes
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f447873-1edd-b7cc-69a8-e707c55bc760@linaro.org>
Date: Fri, 23 Apr 2021 16:02:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Fix various whitespace-only issues from checkpatch:
>      keyword space (
>      no space before ( on function calls
>      spaces around operators
>      suspect indentations (including one functions reindented)
>      extra spaces around unary operators
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 326 ++++++++++++++++++++++-----------------------
>   1 file changed, 163 insertions(+), 163 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


