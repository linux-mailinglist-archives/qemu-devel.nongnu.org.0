Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8C598577
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 16:14:48 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOgIJ-0003UQ-Cb
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 10:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgG8-0000nL-W8
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:12:34 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgG7-0007Rp-9y
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:12:32 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-334dc616f86so44239137b3.8
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gjG1NESJW1M5IpWazrO6oEF067C+C8EP/EXH0EccUbo=;
 b=Edsyc5KwDkcP3VxZDn+BMYMYFpXCcFXpAagsyr5rEb8gZvhwY3OzKTZM/r5gii00w4
 FqRCWIuIhmfOFVt95+/kKtJv+aTmOLf2IUY41p051Kj2RbIzleT/BdO/kAZHOjuyNjZI
 gLNIBFQXMVMcW7u8BiBsqXCS2HzCG7FmteqQhkIWEPJjAEndjSANjZikoi0Oh0rK6yvQ
 +AJm0pTA3v3qYbCpSWQ903HGp+YPZ8IveYV0pbI37P9ZoMQKbK90GTDkFvBdK+bkUjy6
 +1xlvkxW26FxLwBIIiFHfMis+i7c7EMCL/C2aQQp3kph9xLc8qTf7+iHigskc2i7lKMp
 JWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gjG1NESJW1M5IpWazrO6oEF067C+C8EP/EXH0EccUbo=;
 b=bQ9JTOM75lBe6sEUE72gDOMfv4pPN0GzTObNqn38QtrCjYGQlX6+G67vY2heiGWlhM
 G6qMYZAU2heoiTDW2SIOvp1BMYI4ye5b+SIZC1oU05SKojlXTSKAmnKoM/tKthEwdxgd
 I5F8GRUPlaUJ6C7I5ozUB+mD7fGSz+A9S32p4LcpGaLjof7AvG7xIT0F2SJN3hikK/X3
 QiU5pRYaXbnQxtlT5LE9Yw4DgVchun9ICVp8vgqfctxpmkV9njEmT6ctie0bZWYAjuTb
 7qM/b8nEU7p8T6Su6bV/M7uEKlPGLCd8T4PhkG/c4yfantFXcCIqZZwQFHbJSDp1GEAd
 sEEA==
X-Gm-Message-State: ACgBeo1nwX/O8nm8pkeJV0W/9CxnUad+x/qJbIX8SVV57CF3KkB9m+QK
 Ho+7WEXZyr30tJpDrlaWM8PeYlFuyT2edKiYbBhLKw==
X-Google-Smtp-Source: AA6agR66ZMpolzisISaYy6RX4oN1jyaV5pHrTOzy42S+SGJScPOYOcmQTymIiRsrg61gzxnL39xGcBPQQi1KnqJdXoc=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr2975567ywb.257.1660831950142; Thu, 18 Aug
 2022 07:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
 <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
 <1727925.InMztqvFxb@silver>
In-Reply-To: <1727925.InMztqvFxb@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 15:11:48 +0100
Message-ID: <CAFEAcA9PcDk5pnRrKQf2zRaX8h8KSA9SDHODS102iK3jd_fpUQ@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Nikita Ivanov <nivanov@cloudlinux.com>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Aug 2022 at 15:07, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Mittwoch, 17. August 2022 17:55:24 CEST Peter Maydell wrote:
> > On Wed, 17 Aug 2022 at 15:49, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
> > > Well...
> > >
> > > What exactly is still under discussion? In my perspective, the main
> > > pitfalls have been resolved:
> > >
> > > 0. All possible places where TFR() macro could be applied are covered.
> > > 1. Macro has been renamed in order to be more transparent. The name has
> > > been chosen in comparison with a similar glibc macro. 2. The macro itself
> > > has been refactored, in order to replace it entirely with glibc
> > > alternative. 3. Problems with statement/expressions differences in qemu
> > > and glibc implementation have been resolved.
> > >
> > > Is there any room for improvement?
> >
> > (a) do we want the statement version or the expression version?
>
> I think the tendency was in favour for the expression version? Markus made it
> clear that the glibc version indeed may evaluate as an expression (GCC
> extension).

Sounds good to me.

> > (b) do we want "use the glibc one, with same-semantics version for
> > compatibility", or do we want "we have our own thing"?
> >
> > I would have voted for following glibc, except that it does
> > that cast-to-long thing, which is incorrect behaviour when
> > long is 32 bits and the return value from the function being
> > tested is 64 bits.
>
> Then simply int64_t as a type instead, and as "our own thing"?

I think this is probably what I would go for, except that we
should use typeof() rather than a specific type.

Then we get to bikeshed the macro name again :-)

-- PMM

