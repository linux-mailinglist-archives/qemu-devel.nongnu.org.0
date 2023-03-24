Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FC6C8139
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:31:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfgl2-00058R-MD; Fri, 24 Mar 2023 08:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfgkz-000583-6w
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:42:57 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfgkr-0001Oz-BW
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 08:42:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id eg48so7362950edb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679661757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6GuvQrCWSgmeG+gqq0qS0nx6PN00qy3jOGHAU1862N8=;
 b=g1y/8rFbi0Y05awxbCFC6mjyqeuHiYd6ZPxoxCLVSmP1tMI/UCdhm22CmJLIHRh6Ce
 7Aam/p1Ni8j8PilIGin+4+du+l31iFFAlQ0j2gK9F6YX3ueQH7WwBn8gaYkxOLjtAzF/
 1Zp5b2iMTo2oEb4N7Umh7/pZ2d4EZCiyx5JmJv3/B5jtdtLw1kXXdDkTLCxLN24nUNT8
 uwzm3NPiYwAi1kLnm9nIsqwwDsRMrxF4HtWgTfaAbICry242ReTSo5DtcIndE9rJubI+
 uNu1D+HtyFkulIInfgvxt83ctPNu9/V/kAvpajUk1PKa6EORbcpZCfDA/TJljp+56O/a
 uFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679661757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6GuvQrCWSgmeG+gqq0qS0nx6PN00qy3jOGHAU1862N8=;
 b=Q186dcr6RRsR3XHgxisycswN5h9f8uxxU2SsCp/gLOstJwKzEmGq83ZRuTh3qQGNDW
 U5KKs0RH/I1XX4H9ALc2LC5v0XxKM2TDfGz1zYpl2aEFzIOh3q1gy/bvknILH2PwZCG3
 vxXrvQm8TsYikjPJlTDKleM0H1xmFMfmHM/vfk9OZNN3BF95modooT83pFjDMD4n8TXS
 XEKvmm4ZSaMBa50DDVdPKfmChRWfcapXISY/ZWnVHNMOpOKTIAY1Yx1xVLIqNBWONloB
 vaougQJlHu+KaHCf/+2uxfUDo0i9kHPCei0wQGPKIBGwyMdSfACCeVssR80pFUgfzB5K
 Z96g==
X-Gm-Message-State: AAQBX9fw6mVnVfNAMV9ObY5+wV8gXq3Zx8jHQ/KtlUgfALMYjfVZDt1T
 XcBJ2/wVeSIHiB0oKOXLqaiv4Z3KadsIDWh3Uf/DOg==
X-Google-Smtp-Source: AKy350ZYLqobBAj4PGc2M9ESOOan9/Y0CMs8IyvLblKAPWue0gpP6ltk/owz8haVPUjF/1bN4D51huL7G8GkEk2qZkE=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr1366240ejt.6.1679661757699; Fri, 24 Mar
 2023 05:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <87v8irv7zq.fsf@pond.sub.org>
 <CAFEAcA88B70uwK=6SZ4TCujiUik0oOakBPG=USNRLYtzB=kiDg@mail.gmail.com>
 <877cv6pd76.fsf@pond.sub.org>
In-Reply-To: <877cv6pd76.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Mar 2023 12:42:26 +0000
Message-ID: <CAFEAcA9A5Gbfz3-os+NV1ACYrH90sGXeNOMzE-1qcZp+Xvqh-g@mail.gmail.com>
Subject: Re: qapi: [RFC] Doc comment convention for @arg: sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Victor Toso <victortoso@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Fri, 24 Mar 2023 at 12:05, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 23 Mar 2023 at 14:48, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> The QAPI schema doc comment language provides special syntax for command
> >> and event arguments, struct and union members, alternate branches,
> >> enumeration values, and features: "sections" starting with @arg:.
> >>
> >> By convention, we format them like this:
> >>
> >>     # @arg: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
> >>     #       do eiusmod tempor incididunt ut labore et dolore magna
> >>     #       aliqua.
> >>
> >> Okay for names as short as "name", but we have much longer ones.  Their
> >> description gets squeezed against the right margin, like this:
> >>
> >>     # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
> >>     #                               not avoid copying dirty pages. This is between
> >>     #                               0 and @dirty-sync-count * @multifd-channels.
> >>     #                               (since 7.1)
> >>
> >> The description is effectively 50 characters wide.  Easy enough to read,
> >> but awkward to write.
> >
> > The documentation also permits a second form:
> >
> >  # @argone:
> >  # This is a two line description
> >  # in the first style.
>
> Yes.  We use this in exactly one place: the guest agent's GuestOSInfo.
>
> > We tend to use that for type names, not field names, but IIRC
> > it's the same handling for both.
>
> Kind of.
>
> Definition documentation consist of "sections".
>
> The first section (called "body" in the code) starts with a line of the
> from
>
>     # @NAME:
>
> Nothing may follow the colon.
>
> Ordinary text may follow.  Indentation is not stripped.

I guess this has changed since I added the rst stuff. Back
at the time (assuming my email comments at that time are
correct) this was all basically in the same code path, so
the "allow field descriptions that start on the following line"
falls out of having to handle "allow section definitions with
text that starts on the following line".

> Our current doc comment syntax has two layers:
>
> 1. The upper layer uses home-grown markup (= heading, @def: for special
>    definition lists, @ref to reference QAPI names, tag: special
>    sections).
>
> 2. The lower layer is reStructuredText.
>
> Parsing mirrors this:
>
> 1. parser.py parses the upper layer into an internal representation.
>
> 2. Sphinx extension qapidoc.py maps this internal representation to
>    Sphinx's.  It feeds its text parts to the rST parser, and splices its
>    output into the Sphinx IR.
>
> I'm wary of blurring the boundary between the two.  If we use rST syntax
> for argument sections, parser.py effectively parses a limited subset of
> rST.  Second-guessing the real rST parser doesn't feel wise to me.

I didn't mean to say "use rst syntax entirely throughout"
so much as "use the same rules for multi-line syntax that rst does,
not a subtly different set of rules". We could keep our @markup stuff.

thanks
-- PMM

