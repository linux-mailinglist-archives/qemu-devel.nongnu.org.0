Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9D35CA73
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:51:01 +0200 (CEST)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyq4-00019f-LR
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVyoZ-0000cw-4C
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:49:27 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVyoX-0001C8-Dg
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:49:26 -0400
Received: by mail-ej1-x629.google.com with SMTP id w3so21095836ejc.4
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7UkEjm0Y2DH9W7bMLeVI2QbEP//ZSNAofWO6bZGidA=;
 b=mHsR4yjPVmlqhFJufnPs6emw7uL0WgFIrzAB8RwzXgB/BTYuSslpAXJcyjoKgnFsJ0
 g6wE1I2Emg4LyyWM2m49t41seZaF17F3n8On5eeJPX9ulqEUXHNwx8LA/wSD8gIYNp8D
 pZXcC2f63QD3xW5afsxhJmHaV3Cvv4sF2YfeIvWoBWCJMbpRcc5ID2D0H7eDiWgg0C00
 PlQB/WS0Rb0cYK0Fdw1hwrZVcZtyDahhCNb6oeM3CnSuzhjtBOrmZhF6nYN4AFPL9Ado
 4TPHCZpFPO+VnvfMPs4CQkRZnvDxoCWcy65pel/Yiqgc26jf3QxTBw0fzTCs4a9O4n2f
 APQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7UkEjm0Y2DH9W7bMLeVI2QbEP//ZSNAofWO6bZGidA=;
 b=Mvyym/2FVKxQfE93WeAVcjRRKRIguer3kT1gQV54yRmtlP44e3wvDJCmoWg8R+m4H5
 oiGroUc7yJRlb6hlp0wNqvgrmBqoa5OiSEQs2Lr0GLx7ZXx3a7K/1m+rPNAw63wk0DBV
 crASr8CDW9TnYyg2AOvnOqXiFrv7ETQNif3NP3l+4Rs9TLLAYXLbAa9MuDTPEDTIGlnP
 Cat33ExQ8KFRCyjBR95DGG6PCZj2uE/M3Sz9AJbWeo9Q0KoJJ1TnTteEnqBfH8oHfA4U
 qdHxOalr8YkGxjslSmWd735ObVedqe1rCYzsDh1yFmToCxFif6hLZZl4B2H63TfW3aWU
 UlmQ==
X-Gm-Message-State: AOAM533Kg46R94TcWRUloAt1klumpsfvYlbCyoD0yxiAYqY+CQBiyyw7
 diUUiEWDmQGRQlhnw9QVFrmYNaP3Be3ZmCMD8xvdoQ==
X-Google-Smtp-Source: ABdhPJxo4GP3m9hlusdXra8eMFuNVgNhmHgkiz+xCqrMaOugbGigE067A9roECx8n3KCKb2GM+calTDQTWYhPTvAqBc=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr27229152ejz.382.1618242563714; 
 Mon, 12 Apr 2021 08:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210412121846.144565-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210412121846.144565-1-vsementsov@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 16:48:39 +0100
Message-ID: <CAFEAcA-damn2CQDe2OMpEj=5Lo=ZTcsBOMoaHJqsX4ktL3qyCw@mail.gmail.com>
Subject: Re: [PULL 0/1] NBD fix for 6.0-rc3
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: rvkagan@yandex-team.ru, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 13:19, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
>
> are available in the Git repository at:
>
>   https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-04-12
>
> for you to fetch changes up to d3c278b689845558cd9811940436b28ae6afc5d7:
>
>   block/nbd: fix possible use after free of s->connect_thread (2021-04-12 11:56:03 +0300)
>
> ----------------------------------------------------------------
> One fix of possible use-after-free in NBD block-driver for 6.0-rc3
>
> ----------------------------------------------------------------
>
> Note: the tag is signed by a new key, as I've lost the old one. So,
> now there are two keys with my name on http://keys.gnupg.net, the elder
> is lost. I feel stupid about that :(. Anyway, both keys are not signed by
> anybody except for myself. And this is my first pull-request to Qemu,
> so, I think some kind of TOFU still applies.

I'd really rather not deal with trying to add a new source of pull
requests the day before rc3, please. Eric, could you do a pull
or something?

thanks
-- PMM

