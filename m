Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61864044D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p133D-0004b3-Ua; Fri, 02 Dec 2022 05:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1334-0004ak-LL
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:13:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1331-0004I2-IA
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:13:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f18so7068284wrj.5
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AzGpavAAZLgWQ03kC7FUYfmu8pO26j4Zxgn9MBnQeEo=;
 b=grtBfAvyZSMglD920YRVVoEsMIepKRtLpsbxr+PExtZlx6vUjpTI1MXcNTLnVYu9UD
 LVJQoDTJekiaQe/ZCK0mVE9xsuRh3CKIoO2hKlElKhZR8k8CwCAA14QaIKyDaZPmWNXK
 rgvkFClGc/uV3Ody5esespSzbVDWKPQgZ5mM5YxFd5qFswcGyIAeYXjTo/QkdKj6nKBh
 z3TebMB0tD+qWPNPK6SJpXBgAYyFSJO2z21h1VvuXCp3TWuAZ6WSWS0godStUsDE3bLM
 hcyuHKPGoeDv/Eh1d6zIC9brU6c22qjDbadyXa/eIgbBQr0rwFm8EwfH7Lp05pjk82Jc
 2+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AzGpavAAZLgWQ03kC7FUYfmu8pO26j4Zxgn9MBnQeEo=;
 b=cEbAoJFkrv7Sc8Zj1vQmNWY1ABi434U1JJKlIt6vseu0P3TzVMmbAeQGjE8s6rmFqa
 zXBs2z0Zs07ZfhJJOAlJVRG9gYuYAe8jzdD4z/QrM85W3VtZfRItwO7sZCsP44jjiyEO
 VDvEgC5eOYDJRaPYPVM5z0aXeWWY3pIwFehYb2iTF/WFilxWHGXdCqZa16zXNo9mqtUq
 FNGjd0TNzWDAqoKN8wCdmWlArGkSOab0bMe1SEfVeaiy4TK+NaeITk5tqvd00tev9d2V
 IA1LNTrNFYHUbZlGqHmuLs562kuG+mA15Yla7/KdAFe+VHITnQM5qtThdEq6Yd4fnObU
 pjcw==
X-Gm-Message-State: ANoB5pnoZ+uHY5dA3jkUHKfFb4a5ld0X//NOIQB41c48kKndiFmauRQ9
 WSEmyXlzQsShT/0qo/45tWRaRg==
X-Google-Smtp-Source: AA0mqf7TKY5xUqRr6s6e5wNVPYXCcRvdxI8Q2mcq0Kp2iebCWprV1Ez6W9dFwFNQ563Q3qNlUNH7VQ==
X-Received: by 2002:a5d:5f0a:0:b0:241:dcf9:107e with SMTP id
 cl10-20020a5d5f0a000000b00241dcf9107emr23124460wrb.363.1669976014014; 
 Fri, 02 Dec 2022 02:13:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfeb8c000000b0023662245d3csm6592393wrn.95.2022.12.02.02.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:13:33 -0800 (PST)
Message-ID: <35610e84-f109-3fb7-12a6-f1f0064c8cc5@linaro.org>
Date: Fri, 2 Dec 2022 11:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 07/14] ui/spice: Give hmp_info_spice()'s
 channel_names[] static linkage
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 11:05, Markus Armbruster wrote:
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   monitor/hmp-cmds.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thanks,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


