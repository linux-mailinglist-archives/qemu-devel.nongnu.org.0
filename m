Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92363414EC6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:05:57 +0200 (CEST)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5gy-0000X9-B9
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT5d6-0007HR-Nl
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:01:56 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT5cq-0001qe-QJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:01:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id w29so8852941wra.8
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zF612/hCgtnuCH5IXYaBKA2ncV0qTm2jwqI7cVYGSH0=;
 b=QiRdia/L1OROlob71iWPcZl8f6vpUzCH0ye9py8f7DmM6ddEzee0083HBojqxatQ+2
 VbUpC6iQKU5+ir6q3lNti1+/1TmSKKqx3FvspSEBKlG8xsNIGJdViimuhuWOn4i1krJm
 UIgY8zRBV22Jr4fsegRTQZT0nfLwDvtaCLsmw80AiMAAUJQXFpX/xSFS3IAYJkoS/wWT
 lK7IZlYmldFtrLXJrnlcDWcw2NBT2NkjtiWzp4jLBGda0mIcznnjhGbzhQTL8Xvj0lro
 QyjARNZGzROrZUTWyWcxXy93dekLl+HrlQcuqk9r7SJZsT9pFv9NLmQCwMiSUJD4sGY3
 mB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zF612/hCgtnuCH5IXYaBKA2ncV0qTm2jwqI7cVYGSH0=;
 b=lqRz4yyZoOZExhtARirGsHbCK6bRqCeCMgl3TUPP1D7UUsm/3VvOV3W3slZQLngOMQ
 0qqUkvyRGu6lDEpTyauxS8IKaJnFcDst+E4gy7HMXeMBcL8eKzo5myMZnz5ICHojywoq
 urBUJ7zRDMngNXD4DqYsskXWAtFk+MwWYsZqidoX74+TLG03y1V63YZRulnksRtcilzl
 NSJyyIBHYOS0XneYC3YPn/oEUSnlaE8XNeap2xMmi53vMHlAgeDj5X1a93zwJKwsatdU
 V1q7D75nSJCiE5VCDtydMMDK6wn37ag9suX6Vz/3zZw8u9RYDMScpdOFUArfM/szoMrr
 ThqQ==
X-Gm-Message-State: AOAM5317mX4XmuGKzki5XuBnbKNwCt9FuWezOZcYdKi4q+FTiqPPiljS
 X7qT8iYRbnoLOAT9NMK8QZo7sltWdMDrudQrn+EudA==
X-Google-Smtp-Source: ABdhPJwzHy6NVsvLaYpGfX5tKm8sW/1WaL6rGgdNetlsjm+uQwiYyHLJT3dsciaiP1ptvL9ivr3O/4qtCw0cqYbRqc4=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr50571wmm.133.1632330099378; 
 Wed, 22 Sep 2021 10:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
 <20210724085453.16791-9-pbonzini@redhat.com>
 <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
 <CAFEAcA-az0rOTQ1wcvseCqr3qy7Gq64VxzvnRZPVHurqunVWAQ@mail.gmail.com>
 <CABgObfbtV=hh19VUG+f4Yurt2CP96BDXOen_qQUvDE2seVsL6w@mail.gmail.com>
In-Reply-To: <CABgObfbtV=hh19VUG+f4Yurt2CP96BDXOen_qQUvDE2seVsL6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 18:00:46 +0100
Message-ID: <CAFEAcA8Vg7P91CjepJQ_-kk0r0oOhzzEtwtQM6b+s+p8Txqd_A@mail.gmail.com>
Subject: Re: [PULL 8/9] qapi: introduce forwarding visitor
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 13:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Will look at it next week.

Ping?

thanks
-- PMM

> Paolo
>
> Il lun 30 ago 2021, 17:37 Peter Maydell <peter.maydell@linaro.org> ha scritto:
>>
>> On Mon, 9 Aug 2021 at 11:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > On Sat, 24 Jul 2021 at 10:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> > >
>> > > This new adaptor visitor takes a single field of the adaptee, and exposes it
>> > > with a different name.
>> > >
>> > > This will be used for QOM alias properties.  Alias targets can of course
>> > > have a different name than the alias property itself (e.g. a machine's
>> > > pflash0 might be an alias of a property named 'drive').  When the target's
>> > > getter or setter invokes the visitor, it will use a different name than
>> > > what the caller expects, and the visitor will not be able to find it
>> > > (or will consume erroneously).
>> > >
>> > > The solution is for alias getters and setters to wrap the incoming
>> > > visitor, and forward the sole field that the target is expecting while
>> > > renaming it appropriately.
>> > >
>> > > Reviewed-by: Eric Blake <eblake@redhat.com>
>> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> >
>> > Hi; Coverity complains here (CID 1459068) that the call to
>> > visit_optional() is ignoring its return value (which we check
>> > in 983 out of the other 989 callsites).
>>
>> Ping? It would be nice to either confirm this is a false
>> positive or else fix it.
>>
>> > > +static void forward_field_optional(Visitor *v, const char *name, bool *present)
>> > > +{
>> > > +    ForwardFieldVisitor *ffv = to_ffv(v);
>> > > +
>> > > +    if (!forward_field_translate_name(ffv, &name, NULL)) {
>> > > +        *present = false;
>> > > +        return;
>> > > +    }
>> > > +    visit_optional(ffv->target, name, present);
>> > > +}
>> >
>> > Is it right, or is this its "looks like this is returning an error
>> > indication" heuristic misfiring again ?
>> >
>> > My guess is the latter and it's caused by a mismatch
>> > between the prototype of visit_optional() (returns a
>> > status both by setting *present and in its return value)
>> > and the Visitor::optional method (returns a status only
>> > by setting *present, return void). I guess ideally we'd
>> > standardize on whether these things were intended to return
>> > a value or not.
>>
>> thanks
>> -- PMM

