Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA637932F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:55:52 +0200 (CEST)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8G7-0002Cs-13
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg8EA-0001DJ-K9
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:53:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg8E8-0000Ie-Nt
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:53:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id n84so9514414wma.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5quMv+/Gs7PMiF9X08f/tbMaeCF2KnRf5R8iZ/RWFiw=;
 b=q9UjzLmWKl0Tr41hnpVcA5vjqSYq5Enn6Ji+HRtiJsRGIdvMxX4FqLS59hjca581DK
 CyIpCyuX8j+bORI5Ac9TdgcG7sJCoM/qnVTjmDoZ8Ss72PjILiDeAJri7jxt2ei5D9IZ
 7+U59fXsx23TTtTKaux6lYHLtR9/prqlTsX0s0oOMF3Fo0DqqU9YELaMm2bJKuYJPChC
 r/X010rQSNQzuFFxqa0e+8+ZBfzXiHiWXo6RR3fiI02iKzyZUmGAEslq+ecmJBBpFpzv
 w8c8wRcMcNXMunDaPQbPeaYV0rISVcpyI23nCRwa/9lKTEotSIHel2v8stIlYVwlhlcY
 NRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5quMv+/Gs7PMiF9X08f/tbMaeCF2KnRf5R8iZ/RWFiw=;
 b=Nt//sLEeVAlNCeQuzTQayIvTaF4rmQQuv6P30/e0mFhc43+Yuk/iXLtT4gVhwYnLAO
 TmHMV/LUeDj9AVh14q2pumK9IgE7727KnO5CCLhPKvsDU3yXEm0zp9fQxFYYuhZUteZm
 FvnzBVXKw00jDIeR8wlURn9YVLBoyXhR8q943D6AZ6LLR/1to2JayakOLeGRkOt3sY7m
 ae2LnwhwaT+RPHu1YAPDmONSr3KBI6pMY1VyZ96tC+Vl1uZ2FM2cfi0/LBKyNy/sv0xK
 Ri5UjFq3wTzZcnav4CGoms1zKtgbNa3nM2VSSzlXa0v+/YAgpd0RfLWsMXfEEM2AHo50
 GqMA==
X-Gm-Message-State: AOAM532WbptmuRUzhoeE1qilimrSDROg2lETP9bJjmOhVO4ZMuob+1hY
 keHmC0jy8qzMauS+R1+932FZLQ==
X-Google-Smtp-Source: ABdhPJxZEHqtKrEcQBwbPNBGszNPt5SPJbZAHcn+g2UgKxvi0p3CyJb6UcGjBKW1vXxXDT38GIlq+w==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr26198033wmc.131.1620662026883; 
 Mon, 10 May 2021 08:53:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o1sm24227493wrm.66.2021.05.10.08.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:53:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 158671FF7E;
 Mon, 10 May 2021 16:53:45 +0100 (BST)
References: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
 <YJkLLewVDP25TDCg@redhat.com>
 <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: qemu.org server bandwidth report (May 2021)
Date: Mon, 10 May 2021 16:47:41 +0100
In-reply-to: <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
Message-ID: <8735uuy48m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, May 10, 2021 at 11:31 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
>>
>> On Mon, May 10, 2021 at 10:49:19AM +0100, Stefan Hajnoczi wrote:
>>
>> > qemu.org bandwidth usage has been as follows:
>> > - Jan: 12.56 TB
>> > - Feb: 10.55 TB
>> > - Mar: 10.28 TB
>> > - Apr: 7.62 TB
>> >
>> > In May qemu.org has averaged 232.25 GB/day so far putting it on track
>> > for 7 TB total this month.
<snip>
>>
>> For the https:// URIs should we setup a HTTP redirect ?
>>
>> When git clones via https it fetches some specific paths which
>> I believe we have rules for in httpd conf:
>>
>>   ScriptAliasMatch "^/git/(.*\.git/(HEAD|info/refs))$" \
>>     /usr/libexec/git-core/git-http-backend/$1
>>   ScriptAliasMatch "^/git/(.*\.git/git-(upload|receive)-pack)$" \
>>     /usr/libexec/git-core/git-http-backend/$1
>>
>> If we set those URI path matches to send a HTTP 307 redirect
>> to gitlab, that would essentially kill off our git traffic on
>> qemu.org, while still allowing the qemu.org gitweb UI to
>> work normally. The downside is that people won't notice to
>> update their clone URIs. Still feels like an easy win and
>> we can easily remove the redirect if we use code 307.
>
> I remember there were concerns about warning messages that
> git-clone(1) prints when an HTTP redirect is encountered? If everyone
> is okay I can turn the git-http-backend(1) aliases into HTTP 307
> redirects to GitLab.
>
>> Third, qemu 4.2.0....
>>
>> I wonder why this is the most popular. Something must be linking
>> to this, as you would otherwise have to go out of your way to
>> search it out.
>>
>> Do we have any stats on the referrer URLs ?
>>
>> I wonder if there's some key page(s) that need updating ?
>>
>> If we're unlucky there might be some CI system that hardcoded
>> use of qemu 4.2.0 that's frequently pulling it.
>
> The majority of qemu-4.2.0.tar.xz downloads have the wget user agent
> and no referrer. The IP addresses don't have a clear pattern (there
> are many).

I've just checked my Gentoo box and I can see it pulls directly from:

  SRC_URI=3D"https://download.qemu.org/${P}.tar.xz"

and the *9999* builds (HEAD, which I doubt many people use) points to:

  EGIT_REPO_URI=3D"https://git.qemu.org/git/qemu.git"

but the lowest version is 5.2.0 and 6.0.0 is already in the repo so
these particular users probably are a minority.

However Google does point to a number of instructions online that have
wget and "qemu-4.2.0.tar.xz" in them.=20

>
> Stefan


--=20
Alex Benn=C3=A9e

