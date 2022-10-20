Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E17606B32
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:22:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldvo-0007Sw-M6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:22:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldrD-0008Dg-JD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldqg-0007kU-1q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:17:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldqZ-00067E-Jo
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:17:09 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n7so612268plp.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MJ2KWk35tYiSsDQb68W9a5QN8PqyBCYKjEEWMXLnZfc=;
 b=tbT2/QaXuCIoLn532E4VGJuSpXs8jeDfG1q8vUBGW7pi5D1BgLXgPyW6Wwx6xL0VzV
 F2boh5fMg41zI3vSH5WBVZMXlz6TVr48J2WblBn+S7iwMaprETdETqmkKueach9i1oiv
 3HlOEZAmrZQtkHD9lWG+G28N6jCz+EPIJ3znMiZr+pP6HNnnOhbqBX27IsF0oXwcMxsL
 NneCpxWZBUx+CTGfk+nEDNYbuLSNDzVcrYyW1dr7mfCsqe+RzD1lVi9gD5vOTg/gHWHV
 FD0Gb+yCA5ymqdnJPZAEP8+8dvbxbFVdNjtOtJP+AqgfLvR33SVksmdOSVHBtq2Axfi2
 SU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJ2KWk35tYiSsDQb68W9a5QN8PqyBCYKjEEWMXLnZfc=;
 b=U8uFyFFv2stSi4mI3Zu2G0iPxSWTPZekuIlTzne2zFZ/sAI8VKJAQv3sMxpJwTQM6R
 8yNIQzUHBnCMHv4Ko0FUJy2CI+zpWGUNcyz4CQyZiWtapuPc1U03PNv9bgSmI8KUx2ME
 BBl9+PCOyVfHTo/foptFKyDXhsQIh7dJShJrml+Lxys66BRrQGqkdS11JkqFe+38ZjIC
 GzkcUBgjzwKHwlqJV6chJmHuAVxob8WTttrb1m7Jit8kWcy/oNKSWLrRftEvI7BqElgs
 w8pAPkOKRdXPCSJN8KKCLmpbLTVmw5HbZ7pSvsVP0k5JaEVTvcV76rZVRRimmVfbgprJ
 WaWw==
X-Gm-Message-State: ACrzQf3v8jWLeqrZBnNcT2/+MiMuGAitF24zlOplePCNFiRQ5fRVuK27
 fXwrb+AnLZWjHEbBiTKQ70ya7wvtWiJvMlAt
X-Google-Smtp-Source: AMsMyM44RZhHOF+uWPBt/BRk7zfL5j1GRzvTT8SRaXgxbgyHCA5KDTMMMJ9cv2kht6S4EncX1OCX2A==
X-Received: by 2002:a17:90b:4d0c:b0:20b:c983:2d85 with SMTP id
 mw12-20020a17090b4d0c00b0020bc9832d85mr54792389pjb.45.1666304221998; 
 Thu, 20 Oct 2022 15:17:01 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a170902ab8e00b001783f964fe3sm13262236plr.113.2022.10.20.15.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:17:01 -0700 (PDT)
Message-ID: <4b2da843-5ea9-02ac-d6d4-4877bb5d3e07@linaro.org>
Date: Fri, 21 Oct 2022 08:16:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 17/26] MAINTAINERS: fix-up for check-tcg Makefile
 changes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f4c50e8eb..1b41daba88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3727,8 +3727,7 @@ Guest Test Compilation Support
>   M: Alex Bennée <alex.bennee@linaro.org>
>   R: Philippe Mathieu-Daudé <philmd@linaro.org>
>   S: Maintained
> -F: tests/tcg/Makefile
> -F: tests/tcg/Makefile.include
> +F: tests/tcg/Makefile.target
>   
>   Integration Testing with the Avocado framework
>   W: https://trello.com/b/6Qi1pxVn/avocado-qemu

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

