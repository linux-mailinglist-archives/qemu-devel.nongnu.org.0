Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F863781F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAo7-0001x5-9N; Thu, 24 Nov 2022 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAo5-0001s6-Kw
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:54:17 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAo4-0000En-11
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:54:17 -0500
Received: by mail-pl1-x629.google.com with SMTP id d6so1280538pll.7
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TX9/qR4lyx81ZzduYhgBCbP/YycVH2WUrNNfUN8eyUQ=;
 b=hJn3Rih3rT7iv3v9ax6fOyPz3/Z+MhP9OIldZC8BuvoSLyBimiBCOsZspLY9kUsBue
 da0n1d66JojiLkSyQlxYlxyuUfOcOOY06RUsXFl3FTDc1nTtbS+G06KnvHZqftP5aaGs
 UOFYPxww2sFNOE324sMNht9zAzbkg2VAH6JtAACKk4mKRYUon5baAlpJLhu5H6WAw2Y9
 pTOAZBX1X+kfZR1XeNh+N+SCIKeXq+y6uwVN41rmuF/7LnZNiFQQx5L2TTpPgAjRRca3
 LCjqy7+2j+taUmw3LXAjgTtufNZuHmT2dfUan+N70E3IlVGyZZfVqFmAWzjGcFmhxWAD
 m9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TX9/qR4lyx81ZzduYhgBCbP/YycVH2WUrNNfUN8eyUQ=;
 b=1YCsCfKPDrUmPi1UtzI/sygwf7FMp1qoTWh1wU95XlZu+dUMuLQD2CXW/L1kPrJ3ZT
 KrC85gsArpycWBUSzXYCR/XYLuYplRwfP2eMxN6P2HCENwI8YBOEVRv+nprc4Um9hF0m
 goKjMyNH+r8VU+w2SvngfmWD+mNVXi229KAnpKlxQQ483T3RH1eAyuWf5bqQGfRyqRyp
 smbXHquLjb/I57PwVd5u+L8RF54NSNflsHKg8QX9YMbwZ8/SWPgjUeTmkirXwfEOG6UC
 ah/P6fjcxDCvRWzq2M6P7V3qbEjZF+QTQnMnT5yxpmzgf6qUo0yinBH3pN+460xzpk1p
 JhfA==
X-Gm-Message-State: ANoB5pni2DFj9E7bQN3w91CdYh1Lz30rP8FXkWiaIAYOhpoHbXR3qEtR
 IeD13ANe0DK7CaF4b3vj37T2rHkdbWxu27MTVlPlcQ==
X-Google-Smtp-Source: AA0mqf7xGrdlfSGG1gwr1g2fCPiQcAe9Wk0dpolC2SNV33Q4f1KiEJU4zyKIbzOVviaVtMUZw+W+2x1aTbAuOYmOyhE=
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr34297077pjk.215.1669290854417; Thu, 24
 Nov 2022 03:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20221123144436.2141069-1-kraxel@redhat.com>
 <Y36XREqtQtV/S09G@fedora>
In-Reply-To: <Y36XREqtQtV/S09G@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Nov 2022 11:54:03 +0000
Message-ID: <CAFEAcA9Goq-aCZJDWa63uo77UvfwmuXtD3N-RxoRLJuUuMtZNg@mail.gmail.com>
Subject: Re: [PULL 0/7] Fixes 20221123 patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Wed, 23 Nov 2022 at 21:58, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

...that pullreq had for-8.0 patches in it. I dunno if they're
so risky that we ought to revert them, though.

-- PMM

