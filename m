Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4F6C4586
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuKZ-0001UR-12; Wed, 22 Mar 2023 05:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuKW-0001UA-QE
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:00:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuKU-0000fj-Pc
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:00:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v1so10080987wrv.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679475621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fBIhGmn1dzoUfswgoc8dLiZoqDVuabwddS+wN6KZj80=;
 b=qXk2KluBU49x7kCOApdS311nh2V/73mO9OgHpgAIN17S5I8Cai2824mKOI9D0yu6LX
 nkQyzqu1Jhrh7lcy6cpQoSvb4Fj2IAjlCk8r4easWfydruqaHRHbYda6pwBQ9vdMubr1
 FomUR4im9alaMps+6ItauV0gCE16yA75O1OkLJD7iAaPFEAxYbPAkrUb32j+JceuKMat
 LOdjAdMcbg5ZELQpzqmZPLx8YNRGl3xgB5H6nFvJKVFt1wTfS1d8GW0YGGQ9N34pn25X
 +7C1jkuQr9O2Xdh9cntM69xuRoJ9VvKfJU2zcgOmPnCoPramJep72k5g5/xmdCHzUbzz
 o4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679475621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fBIhGmn1dzoUfswgoc8dLiZoqDVuabwddS+wN6KZj80=;
 b=zCYK5D9cst7zVEi0hh3UZ9PI5qoZJWQP1WswJ4xdb8nXB2rhgbEtpMtAYZUTj6mXKo
 14gA9p1GiTuELFN4ZeIYhoSW7bkPK/dtXarfGS9cb1Nk1atlvUttlnHyFBUDUNJRZlEE
 OMLx1r+bRyjakLqTgvrBVp2WmN8KRzaF5VJPg6EjPgchPsno246StZ7zKRwdyc8v9HE5
 PWYrT/a5CSa1xDreTbJ7w4TblFIQBw8dkZDPxFNiLkrTgnaGFuGNo45rfUurV0PU+0nb
 WX6r43bnfWwIzEzMgTmG9NvwnSgyRWrERnfABFm4XQqksR0HB4NX/GF9Ozlf+ns430HF
 LG9g==
X-Gm-Message-State: AO0yUKUKnnRqdBf60nfcfV3M1XG7okl0l33yVqzuvycnONDkDrDeGvrs
 pOCybi8dyuay2SrXxwW6et5e4g==
X-Google-Smtp-Source: AK7set9ejLxi6ND/ixogu0W0hI+1SL0RuIBtyFGrH7h2aEwXL9zSmBZdphsctoJtlfgvIRfN+l/2gw==
X-Received: by 2002:adf:e44a:0:b0:2ce:ae57:71db with SMTP id
 t10-20020adfe44a000000b002ceae5771dbmr4658226wrm.33.1679475621036; 
 Wed, 22 Mar 2023 02:00:21 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b002c794495f6fsm10314980wrt.117.2023.03.22.02.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 02:00:20 -0700 (PDT)
Message-ID: <c2c4b00e-53b8-0205-e627-93860bb67720@linaro.org>
Date: Wed, 22 Mar 2023 10:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ui/spice: fix compilation on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/3/23 08:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qemu_close_to_socket() renaming left-over.
> 
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1553
> 
> Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/spice-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 67cfd3ca9c..52a59386d7 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
>       qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
>   #ifdef WIN32
>       /* SOCKET is owned by spice */
> -    qemu_close_to_socket(watch->fd);
> +    qemu_close_socket_osfhandle(watch->fd);
>   #endif
>       g_free(watch);
>   }

Wondering why this hasn't been caught by CI, apparently we miss
the spice package:

-- >8 --
diff --git a/.cirrus.yml b/.cirrus.yml
@@ -41,6 +41,7 @@ windows_msys2_task:
        mingw-w64-x86_64-curl
        mingw-w64-x86_64-gnutls
        mingw-w64-x86_64-libnfs
+      mingw-w64-x86_64-spice
      "
      CHERE_INVOKING: 1
    msys2_cache:
---

