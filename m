Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F9437D3F3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:49:21 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgur9-0005iA-Ha
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgubM-0003Ui-SQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:33:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgubH-0004pr-Tg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:33:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id t4so36741505ejo.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f2UD3dY3/x/Y4bkG+WlmefAXY2FfdvvxLA0ORuSe0MI=;
 b=GXBUdG5J0AP2gN2qLEqZ3gFmzns2SOW6azLzEmeJZjdHXzAMhUlHIaqAq3yVf4NX/h
 wQvRlgFKhmZlyxveIKJAebcEPJrxCTHgIFmTlvQiQRl6KKGZegr7tkvsopQ8sevSFGzu
 GERwOyK846TNxKtuT6+FrcUQy2PRIp5wmVfu/iLmxn3oNaymtHWiTSK2M0732o9p8CQD
 VpGb8mVPP1Wcoz9V+FgLfO7CrZs3ZTxzYF+9fof1TTdaHsxrbufElibNvlgl4FyOLM+H
 LbOxD95BbHAm0hRRoiP0nKv3Fp/725S01Ua3yE7UHfqTC3wGGmsRjVP83PNwsPYS+26M
 dRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f2UD3dY3/x/Y4bkG+WlmefAXY2FfdvvxLA0ORuSe0MI=;
 b=TEZjBr1We11N/Zju8sLD2odEa9rBvrw0xes3+Et33xWpERnTZ/lSBhl2BEgcRbpU+P
 KWYsYxJha7bOl3FRYCPvx9GZzPBTfzwtevoZxlHh9nKB1ESoOuEhIkREj1ytEu3FG5Pd
 5m9UOG/UKgLBIeatHnQrBS+kr3bNkU/5mFrdn5vzaCAYrJWm0SugSZCZQ+TMn/0dJS7N
 DGxS8vMLTBIy2KJmNA9RW77AQIjL4ooAM/wFcNxa4oTmECtCGvPhAvuWn1QsXTwDgpOi
 /65DvgSNqwp6rLFBN0yjM2JL0jUaiM6nm+l9qMZkl0a1Q7cGtA0cT/NSYdQp9OeOITlA
 c/XA==
X-Gm-Message-State: AOAM533Ow/YW2HbRbTKzQ9hOYNXJddklSTukf3aStBEu09fCtE9AViXX
 rQyVb2gpLuIouzxGY8N91RMmMLwoNJPb5hXTf8TdAg==
X-Google-Smtp-Source: ABdhPJwZ5/dFVj2U2JBIABwPOuMkpHrNrzWQOXFipI1IiYjAB5u3PSNsO6i2e7BmS7jgfPAn2iNw9bacx2hvg80LzzI=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr500356ejb.85.1620847974469; 
 Wed, 12 May 2021 12:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
In-Reply-To: <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 20:31:40 +0100
Message-ID: <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 17:17, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 12 May 2021 at 17:02, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > On Wed, May 12, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> >> >> NetBSD now complains:
> >> >>
> >> >> Configuring 60-edk2-x86_64.json using configuration
> >> >> Program qemu-keymap found: NO
> >> >> Program sphinx-build found: YES
> >> >> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> >> >> Configuration error:
> >> >> There is a programable error in your configuration file:
> >> >>

> >
> > Didn't you install readthedoc manually there? I don't see those warning=
s.
>
> No, I don't install anything manually on the BSD VM setups -- I just
> use the tests/vm makefile magic to run a build-and-test.

I've figured out what was going on here, and it was my mistake;
I didn't look at the logs closely enough. When my scripts run
'make vm-build-netbsd' or whatever, this can trigger a configure
run in the host, which is what is producing these warnings.
The host makefile then goes on to launch the BSD VM and the
inner configure run inside the VM is fine (as you note it doesn't
have sphinx installed, so no docs are built.)

I should be able to deal with this by installing the rtd theme on
the host. I'll retry merging the pullreq.

thanks
-- PMM

