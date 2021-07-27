Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCC3D763B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:25:19 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8N5C-0008Hf-CK
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8N43-0007bS-F5
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:24:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8N41-0006Ga-8x
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627392244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWMWNJcjMkhxs4Pij/ATOwM9Y4y2N8zbBs3L5NM3ndc=;
 b=FbyipENVGhGpGhOOl/UriQcj35sYDjvkJ/PozkNR3ayuRFwGLA76eVgWPjlh5nyZjy9yQS
 QMsxF/yjblAfNmGqwAuJfE06SRskDulOSdaa2U+/lwobD34Rj29lfSZRc3M4OKvNDFJj2Z
 vgM+BbZBNbeY67G2mt8KKV9npOLDR9s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-NkDGR_4RPQuLvjZbowya7Q-1; Tue, 27 Jul 2021 09:24:02 -0400
X-MC-Unique: NkDGR_4RPQuLvjZbowya7Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a19-20020a1709063e93b0290551ea218ea2so3138016ejj.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWMWNJcjMkhxs4Pij/ATOwM9Y4y2N8zbBs3L5NM3ndc=;
 b=UedOe6cJw4koL0X1IO4qFJgHYbjd4c9qpWikMBE1LgPCPXx80Vp47UdRwyCmA87cuB
 pB1fi3AgF88jyMv/KJKnubye5+NduTzWmIAYnjx4tff+RgWdYCN5ExdatM7+7/HiZ0WS
 OeAqLfjDKtEqR4XIZCv5q4iXmogiUEKCsv7NnOHzE+5qaJAkXvHpOaZdvV5bIYWiptFS
 bilfCxf1A1PK/yz3I4zJxG0jI7saINXZLUSRypWL3Tz5Z6WlCGU6clwzpxiWiegtfypV
 9jF5QyI8jrwvYV26ai+Q82aT1uEt1TLL2+35TgD4TuFrH0QV5qVv5KPvc5itb7JeqynS
 M+ZQ==
X-Gm-Message-State: AOAM530DfHjCnw2WLXRpglYXSPGUdspcZ41hbsqs9Gw8CH0YG29jT/Wh
 w7Lv06qHnqcWgJoKJ4DyiDfGauIepDeHTEQ+rewqO4sIINQr49L6Hi9DrYUEncfcDpUeKaZH9+R
 AuYIG0F0EhiyZBlPfc2Gj4k7v/QmpVPU=
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr26595533edu.144.1627392241810; 
 Tue, 27 Jul 2021 06:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz5baIwDqTYWSquT37N66Ba1X7fw1D4ZBf6GSC73svOpd9BKlPfSHZ6TD5ABJqtlVmZzHilltzpaRnU3aMifQ=
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr26595516edu.144.1627392241641; 
 Tue, 27 Jul 2021 06:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
 <CAFEAcA8eEyhhV88RoTfSMnQb05uODYcL4RVHOzLaxPGPUUc_GA@mail.gmail.com>
In-Reply-To: <CAFEAcA8eEyhhV88RoTfSMnQb05uODYcL4RVHOzLaxPGPUUc_GA@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 27 Jul 2021 09:23:51 -0400
Message-ID: <CA+bd_6+zxLQP1XL_wXM3UZvbAZ6FvNspzSAV7XGqrEgfWjWFZQ@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 5:17 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Jul 2021 at 01:39, Cleber Rosa <crosa@redhat.com> wrote:
> > tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> > is currently failing consistently (first found that in [1]).
>
> FWIW I find that on my local machine this test is consistently flaky
> and always has been, so I just ignore any failure I see in it when
> running 'make check-acceptance' locally.
>
> -- PMM
>

Hi Peter,

Yes, I've spent quite some time with some flaky behavior while running
the replay tests as well. But in the end, the test remained unchanged
because we found the issues in the actual code under test (one time
the recording of the replay file would sometimes be corrupted when
using >=1 CPUs, but 100% of the time when using a single CPU).

This time, it was failing 100% of the time in my experience, and now,
after the fix in df3a2de51a07089a4a729fe1f792f658df9dade4, it's
passing 100% of the time.  So I guess even tests with some observed
flakiness can have their value.

Cheers,
- Cleber.


