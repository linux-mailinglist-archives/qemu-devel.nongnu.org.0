Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315C64870E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gcF-0005Ve-Ga; Fri, 09 Dec 2022 11:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3gcD-0005VW-FW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:52:49 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3gcB-0008VE-Lt
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:52:48 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 65so4092517pfx.9
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N/Uxxt4xCYsoBxaIikQ9rlv0GMNPnkPKUD6Ld9zvBYE=;
 b=D831k/ADAZG0ULtuGVlaybvj8Oik/MAY7HoCVKlYRLxMI1Nzy5W7wgH7wS4GtJjuzT
 KbzdUow7cAeiv2Dx2dNPdLaJvs0ZwP01VVHLUKavlL4JlI8KYSLiHV6d8fPAx9PDWJz0
 odjkfkqw6HwLe9S8Ko/DuQj3yhiiAP4Q9ZWYiEMkwktu7OX1MxHtaPIAVGdQ73rDDmXG
 HPyag8wl1+b5S7nMdKiYS5udkYkqNZ9ujji11qYYKmSFoZThwzI+b0iZZ/X/MUaNwmB5
 vVOqPcSuOcytvNSPO5B4cjep/J61uBRoOFBnxkC4yh+wE1pQTiNdkDuSHgd76+NU9qtz
 6c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/Uxxt4xCYsoBxaIikQ9rlv0GMNPnkPKUD6Ld9zvBYE=;
 b=1lsVYaNQwtfOci4gXjHEOE99KmHUkq8aA3c1QwxXXBbCHqv666kkPRiuRrojoEimzN
 ve4JP0c0yp3/OexN6hsJuS7B67lsWl05/swg4x5RU4V+HtLI4+jhmVPOt/7VtXAyZEMs
 0Qz++n1EdB0PqIDkBJF2lWyGkjs+K35GtDNBR660uxg7KLUL37+gvgInQqZRDD9Wkj7F
 Iuox3aEC1dqUUPIDDB+upLNfH6rgGXmxXsn6KXRNCKfLu+CHLgedMc2CKVJ+1NZ3w/1w
 9umBwoHhvJxfw8bF/WRADQwO/DrY57kLGjiI60T9aAG1va+rczQoUhRETOA/zhKJlXyh
 QFJA==
X-Gm-Message-State: ANoB5pn6kFqiFCuLFb9tCkW0BlbBEknM9fpvjLXYLLip/v6q9z3AaBzq
 cS2GMkp9uC3/ZoR8nYEh32JmmRBUPiMo5PT/cc00hw==
X-Google-Smtp-Source: AA0mqf4OcNmRyMteTh9GhFDEVfJWRLWBPKOTpwv/krelXnGF/UpJBwytLsYYAFsU+AebvJYDGIaWFeIE+/0Ee/ia/AU=
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr69634128pgl.231.1670604762516; Fri, 09
 Dec 2022 08:52:42 -0800 (PST)
MIME-Version: 1.0
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
 <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
In-Reply-To: <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 16:52:31 +0000
Message-ID: <CAFEAcA8MrUwOt+gaSVF6tMpG_HO_wCN_O11Ezst97-_52PR9pQ@mail.gmail.com>
Subject: Re: Target-dependent include path, why?
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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

On Fri, 9 Dec 2022 at 16:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/9/22 09:51, Markus Armbruster wrote:
> >> Because of where [pixman] is added as a dependency in meson.build.
> >
> > Is it added where it is for a reason, or is it accidental?
>
> Dependencies are usually added near the .c files that use them.  That's
> a bit messy of course if you have an "#include <>" in a heavily-included
> QEMU header.  You can consider it a way to discourage heavily-included
> headers.

This has always seemed to me to be a recipe for bugs that only
show up in the uncommon case of "some dependent library's
header files have been installed somewhere other than in
a system include directory". Is it possible to get meson to do
things the more standard way, where if a binary has a dependency
declared then the CFLAGS for that dependency get used for all
objects that go into it?

thanks
-- PMM

