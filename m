Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09A2DDB97
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:51:13 +0100 (CET)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq276-0006ub-SV
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kq25x-0006O8-KG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:50:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kq25v-0006Ru-Ev
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:50:01 -0500
Received: by mail-ej1-x632.google.com with SMTP id lt17so444269ejb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqhGn/YVfKuAoZNwt+7qlcIUVLsbRBpWgT9SVMGIODQ=;
 b=gG3g7b4Xjwbb35L/vvZ+sqmu3w8b8Ot9eClcOgLdMO1hxYi3CJBTotgUtBpbHfPv13
 HUxKI9yfJ/Dtl0TiidPplUKrov1ZKxrIK6vTy+I+IVGxfwwAlYiXABOf+J3ecQxgacLe
 wxWkbTC+Mq4Tfne55OE7T/DYCxY0Tg7ZTuiJV7l3i0zNOmtXdwog31YgL7A1IfAybARx
 hMTbqxMI5yOXB1j6IzHjbk9/r6fnuupZ0KmkP4ku2PTNRO6OQ1FjkeDLF9WQmNsyscoZ
 5vF6k4LgBl58TkrGw+9HdnpfsZS6ZFAkJL+bgWrSbaMrGN9Cw+jZJ6Oe0rM+Cbgx1UBk
 ZqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqhGn/YVfKuAoZNwt+7qlcIUVLsbRBpWgT9SVMGIODQ=;
 b=fKZT5rUFSzRZnKjugoTgwv6E4Qu/JRSKOMQGBUbrvMPVr4aHba/qza3myoJ5I62Ots
 +oLcinQctmvIxuIRoJ0L/U1sjmQKUxzQ1pBgXGIF6LvtjsGo7EKm7ge//0Ll3ZME5Hye
 PVjss0ZYa53z6AO+eEm9044JKHMvC3jX1/Upzr8rpOHQYfsaEoxmXSTQCnvgNdfZ1S4b
 zViQ2qpvlIv3brnbkvMn96Do5cklmaXfZ9Ke1qD68d4qTTDXPXqyk5yl38SRqJUme8yh
 j/jL+adM3Z3N2qvpvhXJCBJUlj937x7bJJh8tSDFOLHdrMOvDyPOQLWK9+p7kfrnuTVg
 ebIA==
X-Gm-Message-State: AOAM530Jz5rQZoq3zt8SL0P/40dPFTMWqV9lAJVt8KGp2rlihDW+jzl9
 Pe5YlD5EkwNP8F2CXyZGZvtxEpHyf4MuQf2bomYpGg==
X-Google-Smtp-Source: ABdhPJyeCzgvoBEKoFdW0jTS/cVa8oeCXvHMlUobn+3wWHetd9FejqqaLD2kx1dy6kEEhsNaRx1CCW3anGIjSb2XkT0=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr1292641eje.4.1608245396764; 
 Thu, 17 Dec 2020 14:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
 <ceb9f00e-2fdf-7534-b811-aa6cbd771b4e@suse.de>
In-Reply-To: <ceb9f00e-2fdf-7534-b811-aa6cbd771b4e@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 22:49:45 +0000
Message-ID: <CAFEAcA9iw4rGOZwwLmBqf70s8jh0g10hNRT4Y5aUujZDZhL0cQ@mail.gmail.com>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 22:45, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 12/17/20 9:15 PM, Peter Maydell wrote:
> > On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
> > Yeah, don't try to ifdef out struct fields in common-compiled code...
>
> or should I? Using
>
> #ifdef NEED_CPU_H
> #ifdef CONFIG_SOFTMMU
>
> seems to do what I expect. Is it wrong?

I think that gives you two versions of the struct:
- one seen by compiled-once files and by compiled-per-target softmmu files
- one seen by compiled-per-target user-only files

Since the user-only target executables link both compiled-per-target
and compiled-once files I think they end up with different C files
thinking the same struct has a different layout/size which seems
like it's going to cause problems.

thanks
-- PMM

