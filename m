Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F36C6D4C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 17:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfNgT-0001yF-G3; Thu, 23 Mar 2023 12:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfNgQ-0001wB-Ie
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:20:58 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfNgO-0000Je-KT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 12:20:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id b20so56216670edd.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679588454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rQxbGOzurhWVgU7FPInSDJYY6nUV2zKWnnlNS9Sqd0o=;
 b=ZpcshuODOqaOK4o6YOlMLHu1wM+FVaZ8hfNkNsNEQGSSc0sq3iyCzSua4s5Yr7xHSf
 KkNeJ0SI1jqMA43Ac1f9rV3cu1Hh6R7ksYUjWkTKo6Sb8510veezLp8M6FnGrYfgbMIn
 vQ/O3q5XihlcR3UDoFBLief5e75Evnne179UlTSakbJKItOCj4jDIvIpzq7QNrc2Nx8t
 ggB53HVrnn6brpXSafR2+8NpYw54Kjw7l7PuiSiclhj/dVZtSqNuGiOxRs+9b/nO4xep
 5+T7CWrwO/j3hqh+AuBWfkZAkKt+Jp4GqREHM5uWbPWzf+/qsmSbqYaRwh/056tRIW6r
 KpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679588454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQxbGOzurhWVgU7FPInSDJYY6nUV2zKWnnlNS9Sqd0o=;
 b=xdhc0/FiX9MRawzWr61jXuoS1vlDUKGx2fBa7/j+6pb7wff0hre4W9ei8eB5Ntk73T
 aneUF5feiWQ00ix3pbPSoncbOb96TBA9JnOUayMgMvpvzG03yKQMV9wMB70/Dbq+Buxn
 oKTh45NL/AcjeNl8RBRKTIaz1DB7BrN7lpZhE/Vhc/IHQVmGFt3QzLlKAbAyAMbWx8Im
 wZ2SwHAGfIV3L/dKKZrqz0Qi19RYh2nEOhRcmfLb/5nl35bD8ZgM+kk1l3AnYbVwLvAv
 eSfYyNgLGYIq53Z+eogp5AWU553lUeWDHN7Yy+KqMq0Sg/SgGGhyeZSM/joW7CBGCrha
 IKSw==
X-Gm-Message-State: AO0yUKVylnR16xwBWQIwnJJH1psI6L2iMJ6pMM4R4RPeeLrYh66rw4Fi
 JVcuyIp9ThL4rB8X8eB1+Us4WzO//lflHwZf150KUw==
X-Google-Smtp-Source: AK7set86zOr0NoekxXwcxustZF0M8D2UzGw5Ujp21nmKdVVz9FL50cRrBUE9rC1+I2eKIMDhl7aFeMrTMJ9ydSfyEcM=
X-Received: by 2002:a17:906:234f:b0:8b1:cd2e:177a with SMTP id
 m15-20020a170906234f00b008b1cd2e177amr5710034eja.6.1679588454032; Thu, 23 Mar
 2023 09:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <87v8irv7zq.fsf@pond.sub.org>
In-Reply-To: <87v8irv7zq.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 16:20:43 +0000
Message-ID: <CAFEAcA88B70uwK=6SZ4TCujiUik0oOakBPG=USNRLYtzB=kiDg@mail.gmail.com>
Subject: Re: qapi: [RFC] Doc comment convention for @arg: sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Victor Toso <victortoso@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, 23 Mar 2023 at 14:48, Markus Armbruster <armbru@redhat.com> wrote:
>
> The QAPI schema doc comment language provides special syntax for command
> and event arguments, struct and union members, alternate branches,
> enumeration values, and features: "sections" starting with @arg:.
>
> By convention, we format them like this:
>
>     # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #       do eiusmod tempor incididunt ut labore et dolore magna
>     #       aliqua.
>
> Okay for names as short as "name", but we have much longer ones.  Their
> description gets squeezed against the right margin, like this:
>
>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
>     #                               not avoid copying dirty pages. This is between
>     #                               0 and @dirty-sync-count * @multifd-channels.
>     #                               (since 7.1)
>
> The description is effectively 50 characters wide.  Easy enough to read,
> but awkward to write.

The documentation also permits a second form:

 # @argone:
 # This is a two line description
 # in the first style.

We tend to use that for type names, not field names, but IIRC
it's the same handling for both.

I'll re-mention here something I said back in 2020 when we were
landing the rST-conversion of the qapi docs:

There is rST syntax for field lists and option lists:
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#field-lists
which are kind of similar to what we're doing with @foo: stuff
markup, and which handle indentation like this:

:Hello: This field has a short field name, so aligning the field
        body with the first line is feasible.

:Number-of-African-swallows-required-to-carry-a-coconut: It would
    be very difficult to align the field body with the left edge
    of the first line. It may even be preferable not to begin the
    body on the same line as the marker.

The differences to what we have today are:
 * indent of lines 2+ is determined by the indent of line 2, not 1
 * lines 2+ must be indented, so anything that currently uses
   "no indent, start in column 0" would need indenting. (This would
   be a lot of change to our current docs text.)

At the time I think I basically went with "whatever requires the
minimum amount of change to the existing doc comments and parser
to get them into a shape that Sphinx is happy with". But if we're
up for a wide reformatting then maybe it would be worth following
the rST syntax?

PS: I see with a quick grep we also have misformatted field docs;
check out for instance the HTML rendering of the bps_max etc
fields of BlockDeviceInfo, which is weird because the second
line of the field docs in the sources is wrongly indented.

-- PMM

