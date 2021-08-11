Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5FA3E8F45
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:08:44 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDm6E-0007Il-QK
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDm59-0006JL-2L
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:07:35 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDm57-0001u5-M2
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:07:34 -0400
Received: by mail-ej1-x62c.google.com with SMTP id z20so3494241ejf.5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57Um5HmGYTH7ScgZ07yHZsk9w/j9gyX0RoubPN5K35Q=;
 b=GLlaa5tCaBmxta3p4Ptm7Jn12W3crlMXv6YjvhrTN4N3x5bH8e9XaiTa0RVsVGgodj
 9ugIdCNoeiOaMoy24x5vaZqXBdOfzBesul0gd/5He70+5bDom0gBaSQA7IulgUc6W1mv
 b90jQyXp5xePqWZAzXJ2esyOc7CofmfubvIkO6PlejC3Ac+OwbH8fxefA4ePn/5XYW1J
 xN8Wcx8dp8nXoAdTbh0NsgXNP8zMoB1JP2YdzEzlD7wniKXCj9BXwHE3UYRAkH3PTiaa
 MGJOgsw87HymiiRJ9glwTOV0lPUX8pXYTDjl6/I07hDswrcGLyk84qnyydXZnSD4ikfQ
 /a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57Um5HmGYTH7ScgZ07yHZsk9w/j9gyX0RoubPN5K35Q=;
 b=Ke75xoTsAuu1vIG5F7CsYKvCfQ+76IyLgrgNnHt6sLz7EFGOhS4nkW6up9uQbEndVx
 EKVznIjjRQub8p0P2+Nrre2ql01CMhwsksy7cLiW5e/75VAPXAqJhmFvig5I+Yhsn8Qf
 Ilh2QYh0mahtid0TL/TF0jwBmDrNruCV8WSlctKdR8XrOUWCK9/zThbAu8cYDiF8HenK
 JMsQsDT+4FWQl4KwQ1Zb9xl4HHQ5qG7SXDTMpfWu/ey0ulM+Ca8Z2ywIa4lTnRTzVIcX
 NsUQI21SBdgWb0lgeFtRZBfx/MAVJYOCqmMlEBswBnnQ1WgzGWd8gLZ6xYzDGtW92/W1
 4nhg==
X-Gm-Message-State: AOAM532lCQYM7UY9SPDoj7GlCic8ZhUeOzExKNRH92UxtXpL/6xBBJvI
 42mXbEOSwRn7X8GLw3in4PGO5C9U5/NMt367krAMQw==
X-Google-Smtp-Source: ABdhPJwH0lZ4fGiWJ38fAp0xBESKCFF6lb2987I3xJxHR4ts3wGnuJNDu/FbQIDmAcoB4AYPXarG4dXKpdG0EdjlEIk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3027263ejy.407.1628680051986; 
 Wed, 11 Aug 2021 04:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210811094705.131314-1-thuth@redhat.com>
In-Reply-To: <20210811094705.131314-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Aug 2021 12:06:47 +0100
Message-ID: <CAFEAcA8-+vU6VwNWoKiGbDCdUyQbAmwvHfXi-Ma4DyBbHn0p_A@mail.gmail.com>
Subject: Re: [PATCH] storage-daemon: Add missing build dependency to the
 vhost-user-blk-test
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 10:47, Thomas Huth <thuth@redhat.com> wrote:
>
> vhost-user-blk-test needs the qemu-storage-deamon, otherwise it

typo: 'daemon'

> currently hangs. So make sure that we build the daemon before running
> the tests.

-- PMM

