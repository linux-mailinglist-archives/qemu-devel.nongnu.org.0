Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CC3D95B9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 21:02:17 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ooq-0004ZR-B7
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 15:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m8omw-0003hx-IG
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:00:18 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1m8omu-0000bN-9G
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:00:18 -0400
Received: by mail-lj1-x229.google.com with SMTP id h11so4256446ljo.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CF9Ebtn1K2skoonIX3Kl5uPFwf6/mj0sEHZaqTsqkM8=;
 b=HnOKhABiYVDpWHTEotvy8TRmCEC1QtjeZ/HFGLg2UBX2JmDkodXeXj7V8WiZhzYcQS
 atrhZprD8sBKRVuteibupgTQvvlDMhN/zFROgRV4nT7LTYg0zAoNJXf32hK/4gVEQAP7
 iGKgws00WNSaAoGZiUOGR6gHSsSQnLT0XdCP8hF4l+lBNffzWJUUbag8n0ukQZduUZ7B
 f6YZC8A9czKHd8r+siKbxqI/iLbw8oEXwo82OXsgOkf/Oe0VixfheizX3VwZQTlJCgW8
 iCsjCsQWvAQ260/Ej27hnSOky7yZ1ZnTTK05RB8qcWyE+whZDV+huaBZEIuYPOknBOVh
 YrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CF9Ebtn1K2skoonIX3Kl5uPFwf6/mj0sEHZaqTsqkM8=;
 b=tFXLtpaDaNPSqGdZ9u8bfUW6FJXl8Cv3x8IciYBjG7sktpG2ihKHuA5hVP6hPTpaMx
 NjU828sPEWTwSJsSQdMwYhEN9NRh4QtgBk4IudT2iphbdXMQ0zZDR1qBJjkvwrwTeaJ5
 dfDeHbIAcylpV8tuJQY0mKJrXsFPOBES15yAZuv0TAthm19UZCa43vpq0A6zcuxI+JiN
 0pC2eaweQUWDlvU4JCStp34m6VUpetrFNGmT3PEwlHNAcvLihZY+ol01/5ELpxg1pWZd
 DBVgTazB6ysoZQPJ9Udx+Wld7VnsqeEASAuqCinmkQo8BF3MQuSWM67YBNEjTOaNK3Ur
 mAVA==
X-Gm-Message-State: AOAM531ZKx296R9Cv4qackGaxfnbHIdvMHiiSCjw5lyYriHZWkm1P0g6
 cZ2B9jHNTNLPk17j9YhNQmzsJftOQJwRhT9Xoqk=
X-Google-Smtp-Source: ABdhPJwMmzz0ZTVyuI9BEf3qiVK5oQzhKIRnHD1Mde34Q4f9D/LqLbWCY4pnghV5lqF94ZnmaBPOR9mX6adE6Y0eBfc=
X-Received: by 2002:a2e:a90e:: with SMTP id j14mr751792ljq.250.1627498813006; 
 Wed, 28 Jul 2021 12:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
 <YPC1lgV5dZC0CyG0@google.com>
 <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
 <YPiLBLA2IjwovNCP@google.com>
In-Reply-To: <YPiLBLA2IjwovNCP@google.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Wed, 28 Jul 2021 14:00:01 -0500
Message-ID: <CA+-xGqP7=m47cLD65DhTumOF8+sWZvc81gh+04aKMS56WWkVtA@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sean, sorry for the late reply. Thanks for your careful explanations.

> For emulation of any instruction/flow that starts with a guest virtual address.
> On Intel CPUs, that includes quite literally any "full" instruction emulation,
> since KVM needs to translate CS:RIP to a guest physical address in order to fetch
> the guest's code stream.  KVM can't avoid "full" emulation unless the guest is
> heavily enlightened, e.g. to avoid string I/O, among many other things.

Do you mean the emulated MMU is needed when it *only* wants to
translate GVAs to GPAs in the guest level?
In such cases, the hardware MMU cannot be used because hardware MMU
can only translate GVAs to HPAs, right?

