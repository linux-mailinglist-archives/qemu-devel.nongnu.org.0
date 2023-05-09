Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72ED6FC35B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwK9i-0004e7-39; Tue, 09 May 2023 06:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwK9X-0004cb-Ut
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:01:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwK9V-0007Zf-93
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:01:03 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50b383222f7so8542947a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683626459; x=1686218459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0waNw8QfZtGvUnFAHT6nFszZ8Xke2PavESgDWvCj1hE=;
 b=M8bH2cgN3T89nEhZqBFKzLD5ZP1GGUpSpeve9pK8T6xBuHnBSW9UXefPlxu8oXXn+S
 Fc5kV0VGWRxXgKXsKBAiyR77/KXrlNjL66PXx9QidYbRFHgv8VeFAuPTdm6xq/e06JqG
 DjmGsS297VcfKeLsA11NKaenofLIz9utYCVEMkyvyAcdAd8F+pYJurRyy7H/F6C4UiQ6
 P+nUPXrij7D3wwlAbCuyj0DhRhG+rSuoVzWkNxFQmzJZhUDqPS8Uevxu3pDGVEIzbXVm
 0RZ1fc0n5JY+qBQ5IWtyGaTUZQfKtVcIiCW5g7L9odfKpUuHzO6yvlP7cTCcD863+SoN
 QVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683626459; x=1686218459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0waNw8QfZtGvUnFAHT6nFszZ8Xke2PavESgDWvCj1hE=;
 b=gncXc7AGQbPIqx1s0wAUKQxOZ1cCWX30MlRsQzPFe34UIepJ88bb5GgyNFt3r3APx1
 OPugoND3y6n+X551caxKC27DtZI8gsPFOSXNCL2iYFPjLDlZ9Ylenw/jvX0N5qPhAy8c
 dWfZL0Iw8tZQ/22oxkIVLj0TchzTshuvlL0daj6thfnG9Q0g2MkWLae1T4EdEmMKBVCG
 Pm94nFLitiWin4uiMMtkBPe2KUcfRNLiFVnxplxU0gYu68frcVJe5u3SOyZ2jPrRM5y7
 quMnDyw424FFSkrngQPvLZ80PooUhiPu87P8a8HAbHs7WgPcy9r5w4uFhEWV38jHdTmp
 50SQ==
X-Gm-Message-State: AC+VfDy9YQ9RgB3hG+QtLI6xG0fd4LgifUkKifWd4nYMvvWfjL0wWMC0
 HnngQxIfUBWPl+dNml5M9tUuUG2n6F/1gkiR4IdHWA==
X-Google-Smtp-Source: ACHHUZ5hqEMKV9p/wUJ4Yv6gIy5d3/cmUVuwNMnKbqIOZbUWHQxO0PvBpk7bEBwMP2jMS6S7SZD2YesuKGgizyZE64E=
X-Received: by 2002:aa7:c7d0:0:b0:50b:c62f:9ff0 with SMTP id
 o16-20020aa7c7d0000000b0050bc62f9ff0mr9977432eds.30.1683626459393; Tue, 09
 May 2023 03:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
In-Reply-To: <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 11:00:48 +0100
Message-ID: <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/9/23 11:27, Peter Maydell wrote:
> > On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> --without-default-devices is not about choosing to not build
> >> some devices; it is about making non-selected devices opt-in
> >> rather than opt-out.
> >
> > Hmm, so it's basically "the person doing the configuration needs
> > to know what they're doing, the Kconfig system will give them
> > no hints about what devices might or might not be needed to
> > make machine type M functional" ?
>
> It depends on what you mean by functional.  I would say you do get what
> is needed to have a functional machine, but not what is needed to have a
> useful machine.

If you need to pass '-nodefaults' to get the thing to start up at
all, that seems to be stretching the definition of "functional"
to me.

thanks
-- PMM

