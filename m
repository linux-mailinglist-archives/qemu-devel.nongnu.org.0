Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C4381FA3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 18:08:38 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liJJk-0003Qp-O4
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 12:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJFY-0007P8-GW
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:04:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJFU-0007HG-Fg
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:04:15 -0400
Received: by mail-ej1-x62d.google.com with SMTP id l1so5600300ejb.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g9HypJ7VCJOlliO7wKGaOHGv6yxxi2jF7MDtpdRKI2I=;
 b=TcWmG5gPgCH2ejEWmJPdgT6MoIBqoAXRZplQL1361s9rIozFQl6ABIBGc8mnchSaKE
 kRBzuLXfvb9Nb6L4jaeqRFQvUw5j3ggWXKeE7+6R+pLoWl5VT4268j8aGvpWZUAdBLEM
 CwZLJ1AU4cDmUzeczWEP1cHfhPM5RNsvrzwLLtwClBfRg4Gmxqn7bxER4xF4GCS6syiW
 6R2TcqK+aEOHNRDjPqjVhp2S5U24keew+HdeH5fa/jgSAIuEANLqRNuXZCq+IN6nCWFm
 xIh7k8TYjU5xhnXi5mVskyCKOOjIy/zYaircAaDXS88MQNWK1KNYWKUekOLcLVSuhWFe
 pRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g9HypJ7VCJOlliO7wKGaOHGv6yxxi2jF7MDtpdRKI2I=;
 b=QLHdVAzQSSOIvxWcR56cYYI/GdFPmaWc7io5FTQ+6hFJ6Ha8nqIS2SmM0g3b64paoi
 d8eMA15JiAGqACkA2rHgW7C/h+qrM40Rx+05vd5bjvU3yq6Ai9E76YlV7TAB6fXyErud
 P/CE5xn23wxhS/hnjnPLd/2bu+AJbOaKneexHINY5q64KK+Ff52n6jZ7B5Uloo1A1cg5
 b2Pgv2xYWgxXSbJ6AXml7/1DxIQTcCFM46dRNbVWz6YhZuDJfrC4HDUghxKw6pZdeM+K
 ovNVlh4YvXQQyQKi9c5NNNz6Ln03Ur+eD0lbgxCAOY3dLwq5ULNCzbzko01VpFR0elcP
 2tAA==
X-Gm-Message-State: AOAM530aaBbcygSAjaI+lvR3QqrsWcQ2+dIUyzQwqD8CGkOS9ROfULLx
 kkdYhT/ur3L7AuVU0hNjC0JcVsmHtEsFFyf4uVHzsg==
X-Google-Smtp-Source: ABdhPJzF1JTpE5rPHek16/sXJpSMcwRSZfudm+lAopzxWu30n+Rlag47RIm4j9Q5XP67AF4+uWG3XLEfjH2tX92kvA4=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr19006643ejb.85.1621181046488; 
 Sun, 16 May 2021 09:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
 <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
 <48378522-0a28-b1c6-2a28-72c85202fcb2@redhat.com>
 <CAMxuvayho0Lgyejz8KPCDfmsbHZE9ANMdKv+NCdooUHoaJyY4Q@mail.gmail.com>
In-Reply-To: <CAMxuvayho0Lgyejz8KPCDfmsbHZE9ANMdKv+NCdooUHoaJyY4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:03:52 +0100
Message-ID: <CAFEAcA97jb9pkpCOXYAHxhcxFU1KnQG4UKHvsY8wE1zCdtGVqg@mail.gmail.com>
Subject: Re: [PULL v3 0/1] Rtd patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 May 2021 at 20:02, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> Otherwise, you should get a warning and doc will be disabled. Mine is les=
s
> ugly than yours, not sure why:

I think that's a sphinx-version dependent thing. I requested that
they improve the support for conf.py raising ConfigError to produce
nicer error messages in https://github.com/sphinx-doc/sphinx/issues/7108
but if your sphinx is too old to have that improvement then you'll
get a warning message with the backtrace.

-- PMM

