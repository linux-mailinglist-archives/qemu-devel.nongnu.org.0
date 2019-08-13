Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054048BB19
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 16:05:39 +0200 (CEST)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxXQg-0007M6-81
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 10:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxXPZ-0006cL-MU
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxXPY-00047k-Oe
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:04:29 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35499)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxXPY-00046F-IL
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 10:04:28 -0400
Received: by mail-ot1-x343.google.com with SMTP id g17so21875184otl.2
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gqno2bwVp3LtKwfLy2Hjl9itq2o/QczhQjLnU8vsBL4=;
 b=OOeToIIHeBbpiiqqt8GAHSf4H3bezWYdmDJIlSdu5SnqzPLQZVT+PsAHOHeOGROi7B
 HM15ostnMv3vM+W274qnl+X7nkODsVPDYCZRD8S8Xz5t/vZKDjFnWhuGsOptf/KaRK8U
 Rsb3JDFKB2+vdpHfrHx/ocYys7iOqbM0qWoNc3m9tOF4WH7OICDDtn6ciMF6k1My4MEt
 jzVvHRz4B1Nfv9TYSL4euXRA7CgAUiOa0/Ptm8ysXclnklZ5xZealoEtGbxwp771VoZp
 o6eHQUFvrL/RX89lC2qz4D/xeQjTa9SYivuBTLSHMJMG/twMY/e/8YBi5ymqHH5BvqQd
 8New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gqno2bwVp3LtKwfLy2Hjl9itq2o/QczhQjLnU8vsBL4=;
 b=KUACMrvfW/meml+xMydCxjadoWH08xEgl2DckINul55+U9i//uf0AzshDSVoXB+iul
 blooayQSaxGfqjJKi0QSpU4qh7yswsujoS7NbjokK/DJZDTSnvzY5ZLLJFyN/xWpQ0sU
 XtpiN5cvO5sNUsIZb0zqmGudXsyFg1O+mEpcaDi324/zb6VlPJIyH2L2AoJ5YTP1Y3l9
 3EWkeBGG49FrB7qk2MDOpcu+uUgYitafmza+oXfUC5wZIeg70c528e5ovhjACiX1znyP
 2anA6osHZF8v9NAMt1OCa2oeLKqT5wHIyriXLtbS/wFZfP1hjZssj8FPFYtduJHqaG09
 I5lA==
X-Gm-Message-State: APjAAAV9U/QKTuV7s5eECvBTeXzJDr2pP8siRhZePLLG5qtltIL0OaEK
 XzJmziIvbcODRNsn/9EQC3OYpIWqpZzl+lJRybqZbw==
X-Google-Smtp-Source: APXvYqyEQ0l0HEiK5bTLyhHMXmNQr4QW94Gi2VxYvhpmjbOO3e6t0Mi9yH6RWEgaelWExPWK0hODAaPN06TGDHymv6A=
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr5199874otc.135.1565705067547; 
 Tue, 13 Aug 2019 07:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190712133928.21394-1-philmd@redhat.com>
 <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
 <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
In-Reply-To: <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2019 15:04:16 +0100
Message-ID: <CAFEAcA8axpVeXjWV+2cz8PL-gR_6GvU=i0BMt01pYhff_1LOwQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Aug 2019 at 15:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/15/19 3:13 PM, Thomas Huth wrote:
> > On 12/07/2019 15.39, Philippe Mathieu-Daud=C3=A9 wrote:
> >> A series of obvious patches to build without the deprecated
> >> bluetooth devices. Still worth for 4.1 or too late?
> >> It is clearly not a bugfix.
> >
> > I wonder whether this series is worth the effort right now, or whether
> > we should simply nuke the bluetooth code after 4.1 has been released?
>
> Well, perfect is the enemy of good :)
>
> This series is already done and is an improvement to what we have.
>
> Regarding nuking it, it depends on the Nokia N-series boards, they might
> become useless without BT support.

Er, they're not useless at all without BT support. The BT
hardware is a really tiny part that I doubt many users of
the board models ever used. As long as we retain a "simulate
doing nothing much" model of the BT device to show the guest
I don't care whether the BT backend code disappears.

thanks
-- PMM

