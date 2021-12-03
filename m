Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3887467C38
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 18:09:00 +0100 (CET)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtC3P-00030i-9w
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 12:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mtC0O-0000gV-IH; Fri, 03 Dec 2021 12:05:52 -0500
Received: from [2607:f8b0:4864:20::733] (port=47025
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mtC0M-0003Yh-BT; Fri, 03 Dec 2021 12:05:52 -0500
Received: by mail-qk1-x733.google.com with SMTP id a11so4035048qkh.13;
 Fri, 03 Dec 2021 09:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7PtIXye0UW14k+eVAEMRC0xA03nkWc5snL2Wq8Ef00I=;
 b=Ce8yt8W9auHGpfj0vSB2P7awGy60m2ILV0nQC0GFzY0SU33vFpkd6I4qmJLbnW/QfG
 Ln1NqtWXwtmJYzhj/RBQQs2ZTsorpd+ru8t7Ff0QnSwRk2EccXVPOpgGqIatGYruImQq
 36NSoTWTW/uYxYybl0oP2lOXajuhLLuBERSrCigEwchoWX9rViw+XyVqBPUekEmg2pj3
 Y1L6DQpDjqjkKnkxBEtGlMaYSb8M0JamS00IHykEtA5YHjsYW+tL3PflbZOLeGGMd8vj
 70r6gMdQnUwhNYqLcUC7T1pPFC8UdqXBQ6GMcvzUiVJ/KQeHYsa1vv/VW+4i7dg6gDT8
 6fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7PtIXye0UW14k+eVAEMRC0xA03nkWc5snL2Wq8Ef00I=;
 b=F2QuOqXeFVL6LJSyFqAdLRzMYKt8SSKjzQNop3vnJXL+3EyiqoSp1hm8ScQl9cPjHf
 wzhLg0KyqyvrvcUe1XUjmzPNe6tW5Ux6yKnvRrbXSZXmVK8vz95RhrgPFCJ5WemxbdGV
 01O1jq/WNzsemMvBb0q0mzcxuyFzYK8aeDxiFpP6sL1jhMK570vKgecK4W7pvzCp2Wbl
 iERByiwqmZewPHCwEFIYrqs8J/QapvYK5Inn/qFpo7myEUziaC45EWDxclMxm4E3RKvs
 LntBNQXVVf3G48VP9G9aLGGpUIiMoayJlQ90Tvp7QUrZj8X64ByoLNzaKCzH3E+Q03XF
 Utcg==
X-Gm-Message-State: AOAM531B+2DeAENUIgOY4YtJuinUyM85YuebLjPsnXUSCsMcHMtpuR0O
 ClZSMx2FdPVnf3YdpYQje1s=
X-Google-Smtp-Source: ABdhPJxTSTEfJZIPMH1Bwm5aGVrY58ONIfb4LxI8UXHudnjyv/NBJMq0+m9K0GCZrM1T49Fp4cAjxQ==
X-Received: by 2002:a05:620a:24c9:: with SMTP id
 m9mr19165532qkn.317.1638551148968; 
 Fri, 03 Dec 2021 09:05:48 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id j9sm2451270qkp.111.2021.12.03.09.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 09:05:48 -0800 (PST)
Message-ID: <3e8986ff-c46b-9d7a-8688-afe21c8698b3@gmail.com>
Date: Fri, 3 Dec 2021 14:05:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] ppc: Mark the 'taihu' machine as deprecated
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20211203164904.290954-1-thuth@redhat.com>
 <20211203164904.290954-2-thuth@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211203164904.290954-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, christophe.leroy@csgroup.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/3/21 13:49, Thomas Huth wrote:
> The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
> except for some external periphery. However, the periphery of the 'taihu'
> machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> been implemented), so there is not much value added by this board. The users
> can use the 'ref405ep' machine to test their PPC405 code instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/about/deprecated.rst | 9 +++++++++
>   hw/ppc/ppc405_boards.c    | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ff7488cb63..5693abb663 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -315,6 +315,15 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
>   machines. It can be easily replaced by the ``witherspoon-bmc`` or the
>   ``romulus-bmc`` machines.
>   
> +PPC 405 ``taihu`` machine (since 7.0)
> +'''''''''''''''''''''''''''''''''''''
> +
> +The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
> +except for some external periphery. However, the periphery of the ``taihu``
> +machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> +been implemented), so there is not much value added by this board. Use the
> +``ref405ep`` machine instead.
> +
>   Backend options
>   ---------------
>   
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 972a7a4a3e..ff6a6d26b4 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -547,6 +547,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
>       mc->init = taihu_405ep_init;
>       mc->default_ram_size = 0x08000000;
>       mc->default_ram_id = "taihu_405ep.ram";
> +    mc->deprecation_reason = "incomplete, use 'ref405ep' instead";
>   }
>   
>   static const TypeInfo taihu_type = {
> 

