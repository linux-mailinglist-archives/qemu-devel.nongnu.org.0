Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCB5A1316
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:13:06 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDbV-0007bh-1c
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDZf-00050V-1M
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:11:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDZc-0001JS-Hl
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:11:10 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so1847808pjj.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=g46oBvJaBFuy4K4VyN0nO8F+wbYPwgYtvSUG/apqelo=;
 b=o0Qzlih9TsPUYqfeB1MficUFZhcAsNYvsCbDPalFEBeuHf6GqAkXgAudtBbbD3Q1H9
 c1jqG3M+qdjPrl2HoyohkkoPjoHsT4tNFkrMpfepnTBqVr8lXPP5NdLCDVWCelogZ8Sk
 27SVonFo3cR2T+Qz3COsYCkiXrqlan6msmO/R1O8hoE50xa31pxDvboQI7ulzyBXTlDn
 nsECyuD59Xf2FtbS9idbUyyDL/JnetXDQiBC/oWQBSbRrPdlsYWxUDW+Vxnz1Y9Jjt0o
 rEiDtJaswpZAjrcPcd0qQgjUz7scJNyQxCjTI7/UDBcDC2zKJThOsaR3bM2Kxzep7RY5
 Z7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=g46oBvJaBFuy4K4VyN0nO8F+wbYPwgYtvSUG/apqelo=;
 b=RQztF9lOz11XIXTHxhmnZmCJo7RokXkvOn8WyMTSCrpo52DY0TSx0zFVNmrs3eZwi2
 3KkE37Xhk5XvEGNAjd1234yJd9OT4eT0FFAeqHuSToGc6LV1pnmfr7Dy5a4AQhAuTaFp
 qF4Y0I+zt9hi7LseuQ4vH+r1G40yV7xLLHTuTu7JZ0O3/UVHQjSXKY4c5zpJhpwflJa7
 tqInEAhopoEIKKjUq0YvjmpPi5P6kt3gG1nNma9ogOpHV+1HCs8vO043My5cSQHUgk+f
 Z7aB95HSUI4bg/zfNVnWK5azPdwW+je1xPa08h5zRUQ712hdWgGIQctqn95O1M+I0AMn
 Y2CA==
X-Gm-Message-State: ACgBeo1sV8KEYZsrNz0zjrT/fsKSUqKffnBH+VDJlob80Z4ZZTxZXqEi
 Il9FXRGBtDPykeADxGk0B6Y=
X-Google-Smtp-Source: AA6agR7hS5FCcM2ZsIa5NEH81TBPDjEILYL0/NxaAkV5eBzodmuufN/dHQFC3DlqOARtFItdjC7SiA==
X-Received: by 2002:a17:903:2651:b0:173:3dc3:a19b with SMTP id
 je17-20020a170903265100b001733dc3a19bmr935514plb.79.1661436667105; 
 Thu, 25 Aug 2022 07:11:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090a1bca00b001fac8076cd8sm3588871pjr.46.2022.08.25.07.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:11:06 -0700 (PDT)
Message-ID: <b1555c5e-3a2e-e26f-563f-683556416733@amsat.org>
Date: Thu, 25 Aug 2022 16:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/6] tests/avocado: push default timeout to QemuBaseTest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
 <20220822165608.2980552-2-alex.bennee@linaro.org>
In-Reply-To: <20220822165608.2980552-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/8/22 18:56, Alex Bennée wrote:
> All of the QEMU tests eventually end up derrived from this class. Move

Typo "derived".

> the default timeout from LinuxTest to ensure we catch them all. As 15
> minutes is fairly excessive we drop the default down to 2 minutes
> which is a more reasonable target for tests to aim for.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220816133831.2166761-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - lower timeout to 2 minutes/120 seconds
> ---
>   tests/avocado/avocado_qemu/__init__.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


