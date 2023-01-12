Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DB667202
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwZb-0005tl-EY; Thu, 12 Jan 2023 07:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwZM-0005tA-HB
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:20:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwZK-0007F7-Le
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:20:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ja17so13063638wmb.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=801B4reHsChJExyhhd2Jywxl+Svkbl7ojcchzuCWl4U=;
 b=soMEzUPQ8qKGq6x7N3x2Q30HGLl02Gd9T8hY4YsK1k75Y+fVNP712MLp+iTD+9D8TQ
 oiybkeLHtDPDpRKEEIl++lv275viZWnnVKu0Iq8jrPbulVAE6rd4s2vJ3ryWm9W7C+Q6
 FPlBawcTt/JYGHQsw9VJ0vuziyysNgJ0x99CnDVe8PQ3uWbom/1U/GfuoHJt+e1uiQPw
 RXN4TCa00TVyS1YHELPH2oTOVeuXcRlOK19WLSF1BvzS9QVWS3fzyRAFgw4xq7OUdZ4Q
 5FqlOQzJYWvuR6G5F77Y5QlIBVZA0nlS2UdkvEkOcehJtVFocgB2ylbER35Np3Ji7FLI
 vXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=801B4reHsChJExyhhd2Jywxl+Svkbl7ojcchzuCWl4U=;
 b=S1Vk9dfc+J1czfWkRRRqUOjmM9T08JYVlfphOj3U7Rf7SkE0BV3z0psdW0OkocJOuC
 nOLCjuMtnz7/s5/ig5+ZqIk+QwL24t5ys6xcfNvELMiVKZlgHUVVVS0WcY79pr2QLcAN
 XGSSHOHHMYOFEnUwW/PUUAb5DoHAybI63/AXnuRq07RFGW0HSoRFWnLMZrkQ8CakcDZi
 fdfZwdofw86SwQ4Hyc1TTrKK4f4OmOC1D/GlRUDCU7PiLTJO/YJVzvW3I17t18lIBgs7
 fBh9ZJoD71oOMDelr+y+Sjr7/yoKCC7BjH0BPRENLechenR0XU10YBd9IiLwqng9v1xB
 rsow==
X-Gm-Message-State: AFqh2kpwY4c2WtrtKHwtz6smAwlQNOA5nZJpBfKiBASjOvKJA6ZjFB4l
 cYh0stqvAypGdN8YJqYRIXTKzA==
X-Google-Smtp-Source: AMrXdXvh41sf8TfUvv8C3ny5ui3AYVQMtSS0J6bUak7Pps0pcMJg6uqATnHjMqlKnI0jINXqL8iD8A==
X-Received: by 2002:a05:600c:4d20:b0:3d3:5737:3afb with SMTP id
 u32-20020a05600c4d2000b003d357373afbmr56014384wmp.41.1673526027728; 
 Thu, 12 Jan 2023 04:20:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003d99fad7511sm20668724wml.22.2023.01.12.04.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:20:27 -0800 (PST)
Message-ID: <f300a735-5b5e-da2f-3560-1d06a009d1f3@linaro.org>
Date: Thu, 12 Jan 2023 13:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221209113342.61053-1-philmd@linaro.org>
 <9425e026-e19c-d648-d8e3-71563c686464@linaro.org>
 <d8848620-9882-a457-903b-2f600fd09b7c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d8848620-9882-a457-903b-2f600fd09b7c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 12/1/23 13:07, Thomas Huth wrote:
> On 12/01/2023 12.58, Philippe Mathieu-Daudé wrote:
>> ping?
> 
> Who's supposed to take this?

Alex Bennée? I'll precise in v3.

>> On 9/12/22 12:33, Philippe Mathieu-Daudé wrote:
>>> When using the archive-source.sh script on Darwin we get:
>>>
>>>    tar: Option --concatenate is not supported
>>>    Usage:
>>>      List:    tar -tf <archive-filename>
>>>      Extract: tar -xf <archive-filename>
>>>      Create:  tar -cf <archive-filename> [filenames...]
>>>      Help:    tar --help
>>>
>>> 'tar' default to the BSD implementation:
>>>
>>>    $ tar --version
>>>    bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 
>>> bz2lib/1.0.8
>>>
>>> Try to use the GNU implementation if it is available (from homebrew).
>>>
>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> Supersedes: <20221208162051.29509-1-philmd@linaro.org>
>>> ---
>>>   scripts/archive-source.sh | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
>>> index 23e042dacd..e3d0c23fe5 100755
>>> --- a/scripts/archive-source.sh
>>> +++ b/scripts/archive-source.sh
>>> @@ -18,6 +18,7 @@ if test $# -lt 1; then
>>>       error "Usage: $0 <output tarball>"
>>>   fi
>>> +test $(uname -s) = "Darwin" && tar=gtar || tar=tar
> 
> I wonder whether this script works on other *BSDs ... maybe it would be 
> better to test "tar --version | grep -q GNU" to make this even work on 
> non-Darwin systems where "tar" is not GNU's tar?

Clever, I like it!

