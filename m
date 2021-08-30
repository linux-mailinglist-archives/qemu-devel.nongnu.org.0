Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C43FB91B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:38:34 +0200 (CEST)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjMn-0001ge-B0
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKjLa-0000I3-WD
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:37:19 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKjLZ-0006xn-Bi
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:37:18 -0400
Received: by mail-ej1-x629.google.com with SMTP id lc21so32054552ejc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AgvSiMaUvp7AnxXE7Z8OtiyNLCBjKTy1g+VtvMY0mQ=;
 b=cKKN3ve8S3EuOqQd7A7Ti3sICVxCfaZTC/KpFt2ln/yHSqmHCcopwDLBtiWVbYYVxy
 QrNTQWC5SYyfHjgVFlYYgB9yq1jCtNUMnqUE4ybrAMtF1wRRZuTooJXwlLeuyN6ip+Ci
 VDeCHmCJHX3tWm6Zrqdis00+mXyz9CoZ8mjq2xRSS37YB5uJ4x0l6zgEaoh+WCbx0hoZ
 vj5aMp63/57wcQHadn5RC3CR0elzIbAXL67yZYXWeQDnjrzq/RA9A1Y4pH7XaJKIMdLz
 dXM/bQtFDTUFdRZ4e1KF2NDRa489MeOTzCnLA56Q4H6MH0UE1sbTk/ZkFS++Ksghg3OG
 wXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AgvSiMaUvp7AnxXE7Z8OtiyNLCBjKTy1g+VtvMY0mQ=;
 b=iDarN8AxEMqOA117k4j/6aT01cKvePI1Z+R7390dZysW3AE6E9xKELT3A8gUY8EZqA
 lXeX4/deZzfcfeIiNFwaicfAOKr9LQcmf6s4EWaIXqlsZJSGjcS6nLuXuOTaHSAYOKRN
 kiJ/SnNsvp6N4t4RKP2tF5BKpg8qdlZcS5Y3g9nmKdTiqqGnS/Uin+yvho8dbov2kUgn
 BPJD9kWX5DLLlACcDxm1rhjzhKyypaitmuFpRkHx0i0a2tucrRXfEsC2NKjNoZkjtre5
 DbNSH/NE+zK4f1r7LRgKSJ65zAU3/EkdBrHnoAj2kzKPob5vrYm3hrbOs+QbgRDpbbPN
 wkMA==
X-Gm-Message-State: AOAM533hKkeQRH4bCPK/I7ty+cqYAuqa3+hF+8wpVRogpRGzhV3qspNX
 MILzEY/ZFA+4nm5NOHi/hRiNU7nS8T5zhKjeetj7AA==
X-Google-Smtp-Source: ABdhPJzwwQY08AEx4haEjHArq/qClB34s1oHSixoUfr3BT31erv8VJJR0S8yWzsbdO9/0nRVnxnV6MU+32EdOpy08sw=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr25646598ejc.4.1630337835891; 
 Mon, 30 Aug 2021 08:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
 <20210724085453.16791-9-pbonzini@redhat.com>
 <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
In-Reply-To: <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 16:36:28 +0100
Message-ID: <CAFEAcA-az0rOTQ1wcvseCqr3qy7Gq64VxzvnRZPVHurqunVWAQ@mail.gmail.com>
Subject: Re: [PULL 8/9] qapi: introduce forwarding visitor
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 11:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 24 Jul 2021 at 10:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > This new adaptor visitor takes a single field of the adaptee, and exposes it
> > with a different name.
> >
> > This will be used for QOM alias properties.  Alias targets can of course
> > have a different name than the alias property itself (e.g. a machine's
> > pflash0 might be an alias of a property named 'drive').  When the target's
> > getter or setter invokes the visitor, it will use a different name than
> > what the caller expects, and the visitor will not be able to find it
> > (or will consume erroneously).
> >
> > The solution is for alias getters and setters to wrap the incoming
> > visitor, and forward the sole field that the target is expecting while
> > renaming it appropriately.
> >
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Hi; Coverity complains here (CID 1459068) that the call to
> visit_optional() is ignoring its return value (which we check
> in 983 out of the other 989 callsites).

Ping? It would be nice to either confirm this is a false
positive or else fix it.

> > +static void forward_field_optional(Visitor *v, const char *name, bool *present)
> > +{
> > +    ForwardFieldVisitor *ffv = to_ffv(v);
> > +
> > +    if (!forward_field_translate_name(ffv, &name, NULL)) {
> > +        *present = false;
> > +        return;
> > +    }
> > +    visit_optional(ffv->target, name, present);
> > +}
>
> Is it right, or is this its "looks like this is returning an error
> indication" heuristic misfiring again ?
>
> My guess is the latter and it's caused by a mismatch
> between the prototype of visit_optional() (returns a
> status both by setting *present and in its return value)
> and the Visitor::optional method (returns a status only
> by setting *present, return void). I guess ideally we'd
> standardize on whether these things were intended to return
> a value or not.

thanks
-- PMM

