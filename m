Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19340400D6D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:07:12 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMekh-0007N5-5Z
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMejM-0005x5-Cs; Sat, 04 Sep 2021 19:05:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMejE-0007hQ-O3; Sat, 04 Sep 2021 19:05:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2090328wmr.1; 
 Sat, 04 Sep 2021 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3HbMU+Bmh2tZcJKtiGVWKPW9syNmRkGskFP2WanvD9Q=;
 b=dSw5KtxqhWxWWG2fLojSpvbefOol5s2UNTbnH87McjVOLXwea3/0ti/b4toqrGGIaz
 5G7oSRzXAPzWArtnATnIpYJ98UvUzRJjOsL5wZxqO8DMTXljgdx5XJZZAWhm2YjvA4+9
 Nk6DTHTlKR9MJIPQ8L96uMQsHIxZjb7+9gWijR6Hbsd5PewBwDcA+BUy5tg30gJIeOgC
 2IKLG3pWN4IWOVUG5TwYcS/P3QqnJuaT202DkdLfAIgNwWz9G4Jn4neUOd66+49mpNus
 phF9Ee/KJdPZtERMGipyKajgh+1ppEE06XFBh2qHfPbZjnRs4zG383CyMiyoeKQBEaWA
 n9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3HbMU+Bmh2tZcJKtiGVWKPW9syNmRkGskFP2WanvD9Q=;
 b=JwXNIu7YdHYPKJKpf1KC4MGx0EGitvKDAmdx9aJosjqMJuIBoz6tqYx92dDeFRZcs3
 wABTjuUJo3YcILGfdRvCxBQGsCdei2S3z89qQUs9qCPUd69ATa033IfYyhkvXIi7pxZa
 RlqV0UCv3mcFWoA83AJskUKS4hm44LAGESN/BlZS/OcBOXggsVgThZHqwmeHM/E40EgO
 o6YZObSMbEYyGH8rohkHhI6VofQnjB9Ble4UvlM2R5JfdZ8ki8TEFixGJR+h4nBqyugu
 OzZiTbXjBRZJxYNm/R6XSLKo8otn8AXBIi7AzA6xZjBQ+fdR2JTUlbzKzpFy7snKYyEW
 4lZQ==
X-Gm-Message-State: AOAM533/ou7Y2MryOCZP7vLNUXQ+izCC7Fj6JazxMMYu3/GtbPAls0Nx
 6UCoY6im0zfKJb3N30EhZCS6plwgF2c=
X-Google-Smtp-Source: ABdhPJwGGbqo/ZZ2QhUVVgBtHR7nWuz0+d1I90tjz/29H22YMESFRvtoYGAEovAFFrwm5HQmUHisMQ==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr4795651wmh.66.1630796738682;
 Sat, 04 Sep 2021 16:05:38 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u17sm3014507wmm.33.2021.09.04.16.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 16:05:37 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: add myself as partial audio reviewer
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6dfc6d5-9927-0f4f-a67d-cba7e3f7e875@amsat.org>
Date: Sun, 5 Sep 2021 01:05:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <E1mMVca-0005ZJ-Lo@lizzy.crudebyte.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 3:13 PM, Christian Schoenebeck wrote:
> Volunteering as reviewer for some of the audio backends; namely
> ALSA, CoreAudio and JACK.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

