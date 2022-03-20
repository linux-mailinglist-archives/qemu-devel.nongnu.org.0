Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F395F4E1E14
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:58:27 +0100 (CET)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3ZD-0004ae-34
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:58:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Wj-0002hX-7l
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:55:53 -0400
Received: from [2a00:1450:4864:20::432] (port=41830
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3Wg-00019a-NR
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:55:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id h23so17839673wrb.8
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8JS0E1Py1tuJjL0YL2XQVxwcgFQrpku/Ixrh2DrpXcY=;
 b=GZcC5xy0bVsfrelPI0y1ElCTqR8SxT+UQDQ5grnc651OgA+wLrIawhiPS5ChwRHAbW
 xc/z65TT8AklD5zmbQXdnpgtPNoXAhqelLd8RVNJDsSCYqj1JcBmw7kq5+CkEXzom+f4
 9sRmsC4UsCCZU4wIpcd/iFIejwK1MqyrCi6IHDS3pqTFcOm8YUNU09MIt/E4yDXw8nJX
 pZ0XfOaVSzIqgqVBvM87OlI3LPOisiN2+4xVbV/rPX0X9uU1Lt4BWQOPHkUuCGc4Nr9v
 NB4KSjNf5wWC9nQcWTZ6SrHI9TlK1N/paqFgju3vW1Z9kxom8qB5NkeC0vKJ7mYsFndG
 ngSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8JS0E1Py1tuJjL0YL2XQVxwcgFQrpku/Ixrh2DrpXcY=;
 b=hTArHkmwqo08DNjdD1Dx0avlwMd8m21krvU3GCKlZW/9JkI/9bok8Qw7xqWnwCljiG
 mwJw0toGruHFEJ1g9vZku+oZGEJcrSSsMccTAIaC9xbdW3/VQMbj3kg97NEQXgyIWLEV
 SN3nAXWEDX46Fr6yILyxxtCrou5gjg3Aah5EbR+s9Z8RHwX4nt0vSaoBvwKTBY0xJmYM
 HTEIQWlAnXGV/sMyEfzreTj1oW4ISdmEVjKe2XdKULIC4mYX3jd9YkBg01lN5cDmPtf0
 RxJxbheVu6aSrGo3Pt2g3KSV+a4qOMihfpn9Yj8YgMZuClzcpv66ma61fgewnTZGAQxm
 D88Q==
X-Gm-Message-State: AOAM533Wgzsui7ENYK/XM4Qp7xbTP7tN32J4nzMfjUw71HNaw9EPfrqM
 rORx5AhvF0WRwIZsFOkTQkg=
X-Google-Smtp-Source: ABdhPJwKD+EENSdGdCKJtiaAsYutYs86YqKQyzmX4go/LLDaxYAovj/qNUEVPq/XPw2IQ0bC/iQm9A==
X-Received: by 2002:a05:6000:1847:b0:204:1928:166a with SMTP id
 c7-20020a056000184700b002041928166amr8445wri.122.1647813339148; 
 Sun, 20 Mar 2022 14:55:39 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b0038ca38626c0sm2040822wms.16.2022.03.20.14.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 14:55:38 -0700 (PDT)
Message-ID: <82a19d3f-a903-e4d0-4434-30dbcc3cee96@gmail.com>
Date: Sun, 20 Mar 2022 22:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PULL for-7.1 16/36] util/log: Remove qemu_log_flush
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320171135.2704502-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 18:11, Richard Henderson wrote:
> All uses flush output immediately before or after qemu_log_unlock.
> Instead of a separate call, move the flush into qemu_log_unlock.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/log.h        |  2 --
>   accel/tcg/translate-all.c |  1 -
>   cpu.c                     |  1 -
>   hw/net/can/can_sja1000.c  |  1 -
>   hw/xen/xen_pvdev.c        |  1 -
>   net/can/can_socketcan.c   |  1 -
>   tcg/tcg.c                 |  1 -
>   util/log.c                | 14 +-------------
>   8 files changed, 1 insertion(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

