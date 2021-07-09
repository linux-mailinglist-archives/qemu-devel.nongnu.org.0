Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA963C26AC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:14:20 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sCp-0004l8-HO
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sBW-000461-U6
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:12:58 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sBV-0007iO-9H
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:12:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id y4so7775005pgl.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yejOidrUhx5Ium4NOtpJd0mxTysbL6yNmZssy3ouN9c=;
 b=JGWMSGU+XucKr6r7yfaViSitG098qlZYu+nepY+jz/Z6wLLIPUdXaFfXTTn7s/lqb+
 tsIJik583OGotELC9MEjjFBxpacQA1XlmrobvOU5e4duVw5SS5kZNG0KhTK/2lYSON5W
 49Y/hNfkFavY+zOJYYGCzxiaKKTj/IsEo5w8cGI736QTKsPb+OTBEM4Fp+T5q+2FHc5a
 ZtLilR+b4qO8B+2++lnKVK42xU8dUCDvKVGm6Twk4cHDz5rxU2r6SGO4KaqXxoVG7y+h
 wxg5nczinhwm/3y8YNGMo763HPAMB9A+MrvSbc+um/REA5SFMjG5jz9VppZ4dkkmBu5Y
 LATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yejOidrUhx5Ium4NOtpJd0mxTysbL6yNmZssy3ouN9c=;
 b=hFqwAmtz36rxoSgUR05XYwjfh0zuOsYblr6issnjP1Oq+lKK3lwdQHOO+VK+nDUVBx
 cTuIKcRd+7GiOUrGqSAHYBlMlGc1rERsNmH4jILjdhoqLv8m7CR7TZ7RTuuuarH/Ig/z
 k/sVET3DPffhf45u8LEKUuDPUZoupiMz+dYQ5CJ6TqvqsZ/t+S6Wp3N8n/lH09x4mFTO
 1FS2aZQBijyAJ1MdGYt2WOz5EJG/NwZd1UVnCOk9e9xt1WtDohFtq4bea0HVNK1QDCxN
 UtqEBum6DVdEXvH/11UGfQFgvYPcTdBw7xkS/fPVzFd4L+KYQunWEdSivxao6HFnAGPQ
 UvVA==
X-Gm-Message-State: AOAM533SAwclkL5vocOGTArrUCXo+0KGGqiPCLKqHTR73jvTeQdKgro0
 WoXfSNA1xGDoXLI18I7R2L8ANw==
X-Google-Smtp-Source: ABdhPJxJPrAE+e5+114Qoalab5ltjpp20ETrgB3mmJ4754Kd88bZHjwRjKxvESpcPjVc7i7MhckgSA==
X-Received: by 2002:a62:2942:0:b029:2f4:e012:fb23 with SMTP id
 p63-20020a6229420000b02902f4e012fb23mr37612608pfp.55.1625843574686; 
 Fri, 09 Jul 2021 08:12:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m7sm2003253pjf.0.2021.07.09.08.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:12:54 -0700 (PDT)
Subject: Re: [PATCH v3 32/40] tcg/plugins: enable by default for most TCG
 builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210709143005.1554-1-alex.bennee@linaro.org>
 <20210709143005.1554-33-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3315b52d-c0d8-d444-d744-e516a22bcda0@linaro.org>
Date: Fri, 9 Jul 2021 08:12:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709143005.1554-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 7:29 AM, Alex Bennée wrote:
> Aside from a minor bloat to file size the ability to have TCG plugins
> has no real impact on performance unless a plugin is actively loaded.
> Even then the libempty.so plugin shows only a minor degradation in
> performance caused by the extra book keeping the TCG has to do to keep
> track of instructions. As it's a useful feature lets just enable it by
> default and reduce our testing matrix a little.
> 
> We need to move our linker testing earlier so we can be sure we can
> enable the loader module required. As we have ruled out static &
> plugins in an earlier patch we can also reduce the indent a little.
> 
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - properly handle plugins being ""
>    - make the test for linker support handle default case
>    - move linker tests to before the glib-modules test
> v3
>    - remove stray debug ($plugins)
>    - remove no longer needed if static = no check
>    - update commit message
> ---
>   docs/devel/tcg-plugins.rst |   3 +-
>   configure                  | 122 ++++++++++++++++++++-----------------
>   .gitlab-ci.d/buildtest.yml |  23 -------
>   3 files changed, 67 insertions(+), 81 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

