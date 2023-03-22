Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FA6C4BFC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyfV-0002sQ-NT; Wed, 22 Mar 2023 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyfT-0002s1-NE
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:38:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyfR-0006gi-Hk
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:38:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id m35so11565949wms.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679492295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meMQ0//glfoJKuZw7uJOMjqiFIpXY8+G512UPmZWI9I=;
 b=xABWRDMZHDwh7gBHbXNYf5Gz0M+mSETYql8GvYSXB9AVo0DE0kHtnRCo0BdoZE4YPt
 6woGUdMaJkVkSvvdZ+UCPrlBpJ3rEeEOlH0GaMrcX5kZamTR1KiFSz/gT+jgggI4Z0t2
 3/BWe2qQO0Ukv2VNDN3IaD7g+LdpuVWbwULTTYKx8uSYtLAz4/XlddFowA1/gxXormN4
 K3igtRS2HCFtuMUZwykXIf4x0ydh6xkSEeMZWzQWAPYO0ZHWewypCrR3TbyK/1nKbJ1G
 w30MDHbHpBIHkm26ZEYlMCPK4RWPS+oTkU0yl8xNMA0mK2SoPUcx8C8iCmjd8GWDcS4E
 NN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679492295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=meMQ0//glfoJKuZw7uJOMjqiFIpXY8+G512UPmZWI9I=;
 b=V75FgoxDjj6TkRXDrQuKSax8F2WZYc1wySYnSUWzt30MPez7JNv5aaO6fn5B+cOgCb
 Z6q01RT7mG3Gi+cx1rM0BAMAK4KIj2P41Us1VN79w0uPJI8Xc6k91hClQyV4C6fjrFj4
 6NyX0WUC5H3ADLV7q6XFkYqv2lE3QYU+VA3XEg/Z4665sE++oM4X1JG4+DKtKTyo9E//
 FGQcaq+YVIzYIyt0UEyOQ7A07nxocIRQkZ9G2AMVeTfekzngo/vLPyeQn6hdumrYvCaB
 mQwUu48kJUcbyPG9IqA6p0KhKZH4d4QHMkngyNWZL+U/AVyrpzcEvn6//xoZSdBHC9Td
 fnww==
X-Gm-Message-State: AO0yUKWnhRva41dIFy8rIUpDEupFuvRe3jxAJfgE3oeR3DwHfom9g1gi
 +a0EoZnKDrbP/5dLusm1g42fkA==
X-Google-Smtp-Source: AK7set+KqbZDiTrZFfoj7cMozml072J8OeTfU//yxYuPPIH1V1i7M9NwA1BSvcWDRbNTgrBhBB08Pw==
X-Received: by 2002:a1c:f210:0:b0:3eb:39e0:3530 with SMTP id
 s16-20020a1cf210000000b003eb39e03530mr5100708wmc.41.1679492295263; 
 Wed, 22 Mar 2023 06:38:15 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b003ee17ff73d3sm7242286wms.46.2023.03.22.06.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 06:38:14 -0700 (PDT)
Message-ID: <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
Date: Wed, 22 Mar 2023 14:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322123639.836104-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/3/23 13:36, Daniel P. Berrangé wrote:
> As a VM used only for automated testing there is no need to
> install the X11 stack.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/vm/openbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index eaeb201e91..6af7afac0d 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>           self.console_wait("Password for root account")
>           self.console_send("%s\n" % self._config["root_pass"])
>           self.console_wait_send("Start sshd(8)",           "yes\n")
> -        self.console_wait_send("X Window System",         "\n")
> -        self.console_wait_send("xenodm",                  "\n")
> +        self.console_wait_send("X Window System",         "no\n")

Wasn't this useful to link a X11-ready binary, even if only testing
with -display=none?

