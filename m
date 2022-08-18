Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200A598899
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:23:25 +0200 (CEST)
Received: from localhost ([::1]:38664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiIl-0001aA-L9
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOiFU-00068v-7l
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:20:00 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOiFO-0006O8-I4
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:19:58 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3246910dac3so54086487b3.12
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Lk6fHSRFoGl7Z7855YfvNidtexf4QuouIGqk9100AAo=;
 b=ijL3nDoYI50fVSSPuvBatxzzw9FuPzUCZ58vd6Ng+1KEfmJGoOaOLKQ4EL0O1hTBRl
 9iqISZb530qrtda10+kEx7w+NMahMVYMVS/o+XBf2Kx/5179pfJ9lS3r96I948cmCA99
 hqHx0hMM58wV3SPLGWeSOoX8WwkaVfO7+tPY8wKigenYUECgoCumxPXwAAGM8k4Yi5Sm
 WM4R/pqPd+EMn242ciuc+z5TP5Ar2ZTCWLw67NAYlJ/csFiKYm2csg3AZyuz7yU4nYCq
 mdgwIhGFk/Gnjt37466ezEXeQiZYZp6HNTvHh/slqwKPfjgZmAJCyr0jfc3LruO/KDJa
 ct1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Lk6fHSRFoGl7Z7855YfvNidtexf4QuouIGqk9100AAo=;
 b=y0zQfjinJWg2kybeT+3Zxm/bOwlbMVBKLy8q9Z/uQn0qw4RVQFGsiTEIAhKLB2BSpq
 06rPo6tQJqrGgm/tgHyl8mv3+Ls0UjQkYNvmg9kTvDB1VKuYYYo0L7LRwTB2xX3hceQ2
 8a5tdr8i1g6uLy7T+JPeUd3ovn3h8TNjx/bJKEO/Q3DWayJkXXdFfg2hr0Ly9HI9Nqfx
 d3e5vOEW4/7oahskd9uYW8LEnuD7pW6CNExcYOt71cuxovRXoAu7JJiiiHOswrU0Jgs1
 vgCoMT60I9aAdvp0lMm3Fzv4mkb4tKVZPx723WtGoTLS6i+Bc1t8+zuNM0jeHCdmMPLB
 KKYg==
X-Gm-Message-State: ACgBeo1hOgFNKvNpzPux0fEj8KaIymFBBZz2lCitCqD8TaxEWyZboH/h
 gBLy8AfxYKaNq9SeH5C0W2uic61hN+HH8ripzcMHoQ==
X-Google-Smtp-Source: AA6agR5+hSlQmM5HOb4JpRHr0Rb9TyUPp96AC63PHF6OIbuCypdXDwoASBj/3O2LSpu+wNauQB3A0R+IhNO7ZBUnqFQ=
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr3382104ywb.10.1660839592980; Thu, 18 Aug
 2022 09:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br>
 <b2c49e7f-9b62-86bc-d714-77367df702ca@eldorado.org.br>
In-Reply-To: <b2c49e7f-9b62-86bc-d714-77367df702ca@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 17:19:11 +0100
Message-ID: <CAFEAcA_8JUgKPM=XF4_94ecJtgrt1Tz1RcMHqZHbVpn_bWwMHQ@mail.gmail.com>
Subject: Re: Using Unicamp's Minicloud for the QEMU CI
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>, 
 Rafael Peria de Sene <rpsene@br.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Aug 2022 at 17:11, Lucas Mateus Martins Araujo e Castro
<lucas.araujo@eldorado.org.br> wrote:
> Lucas wrote:
>> I would like gauge the interest in using Minicloud's infrastructure[1]
>> for the CI, talking with some people from there they are interested.
>> It has both ppc64 and pp64le images, multiple versions of 4 distros
>> (Ubuntu, Fedora, Debian and CentOS).

> ping
>
> Any interest in this?

PPC host is something we're currently missing in our testing, so definitely
yes in principle. I don't know what the specifics of getting new runners
set up is, though. Alex ?

thanks
-- PMM

