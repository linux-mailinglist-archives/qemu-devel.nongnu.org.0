Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B886048E0DC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 00:27:20 +0100 (CET)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n89Uy-0000bb-1r
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 18:27:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1n8998-0004bL-02
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 18:04:42 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:63670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1n8995-0002MJ-4g
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 18:04:40 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4BF3A975A3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:04:28 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4JZg3w0zsFz3Fr2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:04:28 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1642115068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RraFeg7pea3mgo3fATwdz9u0kZG7HPNeeO6ATQf6PyI=;
 b=Zil02FDMDU2XKpnqXm1eA3CotrSw10rMFoOiluJuSfrGJH7TJHA/5CFnlwKns7SNXd2ivf
 FlgGsLzE80PC0VF+w+IMgitqceCdkghyaVxqsV9lv2E2c0s0DZip26IdlNVpK3GYn3/lC6
 VDDcOk+DZKPwlbnRSq1tUDRUy9pySnZ+shQksCcKBZb3Uy9PuRzis92Hm0aCUHDEp5RptW
 gh31HUFm5vyKFXALWuB6/khH8pcymbz+1/aFIPolQ2LDpYlzIbFqPKcOw0pqslOoMW61ws
 ZBRcQp/t/D0ZtEANajnYZO9FdUjv4csHiSHi+oWgS/gae/9wk8YaF6l4HCvLmQ==
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id EDEDE127B
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:04:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f181.google.com with SMTP id c19so9025657qtx.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 15:04:27 -0800 (PST)
X-Gm-Message-State: AOAM532lIj9vhUG+eBFARVcFIStQam4m76F1YwIQTsXqzkZijvzkqQei
 lXW/AnTRiwNhNCyOWpPDVtOYG5gNuQu5Pfrymj4=
X-Google-Smtp-Source: ABdhPJwbAIvTkhiVQl11EY8ek+/2J6seOaMqm7FEn5ERo2A3ALf/ApCqgWFEDC0u53+AHVN+uaK3pb6EyyX04DK71NU=
X-Received: by 2002:ac8:5c4a:: with SMTP id j10mr5549051qtj.449.1642115067390; 
 Thu, 13 Jan 2022 15:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-22-imp@bsdimp.com>
 <CAFEAcA9xbOCjc7ZLULuyWNYi5jHtS=N8_HWiob_gaAE+3vxZAA@mail.gmail.com>
 <CAFEAcA8bdDdn8-UOeGX_aHu1E1QuEasCK++x3qNrvRfg6MqCaw@mail.gmail.com>
In-Reply-To: <CAFEAcA8bdDdn8-UOeGX_aHu1E1QuEasCK++x3qNrvRfg6MqCaw@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 13 Jan 2022 17:04:16 -0600
X-Gmail-Original-Message-ID: <CACNAnaF29EyoQSsGKQyXTC+9bYZaTra4DuunkbBC6jeDt4VAVw@mail.gmail.com>
Message-ID: <CACNAnaF29EyoQSsGKQyXTC+9bYZaTra4DuunkbBC6jeDt4VAVw@mail.gmail.com>
Subject: Re: [PATCH 21/30] bsd-user/signal.c: force_sig
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1642115068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RraFeg7pea3mgo3fATwdz9u0kZG7HPNeeO6ATQf6PyI=;
 b=iOtNvYwIJ//hcH9DOmuTxXWQOUILMlivTMpuXpMgL52tPAUXhwZqGpgUz3d3+ftnUE717I
 X90/bZhqVccb/ob8Y20J00rWBj9nOXKk1tFjmbJDr6GMjsLqAub7/VzYbP1kr8x+hA60uz
 ++CoNwb/SEWgVENYgI+yibmXEkNBZSrdwg90yuMf+/653KgE4/Q9poy9zxnGDnlzdlwDaV
 ysFS7ivilHR6phtQIYTD3GIx/p9cKCCkObDkEbMq1jRiOi4Nc+QClOafW7K4oUm6dD8JRh
 SLAwwsr5MJaTN9DmfVulhY2YOj5rRibDGGM42SUqs/SJHhH90Fva0XnqtHDWew==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1642115068; a=rsa-sha256; cv=none;
 b=QXDlOZM888d91/l0f8/Upg0jqCmSIZ4DV57HvTC1vTOVQH1pcRlKrH9XkF8tSuOCUDp4kA
 ITeoy0z81TBUNpSQuzGR6DqPcSnUXG/I4fqM6G2XamfjPFZZKZuPnUGblQj+FvSHQxJA9B
 hjGE6RZ5Pr/E8aivxaBNyYVDIyMrQ1pBRmymkLPMYbg+Gmc9tCpfN8S5KyrxigeVFBXxG7
 p0wrqbVcAgESo8LkWYc0FolHX5tz+R+SbfClnBjMQxGSjXhI0gjHY8Gkws5A456H2hpkBj
 y1h4ykKkT49T9/+iKVcjR5+SWVoaDkgTzEn1yEVg6bv2xox59wYb2CtaSWFPuw==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 2:53 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 13 Jan 2022 at 20:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sun, 9 Jan 2022 at 16:44, Warner Losh <imp@bsdimp.com> wrote:
> > >
> > > Force delivering a signal and generating a core file.
>
> > > +/* Abort execution with signal. */
> > > +void QEMU_NORETURN force_sig(int target_sig)
> >
> > In linux-user we call this dump_core_and_abort(), which is
> > a name that better describes what it's actually doing.
> >
> > (Today's linux-user's force_sig() does what the Linux kernel's
> > function of that name does -- it's a wrapper around
> > queue_signal() which delivers a signal to the guest with
> > .si_code = SI_KERNEL , si_pid = si_uid = 0.
> > Whether you want one of those or not depends on what BSD
> > kernels do in that kind of "we have to kill this process"
> > situation.)
>
> It looks like the FreeBSD kernel uses sigexit() as its equivalent
> function to Linux's force_sig(), incidentally. Not sure if
> you/we would prefer the bsd-user code to follow the naming that
> FreeBSD's kernel uses or the naming linux-user takes from
> the Linux kernel.
>

My $.02: let's go with linux-inherited linux-user names and drop in a
comment with the FreeBSD name, if they're functionally similar enough
(in general, not just for this specific case). My gut feeling is that
it'll be more useful in the long run if we can more quickly identify
parallels between the two, so changes affecting linux-user that may
benefit bsd-user are more easily identified and exchanged (and
vice-versa).

Thanks,

Kyle Evans

