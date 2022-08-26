Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18B5A2B76
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbTM-0001LI-W4
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRabx-0005B7-OE
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:47:05 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRabu-0001VO-8X
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:47:05 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-33dc31f25f9so41210837b3.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=2M4YgRPdK/FojOlju7PZnhDrxvqoW0lzgQJSDJR9HfE=;
 b=QZyJ+20RteXx4dcMmfJ2NfIlrrZMxVyp8p35NpNn+0619QE1HMt3y0ddBKJGhnTtQw
 6IPBkJrqZhqKtgP8uOaNIlnpkACpXVWc2ifYjzVYtoDNGmstwNv85iro+8BEqdjJY6Ws
 OJl8KosMqE06YpEL5AaRER6f7S6wsVOG5bfO7o0zNm9FSvsCNTw0FoJPbGdeMvY1CQTU
 2T1J7Kak6sfkRaET7n9b2hHocCK5VWt1m3XwwJ/OXluJwkwUy3u++UNNefx6NnEEcj4G
 axG+OyG4lDZbE5uSpoCRxH3dEym95Af6R6rC4gNRZtH9/k1CxOG67TdKcMmmzF1AcPOL
 WvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=2M4YgRPdK/FojOlju7PZnhDrxvqoW0lzgQJSDJR9HfE=;
 b=RlEeiEGpmqfeWmuRM14Eymby7Km+53E+T7auk1BTEC7dJjPJTouh6rtnKGl4s/y5l0
 +WSKo8VfqNgSWeoMQvD8QteZjUarTQ7LeEn1uwKYrJ7KmWM0a8CQDYuXrflSlvKuWfQ1
 NSG4/b4ATolkbbaM3+U0BdXJFS3TvkKL+s3Z72kDdVLGlsuFuuj7QvIn7B62sFSlpsxf
 SkqY7PDIOW+TZ8CZ8veAZiC7+7PN9OEcY/lGNcRcbPQiKg3iUI7f/8t129fceX9ZB3qf
 hhoizTn03V51j8ZVw4OzrRkogNkpc7ttbqACAz5k5n5BwWJC9AEyI6TXiZBJp/dDbZXA
 khhA==
X-Gm-Message-State: ACgBeo1equPjGUg4yPgonVZPXjljyQ00P0ysObOwkWBGkTbaZBmK0kVF
 uLPQKGkyGFweRyfFeuhBNhFAtmp5zy4Uh2YjijQn3A==
X-Google-Smtp-Source: AA6agR7GpGx1tVpENvshyiMEVIDiVyWYJPeIiaKTlLzRU0RlbLjAMle77DxhghyviXdK4q8S4pQgtGpZzXpTgyfX7T4=
X-Received: by 2002:a25:450:0:b0:695:8b65:ccd8 with SMTP id
 77-20020a250450000000b006958b65ccd8mr7585875ybe.67.1661525220686; Fri, 26 Aug
 2022 07:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220822085041.127776-1-anton.drap@auriga.com>
 <CAFEAcA-C87Qgyvc_yqtiecA9EBE50J9CZgQY5FiAqDm+pQx67Q@mail.gmail.com>
 <8b584a6fb2cf48c6ac28a9d6ea488dcf@auriga.com>
In-Reply-To: <8b584a6fb2cf48c6ac28a9d6ea488dcf@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Aug 2022 15:46:18 +0100
Message-ID: <CAFEAcA_7jn+92NT-g-7-6LTdycEBaFT6GP5K8saOrpypUB_60g@mail.gmail.com>
Subject: Re: [PATCH v3] Loading new machines and devices from external modules
To: "Sebelev, Vladimir" <vladimir.sebelev@auriga.com>
Cc: Drap Anton <drapas86@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Drap, Anton" <anton.drap@auriga.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Fri, 26 Aug 2022 at 08:51, Sebelev, Vladimir
<vladimir.sebelev@auriga.com> wrote:
> Anton previously sent explanation of our position. Nobody
> commented. Could you please comment on it? It's necessary for
> us to better understand your position.

The discussion was on this thread:
https://lore.kernel.org/qemu-devel/Yta+06u01e16zKTd@redhat.com/
Dan's email is a pretty straightforward summary of what
upstream's position is, and why we have that view.

I understand that the way QEMU is today is not helpful for you,
but it is the way it is. QEMU is not and doesn't really
seek to be a standardized simulator platform with a fixed
API that people can build device models for and then
stitch those device models together into platforms, and
have that work across different QEMU versions; and
wishing that it was doesn't make it so. The gap between
here and there is not just a 300 line patch, it is:

 * a significantly different/enlarged set of contributors
   (in the sense of "companies willing to invest money to work
   on the project and have it fulfil their requirements")
 * a major shift in project focus (for instance, it would
   have to care a lot more about providing well documented
   stable APIs to devices; it might need to care less about
   emulation performance improvements if they required
   breaking changes to existing devices)
 * a lot of work and restructuring to be able to provide
   that "we are a simulator platform with a clean interface
   that makes it easy to write and wire up device models"
   interface. A lot of work would be needed to clean up and
   separate out what are currently ad-hoc and legacy
   interfaces between different pieces of the codebase.
   We'd want to consider whether we wanted to provide
   SystemC interfaces and compatibility. Etc.

Perhaps it would be cool if that open source project existed;
but QEMU isn't currently it. The path to maybe causing QEMU
to get closer to that idea is not "throw a short patch onto
the mailing list", but to try to build a community of people
who (a) agree with you (b) are willing to contribute to the
upstream project to do the heavy lifting in the third
bullet point above (c) can make the case over time for
"these changes are good not just for us but also for you;
we're going to be around for the long term to help maintain
them; and we do our share of the work on the common parts
of the system that everybody benefits from".

QEMU has had big changes in focus before -- most notably
the addition of support for KVM and similar virtualization
interfaces to what was originally purely an emulator.
So it's not impossible -- but it isn't easy.

(Part 'c' is helpful for pretty much every non-trivial contribution
to any open source project, incidentally. But the more you're
trying to propose a major change in project focus the more
it matters.)

> From our point of view technical ban of external modules
> loading doesn't solve any of mentioned problems, but makes
> VP developer life harder.

Anything we provide as a user-facing interface is something
we have to support. Not providing "load machine from
external .so file" solves the problem of "this is not
something we want to support or think we are able to support".

For example, this patch doesn't solve the kind of problem you
list yourself in the commit message here:

> For example we=E2=80=99re now working on Raspberry Pi 4b implementation f=
or our
> internal needs and we=E2=80=99re planning to merge it upstream. It=E2=80=
=99s based on some
> QEMU fork author of which wasn=E2=80=99t able to complete it and commit u=
pstream.
> And it can=E2=80=99t be used with later QEMU without some efforts to port=
 it
> to newer QEMU version.

Having that in an external .so that's loaded via an -add_machines
command line does nothing to make it work with multiple QEMU
versions: it will still only work with the QEMU version it
was based on, because newer ones will provide different
APIs and will have removed old functions that the code in
the .so is relying on. So providing a "-add_machines" option
is just going to cause a lot of bug reports of the form "my .so
doesn't work" where the answer is "you need to use the exact
matching QEMU version that the .so was built for". At which point
you might as well just have built the machine model into the
QEMU binary.

thanks
-- PMM

