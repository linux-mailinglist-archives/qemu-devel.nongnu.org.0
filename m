Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E71457331
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:37:55 +0100 (CET)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6te-000870-My
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:37:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6j6-0006Gw-5f
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6j0-0005zu-Oe
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637339214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ToCcad016m2vwF1WcbT4JiWqSR4EvRlYA1HcRAProR8=;
 b=Y/IYXgUbIxZUnftMbbvdB1Xu8+LIoejHlX4EHsuf7yj8sBUaIzVzirkzlbkGuJPL3i98SY
 L2rYfgCU5ddkDg89KxM1Wh+p09dJGDd5LQWHWUOOwx1IimpxPRPaz8rFnXf6YxM3yWqt/f
 ki2ZBV7t+q4VMuCHxz5DSjyudBmbG7A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-KUDaLAu2PF2gQPxhvypB2A-1; Fri, 19 Nov 2021 11:26:52 -0500
X-MC-Unique: KUDaLAu2PF2gQPxhvypB2A-1
Received: by mail-pf1-f200.google.com with SMTP id
 z13-20020a627e0d000000b004a2849e589aso5935855pfc.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ToCcad016m2vwF1WcbT4JiWqSR4EvRlYA1HcRAProR8=;
 b=AUOva8asgGb7MXQ8Q6yBfQzbYpHKN+Jm9pJ/z94DxW2xpZggdTXMYpbSKg6VKK1JC9
 MUkMjaoFT1SoU06rR0q3TZFOhUnYdUWl6JDOKOjBcb4pPlIYxzrguxMKlqbmLM+96C8H
 u3YEIMZdE2FkIbmO+Fjt+JuLCCgNKPv9GArZ0VS+pWw7vztR/rVlu/PAmONDPYxVE4W9
 vpXQz4FggUuyjEzoMMuDiOVBGlGltfwI46iZGPr/R4wfCK+2FZTBpWOztpbTAYObpQQU
 DGDkdNsOtt7zpIGLsf4bP8uFxgVGb2YpJoHzmL/0cGNHksirKJnvGjLL8BbTHaSh6BQd
 O4vA==
X-Gm-Message-State: AOAM533pREoBIOtYhuKGhxvJzAVKog/f0NlP4f/EWipE3KOmAYYytuSn
 V8ewRs7Xo6UbKJvhMTZzAW+Je8D6ahXl9GXOgR/3KVoJP2c3rIJFEmTqfByynQiaith7izWG1A9
 KP1nCRIMzfFQrOSi2H1pLGvXmLvqtx8w=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr953721pjb.203.1637339211572; 
 Fri, 19 Nov 2021 08:26:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC/UMeOl4Sn+jTWiBXUuEtMbz6x4tKzqP7rHVyU/pF6lFDv4YVGUFaM6E2baAIHHd48KeBouX1/9+wdPcCMs4=
X-Received: by 2002:a17:90b:1057:: with SMTP id
 gq23mr953671pjb.203.1637339211282; 
 Fri, 19 Nov 2021 08:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20211119135348.407679-1-farosas@linux.ibm.com>
In-Reply-To: <20211119135348.407679-1-farosas@linux.ibm.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 13:26:25 -0300
Message-ID: <CAKJDGDY8p+5sNVDOKMjmJkWaiYSQtgDy3AffnzfMtFrRp5s5nA@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: ppc: Add smoke tests for MPC7400 and
 MPC7450 families
To: Fabiano Rosas <farosas@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more comment, sorry.

On Fri, Nov 19, 2021 at 10:54 AM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>
> These tests ensure that our emulation for these cpus is not completely
> broken and we can at least run OpenBIOS on them.
>
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> ---
> Note that the 7450s are currently broken, depending on the fix for
> https://gitlab.com/qemu-project/qemu/-/issues/86 that is being
> discussed in the thread:
>
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
> ---
>  tests/avocado/ppc_74xx.py | 134 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 tests/avocado/ppc_74xx.py
>
> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
> new file mode 100644
> index 0000000000..72b99d39c0
> --- /dev/null
> +++ b/tests/avocado/ppc_74xx.py
> @@ -0,0 +1,134 @@
> +# Smoke tests for 74xx cpus (aka G4).
> +#
> +# Copyright (c) 2021, IBM Corp.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado import skip
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +
> +class ppc74xxCpu(QemuSystemTest):
> +
> +    timeout = 5
> +
> +    def test_ppc_7400(self):
> +        """
> +        :avocado: tags=arch:ppc

All your tests are using the same "arch" tag, so you can define it in
the class and avoid duplication. This is more aesthetic, so it is up
to you.


