Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1657A65A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:19:55 +0200 (CEST)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrp4-0006rW-Fk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDrlX-0001mB-SV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:16:15 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDrlV-00037W-Vc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:16:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0613B81CB5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 18:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DBC341C6
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 18:16:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FnUhkT4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658254566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xJPxEslSIwh6sABS9O8DJvgfd4K7yRrW+gnL2IDNEEk=;
 b=FnUhkT4wjJ9KetChpR0CW9BElLKbOHbdc6QZNoZ7Imuq/IqBAx3ch4Qc5GtV7nqqQ59eYr
 4T9ufPy0PCJa/i7dBdB0wNlddsHjNTgJku5FrZw4QlywucEPBKUw92RsmGKwRTYS9HbfbP
 GcQGHzdMqZeXO5P7BG4Vv3kA1kXBEF4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f852121c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 19 Jul 2022 18:16:06 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id w29so10944835qtv.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:16:06 -0700 (PDT)
X-Gm-Message-State: AJIora///WDBDwjLLl+TtFXmq0A6XjwEnlDBG0BoUVeciLy8rLQ47T5h
 NjFbq0ZEfsM/N/AWaLU/aBoEE/4y2ROoz1FKe1g=
X-Google-Smtp-Source: AGRyM1tisQSVKcUb2NMIegrUdXpuvBkLROZ76yH3M77IYyzxVCnqBUkbcSyIE40T9FrEgbpQ42miSfTKbyRGjOt2tO4=
X-Received: by 2002:a05:622a:1184:b0:31e:aed5:9859 with SMTP id
 m4-20020a05622a118400b0031eaed59859mr25598154qtk.288.1658254565783; Tue, 19
 Jul 2022 11:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220719093439.528810-1-pbonzini@redhat.com>
 <YtalBPp+QKS0wKWs@zx2c4.com>
 <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
In-Reply-To: <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Jul 2022 20:15:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
Message-ID: <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Paolo,

On Tue, Jul 19, 2022 at 8:15 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 7/19/22 14:35, Jason A. Donenfeld wrote:
> >>   6 files changed, 19 insertions(+), 6 deletions(-)
> > Considering the subject line, I'm quite distressed that the i386
> > setup_data rng seed patch did not make it in. I just resent it to the
> > mailing list [1] in case you missed it before. Do you think you could
> > queue this up ASAP?
>
> Sure, no problem.  Unfortunately I was on vacation around the time you
> sent it first.

Excellent, thanks so much!

Jason

