Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790B3DE12F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:03:52 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAf6F-00066J-3B
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAf4l-0005Oj-PC
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:02:19 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAf4k-0007uk-2O
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:02:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id y12so26318949edo.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aAarwigePmuzUmtVG2Bu5w2TniYiS/y6ZR20HelsnBc=;
 b=peIKnM7jBioiwTt/0LdtHWw5F05+YC+OKQJEjBAphwW0qe94J6xLEDU0GWFmKvRPIu
 j/TMfpu7Uqu6nS30eH8/1C6p5H4NUc1VlTDIPV76LEP82J0lkFiyMu48Q5hwJ4jYh599
 3ZH798x2Q15IjZoOIg8WGh30ReD7Th9O95KI8rPD4Ie4S7wwlpiAg7+1M/KUNlpliT+G
 Svwjbc7YDgHIzk8BTUl2nesMOzAdhCYHyNCJbZB0Rwxgyfjvb8wvVB6YSYJZT10zuMjA
 d6FvfEyw5jy1MYfUaHYafUncez12FhHsCuC1yI0FIe/USdIvtNdDCCtI4zCPysGl7dZ2
 fw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aAarwigePmuzUmtVG2Bu5w2TniYiS/y6ZR20HelsnBc=;
 b=uVT1rD1t2zYgRXjXnYQKWlREqOLWgpBIZd+3iJC/nktZyzRenw+zEUdRJtqnmTm+zn
 2v3CHDSLmhcjWgWUJ+M8PkX3TUV1Y1GhIhbqYgGOX3Zd9NSaWhTI76G5h9fLy2G5RX+c
 WHwuj+C6kjQ72axeKcGlp/aTxFIZOPx72keA/I36cuqep0zPxa+EZmr3pWGxMrvzs0a/
 PdrlXn9qgyT35dtMmRKbsF0AZYNXmaEoDRhseWXApv8jo4HcNnZEEvAMP6vQyN0vqRzl
 1tF+En9w4eV7g4wNf73sXZj2OL0/rRp2IilhRNlnit2nYMqX/i4b5Ef0fVXdiXkCqox7
 gQNQ==
X-Gm-Message-State: AOAM532Fenat8o4KI3Po7As1TObARz3sx21VTmC0U0RGYRwBmIXYyse+
 37pN5KY8vGWcc64mAWd+Xwi45y9WvgIuQx6zvg5s2w==
X-Google-Smtp-Source: ABdhPJzGpczDiMx8DoiMVmXoGO0ZuIzbeHlo5Vaeac2joCuWCDrIKmOpKWWbOR5wQ/N9hJb+fBD+bpD+ylnOneLVAlk=
X-Received: by 2002:a50:f615:: with SMTP id c21mr22250315edn.146.1627938136234; 
 Mon, 02 Aug 2021 14:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
In-Reply-To: <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 22:01:32 +0100
Message-ID: <CAFEAcA8naKZD-AG-ckL5FKRfsKPSOdVBLViWUx1MMBqfCwJ_-A@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021 at 21:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> A simple fix/workaround would be to set "b_lundef = false" in
> default_options in your meson.build (which will suppress the
> -Wl,--no-undefined option).

...though I just tried that as a local change in my tree
and it didn't seem to cause meson to actually change the
command line it was using to build the .so file...

-- PMM

