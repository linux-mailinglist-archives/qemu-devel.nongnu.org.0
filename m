Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C557E71F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:14:52 +0200 (CEST)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy6s-0007Zj-V2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oExzi-0002NF-Pi
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:07:28 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:49054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oExzg-0006Sa-GP
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:07:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7073BB829D9
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 19:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCFEC341CA
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 19:07:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pYYCrl3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658516838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AV9+EqH94WDqFtbFHV8s0t7ETEnklgEUOkzd+lxCwOA=;
 b=pYYCrl3EPVIdzif0z3oVuBAZH8xW1h+L3VYkXYb/Xkj+oJP0rk5KYBaSz7gW/v/3QT8sjZ
 wN1QZsP60TEHyt7xSrfyHw7Lnv/75+14y7dKoa1C6HYGK6txdgCrX1AeCxJwQB1A5Uqp6o
 kinUD0SmplcFqIJOmFpnrWCIRb6UtPc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4dd12a14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 22 Jul 2022 19:07:18 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31e623a4ff4so57252927b3.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:07:17 -0700 (PDT)
X-Gm-Message-State: AJIora81L3u6v5U+uemMVcKhjtfaq8xKGOLtZSgxZBvKSkYcT2850XnK
 Hnd9nwn4gz1Pt0kKC4+OMVDz8gfZaUfatquojgE=
X-Google-Smtp-Source: AGRyM1sHozq0HueGKgkyVve5WLl7iSVNye5Rk8ZhypRrELa/CrQfe03fZJ0W/b0z+ag/AnVoZFOCHkZ9hmysUB+/xrU=
X-Received: by 2002:a0d:c884:0:b0:31c:c31c:87d9 with SMTP id
 k126-20020a0dc884000000b0031cc31c87d9mr1141881ywd.124.1658516836730; Fri, 22
 Jul 2022 12:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
 <87tu7az28k.fsf@linaro.org> <Ytm1KiyFGNqAo/Af@zx2c4.com>
 <87o7xhscey.fsf@linaro.org>
 <YtqJaf5gSyj9cVt6@zx2c4.com> <87k085rz6b.fsf@linaro.org>
In-Reply-To: <87k085rz6b.fsf@linaro.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jul 2022 21:07:05 +0200
X-Gmail-Original-Message-ID: <CAHmME9rnzqvm-vFa43hXY9fnrvGK7iUOR5zph=2w-OBKdPfyVA@mail.gmail.com>
Message-ID: <CAHmME9rnzqvm-vFa43hXY9fnrvGK7iUOR5zph=2w-OBKdPfyVA@mail.gmail.com>
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org;
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

Hi Alex,

On Fri, Jul 22, 2022 at 4:37 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> That sounds suspiciously like inventing a new ABI between QEMU and
> guests which we generally try to avoid.

Well the ABI is just the "rng-seed" param which is part of the DT
spec. But I can understand why you might find this use a bit "too
creative". So no qualms about dropping it.

Jason

