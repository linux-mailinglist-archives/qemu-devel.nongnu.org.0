Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6D5E1CA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 12:19:21 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hicMC-0002EV-UF
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 06:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48989)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hicKx-0001Qo-Ji
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 06:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hicKr-0007pv-GP
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 06:17:59 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hicKr-0007kG-A0
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 06:17:57 -0400
Received: by mail-ot1-x341.google.com with SMTP id r21so1319877otq.6
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLJ7xu0pnRJEmkd74BGQ0aMvagEZblH/3m/3EGtj/Ok=;
 b=FnDLz5VLX41E1CHcdOwTRDByEVS5MY8c4omyGPIpfnOcL9alN7ml5oOWOKAsasssTq
 1ELxAmgTmTyesTBzv2LsOSU/F5r4I534ZYccgAnI+jib6BfYEWymzqQuxeCYRfvlT2XF
 8OQxmY8644+jW8kLh8XokD8RiZ1Kt+Rnit22XG66nQt8By/RF7heX4zeJaT2sGgcRqNH
 0Dje8dPZRABqwqoMaq9K8+/WMZRn38GTUHw/s7/XN1MxiCfrhpOC+zFYlklMxMvLLua4
 RzAn+NkkUcRSoNssoDnQHTVy3dymfd4ZlFgXit08s8+gq0iYAWQS1+1UPavRLwziUJjJ
 gbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLJ7xu0pnRJEmkd74BGQ0aMvagEZblH/3m/3EGtj/Ok=;
 b=fR9wWQHQbv6OOD5HUxleOaHaOG3qgPm+eM/PFXupJiwz3Ni2xfaRmIl9eeIZgSJHqv
 5oTnqwyq73JVZ+4EQ0XxgcyYt8qivklqmUc7Dl/ohknsQ1ly4diP7riPP7Hs2uQMceeM
 0A86a/Aa4/DqH5Tl4z2b/kU5Ch5diKcAl1ZdkvEhxu96QagBt/6FG4m9QqJGLg5K+Awg
 VldCTDJKoTjo8rB+YiJ6i2v7cq3WQ36dULndgreknpImtGjQ6auOHHEbdMLnypvsgEDV
 HBDEXbwDH+Kujm1/pbTTGyQsak5F9ZecewwVuL/iSGsuYy8dIyDIw8dZCtMGaLagd9Jn
 WAlA==
X-Gm-Message-State: APjAAAXNc8bmQQlMtL9K0YZMIUfwnPCCI+qAiRGd7STd1F7OuhfYHdv2
 VHgub6CPRyGOconcGlCBzad3DYxfoolff5HPCdr4Nw==
X-Google-Smtp-Source: APXvYqyd9Kj+uy0t4qZA4raZMMNfYox3qGokhiLzlmAnhUaVyNOPLhc0AOegB9EQtkpn1jsuW46Ih7vdimBjOKlVhoY=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr29456178otn.135.1562149074600; 
 Wed, 03 Jul 2019 03:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190702113414.6896-1-armbru@redhat.com>
 <CAFEAcA9oPS2FbBgm+SQYqMbwzg+Dwmm0W9U8Vc-2LX7TmzAADg@mail.gmail.com>
 <87v9wjy9ut.fsf@dusky.pond.sub.org>
In-Reply-To: <87v9wjy9ut.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jul 2019 11:17:43 +0100
Message-ID: <CAFEAcA_EJVYwkvCd+bouW5nvbiA8DzJ48pq70m6AAg=j3Dichw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PULL 0/4] Build system patches for 2019-07-02
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

On Wed, 3 Jul 2019 at 06:18, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > This seems to break the incremental builds (most hosts):
> >
> > make: Entering directory '/home/petmay01/qemu-for-merges/build/w64'
> > make: *** No rule to make target 'subdir-slirp', needed by
> > 'config-host.h'.  Stop.
> > make: *** Waiting for unfinished jobs....
> > config-host.mak is out-of-date, running configure
> > Install prefix    c:/Program Files/QEMU
> > [rest of configure output snipped; no other output]
>
> PATCH 3 changes the dependency configure writes to config-host.h like
> this:
>
>      if [ "$slirp" = "git" -o "$slirp" = "internal" ]; then
>     -    echo "config-host.h: subdir-slirp" >> $config_host_mak
>     +    echo "config-host.h: slirp/all" >> $config_host_mak
>      fi
>
> For me, make complains, reruns configure (which adjusts the dependency),
> then happily makes everything.
>
> Hmm, I see.  Without -k, make stops after rerunning configure.
>
> Is that a problem?

Yes: most people don't run 'make -k'. We should strive to avoid
breaking incremental builds, I think they are the most common
way developers build QEMU.

thanks
-- PMM

