Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA44217B9E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 01:15:18 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jswo1-0003qs-FU
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 19:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jswnC-0003R2-Ju
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 19:14:26 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jswnA-0001jH-Tp
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 19:14:26 -0400
Received: by mail-pf1-x444.google.com with SMTP id s26so5454055pfm.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 16:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oIL48ilkgfN+wYxdaGk48CigIEw5/Lv2OIxnAVxBt8w=;
 b=uZ51QiLZwr1TU7ISzAD6M3UKWIS960ftOFCMw6uRsYw5ToPE8inglXraBh1BKET6wA
 BTU2YjaHPE3UGKZRrHHG5jZRCQMf4TUphOru4LvDr0fh62P1BCDdiQmM7bLfmMRQEb7q
 aDzFO+mZo5W6Zhw/GqZ6ZPOshtvIUFPWF0b8vRviwp1mANtAbHtX+7esVG/SE77Yk4Qs
 7nNtVxgLzH9Hf+myOg6PRSBbET4tJKubsX6EUklwQ6RGGec+kgpFVYgMhgmEJUetyLD7
 SqXbKl3SDQnG1ridpmf6ifOP4ZKUxAAm/yTzQ5Ez4uP5C4mo9oDrm30/1naGsUu/44A8
 xDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oIL48ilkgfN+wYxdaGk48CigIEw5/Lv2OIxnAVxBt8w=;
 b=kNkZgOrD9zwyMfayJ6+OcQh7FnS7RPV9D4tQBuVWssAxaTBMYxw6mutsZNgqNwFHfq
 0+Ume2TQWfVF9UDGgF19Ohd2FKem5JPHgNXwE0sVgd5ti6L9TCMP2baN2xPYYNqz4B4C
 p16XqLwImHSs3AaVGZqdSKWxhP2CegveYVs8FrvPTUH+F0I5evXZr17mBpOjW9fUEUhe
 Igjqn8Lm06n8YTfQosQhLI8Rjus7E9XEBZl5eJdh5owG4ru2VJooGh+hPGVbQ5tBIBTl
 x+3KNRztNlPnjGVSy68iEuS2M1ZvQcqZvD+FbWhHLcm8ZRew9LxfLFb59DfIxeyyZVaa
 ltLA==
X-Gm-Message-State: AOAM531jnB9UO6tXt1+30Mq7BM1OesSt6ut7BihQtO3dInxhEl6GKlKn
 eGmNHTuUl/jBGxI+1asbM/Vu1xUw1Ma77sHdjsY=
X-Google-Smtp-Source: ABdhPJx7Be2ztVkv2kwpA2MZsmqb/U9shQjRTNgLttkls6aWOEPGYQlRRIInN/9KgbEVciC/06aywdnNmcsBlFe4DTw=
X-Received: by 2002:a65:6554:: with SMTP id a20mr41261263pgw.301.1594163663387; 
 Tue, 07 Jul 2020 16:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200706234737.32378-1-jcmvbkbc@gmail.com>
 <87pn97o93a.fsf@linaro.org>
 <CAMo8BfLH2jVLjbdMMWCCuhmh+i40NyHQFK-=bAUw3sSoAxwPww@mail.gmail.com>
 <873663nnap.fsf@linaro.org>
In-Reply-To: <873663nnap.fsf@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 7 Jul 2020 16:14:11 -0700
Message-ID: <CAMo8BfJkp3Dr+cg5aoovD+Key+p5hm4Y0dD0xmBS0um2fnCyzg@mail.gmail.com>
Subject: Re: [PATCH 00/21] target/xtensa: implement double precision FPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 7, 2020 at 12:21 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> Well it ran some xtensa tests thanks to the docker cross compiler
> support. Do you know what toolchains we need?
>
> Currently we have the following:
>
>   ENV CPU_LIST csp dc232b dc233c
>   ENV TOOLCHAIN_RELEASE 2018.02
>
>   RUN for cpu in $CPU_LIST; do \
>           curl -#SL http://github.com/foss-xtensa/toolchain/releases/down=
load/$TOOLCHAIN_RELEASE/x86_64-$TOOLCHAIN_RELEASE-xtensa-$cpu-elf.tar.gz \

Oh, that's a familiar URL. Let me do the new batch of toolchains and
add FPU2000/DFPU configurations there.
And this is tests/docker/dockerfiles/debian-xtensa-cross.docker, right?
I can add new configurations there as well and add one more patch
to this series.

--=20
Thanks.
-- Max

