Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBC600E22
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:51:39 +0200 (CEST)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOeg-0000Za-63
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okOVg-0006wi-0c
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okOVO-00089H-66
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666006920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMwjSPmNoEMFO8LuoyM0mECTDiGT1Bn0rY2tEueDnN0=;
 b=HxOfR14dRHpn0zTig+9TmHkeJ5XgGrq8UoVmLroib+GNi+bOmpFwUeoTHhbbqGIdL/fNaB
 /2uWVB6ud1qVN8IsFKUHMJXnN/N9l8CsAO7k5Dv0V6tmhmxlAArq1yZHxRrVgYL3jnRuNA
 fRu3iVz1EYibf+1j/BeLrCojMrLp4lc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-b59C2mJzPAWFrcqcRZWEEA-1; Mon, 17 Oct 2022 07:41:59 -0400
X-MC-Unique: b59C2mJzPAWFrcqcRZWEEA-1
Received: by mail-vs1-f72.google.com with SMTP id
 m186-20020a6726c3000000b0039b2e2e040dso2447807vsm.9
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMwjSPmNoEMFO8LuoyM0mECTDiGT1Bn0rY2tEueDnN0=;
 b=hK7Gk5GrSnpJwd0nuAeiZAJA0DfzP2hoaoQ3b/BXWdAx1VHXKB3y14ZKbvJg5uAZ/G
 CtVVxJyAiU9MLUJNwIpWOS848BFhbpynHV9CU9ZNVxkC2OpWUHZBN17AqpsQJyxS7E+u
 bj6Kf3xmC16T1UBAF9gu6IiXUFKlt2Uu0eva+4XlKHdpd+rm8uMswKQeiWPziZvQeJXf
 VSvWeksRPH/UkghZfz2RajUfquxDc+U5kWP9zAQeTtLZULcuSHY8NLzgIuilcNnaE9YA
 qpHGZo/NrTy7H3BkIB51IQuR4OJSHV/JXZSK1kYRvy98SRhmVNK7ESHElxEEMT0f02a7
 Gmpw==
X-Gm-Message-State: ACrzQf2Ts2Gr320X41Rhq0piycxFvqXXPQ8Ut88MyUXxjfHZRLAnX39Q
 9vzHaC3zi2CtH4xlpV78L7OkYHV+krFy90MNuLQXYAvTeHLAUJVxyC9yjIrK7k+UUwo2wpyuVae
 g6/Aw0dbU6KOW4lyPtEpTjDCpQRk6l+s=
X-Received: by 2002:a67:ed07:0:b0:3a6:5bf7:8ba1 with SMTP id
 l7-20020a67ed07000000b003a65bf78ba1mr3888709vsp.62.1666006918852; 
 Mon, 17 Oct 2022 04:41:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uZm7aEyT+CIfG9DDoqlTmZw62Qh6JMNtLwqoxQlaLvmh1KH/JfG/r0b6Xmv64Fq2qNBr32WU3kZZmJpNBOgA=
X-Received: by 2002:a67:ed07:0:b0:3a6:5bf7:8ba1 with SMTP id
 l7-20020a67ed07000000b003a65bf78ba1mr3888702vsp.62.1666006918617; Mon, 17 Oct
 2022 04:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221014135648.2574797-1-alex.bennee@linaro.org>
In-Reply-To: <20221014135648.2574797-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Oct 2022 13:41:47 +0200
Message-ID: <CABgObfa_wxQLmWYPFZTzTWXipKt5gik0FzDcHKSO9DTkN9c7RQ@mail.gmail.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add entries for the key build bits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Oct 14, 2022 at 3:57 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> I'm going to nominate Paolo for meson stuff given the conversion was
> his passion project.

It wasn't my passion project, it was my secret project to stop having
to fix bugs in the makefiles. :)

>  Build System
>  ------------
> +Meson
> +M: Paolo Bonzini <pbonzini@redhat.com>

I think it's fine leaving the handling of meson.build changes to the
community at large. Excluding my own changes to move stuff from
configure to meson.build (which I'm almost done with), the wide
majority of meson.build patches did not go through my tree.

But it's okay also to have me as the official maintainer, perhaps with
added reviewers. Among others Marc-Andr=C3=A9, Daniel, Thomas, Philippe all
contributed a lot of reviews and/or changes over the past two years.

> +S: Odd Fixes

S: Maintained

> +F: meson.build
> +F: meson_options.txt
> +F: scripts/meson-buildoptions.py

F: scripts/meson-buildoptions.*
F: scripts/check_sparse.py
F: scripts/entitlement.sh
F: scripts/symlink-install-tree.py
F: scripts/nsis.py

Looking at more files under scripts/, it's an easy cop out to add them
under the Meson entry but for example please add F:
scripts/feature_to_c.sh to gdbstub since you are at it. We also need
an entry for

F: include/qemu/module.h
F: util/module.c
F: scripts/modinfo-collect.py
F: scripts/modinfo-generate.py
F: scripts/undefsym.py

Perhaps Gerd?

> +TL Makefile and configure
> +R: Paolo Bonzini <pbonzini@redhat.com>
> +R: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +S: Odd Fixes

I think "M" is more appropriate, and "S: Maintained".

> +F: Makefile
> +F: configure

Also:

F: scripts/mtest2make.py
F: tests/Makefile.include

Another related change, given the recent cleanups to the tests/tcg Makefile=
s:

 Guest Test Compilation Support
 M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 S: Maintained
-F: tests/tcg/Makefile
-F: tests/tcg/Makefile.include
+F: tests/tcg/Makefile.target

Thanks,

Paolo


