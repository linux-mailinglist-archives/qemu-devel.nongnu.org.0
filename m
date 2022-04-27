Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86AD511451
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:34:36 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nje4B-0001aD-Vg
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nje2T-0008Lk-SH; Wed, 27 Apr 2022 05:32:49 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nje2S-0007UX-5R; Wed, 27 Apr 2022 05:32:49 -0400
Received: by mail-ej1-x629.google.com with SMTP id g6so2246351ejw.1;
 Wed, 27 Apr 2022 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qT13RqFUDCDCBaYOo0rzekE3nFeHBHwPmSUKvCmZad0=;
 b=LctFJtHdU+5gSStF0CWBCt88qUShXBp0iwTQLX8jZRDQtQIHL761DUzDAA4YhgSLET
 7syM9tCJo2lM35++5DW/17FwgyBTf3ne3/iPYqsayGLYLUvRTYD6GG6old1Zyf0JHXBL
 r+QbmWNMDxJzrUd8afBOkGYqMK0z9Z9xNGMdAxswzO/jgR4RFgoL2pGeeNI23P1uKIAy
 brCZC/8mz/AJKOeLL4ICnaotLM/us9Ezq8WVfGq5UsvbTWGk/5jreEBsYKFJmxX2FJyZ
 sdzEUZpRHc4o5dVbrGH1KDHUrGEGidq7mWdhQaAahO1uadI2ZnBl89C235hbiG9MFq2n
 N8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qT13RqFUDCDCBaYOo0rzekE3nFeHBHwPmSUKvCmZad0=;
 b=FOC4+vm1k/h4MIwIeeNDli+SaGFSPMKo/bL9wsdPslUOqAxvn6OndVkaYnfofeen3S
 fppn4lp94HUopDnXGDaluF8k8GmnHLJ+rTftgmiKMA22+INPAQVvEfEC2JVgk6a8V1pr
 bqI/9e6OvZlNGZGO+nl6OhQQlXPerUNhdWjvyu3rkZkrFb+3KEECdW8rXIN4TDLR1c/k
 LQYquuKIJ4Vy/ymKlJD+8gDFjdkpidvpkhhS5NPVVIdTU1tfKaWNZlXEH6voex7h7BkY
 XQalUYxTDhB41kYso/+zUyqenTYnmPtM4wVwU33VCJZY41EgMGfTHzDnqNjsgS8GMZCl
 fncA==
X-Gm-Message-State: AOAM533SWpH/rBGik7tYH9QuGryobLUv0kA/WaqEdykUMt9sqTqrMxYF
 Yi5MYNtH+A1bk3ElDFF9rmc=
X-Google-Smtp-Source: ABdhPJwC/oX0PoteH5qYExLqG3hPhH143o9sdakQOb4c4VSoihn2C1HlDh/P0w5Zheg0u+5VKKNcUQ==
X-Received: by 2002:a17:907:3e10:b0:6ef:f04b:c21e with SMTP id
 hp16-20020a1709073e1000b006eff04bc21emr25382436ejc.747.1651051966016; 
 Wed, 27 Apr 2022 02:32:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 g1-20020a170906348100b006efc26c7b1dsm6315127ejb.195.2022.04.27.02.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:32:45 -0700 (PDT)
Message-ID: <bacf5dd3-4cc1-7f80-8337-945d9b3f7dcc@redhat.com>
Date: Wed, 27 Apr 2022 11:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/18] ui/vnc: Require audiodev=
Content-Language: en-US
To: Martin Kletzander <mkletzan@redhat.com>, qemu-devel@nongnu.org
References: <cover.1650874791.git.mkletzan@redhat.com>
 <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a07513f1bf6123fef52ff5e7943f5704746b376b.1650874791.git.mkletzan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 10:21, Martin Kletzander wrote:
> @@ -4188,12 +4188,15 @@ void vnc_display_open(const char *id, Error **errp)
>       vd->ledstate = 0;
>   
>       audiodev = qemu_opt_get(opts, "audiodev");
> -    if (audiodev) {
> -        vd->audio_state = audio_state_by_name(audiodev);
> -        if (!vd->audio_state) {
> -            error_setg(errp, "Audiodev '%s' not found", audiodev);
> -            goto fail;
> -        }
> +    if (!audiodev) {
> +        error_setg(errp, "Audiodev parameter for vnc required");
> +        goto fail;
> +    }
> +

Wouldn't this break "-vnc :0"?  You can just ignore the audio commands 
if vd->audio_state is NULL.

Paolo

