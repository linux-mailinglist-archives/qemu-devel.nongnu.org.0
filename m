Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79638C9D6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:14:21 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6qy-0006Nw-KR
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk6pp-0005gr-5x
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk6pn-0004zO-82
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621609986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iloWt9guBWln7WRUG/OBv7ebaBaXKHdgpM/cHkOpmro=;
 b=CY/xWNCInEoJf1E6HB5EklN6hBAYWGqEg9zXCYnUPjenFZwEVJHPDiDZ/kqvUuDKbcNEry
 mfxSojMXKtf35+koV+7LY0AXhSleCxdktcEyI9N6E0ffTawdPAcNqnIkkVfyL4eUawTtyB
 UlpCQMFnrRH7JDqwL0nmrCHBg5TNThQ=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-F1JCcfbePP6PlpUH_Z3XiQ-1; Fri, 21 May 2021 11:13:05 -0400
X-MC-Unique: F1JCcfbePP6PlpUH_Z3XiQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 z43-20020a9f372e0000b029020dcb32d820so7669344uad.2
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iloWt9guBWln7WRUG/OBv7ebaBaXKHdgpM/cHkOpmro=;
 b=eziLpecRtS44D9vj843YUA5KodNoiftCjF+yys8l9epaXT0wIPI1mPlvztUzUWT4Zq
 33n7WdwVHVCmDBJLQCcO/RtpYROHEwj5B/IGyRUoO13iWTEyz5kRJ6KsurAEO+bMpS3h
 Y45te5PNeBFMcQ6JGnmMmjjrrSWiMT0Ou+5pLqDUE5I8fnsCU5NY1BWskuQw1aFBYd2+
 41x1y3GtFSHU/R2GltZV2tjuBVbB95UeqZaITFYv5i53/2CInJf5rEnM0LhFGjfb9XdW
 8MXxxUU6F3zNI+F0hi2VIeIoZyDqtNSYXQPNb4p6TtUtzQxvJqdZArq4+6l2ofLCT4vf
 8yhg==
X-Gm-Message-State: AOAM531ssmEkygZs7wi7b9loSnWe7wVkCikkfQcea6Bi4M+kCWrYU5pm
 GA3lt2y9rnzNcNh/hYpOVKMapzLbw7HqVOg8xcL4VrZDMkhqgIie0gSCXAOyoQGRrbz2dY8O3Po
 s2yMwQimftJ4Buj6hWDS7COI61KB5Jm0=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr11041550vkp.11.1621609984565; 
 Fri, 21 May 2021 08:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi+vHkWUhLLYrP+6aH6N61Lran0Q9/kUGOoB99PcCiUWrNq60P9Bp3KYuiMXSFDdPK6z7mYiDG79JWTYoGF1M=
X-Received: by 2002:a05:6122:124b:: with SMTP id
 b11mr11041521vkp.11.1621609984335; 
 Fri, 21 May 2021 08:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 12:12:38 -0300
Message-ID: <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>
> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> > If you think these tests belong to tests/tcg/, I am OK to put
> > them they, but I don't think adding the Avocado buildsys
> > machinery to the already-complex tests/tcg/ Makefiles is going
> > to help us...
>
> This does raise the question of what we're actually trying
> to distinguish. It seems to me somewhat that what tests/acceptance/
> actually contains that makes it interestingly different from other
> tests/ stuff is that it's specifically "tests using the Avocado
> framework". On that theory we might name it tests/avocado/.

I think the updated README.rst from this RFC, inside the system
(originally acceptance) folder, is a good description of what these
tests should be: "This directory contains system tests. They're
usually higher level, and may interact with external resources and
with various guest operating systems." I can improve it, if needed.

We are using Avocado Framework as a tool to accomplish the above
description, but I don't think we should strictly use it if there is
another way to accomplish what those tests are supposed to be. Calling
them "avocado" tests may restrict the intent of them, in my opinion.

>
> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)
>
> thanks
> -- PMM
>


