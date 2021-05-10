Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E5378D70
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:43:07 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6Be-0002iD-2z
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg698-0006xF-Ub
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:40:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg697-0005k8-13
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:40:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so10352979pjb.4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ajd3C6ne0kJJRaWe22HEXMECYDfUfQJfZOONyKA9sGM=;
 b=JblwVpru0ZEK7/Dt5XcZ9XiwmROsnS9x7Ta7uTZlmu3f2b6RiDkLc7Xxl7vcY9gKuU
 iaUmA13sOrKJ7k0uQfCXaAekJiHlJR/eaVj9DuIuOmFU+bQP6NubVf9ulSXe9bL3eY8v
 NXBvagBmlMon99NFh/I2miNDbseSSinfqbLyGotZN3hiTEu9OnYywZb28yfp0kGj9wNO
 Jb+gc9Sb9B7pkTGIZxfN/VuKaTgc8eHOLdCn+qcPwH1C+lx5bkCNxPBGsmrtRxqoEOMD
 pddkgti19j6+ca3SeEwqCf9zSb4WuL0uoGpQyxptBsacYEwLz+3bqR1KtI0XoDm/6tu2
 wXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ajd3C6ne0kJJRaWe22HEXMECYDfUfQJfZOONyKA9sGM=;
 b=C1Id1MBQmAwk6L0a8u5Mi6NK3Z2AW279rJOYOLovPFWrR62ulKlJxEsW0ZkVjX0x6f
 1MLZW7RUHaveWwT532X3npLTSHhEj+EQIJEEhGLFuv13YwDUAMaGLw7RqL7fKSuUMwmA
 I2lkn796gojHUGoJ9Ztg4DLvtcnhg3vWUQLyRhpSxYvBdGMOaSRbQ2BJtYn99tcbnCpB
 NxrF1yr8laAFGPEmcJMyomqMISTttQALOq7sNMvOsYrvopAble6+FmMBEswWVajbL1r0
 v4pLo88HnrwDryOrmwIKjh8+GtPT/jtXp054hg0zQXElCf8NWhHaLRhhBKaMFFhzoGS0
 jT3g==
X-Gm-Message-State: AOAM5338dbYNzHqz5yOUZiDTJsk7Ltijj+JbYssHfrhLLJ9XO5Mqt9G9
 fk5JxO/Qb1KcpL9ps02fclt/OXQIxNUqxvrw4Jk=
X-Google-Smtp-Source: ABdhPJyb5L/X4F+6ChwzB51t6wYdQXxcGL+SHQU4kkHZpYElWZFNpPB3tpzSjwFE53cUKH4KCr+212cH2mdkOXQfnLY=
X-Received: by 2002:a17:90b:3686:: with SMTP id
 mj6mr41282082pjb.116.1620654027644; 
 Mon, 10 May 2021 06:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
 <YJkLLewVDP25TDCg@redhat.com>
In-Reply-To: <YJkLLewVDP25TDCg@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 10 May 2021 14:40:16 +0100
Message-ID: <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
Subject: Re: qemu.org server bandwidth report (May 2021)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 11:31 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Mon, May 10, 2021 at 10:49:19AM +0100, Stefan Hajnoczi wrote:
>
> > qemu.org bandwidth usage has been as follows:
> > - Jan: 12.56 TB
> > - Feb: 10.55 TB
> > - Mar: 10.28 TB
> > - Apr: 7.62 TB
> >
> > In May qemu.org has averaged 232.25 GB/day so far putting it on track
> > for 7 TB total this month.
>
> That decrease seems to show we've had a big effect from moving to
> gitlab. Not big enough yet though.
>
> > Roughly 75% of traffic is git (https), 25% is tarball downloads, and
> > the rest is wiki/web/miscellaneous traffic. Fun fact:
> > qemu-4.2.0.tar.xz is the most popular download!
>
> First git traffic...
>
> When you say  "git (https)" are you exclusively meaning access of
> git via https:// protocol URIs, or does that include git:// URIs
> too ?

This includes git-http-backend(1) only. I think gitweb traffic is separate.

>
> Or are git:/// URI traffic not accounted for at all in your 75%/25%
> split there ?

git-daemon is not included in the stats because they are web server
stats only. Based on the network bandwidth fees that QEMU has been
paying I do know git-daemon traffic is much smaller than
git-http-backend traffic.

>
> For the https:// URIs should we setup a HTTP redirect ?
>
> When git clones via https it fetches some specific paths which
> I believe we have rules for in httpd conf:
>
>   ScriptAliasMatch "^/git/(.*\.git/(HEAD|info/refs))$" \
>     /usr/libexec/git-core/git-http-backend/$1
>   ScriptAliasMatch "^/git/(.*\.git/git-(upload|receive)-pack)$" \
>     /usr/libexec/git-core/git-http-backend/$1
>
> If we set those URI path matches to send a HTTP 307 redirect
> to gitlab, that would essentially kill off our git traffic on
> qemu.org, while still allowing the qemu.org gitweb UI to
> work normally. The downside is that people won't notice to
> update their clone URIs. Still feels like an easy win and
> we can easily remove the redirect if we use code 307.

I remember there were concerns about warning messages that
git-clone(1) prints when an HTTP redirect is encountered? If everyone
is okay I can turn the git-http-backend(1) aliases into HTTP 307
redirects to GitLab.

> Third, qemu 4.2.0....
>
> I wonder why this is the most popular. Something must be linking
> to this, as you would otherwise have to go out of your way to
> search it out.
>
> Do we have any stats on the referrer URLs ?
>
> I wonder if there's some key page(s) that need updating ?
>
> If we're unlucky there might be some CI system that hardcoded
> use of qemu 4.2.0 that's frequently pulling it.

The majority of qemu-4.2.0.tar.xz downloads have the wget user agent
and no referrer. The IP addresses don't have a clear pattern (there
are many).

Stefan

