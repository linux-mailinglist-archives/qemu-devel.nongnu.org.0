Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC116423DA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 08:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p26GZ-0002tS-2G; Mon, 05 Dec 2022 02:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p26GR-0002tI-Df
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:51:47 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p26GP-0003SD-Tz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:51:47 -0500
Received: by mail-lj1-x235.google.com with SMTP id q7so12554717ljp.9
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 23:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1ANmDXuRODXtDvrdrYJCwDpkyQniykORvkrRuyAL1w=;
 b=ZbwipdxOX0vlD1OhtZ2wDlsDX1MylJITYI5mUK+WatYubqE8gz+OHHjSZ45n8Z7T+B
 euNf3+lbEtF7WO7ppXs6bUFEbmTtAcLRq5fBcgIpJZk9tqJcfmmFJRJGfDbjuTkqPwei
 t06jwBPs/k5ESpmpAWJoa9zELLav/TXtL1DN2qTfixc22CzmVD7smlvDpV7J/jhanNrG
 9vL0X6vcDKcygJMN90VuCBWmYOc7tNLXmxZuq4gWYGp05mYigDmsCpv4Wi/x3iT/fCU0
 e6opG0jPRbMeoy+5bOB0MQlgjZcTFZ5siQn/D40qY2LZzpjDCgZSAC4nmcGF37bZqXxq
 Oc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X1ANmDXuRODXtDvrdrYJCwDpkyQniykORvkrRuyAL1w=;
 b=zY3y7TV8R8DI99rzzk3njKgOg9YhnahuV+4NqW9MG38J2raEoUodaLLilvLOjdId7m
 r0SfZn87/Q9hlS49iRaI8P3JI9o8iYYb+z+g1NI8BIvDDpQRrl9wIWc1/3DfIv4yD4QL
 Hs7nSyvwlfNdtDhiWOJv+d/Q/v7sv6J8Sk/CEUrl9yGBdXBGiTy80Jfo8dUqa/0UxsnU
 75/drKCTtLIuytS+ML7JUYhFuL23z9OhF2bn2WuM7sV93zRCxaViduZfLCkSqySc2Nal
 FOlAY01kld6SfrQlyjbA97puYVjvcr4I5ZK6KTEuNP78SZLBmHAgeCEBf9kXRn/Tbb9/
 9tIg==
X-Gm-Message-State: ANoB5pnufdluaSA/LJfQx2+8vlnb68p5/Vcrbjcb8ETp1F9Vuos6dlLW
 B0+P37mJ/KuBpC0tmFJjp2dm2o3WmAm7KDuXzxA=
X-Google-Smtp-Source: AA0mqf6j5IPnHDoJ3wm6aspp4btJCMyuTTMcezad3/Utor7JkD0JE20+7SkCcEujGDW98ssIfJpZ2OhxzDGXJ/mtvzI=
X-Received: by 2002:a2e:3506:0:b0:279:ee82:f32e with SMTP id
 z6-20020a2e3506000000b00279ee82f32emr2305532ljz.452.1670226703414; Sun, 04
 Dec 2022 23:51:43 -0800 (PST)
MIME-Version: 1.0
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
In-Reply-To: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Dec 2022 11:51:31 +0400
Message-ID: <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Hi,
>
> The vnc-display-test is failing on Darwin:
>
> tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
> Unsupported auth type 17973672

It is supposed to pass. Can you share more details? It doesn't look
like an endianness issue, at first sight..

> Is it supposed to pass, or should we skip it similarly to Windows?

(I hope it'll cover Windows soon)

--=20
Marc-Andr=C3=A9 Lureau

