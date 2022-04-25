Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA050E2C8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:13:49 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizTI-0005TT-QO
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nizO3-00048l-4s
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:23 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nizO0-0001vh-LP
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id z19so5297098edx.9
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9vtnrhAa9BfmH6dFS0gl9ifwcUMoQs3R0+bNFD0+NI=;
 b=JpS359SwFhJK/oKR+NlWskkn0WU9m0dMyOZ1SK8F0iuD+zjDTrFi2SQAVxiw1e4aZc
 lshi7c/mVyQWiEva0teQJ953V+J//ScWVGITTxUry8vGzOD0z+O7EBd7YBdemFP0Vegf
 SoZqH5DSQzMfDWlzIyZMUvxrn1Qz9JYQIH/Xrfrq8llDltYwfijvUO7ZXl9ASWdhubX6
 E7aA0wZNxQQ113b0V0um7sjzhcsZlG1YbrCZAZBQXTeseJC9RD+UR2oHfqLw5c5XhyLE
 amOors4lNwkKDkWuIwOqE5KikYE8QsPTdsv9Gvw9AXj2xOgMTv5IQRf64cPCbzm5PkaK
 XiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9vtnrhAa9BfmH6dFS0gl9ifwcUMoQs3R0+bNFD0+NI=;
 b=F/FWXN7P7QWLraunsHOGZbjsF1mQC7rVRdgVFawkuOrKiDKMWUEbpiV/Ickfmk/K22
 PluzrAx+8TNApaDbkIjDxQuY/DzOnVVBtqvN0nRtlEJ9i7pws2bJ7bYaCZ9oBARJpoUL
 T8FRTfefkmIjgQHlZjMiTJLKubMzo+GhpnhS+TuPKHTyH+LhSNVBNSgkQyq9oEOHV8A/
 rmFQ9npYQg53aiL8LtcWh1zZLyFngvrodqMGONle1YAyf4/0QrdQW81ZXry2nPs+ou7P
 bgeCzNRmsU7bpQtq69gjUwaKIX5Zkftu9KgogRyv2l3M2488MPrn1U4Fnal2okQ7oE7p
 h3xQ==
X-Gm-Message-State: AOAM5337ri08SVC9fPtpka7NQNUwTtsbWFxSy/xVAELV957rzSleowJv
 kWzRiGU8G4LyCxbesbf7COxEiWthQ94LtXRrqWw=
X-Google-Smtp-Source: ABdhPJwSyFEfuaIraEouvyPj0JPp0SXTgYRfbMTZeFZlm+QF+RPUvkUp+CDr1PVyCJlKh8Rn/cuQF/1gtZxvl4NaIA4=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr19027138edz.414.1650895699050; Mon, 25
 Apr 2022 07:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220421155726.31986-1-simon@simonsafar.com>
 <CAMo8BfKPgZ29ReVE9CYmzfZ0sfem-fXqLf-2TW8qYQpO6fPA3g@mail.gmail.com>
 <331420f7-9bc8-44b6-b9db-e1d82cfdd399@www.fastmail.com>
 <CAMo8Bf+6gg4w1D_V8GBmePhC0Opf08Ctp3G90QpO69Yfk87B8w@mail.gmail.com>
 <b24c44b0-4cc0-4165-b794-44f1c61e3460@www.fastmail.com>
In-Reply-To: <b24c44b0-4cc0-4165-b794-44f1c61e3460@www.fastmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 25 Apr 2022 07:08:07 -0700
Message-ID: <CAMo8Bf+s_bL0-Y99AFYvsCme+7F+6wEAuYyMLdrrBU8mE4bJtg@mail.gmail.com>
Subject: Re: [PATCH] target/xtensa: import core lx106
To: Simon Safar <simon@simonsafar.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 24, 2022 at 10:40 PM Simon Safar <simon@simonsafar.com> wrote:
> On Sat, Apr 23, 2022, at 2:26 PM, Max Filippov wrote:
> > It's for a (future...) Lisp compiler! Somewhat in the style of MicroPython; the idea
> > is to make code editable on the fly, without reflashing (... or restarting, even).
>
> Interesting. Do you use libisa or do you do instruction encoding on your own?
>
> It's my own; it's generating opcodes from the tree of tables in the Xtensa reference.
> A large part of the actual code looks a lot like those tables themselves; there are still
> some missing parts for some (e.g. overriding some defaults on which instruction is
> taking what kinds of parameters), which I'm just filling in on the go.

I see. I once did something like that for QEMU TCG:
https://github.com/OSLL/qemu-xtensa/commit/53604287d6fdad1ce9659135a8ecbb569be90380

> It's fairly hacky, but it might fit together well with the eventual purpose of maybe
> running some of this in that 40k RAM onboard & keeping it all Lisp.

40k of RAM is a reasonable concern (: I would guess though that libisa + xtensa
core description are purely code and constant data, and as such they may be
put into FLASH and not consume any RAM.

> (I'll put it up somewhere eventually once it's not a complete mess & starts doing
> something interesting! assuming this ever happens, of course.)

Have fun and good luck!

-- 
Thanks.
-- Max

