Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A63E8AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 09:22:19 +0200 (CEST)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDiZ7-0007dM-Ij
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 03:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDiYG-0006wy-97
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 03:21:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDiYC-0007Kh-6t
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 03:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628666478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxzcH4AbGySBsDRY1aO35gDWHWkfbAKTNSiJNmXvSpc=;
 b=B7MlX6BsOKDzr/DdZiwnCiG3nrCOeivrsX/txuXvnhmV9kjnYt872EtDJ+T80b29Nz3f4s
 6cC8CPNdCio3R0Mee7Ys39gdX3JTfXAGHfiTe+8S4uyWG0kT7rgLINVwii+OIWQRGleO+o
 ta7FPRaiRNjHLqDcjSCH5/rry3t1LLM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-1LKmDNykOJm2_7JES-LS1A-1; Wed, 11 Aug 2021 03:21:17 -0400
X-MC-Unique: 1LKmDNykOJm2_7JES-LS1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so529467wmj.8
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 00:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DxzcH4AbGySBsDRY1aO35gDWHWkfbAKTNSiJNmXvSpc=;
 b=e2GLMKvF+hF3FMp5aKb5Fj5DZx7g5xFBgGl4t+uuI4B73h/+V7pzUstXqIdogqod9i
 JU5AeAZjcvvFwjiG2Xf+HLZ3AmmclQgaGaJASLxFS859B7QDKh6I0MwRY1gSCjATMgek
 3WEc2frdsLGAK9BePy5RsaMcrhPr+otv4mo6rSUWN9wpZLJk0VadGNmgNH4LK7GtOKV8
 RTNJ7oRK1TW7QV03aiPpogKQus9sYCOSgXee/u60N+giWOmxJ2juPRp1LznN5tSdN57j
 tonm5rQ84Vqo0c8NzH/aoRf/RBN+nzcQ7J2bI8uDFEEb9gD7NFwlkv5FAAlWpRjSIEHV
 bzwQ==
X-Gm-Message-State: AOAM530ujvx5hl4a8ihBXG9MaDtCR7Rk0b1f/8FNWVVkWbZSbk6zwa5t
 BB+9yOf3HzGmhqiVKt1ogI4R+11tcqshT1atH7+d3OFtCiGT3Up+3hPw0NlZf/HFyLBdpGSQDWy
 QHTrh2vS3LTFJmYnT+9fBO0L6tmF0F4mX8u2gJ73mEI5OUmoQJ42mfriEGWZH1+JR
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr26477344wmq.32.1628666476021; 
 Wed, 11 Aug 2021 00:21:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznwtvKkTIxpgOYN9Y1HuC+e7rDkjlzE85vGqw2aifSJOppgSpYzOReTGMBsom6sqyS3d8Sqw==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr26477318wmq.32.1628666475690; 
 Wed, 11 Aug 2021 00:21:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d15sm28064789wri.96.2021.08.11.00.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 00:21:15 -0700 (PDT)
Subject: Re: [PATCH 1/7] MAINTAINERS: update edk2 entry.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <20210810083450.2377374-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9419349e-332b-6826-0818-64610701649a@redhat.com>
Date: Wed, 11 Aug 2021 09:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810083450.2377374-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/10/21 10:34 AM, Gerd Hoffmann wrote:
> I want keep an eye on the edk2 things happening in qemu.
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e4428c..9d31e42786b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2947,6 +2947,7 @@ F: docs/interop/firmware.json
>  
>  EDK2 Firmware
>  M: Philippe Mathieu-Daudé <philmd@redhat.com>
> +R: Gerd Hoffmann <kraxel@redhat.com>

Let's be honest and add you a M: tag here ;)

Whichever you prefer:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  S: Supported
>  F: hw/i386/*ovmf*
>  F: pc-bios/descriptors/??-edk2-*.json
> 


