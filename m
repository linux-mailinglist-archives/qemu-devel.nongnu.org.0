Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF60667B0E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0b8-00030p-5t; Thu, 12 Jan 2023 11:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0b3-0002yk-Kh
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:38:33 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG0b1-0008HQ-JL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:38:33 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g20so14201000pfb.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EGkQVNtaoQAMvDYuqtGmbHuLfJzMrrI3jFxmiv6ma8=;
 b=fgTdwLU8V54u7Oc1oIcH+DsG5YZSfXWsm1fbnJDjWJ/g3OoArdXyptgi9Hs0VS5Ht3
 N4/kW4NCJ5O6F3aoW2vpkf/hEuTYoHebeC64zvPzU/YY3MK6eUaHhkmafsD91lUEijT8
 ok9kpMIt7ZyY5mri2f28yeVE0HKnOB5X0sWUzgFzE7cy40H2hDWyCmcgRez9gpKmqAe2
 gogZtJtlKQzhTvpsKlFd3zdufklSO90+m+tV1hi5htJNQ2D6V/O+4bKDk03J/usaS/j5
 4knVMfVoTOMNrg0HpPosMXbfZlloblpOymu2nkBbcuj18lAnDZgM3Gd7Ci+cJZNoODZz
 Ft0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EGkQVNtaoQAMvDYuqtGmbHuLfJzMrrI3jFxmiv6ma8=;
 b=FEkEc8VmoF3+0ui3XiATfBxZp5sQQJGTQdQsD0B2qeoMtCmBrXDJ/v8RfuAESEnKb+
 cCh8CiP7SN4Aac525TzXL44dI47t5fHGZf2enlu0vCugbM/Am9D90wPX0Kq0KBQTaJkN
 f2SD+NZOu70JhhD+xatwPlGwcetTwu9FHF5rEkjhQA73zM2V9+ZqsMSM/2XclhATWp0+
 3IDDoSj0xgC4Fs91upIrwxVQLL/WoS45Hfljab/wvrkmGR6tlCmZXlYODMbmK2kkR9ek
 LBGki0yHRY3VkiEjXMBgWG8B1moIqz+r7nxLEUPHMtHN8mW6uTOeeMtR0pq6hrHWEOh8
 vQnA==
X-Gm-Message-State: AFqh2ko83TiehgKpqdCTy6LeMRemtS4OVA4jXnPeCCDyA1uOWPq4gGHD
 3TMH47rDCmdLZYYSRSQ8S7YRH43HW311/I4y8NNkCA==
X-Google-Smtp-Source: AMrXdXuuxq2fNigpEKi8gb0ubH8uILQj605ArM46se1dHWc8JKUsHhSBsoBcrlQg44JDJsd1n7eca/SnonAZKVV2naw=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr5040754pgh.105.1673541509513; Thu, 12
 Jan 2023 08:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org> <Y8AewFAHRGf6ZI3x@redhat.com>
 <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
 <Y8AwXG/c+IRyJ2U6@redhat.com>
 <CAFEAcA_EP2_0vm8r=12DBTG4a7X7aMYAy2x+K7YctZmSZWTv2g@mail.gmail.com>
 <Y8A1nNp/JieSDgIP@redhat.com>
In-Reply-To: <Y8A1nNp/JieSDgIP@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 16:38:18 +0000
Message-ID: <CAFEAcA84s_nDuni6Z7FzX0EnJT56dtaDHiq1qu0mCUq2=Gg1wg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 imp@bsdimp.com, kevans@freebsd.org, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org, 
 philmd@linaro.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 12 Jan 2023 at 16:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jan 12, 2023 at 04:20:36PM +0000, Peter Maydell wrote:
> > On Thu, 12 Jan 2023 at 16:08, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > I think the challenge is that osdep.h is too big as it exists
> > > today. The stuff the needs to come before system headers is
> > > actually little more than config-host.h and a few #defines
> > > most of which are specific to windows. If those critical
> > > #defines went into config-host.h, then we could have a rule
> > > 'config-host.h' must be included in all .c files as the first
> > > thing.
> >
> > This doesn't seem much different to the rules we have today,
> > except you've renamed osdep.h to config-host.h...
>
> If the QEMU header files all contain #includes for the
> system headers they rely on, then when tools are validating
> code in the header, they can stand a better chance of being
> able to resolve all the types. Though it'll still fail if
> some of the system header pieces only get exposed as a result
> of config-host.h macros, but that's relatively few, compared
> to today where amost nothing resolves if yuo validate the
> headers files in isolation.

Yeah, but I don't want QEMU header files to contain
lots of includes for system header files, because of...

> > There are some complicated things in there, not always
> > limited to Windows. Also where there is some header
> > that needs a platform-specific workaround I prefer that
> > that header is pulled in by osdep.h. This avoids the
> > failure mode of "developer working on Linux directly
> > includes some-system-header.h; works fine on their machine,
> > but doesn't work on oddball-platform where the header
> > needs a workaround". (For instance, handling "sys/mman.h
> > on this system doesn't define MAP_ANONYMOUS", or the
> > backcompat stuff in glib-compat.h.)

...this. So we'd have to have config-host.h include all
the system headers we're working around anyway.

-- PMM

