Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFE2D9530
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:27:14 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kok8P-0001jE-TA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kok7P-0001HI-ER
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 04:26:11 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kok7M-0001kD-Iz
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 04:26:11 -0500
Received: by mail-wm1-x341.google.com with SMTP id e25so14592492wme.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cq8/Ax06jqXTrUap5n5ga3UgjpQMP4Gdw3lu3iBDWF4=;
 b=KiZNZwuRtdi3GZGyuLK3xxYE2Z+hxbUG0kXd5CoM2GEGfw+ytNblpZFBXW27jk8r1j
 P6ESYHCeoieesH63pTagAweAc0FlOlQLnc4wM+8eMgyoFoQl5RW0LDjGpu30nLRAOW9q
 T44XQojIX9Yrb32nYzlok0Qes74zFL2k3RzOQuGTUsS4SPrguwTsiMaR+r3CwQRO8CcU
 Ys5t70P5pTyxp5sQevL9hLtMJxOPogAsZh6bo120wC1G0N6rWehJ/PD2jOWVhfiHIFNt
 zl1VfjN2Cmx9LWW85p8uPbh/wyyM5/YunamCdaqv9Y/kO6HUvZpJIotITQ2r/Xm+8dZS
 TCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cq8/Ax06jqXTrUap5n5ga3UgjpQMP4Gdw3lu3iBDWF4=;
 b=ZI96yS0aNIrPyBbrRWINmoy2j004jGyNHZfhmeSEvYTUVgRaFyITOVWKuG+kLEaDPY
 sbfIrIlw8dFRNQvX9bu5hEZxxD2A7iiLEzFcVURUJMRDjRzEOgMHP1otdjy5hcmmwC9C
 sQuDYHaBe0e29GKRzEYtiMeRogI9vN3R+m58fz1zToegt9YxJyAD5BPAEgenGUgn4tbW
 pdweXey9j0e1lLEesKtrCo35IDdUaJ5IsuJ+BiqEvSNXt1UEe0qXsvJytYZzj5eA1sPu
 0uRsX5JXoAUvrTdpoaGjiGC+MjLRB/ng13OQu/0aXFdQjGTDHjnV/fhoCZcIuGpRFUSy
 BufQ==
X-Gm-Message-State: AOAM530FnhQRyTt23lmD1WmoTLIPJsjEvsEvFpHjTd4rf3nM/b9E0B9F
 eSCMd+vxi1FmyfL8wxpp4vRuow==
X-Google-Smtp-Source: ABdhPJwpJ2XKWCusoDz358GTXqEUTsFyBpCeijtmLNzBgo5ylTKMOWxvO6R6NfF0nKinXlSYCRpIUw==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr27253301wmg.136.1607937965812; 
 Mon, 14 Dec 2020 01:26:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm30683936wrt.35.2020.12.14.01.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 01:26:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDEAA1FF7E;
 Mon, 14 Dec 2020 09:26:03 +0000 (GMT)
References: <20201118140739.18377-1-alex.bennee@linaro.org>
 <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
 <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
 <CAE2XoE938Ut+5NAB+4qgWMK4O4rGz8ORwWMsUC90J9NwF0Fs2A@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: luoyonggang@gmail.com
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
Date: Mon, 14 Dec 2020 09:24:47 +0000
In-reply-to: <CAE2XoE938Ut+5NAB+4qgWMK4O4rGz8ORwWMsUC90J9NwF0Fs2A@mail.gmail.com>
Message-ID: <87h7oovivo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


=E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyonggang@gmail.com> writes:

> On Mon, Dec 14, 2020 at 2:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
>>
>> On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth <thuth@redhat.com> wrote:
>> > On 18/11/2020 15.07, Alex Benn=C3=A9e wrote:
>> > > These seem to trigger timeouts with some regularity.
>> > >
>> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > ---
>> > >  .cirrus.yml | 2 ++
>> > >  1 file changed, 2 insertions(+)
>> > >
>> > > diff --git a/.cirrus.yml b/.cirrus.yml
>> > > index f0209b7a3e..08db7c419f 100644
>> > > --- a/.cirrus.yml
>> > > +++ b/.cirrus.yml
>> > > @@ -18,6 +18,7 @@ freebsd_12_task:
>> > >      - gmake -j$(sysctl -n hw.ncpu) check V=3D1
>> > >
>> > >  macos_task:
>> > > +  timeout_in: 90m
>> > >    osx_instance:
>> > >      image: catalina-base
>> > >    install_script:
>> > > @@ -32,6 +33,7 @@ macos_task:
>> > >      - gmake check V=3D1
>> > >
>> > >  macos_xcode_task:
>> > > +  timeout_in: 90m
>> > >    osx_instance:
>> > >      # this is an alias for the latest Xcode
>> > >      image: catalina-xcode
>> > >
>> >
>> > Reviewed-by: Thomas Huth <thuth@redhat.com>
>> >
>> > ... we could maybe also split the --target-list between the two jobs if
> they
>> > take too long...
>>
>> Maybe it's time, 90min reached:
>> https://cirrus-ci.com/task/5774549872541696
>>
> Even two hour doesn't working, don't know why

It seems to have jumped up quite considerably over a short period which
makes me think the underlying cause is something is getting stuck on
MacOS. Unfortunately it's hard to debug with just the logs because
whatever is taking the time might not be the last thing in the logs.

Having a time-per-test metric would be useful here.

--=20
Alex Benn=C3=A9e

