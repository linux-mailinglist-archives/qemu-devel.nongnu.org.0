Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BE3D158B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:53:06 +0200 (CEST)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GP1-0003tl-MU
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GNv-0002LF-7T
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:51:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GNt-0002xt-K0
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:51:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id c12so3093834wrt.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m8THq8WzCRgKITg+03EWQP9WhyH4SA7NlngjIya/AkY=;
 b=u4sHaHnkx+HS8kkUPdGwIE986oqWv+moWdJtkryxrF+IZDbnGo9DB//q7yesHq1GFH
 ET91NTA4bzuiflSEufaJ6Y0HHdB0NA8So3jf8BlKDlyroN+EOBC5wDAX1CwdLe0U3TWX
 oQT0Tld1CjXGJw6xWAiTmW8UHZX+lPrAyWRAlrTqt1CLJMtQvsS9+SgBzQQKxoJ1+WXQ
 6ZI+kdqHlixsJGpAhuYo4x3RQR38kooF6qhj2S7qFQASx1S6vWrTcA7FzR0a11x32bq5
 YUiHNfxckbtxil6Hwq9pr3blzZxnZj29A6e+uzl/eNHv5h55/bigzmrAd2cxJcprLu4Q
 aUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m8THq8WzCRgKITg+03EWQP9WhyH4SA7NlngjIya/AkY=;
 b=igJoK9hC9aKRHM5jwObylFUzs+ieLEX+dk94lE4X+2ekAyvc+eaQhsDlwOfNtW7bwZ
 D0PKV5Afp3dV41bUWva3sXMm6fUshq8z/zsL6DoKdF+MgJcu1lANsCpExEnDX4JaGUfk
 jPx84wNJJNYKnvlhgrxahRR5wpfZ44LBCk++NTZEUbQQGB7DyWFFJRwtmGnkyzEUBSVu
 uyDlVweymO4gOlREmwioJSajO3iP+kHP5nwxd6E+c31PyF/OvCbWOhEioWlQ3qcU2rjG
 Dbi9wUTwXr0fiNXxfX36lFL0McJKsSmZH21BdUEw66pxKGPIKJmUjmOhN1FO54NwWgcz
 8b+g==
X-Gm-Message-State: AOAM530kSI6wN5wz20sKOqtKV65n5bK+ZyKbnQ+eTFBOaOy8VQymr9p0
 7ZEV19l+iJi3k0gHBI4jZNjpn5IZ13maJw==
X-Google-Smtp-Source: ABdhPJwOAN7xboiHuONosU38pGc6CXnicEOECaOl204MrZUugIDVYp7h9d8VLxgo2gbvUFOh8zc8Ug==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr44620607wrp.353.1626889911970; 
 Wed, 21 Jul 2021 10:51:51 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e6sm513800wme.28.2021.07.21.10.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:51:51 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/23] target/sh4: Drop check for
 singlestep_enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5fbc1dc0-e83a-82fe-6c28-8149ef936777@amsat.org>
Date: Wed, 21 Jul 2021 19:51:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721064155.645508-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/21/21 8:41 AM, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/helper.h    |  1 -
>  target/sh4/op_helper.c |  5 -----
>  target/sh4/translate.c | 14 +++-----------
>  3 files changed, 3 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

