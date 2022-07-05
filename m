Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8C56715C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:43:26 +0200 (CEST)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jlt-0006vD-BD
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jjR-0005Hx-A0
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:40:53 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:42716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jjP-000620-P1
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:40:53 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ef5380669cso110899397b3.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hF/oyge82bS6Khc2l+ZQrcYJpr7mX3uhTPbJFVcsAmM=;
 b=KaSc0XH9ByAihLNI6SmsPNIaRssLXElS5Ek8U8uyR6kr+cMEwjCQ5NFdP5Ofscjjsh
 ygfcH4xslnO1eYxvpkOF4Cn2vFnz3ibsI3zVvz3L4TTVzX/EdXyA6vh0BTFZJi7cfSYd
 2CmVwrqJWwLovpAkieqst8q8rkqVRHQk1kwD4g+6nn96Yl3cta5JQA8Z9EYbucqdcWFv
 UVakm/AjPbtmgSOrORuCBKnjF9oVZUA9puclrB6CIPFfnZcfrvFTGMCnFvq6vvitz6Vg
 jJo3RC8Vzyx+KoNTDd8Ml7ORbM8G8nd+wazhfAdvrg3i4iRGZwO1YMV8lnnVlAgkPlZ7
 veRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hF/oyge82bS6Khc2l+ZQrcYJpr7mX3uhTPbJFVcsAmM=;
 b=C9k1jTNYrdSmc7mNbYJkp2y2uM0VPwy6J823lp0KX633JCFUEvv7eUCMzIXI2J4xxX
 euJnl3sdacaNDOLaJZzawWiaBOmtfKAIWGlZJoob1UnOPApcnS1O2Iyr5Tc5PWh/9mDg
 /caOi96qbv62xbVCfq/vDRb5LIx6txsbLBIpKw2ENaj6E+Cb5BpZw0CM+d6Vq0xETJ+A
 ZGcHZWKpPmIamEMXqCX8oj34yLOh5CyVenN1+ph2Pxl4ycBC1Vm7Fd9364PSKhpdQvsq
 A7I2tqMf6GvhzhO44iNGskx1BzLXk0zuIKE6h9aAJER6YRRPFwcobjAD3f85IkhBjCht
 sfRw==
X-Gm-Message-State: AJIora+nPBK53lpr0FCBaCPiwPAudSW9LjWWrnomg3U5kiUvdQQwoiFG
 xq4XndFUhh0LtrSHA0wS403K8BdWerD/YuVT/yYVTw==
X-Google-Smtp-Source: AGRyM1sg9nAKTD/WIkwGV+++aND2JmPcDip4S6QU+zW4JWf2jlnIyimk8BDFph+PCLOxZimz8MY67qM4ucdJT+ZRvGY=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr39363618ywb.10.1657032050587; Tue, 05
 Jul 2022 07:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220704224844.2903473-1-iii@linux.ibm.com>
 <YsQ1fuMRPpA+9AzX@redhat.com>
 <CAFEAcA-4=A6NWrpCo5=cBO=v2-GVwK+b5RcgFiJcZN6e-Kb=GQ@mail.gmail.com>
 <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
In-Reply-To: <9dc00e0032b3d753a18f2e9bbec4554402dc6aa4.camel@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 15:40:10 +0100
Message-ID: <CAFEAcA_Twju4rnn0f97nEshorwbaDK2n0vcdMXDWcwuuguikzQ@mail.gmail.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 5 Jul 2022 at 15:37, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> On Tue, 2022-07-05 at 14:57 +0100, Peter Maydell wrote:
> > On Tue, 5 Jul 2022 at 14:04, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> > wrote:
> > > If we put this job in QEMU CI someone will have to be able to
> > > interpret the results when it fails.
> >
> > In particular since this is qemu-user, the answer is probably
> > at least some of the time going to be "oh, well, qemu-user isn't
> > reliable
> > if you do complicated things in the guest". I'd be pretty wary of our
> > having
> > a "pass a big complicated guest code test suite under linux-user
> > mode"
> > in the CI path.

> Actually exercising qemu-user is one of the goals here: just as an
> example, one of the things that the test suite found was commit
> 9a12adc704f9 ("linux-user/s390x: Fix unwinding from signal handlers"),
> so it's not only about the ISA.
>
> At least for s390x, we've noticed that various projects use
> qemu-user-based setups in their CI (either calling it explicitly, or
> via binfmt-misc), and we would like these workflows to be reliable,
> even if they try complicated (within reason) things there.

I also would like them to be reliable. But I don't think
*testing* these things is the difficulty: it is having
people who are willing to spend time on the often quite
difficult tasks of identifying why something intermittently
fails and doing the necessary design and implementation work
to correct the problem. Sometimes this is easy (as in the
s390 regression above) but quite often it is not (eg when
multiple threads are in use, or the guest wants to do
something complicated with clone(), etc).

thanks
-- PMM

