Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C352B912
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:52:54 +0200 (CEST)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIEX-0003Gy-2c
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrI7L-00085k-Hx
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:45:28 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrI7B-0005tr-HW
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:45:21 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f83983782fso21177687b3.6
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=DOk/qBx6CR/E5thDmJakrzJzG3N8bnuiBmzG+2mcKuw=;
 b=pMc4+IlM3LZWWpY+A7JvfxUHz8ekRsy4vNEyAp5IL8bFfdbPtzkptZ7ToGLDrcVRqo
 dqlInWeySsq/7Jr8ktAiJZ09bLndX+7/Y4iNNgi0Ruz72F7NQ9FRgt+be1XTIZMnBBez
 GHwue/eAORwA7q+bnLjYaf09Buh5TIl69UBnRiAxEPmjDn1+edUHPJbhkHoWxMFHRIG+
 avH7D+o1l8iAAMDFZ+SelqGhcCutYv1MxKNLVoqajNBiTeZLQIsOxnddLGlGBuH9u8Zh
 Rg2xMGnllqIF0MY9zB3xhEVuKMS9qoInxDV9FFAHPP+LsRBsWANjx+cT2G7Cm1Fdsohr
 pymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DOk/qBx6CR/E5thDmJakrzJzG3N8bnuiBmzG+2mcKuw=;
 b=y49J2GAMa4Ewez8IED4514oJ7KceK7S1km4e6JCEo2/MLvlr+uasn7UuxGT9qRK/c3
 kelS66avzr0QlizxpdpYt8SzLoNhUi/ltl6dj1jhqGIm6v/1RyTVoHPiseZbTngZYy/Y
 6ByOfWihzmWAtSuMKThPslCOV6LaZqmxwLfCDSBBri+yWskjZrraNT+NPbgOq1ozl9tH
 EcvghVHmt44i17C8O4zo5Yw2GSAGnXutsaKSIDAjTFrO/YYTjpPW3mBxgSgtolDzH3Tl
 7rTEPLbzeu+ANww/LhhDZSv41lJzOlp2bep3LsFgqNpYxHrm7XLu/XvTqQsxkmWSGWjH
 yj5Q==
X-Gm-Message-State: AOAM533RTSy0UO8rfH6tUkkyB3FnRmLayiSMU4wuH78Ex73ieyaFLu3V
 QBnDOvRN0zM91OtRnFgfOZFTbSNW2kk5vIQOmpFGtA==
X-Google-Smtp-Source: ABdhPJynCw04e4sf2MsGWKyiofLoDdDiVsJs/Qxu/4NFTytGVli9L2DA2TRDwMRQNUYfH/vDi/0m/83fz8gY4G+thN4=
X-Received: by 2002:a0d:caca:0:b0:2ff:47bc:ed48 with SMTP id
 m193-20020a0dcaca000000b002ff47bced48mr1563369ywd.64.1652874310937; Wed, 18
 May 2022 04:45:10 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2022 12:45:00 +0100
Message-ID: <CAFEAcA958zYQrgncpJWpSpjoYoL-VC3-YjObhD96JL87Qh65ww@mail.gmail.com>
Subject: CFP Reminder: KVM Forum 2022
To: kvm-devel <kvm@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 rust-vmm@lists.opendev.org, kata-hypervisor@lists.katacontainers.io, 
 Libvirt <libvir-list@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

================================================================
KVM Forum 2022
September 12-14, 2022
Dublin, Ireland & Virtual
All submissions must be received before
 *** Friday June 3rd, 2022 at 23:59 PDT ***
================================================================


KVM Forum is an annual event that presents a rare opportunity for
developers and users to discuss the state of Linux virtualization
technology and plan for the challenges ahead. This highly technical
conference unites the developers who drive KVM development and the
users who depend on KVM as part of their offerings, or to power
their data centers and clouds. Sessions include updates on the state
of the KVM virtualization stack, planning for the future, and many
opportunities for attendees to collaborate. Over the years since
its inclusion in the mainline kernel, KVM has become a critical part
of the FOSS cloud infrastructure. Come join us in continuing to
improve the KVM ecosystem.

This year's event is in Dublin, Ireland, but it is a combined
physical+virtual conference: both speaking and attending can be
virtual if you prefer. For more details, registration, travel
and health and safety information, visit:
 https://events.linuxfoundation.org/kvm-forum/

For more information, some suggested topics, and to submit
proposals, please see:
 https://events.linuxfoundation.org/kvm-forum/program/cfp/

We encourage you to submit and reach out to us should you have any
questions. The program committee may be contacted as a group via
email: kvm-forum-2022-pc@redhat.com.

Apologies from the Program Committee for not posting an
announcement of the CFP to these lists sooner.

