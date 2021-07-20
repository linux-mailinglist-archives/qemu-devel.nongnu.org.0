Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963F3CFF7E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 18:32:25 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5sfP-0005hj-Hn
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 12:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idsandoe@googlemail.com>)
 id 1m5rih-0003pM-HC
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:31:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idsandoe@googlemail.com>)
 id 1m5rie-00065m-ET
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:31:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id l6so12551476wmq.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LR6FhGgKZFXI6AbVilsVqj7SIosNkslo1hZegf0cIpE=;
 b=ABqKzFlQWpS7dw8xEt/EITmq1vTTS7AHo7BTi97bJUNNhJnn5+iwAtFo63ZTp4afW4
 LMPV5e9HUkF+TYKXaCpXmANSNIYSqR+V87TWOEY4tmk2j2C5PwXZ6FklTFknDGAc8HEq
 ms/jDXgHiZ0CpsACnsyK+rPu44YltBPoMqtk/qlZkyTpP996W9q9d0DREz4MHq6tCXWR
 RLvq+gsX8IbTyYLgx6BeTA7Puy1kPf9+Fi/7D3se0CLn5KmBlBoGVYFKf3qs26iltqHl
 2/SsL3wQu2WtjF3yeOmhvy4GqMmmUJX29qYaKz6DFe/lfhPt4c6Yynbwf+BLMxZMqSvv
 Jx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LR6FhGgKZFXI6AbVilsVqj7SIosNkslo1hZegf0cIpE=;
 b=iqxQZjq6RF6txzUURf7PBZgRZCNttZztsjpgrR6BFkFMR0mPVxyzNs9OQcw4NFAQZN
 PQolFCsXepm9KiYdfrnQExg32uyAJMlmL3tCCYtx2RUm24HtNiqEJKkcyUW5L+ZlUdWn
 wUi+qFYak8QiOnqFthfLopWs6x3hmlOe2/S9qJu/Kp7YkoPce0SpxyO7f9ZSZwaYAXpU
 x+p93/zhMh79ykvo56M8qrqJXmV6TpISlmQ3uGORjf43HB/X62fhqR5gR6/H7AzNhyn6
 LK5b7MZnEAyzcF4eLcosYcARIECtq132UTTgpy52839QanaMkyr40SAvHTPAhOriAw+R
 0/IQ==
X-Gm-Message-State: AOAM530OmfFymcubQOLgYDIzf4YGxpRn2u1lqimeIiSJr2QRx++ghHfy
 juacEJpYlvwGfMGoVZGY2Mc=
X-Google-Smtp-Source: ABdhPJzxmSoq/d2QRo+2rDgQuhbHbPJGnXH6X7ZCS3Leds5JDbL61RGPqdlNQNPOS12S1P2z00s52Q==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr32732402wml.45.1626795098268; 
 Tue, 20 Jul 2021 08:31:38 -0700 (PDT)
Received: from [192.168.1.214] (host81-138-1-83.in-addr.btopenworld.com.
 [81.138.1.83])
 by smtp.googlemail.com with ESMTPSA id b15sm11173471wru.97.2021.07.20.08.31.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Jul 2021 08:31:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Disabling TLS address caching to help QEMU on GNU/Linux
From: Iain Sandoe <idsandoe@googlemail.com>
In-Reply-To: <87im15qbp3.fsf@oldenburg.str.redhat.com>
Date: Tue, 20 Jul 2021 16:31:36 +0100
Cc: gcc@gcc.gnu.org,
 libc-alpha@sourceware.org,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <55F007B1-A82C-44CB-8427-750AE5FD963E@googlemail.com>
References: <87im15qbp3.fsf@oldenburg.str.redhat.com>
To: Florian Weimer <fweimer@redhat.com>
X-Mailer: Apple Mail (2.3445.104.21)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=idsandoe@googlemail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Jul 2021 12:31:04 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Florian,

This also affects fibres implementations (both C++ and D ones at least =
from
discussion with both communities).

> On 20 Jul 2021, at 15:52, Florian Weimer via Gcc <gcc@gcc.gnu.org> =
wrote:
>=20
> Currently, the GNU/Linux ABI does not really specify whether the =
thread
> pointer (the address of the TCB) may change at a function boundary.
>=20
> Traditionally, GCC assumes that the ABI allows caching addresses of
> thread-local variables across function calls.  Such caching varies in
> aggressiveness between targets, probably due to differences in the
> choice of -mtls-dialect=3Dgnu and -mtls-dialect=3Dgnu2 as the default =
for
> the targets.  (Caching with -mtls-dialect=3Dgnu2 appears to be more
> aggressive.)
>=20
> In addition to that, glibc defines errno as this:
>=20
> extern int *__errno_location (void) __attribute__ ((__const__));
> #define errno (*__errno_location ())
>=20
> And the const attribute has the side effect of caching the address of
> errno within the same stack frame.
>=20
> With stackful coroutines, such address caching is only valid if
> coroutines are only ever resumed on the same thread on which they were
> suspended.  (The C++ coroutine implementation is not stackful and is =
not
> affected by this at the ABI level.)

There are C++20 coroutine library writers who want to switch threads in
symmetric transfers [ I am not entirely convinced about this at present =
and it
certainly would be suspect with TLS address caching enabled - since a =
TLS
pointer could equally be cached in the coroutine frame ].

The C++20 coroutine ABI is silent on such matters (it only describes the
visible part of the coroutine frame and the builtins used by the std =
library).

>  Historically, I think we took the
> position that cross-thread resumption is undefined.  But the ABIs =
aren't
> crystal-clear on this matter.


> One important piece of software for GNU is QEMU (not just for =
GNU/Linux,
> Hurd development also benefits from virtualization).  QEMU uses =
stackful
> coroutines extensively.  There are some hard-to-change code areas =
where
> resumption happens across threads unfortunately.  These increasingly
> cause problems with more inlining, inter-procedural analysis, and a
> general push towards LTO (which is also needed for some security
> hardening features).
>=20
> Should the GNU toolchain offer something to help out the QEMU
> developers?  Maybe GCC could offer an option to disable the caching =
for
> all TLS models.  glibc could detect that mode based on a new
> preprocessor macro and adjust its __errno_location declaration and
> similar function declarations.  There will be a performance impact of
> this, of course, but it would make the QEMU usage well-defined (at the
> lowest levels).
>=20
> If this is a programming model that should be supported, then =
restoring
> some of the optimizations would be possible, by annotating
> context-switching functions and TLS-address-dependent functions.  But =
I
> think QEMU would immediately benefit from just the simple approach =
that
> disables address caching of TLS variables.

IMO the general cases you note above are enough reason to want some
mechanism to control this,
thanks
Iain

>=20
> Thanks,
> Florian
>=20


