Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F26662589
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:27:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEr8p-0007xZ-2E; Mon, 09 Jan 2023 07:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr8j-0007ur-0W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:20:33 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr8h-0003lG-EY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:20:32 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6537477wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fu/jx2uXwn8KA463tuCQh724LOLPDTJwQ6fpu46pse4=;
 b=bHUTc6l/kwEyKe8m32FnvVxuMnXvBaiTblIC216EmM979KMFCdN2U/4JQz1pkoqS00
 x5gh8k6IBRzDLJYxsKA6XOJGCC0Kuz1FBGXBOIk1lx6awa9u3F2JKd+3v1F21vzqn9Ws
 zfZifIiY+pJOLLZQ51vp8Y/dUnXU/HLfCxxvyS5V5RDoI5UwylfjtIh0azs2JsynAHfN
 HAG+iRhng2o0eOJThJtNXYblQTcT7U8yQDOqD/VMCS6+omHMpE6lxnaatwEALhRFwJj+
 vjDOjjokprt2XUBrRtx6UvUQNwA92EcOxpXD3oA3IvvJreuO31RvWOjWkjSUYM5KIXFo
 sD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fu/jx2uXwn8KA463tuCQh724LOLPDTJwQ6fpu46pse4=;
 b=pS3CrYIyVsweAoVDispXSV/0K4rvJVnTaS/M1CKPOJtQu8ag43lXj5yyhza/NPEy6t
 3f4wcphz2rGRZg0FBaa6sS4umz2eoL9da53vkTKeKk/8uGH3B7F61QnJyxcbkX46tmlo
 sstpgR4ic2Tca5Hu/nM72R4PI2eWQBybv66ZvrB/LAsq/2KH9YBUN1zDe1XYDY5AqdMq
 TREbRZJLRI4m+se00OwENSdNtqDns2DNMakbocIZdWl9R+/wjg7CgXSQGn+6mX2thWy0
 uhvTDqMSH7QLGBod4lWEwSW9BnXPWFXfebDP2x84WutkCxvYBRnXWW2udaz5qT6Rn0TJ
 OUQA==
X-Gm-Message-State: AFqh2kp8e/GJTdfTkQdHq9a2q8OsO4vFbDwkWeX0Wk5KN+1RqXFFCHhL
 GO0EyGmnYt/2Ee+ARyXfrL+xxQ==
X-Google-Smtp-Source: AMrXdXsjFjd+0ReoZIWbbvUAB0adExtbfrmfCbjgx1rgJ8ULdY7t7Kl5UfGYqm3qz6Z1ASQs9tOScw==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr46108953wmb.31.1673266829734; 
 Mon, 09 Jan 2023 04:20:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm16773658wmo.24.2023.01.09.04.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:20:29 -0800 (PST)
Message-ID: <a0b0e603-577c-f018-e8db-050200293e76@linaro.org>
Date: Mon, 9 Jan 2023 13:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] build-sys: fix crlf-ending C code
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109112110.128967-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 9/1/23 12:21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> On msys2, the shader-to-C script produces bad C:
> ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]
> 
> Fix it by changing the line ending from crlf to lf, and convert the
> script to Python (qemu build seems perl-free after that).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build              |  2 +-
>   scripts/shaderinclude.pl | 16 ----------------
>   scripts/shaderinclude.py | 22 ++++++++++++++++++++++
>   3 files changed, 23 insertions(+), 17 deletions(-)
>   delete mode 100644 scripts/shaderinclude.pl
>   create mode 100755 scripts/shaderinclude.py


> diff --git a/scripts/shaderinclude.py b/scripts/shaderinclude.py
> new file mode 100755
> index 0000000000..c314b7ac63
> --- /dev/null
> +++ b/scripts/shaderinclude.py
> @@ -0,0 +1,22 @@

Missing license boilerplate.

> +#!/usr/bin/env python3
> +
> +import sys
> +import os
> +
> +
> +def main(args):
> +    file_path = args[1]
> +    basename = os.path.basename(file_path)
> +    varname = basename.replace('-', '_').replace('.', '_')
> +
> +    with os.fdopen(sys.stdout.fileno(), "wt", closefd=False, newline='\n') as stdout:
> +        with open(file_path, "r", encoding='utf-8') as file:
> +            print(f'static GLchar {varname}_src[] =', file=stdout)
> +            for line in file:
> +                line = line.rstrip()
> +                print(f'    "{line}\\n"', file=stdout)
> +            print('    "\\n";', file=stdout)

