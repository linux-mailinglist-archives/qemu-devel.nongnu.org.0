Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B724379360
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:07:54 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8Rk-0002B2-Vc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg8PU-00008y-Tb
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:05:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg8PS-0001y9-1b
 for qemu-devel@nongnu.org; Mon, 10 May 2021 12:05:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id m37so13624596pgb.8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NitbGVv7+aqhjthVDJUIJP65i7Rau9ziCbytyDvIczE=;
 b=t//MlMUusaqe+PaY4ARgC0IlqDDSAu4lsK0EM170V+kTH20fAjupvNbd9qhq2vq51P
 naOFhXD/82UsumgDU33gk02XMzoj+yBILBlIrzj0h58IEwpPQZIUXKKQDe/20YnA2+PV
 Hl8zctRUKBvm+03j1I8XuCEDy6Mw/M9abopSi0Rsu3J7YlmR9SgObXK1LZvZPekAKx90
 6lwAemGB95K/I6Kw+UmD6sJrsrhbxG543XYF6ZdvOK0I79NDQg4iFPrs+SbZSto9cE0d
 fWgLfY7AqR3Gu9mL6nAZ9LBi1ys4Nj5uWutcmORINTzw0I5MEtiTskeV1GaTMCve/Ub2
 ysHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NitbGVv7+aqhjthVDJUIJP65i7Rau9ziCbytyDvIczE=;
 b=b5jfZAJxeK/wzwAqwdTO6Cln25/iBF035tlzRPIyIe30puWF+CvVLZHbeHNtGVcoQt
 /PU1+bMfwKXiog8XeoS2Bmpifo52mF3FbiRyAs4V1ncc4p9OgX9vvu5/OOAzb7JTBAau
 qbwZhX5EhGS7wFnDFq9w37iEhfbvBSnjX8MihyKd8FOJph2/fhI9Lx68tmRbidHmLe98
 SQxuJv/hU4AvVfR5q+olbpwPKsVonE/h/IELeBlGV2/mYY2qR3xIA7yprzp70KvFUrKe
 pNtNSQnzBZAgUA+daL+GID5H0zFY5+xuHRgaP+ug10g8M3CXCokKGFbD+maMoiYA478y
 NzLw==
X-Gm-Message-State: AOAM532YEDBYWzZRDChwJurXPnyh9MDUVsyGNHZc1auapHJvE1swHOl/
 cuGSSEZz/uiV0JqTYKAe4nKmduzqK2liHInXKkI=
X-Google-Smtp-Source: ABdhPJwdRXOHvCq8xYIqKUeS9R0hkwBRZCWfuKn32ClmWI50FPB1tFW5XeKE9j2ZDLKGwEoAv0lSTnH7UT1XXIXRb8M=
X-Received: by 2002:aa7:88c9:0:b029:2ab:aea7:e761 with SMTP id
 k9-20020aa788c90000b02902abaea7e761mr16547039pff.71.1620662728404; Mon, 10
 May 2021 09:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
 <YJkLLewVDP25TDCg@redhat.com>
 <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
 <8735uuy48m.fsf@linaro.org>
In-Reply-To: <8735uuy48m.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 10 May 2021 17:05:17 +0100
Message-ID: <CAJSP0QW6vsiPbbvCh+1xt6CcmXi_Yan05UzpKS7TgAH9OSrv5A@mail.gmail.com>
Subject: Re: qemu.org server bandwidth report (May 2021)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52f.google.com
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 4:53 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Mon, May 10, 2021 at 11:31 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> >>
> >> On Mon, May 10, 2021 at 10:49:19AM +0100, Stefan Hajnoczi wrote:
> >>
> >> > qemu.org bandwidth usage has been as follows:
> >> > - Jan: 12.56 TB
> >> > - Feb: 10.55 TB
> >> > - Mar: 10.28 TB
> >> > - Apr: 7.62 TB
> >> >
> >> > In May qemu.org has averaged 232.25 GB/day so far putting it on trac=
k
> >> > for 7 TB total this month.
> <snip>
> >>
> >> For the https:// URIs should we setup a HTTP redirect ?
> >>
> >> When git clones via https it fetches some specific paths which
> >> I believe we have rules for in httpd conf:
> >>
> >>   ScriptAliasMatch "^/git/(.*\.git/(HEAD|info/refs))$" \
> >>     /usr/libexec/git-core/git-http-backend/$1
> >>   ScriptAliasMatch "^/git/(.*\.git/git-(upload|receive)-pack)$" \
> >>     /usr/libexec/git-core/git-http-backend/$1
> >>
> >> If we set those URI path matches to send a HTTP 307 redirect
> >> to gitlab, that would essentially kill off our git traffic on
> >> qemu.org, while still allowing the qemu.org gitweb UI to
> >> work normally. The downside is that people won't notice to
> >> update their clone URIs. Still feels like an easy win and
> >> we can easily remove the redirect if we use code 307.
> >
> > I remember there were concerns about warning messages that
> > git-clone(1) prints when an HTTP redirect is encountered? If everyone
> > is okay I can turn the git-http-backend(1) aliases into HTTP 307
> > redirects to GitLab.
> >
> >> Third, qemu 4.2.0....
> >>
> >> I wonder why this is the most popular. Something must be linking
> >> to this, as you would otherwise have to go out of your way to
> >> search it out.
> >>
> >> Do we have any stats on the referrer URLs ?
> >>
> >> I wonder if there's some key page(s) that need updating ?
> >>
> >> If we're unlucky there might be some CI system that hardcoded
> >> use of qemu 4.2.0 that's frequently pulling it.
> >
> > The majority of qemu-4.2.0.tar.xz downloads have the wget user agent
> > and no referrer. The IP addresses don't have a clear pattern (there
> > are many).
>
> I've just checked my Gentoo box and I can see it pulls directly from:
>
>   SRC_URI=3D"https://download.qemu.org/${P}.tar.xz"
>
> and the *9999* builds (HEAD, which I doubt many people use) points to:
>
>   EGIT_REPO_URI=3D"https://git.qemu.org/git/qemu.git"
>
> but the lowest version is 5.2.0 and 6.0.0 is already in the repo so
> these particular users probably are a minority.
>
> However Google does point to a number of instructions online that have
> wget and "qemu-4.2.0.tar.xz" in them.

Thank you for checking this! Are you in touch with the maintainers or
able to tweak the ebuilds or documentation?

Thanks,
Stefan

