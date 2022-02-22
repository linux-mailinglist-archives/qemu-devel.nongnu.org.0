Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B884C03D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 22:28:41 +0100 (CET)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMci7-0008Ss-VQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 16:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMcfq-00063L-72
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:26:18 -0500
Received: from [2a00:1450:4864:20::434] (port=43726
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMcfo-0007dI-38
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:26:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id s1so9478800wrg.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z2SRibBdQhixFwba0M71V19LMVqOX8fCQkoDOJttA1Q=;
 b=ecV4SYfhCEOC4Yl5NdHsUrMQNzpop6nR8V3EfNZ5BTNGDCf/qLBiJA+1CEoyx17z+x
 sddKKpSQMtY4Hq4plNYEzUul7bKn759mrQ440PZfSbLUjnjxkXFIq7mH8yzGy6Ty1I9c
 M/K9IFgZVvFm4AGMIbvCWVbhxvFUfov+I6IWtI1z8Ee7vyLe5Apn+4pxRR0GcO4zUytI
 X4MYT/JfBb6eEA+26jxkBfcrO739xF+qfTey0IYMnQbq16PLS6//djG8rehs7O/1zB6D
 8kCd+E5OU9xX+V5kwjI72ufan74a8vf9GN3TxZSDIEd2XznzJjmbTzDL994ZAYGEasEm
 0+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z2SRibBdQhixFwba0M71V19LMVqOX8fCQkoDOJttA1Q=;
 b=62Bg9LC+eW5XiOKgRpkn1w2S7Oukg5q8oCn7qrBTEDaeZChP/X6Kt8q2/cVjBtHWCo
 R5G7AL+w2yQGhi+QxUkOBN1MisjYuXhXVAyXGyplQMnr3439nncqQGOYWQNeTI4bI7Fu
 zS5YbOprbTUUL79xp0vvTt2orbY98oqOmkMF20JvmuUi/wNQKuc8vhnfQ+5AEpqxsqN6
 LGASF4JhLe3MH74plo2waQ82J9xb9HaPnXS9+ta7jm5ZDgE7YDtlyw7DYJ1m+HfhIE8+
 +5CyAB9DPvvvXf9Z4T6IxiKG/1qFi02NG6LYjUyVR9BXaueJ8bTsJ9IuUDPOgiGvq9Mk
 yGsw==
X-Gm-Message-State: AOAM533eX8tnpwMePt6C0gWOLdnlg7ufYNRqpZ5szRSHOlwsKwQe0UYk
 auaeaaPrKxxQHhVpD4IG9Io=
X-Google-Smtp-Source: ABdhPJyLM4imgXml+VjaL9XxSKV7gJLmrllhozK9S7czpuje1Jn8YNcJ5523zJ8mWKsdmOPQLkkk0g==
X-Received: by 2002:adf:f14e:0:b0:1e4:a64c:c1f8 with SMTP id
 y14-20020adff14e000000b001e4a64cc1f8mr21319100wro.512.1645565174237; 
 Tue, 22 Feb 2022 13:26:14 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b2sm35533609wri.35.2022.02.22.13.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:26:13 -0800 (PST)
Message-ID: <cdd60bac-f425-4d51-3ec0-5daa59decf8f@gmail.com>
Date: Tue, 22 Feb 2022 22:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 7/8] Drop qemu_foo() socket API wrapper
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-8-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222194008.610377-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:40, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The socket API wrappers were initially introduced in commit
> 00aa0040 ("Wrap recv to avoid warnings"), but made redundatant with
> commit a2d96af4 ("osdep: add wrappers for socket functions") which fixes
> the win32 declarations and thus removed the earlier warnings.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h                | 19 -------------------
>   crypto/cipher-afalg.c                |  4 ++--
>   crypto/hash-afalg.c                  |  4 ++--
>   gdbstub.c                            |  2 +-
>   io/channel-socket.c                  |  6 +++---
>   net/socket.c                         | 24 ++++++++++++------------
>   tests/qtest/e1000e-test.c            |  4 ++--
>   tests/qtest/libqtest.c               |  4 ++--
>   tests/qtest/npcm7xx_emc-test.c       |  4 ++--
>   tests/qtest/test-filter-mirror.c     |  4 ++--
>   tests/qtest/test-filter-redirector.c |  8 ++++----
>   tests/qtest/virtio-net-test.c        | 10 +++++-----
>   tests/unit/socket-helpers.c          |  2 +-
>   util/osdep.c                         |  4 ++--
>   util/qemu-sockets.c                  | 10 +++++-----
>   15 files changed, 45 insertions(+), 64 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

