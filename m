Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A434ED45
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:13:31 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGzi-0000fy-6E
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRGy0-0008En-8v
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:11:44 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRGxy-0002f3-DH
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:11:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id o19so18872055edc.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1TV30SG5a2HvEMiqEikyig8SZS4eEdw/bS6OGbrvtl4=;
 b=CZC/6r8XEnX+jewG+FE6n791gLZIvdrNf6X0KgC+xB6PpCEyMa8d1x8yLcGNAHw0na
 XfzQGj8dH6raEqdfWXM8FJ+ijicC6uJLo2ZjxynM20OvCBj8arREJH91pjPo0C0H/GIA
 CN1mqbpAo8zLI4lvt7sHeWzD2uC3msDpDKeINwkY3pcb9OBmKb00HBolJw63o3oREE0z
 BapMs3r/DO5b0nhayy4nMY2zt42Q1gZAV6NHoYjFnwWqwS0vmrV7OxLYSxrw0ybXvNFN
 1YvWsiSjDQGCQOO58eCK8mB5vr2962b5WgWaq78CCwz21+pFvi49sHu3N3O6rk3ppE4k
 Ul5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1TV30SG5a2HvEMiqEikyig8SZS4eEdw/bS6OGbrvtl4=;
 b=pEa5BkRrT9gkl3MfkkCjdGr8wylQCX3ofvVzeKLCQalSvMjfgdyZQdQnTrEN5eADnQ
 84folF+8Ioh5eCWHwMc8MJkWbVhMuk/zid3wXdtf/j41YMiwydpXTv0NkZg4hvDpwHOC
 Wm08QR+RmoFksBZP3fNyA4+W9AXxmSy+90xjJVs6tcogWxiSXN42qNFEhlXJ11anerJY
 9aEfNKph+zZVBC4kCgKbOZLqw4l2wUHeVUq+FOYeSF5y6Sk506XskRmWCjNEa5ZQulTV
 HvAstA4YCGgQ38lvMfySdUUDHMQMKgVnvVL3WDpoaBnWKajv8SzjF3cCC790hEOW/aIW
 kzdQ==
X-Gm-Message-State: AOAM533l2+7LF/4ekMfAzGYEzPgf1LnACeA+xofiOeBofsZC6Tv35ae4
 8/3zRU6erUyjGDBRczFQ8HT1uphmU79+a0ZTbLR5hQ==
X-Google-Smtp-Source: ABdhPJzx8l6s7cwr1jpqW3gS0gdFyY/HRqnR3CN6UnNzzv2sCOPmb0LgKzma2rhBy3UIAyvmt6mNN96iExEuK2KHAxk=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr34170064edt.36.1617120700556; 
 Tue, 30 Mar 2021 09:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
 <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
 <YGMjypzf1hHk47bC@redhat.com>
 <23fcbe91-1b9c-559d-1a61-6cce839bb390@redhat.com>
 <YGMnVy4LDHu28wW4@redhat.com>
 <CANCZdfqE9wOppe2PYco7-x630Q6xeCezG6=nh+UfbgN_j140HQ@mail.gmail.com>
In-Reply-To: <CANCZdfqE9wOppe2PYco7-x630Q6xeCezG6=nh+UfbgN_j140HQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 16:11:08 +0000
Message-ID: <CAFEAcA_w_XPvCgaFGgOTCX7H2DmQQu+H8GysFou--bv6Z3NehQ@mail.gmail.com>
Subject: Re: Serious doubts about Gitlab CI
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 17:00, Warner Losh <imp@bsdimp.com> wrote:
> submodules have caused me significant pain in rebasing the bsd-user work.
> The way QEMU does things, you wind up with unclean trees after a build,
> which causes grief at times... I for one, would shed no tears at the number of
> submodules dropping to 0.

I agree that submodules are bad, but in general you shouldn't have
an unclean tree after build as a result of them. (The exception I'm
aware of is if you have to 'git checkout' an older revision where a
submodule that exists now didn't exist back then; git leaves the
submodule directory in the source tree and you have to rm it manually.
But that's "after checkout", not "after build".)

The main bear-trap IMHO is that you have to remember to
"git submodule update" when checking out different revs of
trunk to keep the submodules at the right version. I wish
git just automatically kept submodules at the right rev for
whatever trunk rev you're currently on.

-- PMM

