Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A24601B02
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:09:22 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXMO-0000o2-U7
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXHG-0002vN-Uq
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:04:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXHB-0001CH-Q6
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:04:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f11so20383297wrm.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsdQbGfPbAaXXBjyWXqnPOZZZme8x7KVaAtmeopWOkQ=;
 b=YKMw/s1/vRkD7kwvMJ8raL3TdlyG4tY8TxJWa1lZj9o19bAq797PQPCavlpI2Ba77k
 //SF0xVK2EPR46cKspkQ3MtOyjFpW6eq6On1L/0LFigJQmyS1V9fDZ/xouvngm2cvw0y
 e/v2YX1YY8z84n5rGzgigSs/B/ZRhoa/DIIyPL3vzfo3OalkT0tJz8tvyzoJCFzYgbPm
 wxGpzPQKqOvaGlW4eoAUKxOeo68WlqHhdp55Tyw2tsMC8m9Q9Sd1ZO08kZQlmae+UCTr
 TYUQaxEGlsQcpafTYg3657jXzWZ6Ksduk39CkuT05cNLpWazfJWCcTvbj9E/5VcEIz2s
 mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsdQbGfPbAaXXBjyWXqnPOZZZme8x7KVaAtmeopWOkQ=;
 b=2aldtrM5NjiMYSaTFnyR/sxsJG3FxX/dhQcfqYzqGazrKeEOfP92J3uFVfQEvTZdji
 9x1SlOYfHe21gbU0PvpyNJfUa3AFM8VDOK3/RuHK2v5VuwpZcNuPIMaImi1IpZ5J6mV1
 si+QnZPJI0J3y5bKj0zFPH33O6pSeTdLqXfEnD/oHpJ90fYFaBNnJ0/7KS8dV0qVF7Sf
 1r8KDJIpGy9hObOWUmwMLxXzOwAPcdeBSnff83njFWNQyrWgOjdQdNK9yUKqoEX+0zIl
 FvaynLDyM8s1oeMOSOoewQU+eocdf12XjGuKvdQcEzdriqVl/x1KJR9IJQDh36bVhfvQ
 11ag==
X-Gm-Message-State: ACrzQf2ZefnN7JLFNAyV4f/7HqJdAU7AoBbTicpUrRhm9iJtrubiKjNb
 LDy9I3FoiYMCCR46KRKtQvK/KA==
X-Google-Smtp-Source: AMsMyM4QGPYlGwpJNw6YS3rQ6e4dVpNfCiFCQyMCmcvPsmFFEOieeoKQ4oaVHHavrHitbS/wgdB/UQ==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id
 g9-20020a5d4889000000b0022b021438ddmr7868597wrq.32.1666040626984; 
 Mon, 17 Oct 2022 14:03:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b003c452678025sm16591377wmm.4.2022.10.17.14.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:03:46 -0700 (PDT)
Message-ID: <6aa84e33-8ae2-bb4f-c4fa-1f71ea8301f8@linaro.org>
Date: Mon, 17 Oct 2022 23:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] input: Allow to choose console with qemu_input_is_absolute
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221014115416.63819-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014115416.63819-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/22 13:54, Akihiko Odaki wrote:
> Although an input is routed depending on the console,
> qemu_input_is_absolute() had no mechanism to specify the console.
> 
> Accept QemuConsole as an argument for qemu_input_is_absolute, and let
> the display know the absolute/relative state for a particular console.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/ui/input.h |  2 +-
>   ui/cocoa.m         |  2 +-
>   ui/dbus-console.c  |  6 +++---
>   ui/gtk.c           | 12 ++++++------
>   ui/input.c         | 29 +++++++----------------------
>   ui/sdl2.c          | 26 +++++++++++++-------------
>   ui/spice-input.c   |  2 +-
>   ui/trace-events    |  1 -
>   ui/vnc.c           |  2 +-
>   9 files changed, 33 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

