Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16F6A1E04
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZfe-00063P-EN; Fri, 24 Feb 2023 10:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZfc-00062m-Rd
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:07:36 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZfb-0006Jr-9D
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:07:36 -0500
Received: by mail-pg1-x52f.google.com with SMTP id p6so7737464pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sW7zTuR9EnvwsIkTYmrzi7g5f8L7merPu6t8rMqa2k8=;
 b=ajm02ii/Hm5PqlU3o13wcRxa2pjG+XthXF4xhNYVuelWnNTbZWFIfhHqopUNCDyT7x
 La9epqtaxuaEehw07WRbZWKgVo7xE2UYmuu3XtEb2BLsln9Dc7FCxDUnTBUW/VzLQddr
 JqqATIRig7PaYfn3x+Eb17aUMqRwFZSfTf0bTHxQQv3nFOmqS0flX3QPZTUhHMSsQQnb
 M8wZmbyTp7Zmgpoqb5c3ZVN1fu+G9GxFNrxJFVD67aVKLg3pOx+wwyCEJdKMzFomRvVU
 p7Xk0C8bzosrQr55WYdVVB5OSbBUQpeYcSOWIzLh4xfxIyYbMw36VxdIshnsTV11JrnY
 YmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sW7zTuR9EnvwsIkTYmrzi7g5f8L7merPu6t8rMqa2k8=;
 b=hHEikmjhmoJJtT/n1VvaZT1Mh289xur3wHaYlbcavd3S35bgLuVnkECHhqIwMIXPtD
 KO4j9erv/Z4CASiZN3mZAbRlCRcwW1S+2rIbYDfBnW/men2nzVotzlG83rmf0HQIukJF
 a8ai2ldvHURomJdwK/GAlU5idigesM0ppbFpswuS6ZKAcLoADbc3M7FGwv/r/4zz73LS
 WqBTJNSCuPJwnw0By/70I40r5rE7HVnVYhqv8jkB5KPUU5Onun6cTqb8DMIX060jNNXt
 n66wvbW7VnclobrITh2Bsu+X3Gc1fgriHzMSprV3BhxoG/+oy7A7ee2Tuve2D1ZEJexF
 euEw==
X-Gm-Message-State: AO0yUKWVVrt2COwPLHnrN/5I4r2Fw855r7CEeFLysQknor6ihJ2k3c6r
 TVFwKkjzHNJI+KwhBxNjggLgrljtfzdu3cp8SiKYjA==
X-Google-Smtp-Source: AK7set+IR18kf8S2QJ5U8qT9GtD9mEnL4bEi0nIOtSs1i+N9IGw02YMytG2yYt5qZPCK0mLrvw+qXpadeF97vNI5UHc=
X-Received: by 2002:aa7:8a0e:0:b0:592:41a:1054 with SMTP id
 m14-20020aa78a0e000000b00592041a1054mr3266857pfa.5.1677251253788; Fri, 24 Feb
 2023 07:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20230223122327.1920247-1-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 15:07:22 +0000
Message-ID: <CAFEAcA8dWsaYJBqVztMq11eS-H+OqKWFThus58giG8-aERRXQQ@mail.gmail.com>
Subject: Re: [PULL 0/8] QAPI patches patches for 2023-02-23
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 23 Feb 2023 at 12:23, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-02-23
>
> for you to fetch changes up to c7b7a7ded9376ad936cfedd843752789ca61bc3b:
>
>   qapi: remove JSON value FIXME (2023-02-23 13:01:45 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2023-02-23
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

