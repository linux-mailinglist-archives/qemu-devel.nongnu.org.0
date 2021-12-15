Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B1475665
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:29:52 +0100 (CET)
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRXj-0007Lq-9c
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRUj-0003aD-Ub
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:26:47 -0500
Received: from [2a00:1450:4864:20::32f] (port=33297
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRUh-0006Pr-WF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:26:45 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso871955wmh.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q2E/XBk0g1EKFzgrPoYeNkrEBiUxQHMP63xg9dYJsRc=;
 b=grM9V1vltr8FuNNq+z8UQtw00W/YRAjQvw5ESzHz9J71pk7oethStkC50TDu9J7P0b
 7O0X3wo8zjVTOKxStoOg29DAzS6U34zos66PMbORPLH4IqrWyBYXitMfdlRel37VR0jn
 s5Fbx2H9wbW/72L+z57NQ9pVsXuv0EQzGqfmD+wMptvONabYw4pMJgO9dTwB1ldkxBQO
 yrJQqcjSykNso8IADAkDNx7ClqRLxEs+hmYH4fBBIHn7Pzj+8QrZomhbvQnUZ+pnW63l
 ST/8amBydai6Pia+NfXGVJa44IxXTq1fvHdFiez+7MnNzG5rocFgnU7iXjiEVijTkHls
 oYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q2E/XBk0g1EKFzgrPoYeNkrEBiUxQHMP63xg9dYJsRc=;
 b=nY6HFtD3zCXtpCqDSDcGvJjzQM+9nGVuOUj/0KFA77zdDk7Xd1oInyzibuoM1IX8So
 +7k+BYMdAZ8aB3/ZUZulf14uZZrWJ+lBAEc3Bi6hSmdBCdYU5rvkDZaLK7SG95tztjGB
 8qgMgxWd1UXxDUdt2WQEnFC8Z6iNUhoe7gw8rCI40WTRUGF7d56XeRY/odZDfESuXNIt
 N4djJMA1B3m5AX3Ti5m0AggGRV129DpDqiiQq6oJFfCjHF/08QeKlwfDwEHnDCCkqMRZ
 Ay1nBkvRybFBWGIN5W2DAO5ABluGkCgfVe4JTP/X0ZdUNemF7r0zFJxGPugzumABiuF1
 pbgA==
X-Gm-Message-State: AOAM532ApHagBf+yY05yhv1tbnxvre8W/A1j4tVf4GvGo/KKlAS8HicQ
 mb0ouGLzPNF3XulgTZMDIsvhA2n7rt4=
X-Google-Smtp-Source: ABdhPJylp4TJy8zXd1fL3pea8Qa4ZLvhnLQ0L2a4mjRxam4QLwIrQdlSBCplipyA8zGFc8E72N7cYQ==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr4117785wms.44.1639563998184; 
 Wed, 15 Dec 2021 02:26:38 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w8sm1532375wrk.112.2021.12.15.02.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:26:37 -0800 (PST)
Message-ID: <91da377f-2a21-b8aa-c79c-8349f9f42b5b@amsat.org>
Date: Wed, 15 Dec 2021 11:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/i386/vmmouse: Require 'i8042' property to be set
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211201223253.36080-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211201223253.36080-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Calvin Buckley <calvin@cmpct.info>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 12/1/21 23:32, Philippe Mathieu-Daudé wrote:
> If the 'i8042' property is not set, mouse events handled by
> vmmouse_mouse_event() end calling i8042_isa_mouse_fake_event()
> with a NULL argument, resulting in ps2_mouse_fake_event() being
> called with invalid PS2MouseState pointer. Fix by requiring
> the 'i8042' property to be always set:
> 
>   $ qemu-system-x86_64 -device vmmouse
>   qemu-system-x86_64: -device vmmouse: 'i8042' link is not set
> 
> Fixes: 91c9e09147b ("vmmouse: convert to qdev")
> Reported-by: Calvin Buckley <calvin@cmpct.info>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/752
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Amusingly 'qemu-system-x86_64 -device vmmouse,i8042=i8042' now works.
> ---
>  hw/i386/vmmouse.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index 3d663682863..a56c185f159 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -286,6 +286,10 @@ static void vmmouse_realizefn(DeviceState *dev, Error **errp)
>  
>      DPRINTF("vmmouse_init\n");
>  
> +    if (!s->i8042) {
> +        error_setg(errp, "'i8042' link is not set");
> +        return;
> +    }
>      if (!object_resolve_path_type("", TYPE_VMPORT, NULL)) {
>          error_setg(errp, "vmmouse needs a machine with vmport");
>          return;
> 

