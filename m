Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708164DCD2A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:05:07 +0100 (CET)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUuUj-0005rL-UR
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:05:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUuSK-000436-00
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:02:36 -0400
Received: from [2607:f8b0:4864:20::62f] (port=38746
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUuSI-0002k1-CX
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:02:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n18so5102118plg.5
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dr3718q0dxqOgoV+9X2gHa9m9ZX+YQocb//+JvbICIk=;
 b=jxMr3eh/tRM407kFKiat+wRZX379BtbYkd89p+F7AcCwx+EBlRnAwsDKEV4fI23CuG
 NzWZIQdAfUbXTFvP8jsPPr/X6YRryklOfdqmgduZI646Dk09sahTiGKXaemR2qaV1Zgv
 Nrt2zAW2j0s9L/gUZujPlKOuBGIcfWosIk3ZYC/W0BgfrQb/59+ttfYBHg4zauXrDOJJ
 TPbvZ0yyrXfA8w8yYyFL1vjzLK96STZuDBu80V5+zSNeD14tYvlr5hBLVSDCcUPKXDeG
 Dps/4zLDKIp0Nr+cjVn76kys57foQyjmm0TofK6r9+c50SyeMiVSO9BktiJZ9i7n6HLg
 rdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dr3718q0dxqOgoV+9X2gHa9m9ZX+YQocb//+JvbICIk=;
 b=koXFIoblsYgalEQtJahVbLcu9biU+4HAP64AWdRVN/4VmUAKeZQJuyBgobUd+JPuVM
 MF/axla2mwxPAu8Ifd2LCCx+vm5bk+2UBMmFdmd6BTx3DDOXlYCSaX5DL0JAbwLCct6F
 ZPAyF1m4/KCA96GRXv++QC0wGLKpa0JVBHiNnhVj/YKRD0WoRYQ9QPHyycaiMDa3G19Q
 uBD00Vz3O6YabLnkp20LSZ4LqMidu1SFTvJzLIH9d/0252ma0dLZt8XfGpQLgg81ISvn
 hmqPJ3YUncyYOjERE35VJetQA58870zgH/pK73nW4GFaRxHq+kvv5tYtJDaDl0i2w1ix
 EA/g==
X-Gm-Message-State: AOAM531kMYOleZUgLmpQY437xTmkW73279gTvzEC2l+/+7TI1YbinLeN
 OPtCGJRdYEDpLscT7msdLEk=
X-Google-Smtp-Source: ABdhPJwMzKHxHb5Gub8BfpeyTpbx5lUROihKdn2NBB6hNF6faE0v0X7UN9LMkmLN8k8L/5th1ed0tw==
X-Received: by 2002:a17:90a:b393:b0:1bd:5400:cba9 with SMTP id
 e19-20020a17090ab39300b001bd5400cba9mr17333204pjr.232.1647540152708; 
 Thu, 17 Mar 2022 11:02:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a17090a521700b001bbfc181c93sm9960294pjh.19.2022.03.17.11.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 11:02:32 -0700 (PDT)
Message-ID: <f79af5c7-8402-afd9-20cb-435a284f64a9@gmail.com>
Date: Thu, 17 Mar 2022 19:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] ui/cocoa: Respect left-command-key option
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>,
 Will Cohen <wwcohen@gmail.com>
References: <20220317152949.68666-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317152949.68666-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 16:29, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cb6e7c41dc6..c4e5468f9e6 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -923,7 +923,8 @@ - (bool) handleEventLocked:(NSEvent *)event
>                   /* Don't pass command key changes to guest unless mouse is grabbed */
>                   case kVK_Command:
>                       if (isMouseGrabbed &&
> -                        !!(modifiers & NSEventModifierFlagCommand)) {
> +                        !!(modifiers & NSEventModifierFlagCommand) &&
> +                        left_command_key_enabled) {

My bad for trying to resolve merge conflict myself sigh :(

Fixes: 4797adce5f ("ui/cocoa: add option to swap Option and Command")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>                           if (swap_opt_cmd) {
>                               [self toggleKey:Q_KEY_CODE_ALT];
>                           } else {

