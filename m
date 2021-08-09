Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6D3E4C4E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 20:44:40 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAGN-0003uo-2s
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 14:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDAFX-000375-W7
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 14:43:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDAFW-00017A-K1
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 14:43:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id by4so7359899edb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DaCbApnpz+DySru/N3BaA3ZfEOzEsKpo43S3ADmyeLg=;
 b=Ct4uQnbyeVsV8eSbspxpOYatNvVPNDIyJsOMKkO+H8JRKOpjD9FuDnpwN4AxbXD4Du
 n0fb9hNBgKzK2aULzDLnr+kIR/OUCJm+0k86DBPWVS9yaBT3dOlK+6W5SsKODWw6mhFQ
 STD+URI6lMlLkKZrDOXNbct0agEvWfwMf/wVH4y9gSB2tdE4uMqcPAOJ2Ao+/XshT1Hq
 IyiQhPGxgA0Yh5QH0E5xOADCc6TSvERiXPa7TAl0mOwPHJOdH4vIpeVRkihNqPZLC4iq
 kdRmRdhcoIByfP+0bK0slxdlxSvv+F1DCIiUGC2R/5sGYGtNsG0RZro+koSz3RFH8DQg
 s1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DaCbApnpz+DySru/N3BaA3ZfEOzEsKpo43S3ADmyeLg=;
 b=OoRcHIVeahx26NUH1KXjTNpctUo+6MKXp5HxXbOtJk8inuXdljQ1sz+CM2An7GqIQe
 rj3XPwka6Jo8NYbePsb3B9NOHM+GcZDj9Ex/DHhVheh/Vi3pQEPvj6Xk/i7Ap8G6YCL+
 CgKgBh5VF/AxluOqS5BjlPlHr9kcQIM1wA4MHjpMBWmvv9IddUaf3F/iXzXHgZ5udf69
 ELQ3nKiC33KUtZyNL7aoemoStZbQuOvYJrNteCIjJzRzJ5ZMrVHwlvwnngOnDpOlhdnG
 1B8BzUPv8DD2bZkWCIOeelJqWQDufuubzaZrnANfPOgij1h8Q+Ug5NWDKqXCwrYL7UUU
 iE8w==
X-Gm-Message-State: AOAM5333Xo34m9/pEcQYX3owf2cCpSHu4D7k/o4mQwcULrVFlxpZdBmH
 xAf4/yspHa6wHnr3vt8CL1TigxKLQO/m6GhqAr2P1A==
X-Google-Smtp-Source: ABdhPJwPaxrRh0JNAtMvi/ZeSopGXxQSmlkbr11YdqyD24okujbe6NVs+hppuildrpkOBt5qwHmIKouZCMCR84eDojc=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr31527961edr.52.1628534625148; 
 Mon, 09 Aug 2021 11:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210809170319.740284-1-hreitz@redhat.com>
In-Reply-To: <20210809170319.740284-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 19:43:00 +0100
Message-ID: <CAFEAcA_NujZgkjPzV0WDvuDuxAJn3qCGPxRRKCLeYXHWPcQX4A@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches for 6.1-rc3
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 18:03, Hanna Reitz <hreitz@redhat.com> wrote:
>
> Hi Peter,
>
> Let me prefix this by saying that it's me, Max.  I've changed my name
> and email address.  I understand freeze may not be the best of times for
> this, but it looks like I can no longer send mails from the mreitz@
> address for now (only receive them).
>
> I've tried to create and sign the tag as Max, so I hope this pull
> request won't run into any issues from that perspective.
>
> (For the future, I'll create a new key and hope signing it with my old
> key will make it sufficiently trustworthy...)

Yep, that's fine. This pullreq is going through OK (will send the
usual applied/errors email once the builds have completed). I'm happy
to treat signed-by-old-key as trusted enough. (In fact we already
are working basically on trust-on-first-use for new keys, but if
you're OK with signing your new key with the old one that does
simplify things a bit.)

Do you plan to send a patch to MAINTAINERS ? It has some
mreitz@redhat lines in it currently.

thanks
-- PMM

