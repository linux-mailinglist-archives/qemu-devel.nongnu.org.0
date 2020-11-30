Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3672C8530
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:33:02 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjIa-0002Oj-A7
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjCE-0006hV-9a
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:26:26 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjCC-00045k-8R
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:26:25 -0500
Received: by mail-ej1-x62e.google.com with SMTP id f23so1791501ejt.8
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+NKxKyeoqCIDEDdsuOFhamrjxI2SP9q59L9/qzoO/A=;
 b=X3XgvkxHaGnwY5wDFTuVjbBurC0VCE6pHKy0dKIQP1X+tdlMyoCe6uzv0ZbVH0p6yp
 SpUGPtEm7JDKnDVUE+YogBHFaCI5KUcyP2Fnj/VlB8mCncTjUpSePFOo7mlx4gQGIYe/
 eegdOKLBsoc9ABuN5TSJB/rlWJ8pCAoislZkr1SW61nQtJ7abkQaLcwQs6tkhcVdTCA0
 fUeYLQgzpVyt6HksE6DYu7XpkVEH37yD6XSM1TrKH75K0XT38xbEZPYqvPDOvoZdFpRF
 GzgDUikfqoTh5sboy+SelPQZ1mVgnH41/J3GjkFb5znktsvlA9haVP/I/KUhRYek8LvG
 1YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+NKxKyeoqCIDEDdsuOFhamrjxI2SP9q59L9/qzoO/A=;
 b=IsuMNzr/8XcILp79AQbphFpBY2xa/jJJXNgnUS/vi3VFWBVuXUEo32scf415mxzmF+
 tbGmCR6T/PdcXq6SDxh8Zolf93FX0KJjMCTJTZ/HQLiipJHSo/3zfKtm15ivrDv9Jg9E
 awAxoKjwkfYhWlM7fRif6vwgfxX8oEcdawPmWEEte4Fjc30KyQA2PLk2sLSL7trk2gay
 326asx9MXpWV7yXtAb2mL3z6zMKfZ8peiqf96YTMBagGg0p+8WnKJ2YshsUaSsIA+EUL
 1yDBwLwhTpm9mV5ETxliChLYWkFIwM24PkVtOvf1ITmLw1dR/RpeZ3NI9xBocZHzlNzv
 AvGQ==
X-Gm-Message-State: AOAM5338/A6w/Ex3yGSsH0pi9vC592j5S1HRJIBbO0M6Dk+3T0dYMxHW
 InYONG3bAr06MaBR4AsZnTAJOXnUmzWg+S8Ic9v+zQ==
X-Google-Smtp-Source: ABdhPJysubEEd2miN6LQyJ8fw7dybpWKU6oBCCRbBln1S1qcUp5wxvH8ICq/Ws6i2Le9Fjm3Dr7qG891QhRJSmsL6TQ=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr3767664ejf.407.1606742782667; 
 Mon, 30 Nov 2020 05:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
 <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
 <87zh3ufoy4.fsf@dusky.pond.sub.org>
 <CAFEAcA-3a8gYRPzk4jzv3QfLAw3tL74LoFTMy+VhXZA3QdOfPg@mail.gmail.com>
 <87mtzqsy2r.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtzqsy2r.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:26:11 +0000
Message-ID: <CAFEAcA-JCLUn5BxwH71CmFB3Q+KMSK0pid8nGH9hLUokNcoLSw@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Nov 2020 at 09:01, Markus Armbruster <armbru@redhat.com> wrote:
> CODING_STYLE.rst: "Lines should be 80 characters; try not to make them
> longer."  I'd like to keep the tooling we have to help us with trying
> not to make them longer.
>
> If we have lost the ability to differentiate between "warning" and
> "error", call it something else.

Personally I just want checkpatch with its default arguments not
to complain about code that we'd be happy to accept in the tree.
It's unnecessary noise when I write and check the code locally,
when patchew runs on the patch on the list and then when it goes
into a pullreq. Do we need a new "be really strict" option?

thanks
-- PMM

