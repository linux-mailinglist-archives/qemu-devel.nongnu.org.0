Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D335339E00
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:08:39 +0100 (CET)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL34Q-0006oB-3l
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL32h-0005hO-4a
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:06:51 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL32f-0007gm-Px
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:06:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so17338309wmy.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 04:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6FJquemdn36WUJczObQAS+I/SG4MOZmZWmYfm/6Y3Uk=;
 b=gyckmp3hRlml+M5hTaNSSIOAa37g9clL/wiY2K4ydF2F1mrtAJODAmGpiIlbt0Nar+
 tUQahsDGq0qPA20X85N/VvGz0SOZ+8/9/lOjYAP33akOr1AE6yI1sVGmbJ+nQYagKg8y
 17vhWa1DnuZzMRws0CPbqd1prO/i68jz/A0zabBPxUVanODI1H9k5gDvPM41GR3lf1lt
 N/YJeTO6Pj1pLMaVN7cxfDKTbS2QKuZgyDRy8b13Mz848Qk05HiSXsshcZenEdNYkyAX
 wVvfzDeqr64QirtYGv+ch9Ii/vwPNVbDxgVa0gAoW6c+y6o/gKwZ0ChBeRzjQfvMyBjx
 0Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FJquemdn36WUJczObQAS+I/SG4MOZmZWmYfm/6Y3Uk=;
 b=fML32UYrXPXb2aLmCMHqA/ouv9Jn9EY7LZCXh0Ed/yjzPrImUcGOq/bZXZg2zD6o9p
 yslZZl26nDamS2Q+khuJD/+AXeIz0JqR65TUFDQIHhvWR3iuyinhd8shJ61WqFabJJLT
 NE5jZc7YUFXZWmYybDzSdIe3rHvOPpJn9FdOm5mubSDWMe63LqcBT+2ZMqGHteD21+9u
 VSRlJaJhOT4S3enS8ZWsn/VIh945EN87caGVUcjzrsHdhkez+R+IZ9hB3j070VKZy/Rj
 XSU+JFzbvR5XeqC1iqLFfKeJ/1ts87JvRGyi2cLb2EZWz7TLRgkikPMIl3nlhhcpBQTs
 llBA==
X-Gm-Message-State: AOAM531u7Kp5uOf22skkSysod7DgR0zd6CslmvVxvaR5Kg51LwkRy6/9
 2llIByLWGJ61JsGIl5Emx3s=
X-Google-Smtp-Source: ABdhPJxYnuAHpqlI51xTy/8MPHVB6YO4zgeDpiu6VzvyHFsjzkEiLqwxPoxtAuiDwMWJ66uLZyvCNQ==
X-Received: by 2002:a7b:cb90:: with SMTP id m16mr17483629wmi.162.1615637208176; 
 Sat, 13 Mar 2021 04:06:48 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o2sm6565503wme.16.2021.03.13.04.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 04:06:47 -0800 (PST)
Subject: Re: gitlab outage?
To: Paolo Bonzini <pbonzini@redhat.com>
References: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
 <CABgObfZboWr7SCkZGzxAdkc_0sHQj-n4o=jZ=S3iQJ2fS0f0mA@mail.gmail.com>
 <08341f85-2962-a0ba-7295-eb3e051f26bf@amsat.org>
 <CABgObfaxifuB9sn3-VqobjSUycwAYO758=4RPhyn1112q5DNcg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e40e388-32e9-8930-a61e-a61be66ad893@amsat.org>
Date: Sat, 13 Mar 2021 13:06:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABgObfaxifuB9sn3-VqobjSUycwAYO758=4RPhyn1112q5DNcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 1:02 PM, Paolo Bonzini wrote:
> I wasn't saying it was intentional. It's fixed now.

Yes, thank you.

> 
> Paolo
> 
> Il sab 13 mar 2021, 12:58 Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> ha scritto:
> 
>     On 3/13/21 12:35 PM, Paolo Bonzini wrote:
>     > The site works for me when logged in, and the members of the
>     project are
>     > alright, but I also cannot clone or fetch.
> 
>     I don't think we want to update all automated scripts to use
>     credentials and enforce all users to have a Gitlab account ;)
> 
>     Can we go back to anonymous access for clone/fetch?
> 
>     Thanks,
> 
>     Phil.
> 

