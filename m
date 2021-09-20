Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41E411721
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:33:18 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKM9-0003H6-4B
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJpl-0005tT-KT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:59:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJph-0004Fg-J4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:59:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i23so30041278wrb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+XlzDwLOZOzTUwQzbuG0ot0R7euYgvp6st65uw+dmI=;
 b=AGQoERM2oGG12guIhE5UGMQqMnfUEOxaLpXJWOlB3mmHJvA9Ih0G3fSl0pwvG8edod
 /D2g+T412egWqUUK9AvtRARvjYBs5HTRk+E0fdbkm3whI61eo+Hhp2SezXvDD+y1j2wU
 Mu68LsHh6CCsp+F/T72sE7X9h5VMcb/VV71iWn2jHy/hD/eM6ip9s0pTCqc8S5wcMSU5
 KYQCqnk1tukgeb3D6mXRcpphwJKqizrY0KwXB1cCMZHGVQ+PowOguZhuTfAYpAF0kLg7
 vyxeySHFjgH2+n8N86sDYQDFeQOcg6EaVnbiB29dbh8KpuWD7gnF/27vp5gQtFzqTvoK
 sonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+XlzDwLOZOzTUwQzbuG0ot0R7euYgvp6st65uw+dmI=;
 b=cN6vsUXcHhHZhgYVAzU75tsSU3lk14UxLKwzDpjLyAOqwXxqBvFBd9m7Dj9/P0so1E
 kqECC2uaVWl3q4ZGPYB0azIVjbL/oS2bPo0w2PUerpMcgklK443us0ox2Eh05+lIhUhE
 roVOkxVQYazpHk4UmpAVpvxxE+ZNir/sV3gw++9XVG0xYIqS9ymu8aDzD+wUA6VTp0t4
 eWNAvv3x7cGTIFfh844zpjawS43VXDTWaeQoG+phTpFP8pZVDoDMvKAil7DI+YaFBYr+
 FPq0jjXAefP5uxepm13LSGBL4N1mlsCky+ycHu9khcrXMYSi16rAY2fuQvQ4ZyABQI5e
 QOSw==
X-Gm-Message-State: AOAM533p3c3K0BMk15+qDAwzkdN27zWSMxkhKJgwwdxcsmcrxIpoIL3D
 mv1fdbNYzbKM/cLtZQa2zI9BIgasIlWBNT3eZvtOPw==
X-Google-Smtp-Source: ABdhPJx8V0dokTL9iNiFaHhxn4vgB0BQcLwBAhZFFU1s10xtpa2VUNn+oHKacI3MfG91r0lkMC3ATo7edvRxJalaAXU=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr24823037wmm.133.1632146383702; 
 Mon, 20 Sep 2021 06:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193447.3946219-1-crosa@redhat.com>
In-Reply-To: <20210803193447.3946219-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 14:58:52 +0100
Message-ID: <CAFEAcA-oLJeEOXakQboy=gWhWukv595Dr=5n6Nh7tN5GKfYWcA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Acceptance Tests: clean up of temporary dirs and
 MAINTAINERS entry
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 20:35, Cleber Rosa <crosa@redhat.com> wrote:
>
> This is a reply to an issue[1] reported by Peter, and while at it, an
> update of the MAINTAINERS entry so other people now the status and
> where to go for help with regards to the acceptance tests'
> infrastructure.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00349.html

Ping? I was reminded of this today, and it looks like
the acceptance tests are still wasting gigabytes of
everybody's disk space with non-cleaned-up tempfiles...

-- PMM

