Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911D38CA0A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:24:19 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk70c-0004MS-Al
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk6zI-00031u-LF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:22:56 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk6zH-0006a0-4R
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:22:56 -0400
Received: by mail-ej1-x634.google.com with SMTP id n2so31029319ejy.7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpJ3eD4/8uWL5SKJxSPL/aVLAM+9AR451TFn29/xKSI=;
 b=tytRNf1EbL4RpEFOVCOtXkdlnyPrLfIOGZKyI7IuAGQSErNWgmo1ayfAI3hOJRx6sL
 0tbeH/GxTuoaSK4luUcHPOoTZDs87c8J0TohvO2zx47MdeK64LtjBmzsvcF/iY4CCRCz
 cxdlNF1KNfE+OahGKfZ0wt6s/noGrBq1fdv1dzoVlFOZwFNFOHtqNvFt4KCb1EaKkRru
 jG3VSdWaLfwaA8epHxVrb8no9vC7P92UX+nYVhOxN453RcZwl+rglzTGGhz4cn9FuvGF
 SHLdrkmbMZK3Ew3f9+VREz8iX6MhhFIt5qOaf5+nKY6KhtAXRmmKoKUGjlN2w51i9nEx
 qgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpJ3eD4/8uWL5SKJxSPL/aVLAM+9AR451TFn29/xKSI=;
 b=J7Fo1oHQo6XpC1z8F1fCgZVR8pRXfvoTg2LtNJwBy6GDhcUDx2QXrcEtcigCRvpJtA
 haJosoHFh7W9CyvVgJkmRMAaWyXx+Q7GJxzLeOO7PsC6ZHnhjjFql/dXpL7OWeCuLycD
 lLh6R3AC9Z9lxJ6PeGHlC34lLbmdAJ93KWqVGZbjkhDAvbfuLtX4jQT/oBzdi6QE3gGC
 OKWLbXktPK5nxLO0pVdrrwkNSjfaBxmgnegSSd7ug0VsBIYYdL5SVzVbRsJRfx/dxrYR
 TGBqVVdIpDvpMwRp27laPh7I4h2EObWNqz9YZv53njgMdjLjP4aM/VNbmhjX68KgseCP
 TE4w==
X-Gm-Message-State: AOAM532fC2YEjNJYoFRfYnOhc5SRRvso/lo9Zfu9O0s98fdofIeySfOU
 YObBN5Dcfi2knp5t94uJvq9l/JkViJ+vteyg6Z6C8w==
X-Google-Smtp-Source: ABdhPJz4zVZcBJdTjO3y2aA0znOxozMpOgf/QiA+jMV7hHkqEOr3x5Xv5MNchk3WgM6av63urkBtnTT6E8sW4IpmU1M=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr10709717ejc.382.1621610573255; 
 Fri, 21 May 2021 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
In-Reply-To: <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 16:22:33 +0100
Message-ID: <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <wrampazz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 at 16:13, Willian Rampazzo <wrampazz@redhat.com> wrote:
> On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > This does raise the question of what we're actually trying
> > to distinguish. It seems to me somewhat that what tests/acceptance/
> > actually contains that makes it interestingly different from other
> > tests/ stuff is that it's specifically "tests using the Avocado
> > framework". On that theory we might name it tests/avocado/.
>
> I think the updated README.rst from this RFC, inside the system
> (originally acceptance) folder, is a good description of what these
> tests should be: "This directory contains system tests. They're
> usually higher level, and may interact with external resources and
> with various guest operating systems." I can improve it, if needed.
>
> We are using Avocado Framework as a tool to accomplish the above
> description, but I don't think we should strictly use it if there is
> another way to accomplish what those tests are supposed to be. Calling
> them "avocado" tests may restrict the intent of them, in my opinion.

But the main reason IMHO that we have them in a separate directory is
because that's where we have all the avocado machinery. I think the
sharing of the machinery is what dictates whether a test winds up in
tests/acceptance, tests/qtest, tests/tcg or tests/qemu-iotests
much more than whether it is "usually higher level" or more of a
unit test or whatever. If we ever added some other test framework for
doing system tests, we'd probably want to put it in its own
directory rather than lumping all its support machinery and
build files in together with the avocado based tests.

thanks
-- PMM

