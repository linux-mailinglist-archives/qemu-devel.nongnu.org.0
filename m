Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B251A4EC60E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:57:11 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYow-0002a7-Hu
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:57:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYmd-0000Vh-6P
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:54:47 -0400
Received: from [2001:4860:4864:20::2a] (port=45620
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYmY-00089p-4e
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:54:43 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d6ca46da48so22078877fac.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tx1SwE4iNljeOcZpcrMgADhaavxCRvqXXqyh57t5650=;
 b=nQL2X8oq9dLlfvtRe1jwwgSEeQk2AHon6tdxLn7wRqW9GRT+e1HY169vsATBloEH+I
 UADr0E6x6FFBfyl5R02AxzTYPLemEaIgTjhwD/ISvzMhgSvYgVPhq7eefnBin6NKRzVj
 nkPYpQy2QEtKb/5P20DkMoFNhhDbV2h5LfYzXtfdjNWWW0815HHWmqqqAVbePrOslgd3
 zn2VAVnthx7MBX8pY05ZsJOih9nfw933N/jwQ/L0NxM3hacigH8WORvmX2hAYITop2DL
 hY1ZeM1ALdQ5P86qZ51YPjKIO2FavWcJrIYnB4mCw1LZ0WnbY/fDFHK7DgnZVbthS5WD
 1acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tx1SwE4iNljeOcZpcrMgADhaavxCRvqXXqyh57t5650=;
 b=mg+kJGrGAL966iXNdkn+pwIOeV76MdyqYX8odsysFj3hR/cDlkNEvBSOFmWeWv8Kb3
 SSSaKvIBS9ud6z4xZJ0KgE39jW8jfZvk44AbLx91Ok41D4sHUSNDzW5SOboyKOX4/L8p
 0J8MrJhWIVCIJ/YawfLOJO84cRhPWnfLG5vzoi+D/J8mTiOZUu5M8A/bIKmX2uBkNT+E
 5IS/xpAnQD6E3uTpnr7GjP2FGkXDEmKaivoOUzcIBz9VVL0uq+wl3qgLSazgHbRFl12P
 Dag/LxXaM8YxhyQQCm7Jm8Hosty6p6fqq9b9RggSYANakeP0UcxtheluK0NAfH5RPQb/
 R9SA==
X-Gm-Message-State: AOAM530D7Z5SnaENPZBA3E2HD1qmFkZp0M8CWXz3mUyAmv8rfSW56A5w
 Ef5s3AXlKo5tBG7xPrRGMc0JyQ==
X-Google-Smtp-Source: ABdhPJw6zH8VlfBreUxlqC12yemySZq9a/MlgGzWQVrXo011AVoNauBzktTdpa9eLsCPjJd8TRJqZg==
X-Received: by 2002:a05:6870:e253:b0:dd:a40e:ae92 with SMTP id
 d19-20020a056870e25300b000dda40eae92mr2206453oac.233.1648648480619; 
 Wed, 30 Mar 2022 06:54:40 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 c3-20020a056808138300b002f76b9a9ef6sm2070342oiw.10.2022.03.30.06.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 06:54:40 -0700 (PDT)
Message-ID: <bab603b7-18d2-4a97-f426-6050211dbcc9@linaro.org>
Date: Wed, 30 Mar 2022 07:54:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20220330134302.979686-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330134302.979686-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 07:43, Thomas Huth wrote:
> Seen while compiling on Alpine:
> 
>   In file included from ../linux-user/strace.c:17:
>   In file included from ../linux-user/qemu.h:11:
>   In file included from ../linux-user/syscall_defs.h:1247:
>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>    [-Wmacro-redefined]
>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>            ^
>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>   #define TIOCSER_TEMT 1
>           ^
>   1 warning generated.
> 
> Add the TARGET_ prefix here, too, like we do it on the other architectures.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   linux-user/sh4/termbits.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

