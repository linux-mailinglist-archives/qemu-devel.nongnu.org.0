Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1050C3B984E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:45:15 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Uk-0005dy-2M
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4TO-0004G4-IU
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4TN-0006fa-BT
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:43:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m9-20020a05600c3b09b02901f246b43bbeso5043254wms.3
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6JRvzp+eqFZZtskZng47bJrVKo1Pbnm9FHV+kfl/ICg=;
 b=mKJui3zeGPQCdKA86+gvmKzQRa2zoWxIbQRHH2wh7FcUJbd/Og7uyBm0pUKcArfROF
 miiKhf+ZbskEfwH7QpTit2sbq5XgMssUlp3ss3mwKR98Q3t01gk9wyEulb0WliCFEkG5
 /4hQfXAMS/Kx5kkb8j5KezQh52YoSDbW2ZZ+O7XJuPH1LpqGoO/G+SiByHC1BU/7tYEQ
 swLJ//Eiw2GFR0lVzjT7+FXf94efQ+WxsKwx4AA0GZDw/YfUQNw3JuXv7tRIv6DzUDiz
 KlK+DV1putGwVGjuyIbD+czuJS+nBO08o+A3a7EjsK6Bs5v1i+CEcIoG6cckrizPbj1E
 vQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6JRvzp+eqFZZtskZng47bJrVKo1Pbnm9FHV+kfl/ICg=;
 b=UGUvu46ToebIqbOcMUiQbzJoq3TeydmW6W4C8WNNUnoFIPc3MDLQCnpk2LuMDUi1KO
 V5I0HEeJRChWthkj+t6MXsEu91ZAVxSPOw2U50jHqlDwheAaM5uAff3+Co9enhEduOx/
 GtajG9viGiOwG4ND3kERpazjDzPJm2RLJ4SDB2IkcG2UKC5IhTZbp1wjEwdK7WjjCCTf
 FqIgD9ISdKS+l9bd4PiybGjxeCGANphliXz0+kEAb6Vxirw8yLldJbToebXi8AGbNmoP
 hNryfV+w2UJZ4b5aVqarAb2bda0+2mwmlzNRm8dfM5xqi0mM8eCvlTSDrRrIqhtH53PN
 jnMA==
X-Gm-Message-State: AOAM5317wol/oHZ2bKrfN+nnCcpeKIShO+rEHjugDwnjbRcBOGy5ik5R
 nMfvjpcaQBqcWCCVqd+glfw=
X-Google-Smtp-Source: ABdhPJwgf86awzv965T4DLZNobvwd+V1sRDJaEQPdI9cxWu22NckbqKIeO/rXQxbKWWmSBktp5YczQ==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr1820073wmj.109.1625175827930; 
 Thu, 01 Jul 2021 14:43:47 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id d24sm6369500wmb.42.2021.07.01.14.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:43:47 -0700 (PDT)
Subject: Re: [PATCH v2 05/10] dp8393x: remove onboard PROM containing MAC
 address and checksum
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe351a76-5a4f-95ee-2380-6fdf1846f9b1@amsat.org>
Date: Thu, 1 Jul 2021 23:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> According to the datasheet the dp8393x chipset does not contain any NVRAM capable
> of storing a MAC address or checksum. Now that both the MIPS jazz and m68k q800
> boards generate the PROM region and checksum themselves, remove the generated
> PROM from the dp8393x device itself.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/net/dp8393x.c | 24 ------------------------
>  1 file changed, 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

