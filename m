Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C633C544
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:09:22 +0100 (CET)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLreW-00059I-0N
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrQT-00020m-JU
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:54:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrQQ-0005Fb-KI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:54:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id h13so18381091eds.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1J0ArbFGDQR2mj1V/O+MtU/P7Ye1anKhOfkaHqsDsOU=;
 b=Zo4tZBmiN5RiUx6WpUspwYp4aLZN9FyF02svWnisFPAHT/7u0bGOlLZIoLLb9DgQXQ
 tfcUiy6uwryupPxIv/1l2pU476bkGqvusEQK3DaKtYddjHo8rtNIhiIoqw0bdDLazI8u
 io6FsgpZTsou+2v6WdkIPLCgfKDr+80IH5vJKwQ8XUrt/XF3iMKrtH6W2UF7rSfqXbeL
 LBhYmtLZS2hBct7I31nig4vecTiRQHdJE5EamraNR5L2pAqiRVqO/OQmCg306V8vn48b
 0oz9FFKWcmRCpoC1V71Ushbuewoaa8asy2Gk2Rnlwkn7wnclRqOwcLPnBSVUwEOPhoTb
 xThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1J0ArbFGDQR2mj1V/O+MtU/P7Ye1anKhOfkaHqsDsOU=;
 b=eaYOgrQejf5AZyrDLshA20Mobq48+KK0OrJvzshGSuS45DI8qk/0XXirRY/IJ9y5hx
 JcusN8UiPOmQA6bz0q7qST1RUejd+SWsxtrbYbpYlv5qVuqdprYnO4h7A8aNqUk9/IRl
 6w6UHl5QOlYH5sbFPKlWgbt8oXoQilWoMAD69ItCKY3YHJYZZGmzhKhFaOwvyIz9Hb1t
 NceI+epkUPaeSPE2x4c2YETbIG8VYsHVL1hyYE5inR6NI4DbGr4972uzXmmA3pKNAIr5
 2AEiCqpXPAJK6pPUjhufTloPSHFQn/NPn7GNSZhn/gT0i/URRmfHQMRCGveNR1+go9n0
 4Rng==
X-Gm-Message-State: AOAM5335xqyg5oUUICOSWz3hNghFrQCuTgNERWA3YyEvOfkR/kJLDoIQ
 9OCfYdAkENc7oQCud7WloNYIJQ==
X-Google-Smtp-Source: ABdhPJyKH8YjLwN0vrT+9SpfkMEkwDCcL6YknOXCFjjcScCYKN82/QYEeGcoVmXq2yqvNbT5FZ/KKw==
X-Received: by 2002:a05:6402:1c1b:: with SMTP id
 ck27mr31355530edb.223.1615830880407; 
 Mon, 15 Mar 2021 10:54:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u24sm7999180ejr.34.2021.03.15.10.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:54:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF86D1FF7E;
 Mon, 15 Mar 2021 17:54:38 +0000 (GMT)
References: <20210315165312.22453-1-alex.bennee@linaro.org>
 <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
 <b5db40d9-1a51-3690-a1ac-0ac345619376@redhat.com>
 <YE+UuX2Hqr2BjsRh@redhat.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] docs/devel: expand style section of memory management
Date: Mon, 15 Mar 2021 17:54:17 +0000
In-reply-to: <YE+UuX2Hqr2BjsRh@redhat.com>
Message-ID: <87pn008fq9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Mar 15, 2021 at 06:04:10PM +0100, Thomas Huth wrote:
>> On 15/03/2021 17.57, Peter Maydell wrote:
>> > On Mon, 15 Mar 2021 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> > > -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the f=
ollowing
>> > > +Care should be taken to avoid introducing places where the guest co=
uld
>> > > +trigger an exit. For example using ``g_malloc`` on start-up is fine
>> > > +if the result of a failure is going to be a fatal exit anyway. There
>> > > +may be some start-up cases where failing is unreasonable (for examp=
le
>> > > +speculatively loading debug symbols).
>> > > +
>> > > +However if we are doing an allocation because of something the guest
>> > > +has done we should never trigger an exit. The code may deal with th=
is
>> > > +by trying to allocate less memory and continue or re-designed to al=
locate
>> > > +buffers on start-up.
>> >=20
>> > I think this is overly strong. We want to avoid malloc-or-die for
>> > cases where the guest gets to decide how big the allocation is;
>> > but if we're doing a single small fixed-size allocation that happens
>> > to be triggered by a guest action we should be OK to g_malloc() that
>> > I think.
>>=20
>> I agree with Peter. If the host is so much out-of-memory that we even ca=
n't
>> allocate some few bytes anymore (let's say less than 4k), the system is
>> pretty much dead anyway and it might be better to terminate the program
>> immediately instead of continuing with the out-of-memory situation.
>
> On a Linux host you're almost certainly not going to see g_malloc
> fail for small allocations at least. Instead at some point the host
> will be under enough memory pressure that the OOM killer activates
> and reaps arbitrary processes based on some criteria it has, freeing
> up memory for malloc to succeed (unless OOM killer picked you as the
> victim).

OK how about this wording:

  Please note that ``g_malloc`` will exit on allocation failure, so
  there is no need to test for failure (as you would have to with
  ``malloc``). Generally using ``g_malloc`` on start-up is fine as the
  result of a failure to allocate memory is going to be a fatal exit
  anyway. There may be some start-up cases where failing is unreasonable
  (for example speculatively loading a large debug symbol table).

  Care should be taken to avoid introducing places where the guest could
  trigger an exit by causing a large allocation. For small allocations,
  of the order of 4k, a failure to allocate is likely indicative of an
  overloaded host and allowing ``g_malloc`` to ``exit`` is a reasonable
  approach. However for larger allocations where we could realistically
  fall-back to a smaller one if need be we should use functions like
  ``g_try_new`` and check the result. For example this is valid approach
  for a time/space trade-off like ``tlb_mmu_resize_locked`` in the
  SoftMMU TLB code.


>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

