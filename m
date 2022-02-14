Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA14B5D8A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 23:19:24 +0100 (CET)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJjgp-0007Nl-IW
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 17:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjfP-0006Xi-OQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 17:17:55 -0500
Received: from [2607:f8b0:4864:20::1033] (port=40749
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJjfO-0006Q8-6h
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 17:17:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so634596pjv.5
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 14:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1L4RvUcl9FXqQlfq+klQKHkHt6w1Cz+XfwkM3BIIDX8=;
 b=neNLpd/BXwuouJfgNP6bBNUDUejNqdhTQt+M3ttJO5gxcrJeQ8qZet/ONPlU1q3RD7
 n7074G84Cnh5r4uh5ftSRt5BE8ChpFmpRJ53iH1PeNlYp69pwxWK2xG7dlY4beNfvdu6
 VDVR0Q/ZxTY4emhwXOfYfR23jJ//n/x4VDCpnb/dh+1eViA5/JXuc1QfACRgm/7tqeTu
 ucoHL44z3vsMwoxfgSMX7frfJcrvXeUvCoBVHqAhqcGQqmphUDuHUfk6ddWT7t85fWh8
 wpNtDnbHyVJOwK/KEtvEUE9NN4aiT8RBgTbrBUwgAAFjL2dtcqRxc+CV85NgeK7cF93V
 BbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1L4RvUcl9FXqQlfq+klQKHkHt6w1Cz+XfwkM3BIIDX8=;
 b=ruukgI+B5AkDQjLL5lJkE+cOmvnp+pWK0b+Dy5ubleVcwt9CCDBPOtrdpGgARVGLTy
 N4cj2ZHOMiCzZg97h9Lq20nEpj4Ed2mtEF1T8iwl+YTX9dFU71CQ5QOMccVj0t6NEQRJ
 AV7J8jjxM1HnTxFoOVzHtoNMYM29hy0yReyN+3oZqKF1q/txz7gkLk0kHTLjCp+ILqB1
 5pld7heI6ni+Azl1JL9vyzKpsHKzHYcFevV5SUrbrWoUiQhsQDvLA24phdo1AGYSLPGT
 DAUlckSyhC+njXa6orfTe9yyewLMu82xfhkgECDgX6iRAGPcItu5CsbSqJqABTkpw2gc
 ILGw==
X-Gm-Message-State: AOAM530U4jQCcGWsJkx0p7myoJiWHNWlzlnY/Qnh4T2mzGwWdg7C4aDg
 KXjmRTBKx8oTy0dxbBZdw+e8YgeOW8g=
X-Google-Smtp-Source: ABdhPJwbbP2Gc22g/sRDcXaGWTqVzkMai3NGOEE5+Abc2L+GUPX1p+Q7Dlu1CaY5R97QjJs2URwlkw==
X-Received: by 2002:a17:903:31d7:: with SMTP id
 v23mr978181ple.138.1644877072362; 
 Mon, 14 Feb 2022 14:17:52 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id s9sm3810184pjk.1.2022.02.14.14.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 14:17:51 -0800 (PST)
Message-ID: <2dd3c8ad-1b9c-c983-9790-769cf3027f24@amsat.org>
Date: Mon, 14 Feb 2022 23:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/3] ui/console: fix crash when using gl context with
 non-gl listeners
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
References: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
 <20220214201337.1814787-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220214201337.1814787-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/2/22 21:13, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The commit 7cc712e98 ("ui: dispatch GL events to all listener")
> mechanically replaced the dpy_gl calls with a dispatch loop, using the
> same pre-conditions. However, it didn't take into account that all
> listeners do not have to implement the GL callbacks.
> 
> Add the missing pre-conditions before calling the callbacks.
> 
> Fix crash when running a GL-enabled VM with "-device virtio-gpu-gl-pci
> -display egl-headless -vnc :0".
> 
> Fixes: 7cc712e98 ("ui: dispatch GL events to all listener")
> Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


