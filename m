Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4D7337EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:08:53 +0100 (CET)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKRc4-0001NO-Bk
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKRaS-0000JT-Od
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:07:13 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKRaN-0000PC-G7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:07:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id o19so4696533edc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 12:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HVSeJySRJpH9aibVQ3gppwY4F+ij90q4Aei1vEJzqvk=;
 b=yLt57EMAvHz9n7H1ZwLcRFAyCwojYpX/Ps7+prvaUJGFpz3a3e0dKFpUYcMFbk/osB
 xSukO6eTFFc+uju7ho94Kmrk+N965uHOheY05H+uea+3p5PuY4d7WaEnuZcYYkwBP7As
 fisypRbxW0CVdBqmMD/p8hjyeaMUuxVX2wSB5Iyo0PCL9CiDXHcXxZTok25O7qh9yfvM
 z/247QLbvZdIi8U+UIf/xw52jwaU6GTyPvdjYzySRhq9LVg966MNK3MUz6cIomNGKQ8R
 GtB7Cb6s0X0uknk9mJ/pvvhpG4gOY516qmCF8+nb/stWs5vOSGFzVzJsG671/ur0UMFE
 Fmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HVSeJySRJpH9aibVQ3gppwY4F+ij90q4Aei1vEJzqvk=;
 b=k94qdgZ14o1q61pOXjdaFEdXlzJ9Frga8K1+9U+PHbxyWcjzr+eYUFbhX2fP0IzHAC
 yOv+/7uJk4QDEbWHZ5QetR0mCPn3/17Cpkk985DdEvLmHU49FU083n1fYxbx/pLZDLsU
 wf+zLEnb4BvZHwKpUr0ptaPoWJO9SWYHTciS0dBaiKdOTrC0KqFG438VrCseB28p344r
 hcvc2jjkI2DafA9/f1nUdBikVi2H8rGsGtRt2kmSlXYxMTmZz2Y6bM8AnysriOIIocfY
 IQ/c+K9Y9xPLqbOw5Xg3QULURNY0ifRahSBtcwq+Mzupg/jIduqjj+EisXUrp55twVzY
 jHDw==
X-Gm-Message-State: AOAM530EBncjEAQ0mauxJ2f8xJ42Al8WnhKn/LxnxJcWUroY2TAls1Ki
 Usg3zeKqV8ZOWRhitfMxHQ5CaA==
X-Google-Smtp-Source: ABdhPJxwjjL++ImNJDh3jsZBH7Zlxd6JXd6soAsQz2zVt8D3CYwGJAZTLevxVa3MwQNAzOwBXH2BCw==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr10412067edu.268.1615493223245; 
 Thu, 11 Mar 2021 12:07:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm1733504eji.111.2021.03.11.12.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 12:07:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 542551FF7E;
 Thu, 11 Mar 2021 20:07:01 +0000 (GMT)
References: <20210309172127.20470-1-alex.bennee@linaro.org>
 <CAFEAcA-hiMrr4gs_Z6aEDzXSdLwYDqHCbzp8T0sp4eYhOka-Dg@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/4] semihosting/next (SYS_HEAPINFO)
Date: Thu, 11 Mar 2021 20:05:42 +0000
In-reply-to: <CAFEAcA-hiMrr4gs_Z6aEDzXSdLwYDqHCbzp8T0sp4eYhOka-Dg@mail.gmail.com>
Message-ID: <87mtv978uy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 9 Mar 2021 at 19:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Hi,
>>
>> Hopefully the final revision, instead of hacking about args to
>> reverted to the orignal code (with minor tweaks for args). Still based
>> on my in-flight PR:
>>
>>   pull-testing-docs-xen-updates-080321-1
>>
>> which already moves the semihosting code out of hw/. Please review:
>>
>>  - tests/tcg: add HeapInfo checking to semihosting test
>>  - semihosting/arm-compat-semi: deref parameter register for SYS_HEAPINFO
>>  - semihosting/arm-compat-semi: unify GET/SET_ARG helpers
>>  - semihosting: move semihosting tests to multiarch
>>
>>
>> Alex Benn=C3=A9e (4):
>>   semihosting: move semihosting tests to multiarch
>>   semihosting/arm-compat-semi: unify GET/SET_ARG helpers
>>   semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
>>   tests/tcg: add HeapInfo checking to semihosting test
>
> Patch 3 never made it to the list or to patchew:

It's on the qemu-devel archive:

  https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03051.html

AKA:

  To: qemu-devel@nongnu.org
  Cc: keithp@keithp.com,
          =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>,
          Bug 1915925 <1915925@bugs.launchpad.net>
  Subject: [PATCH  v3 3/4] semihosting/arm-compat-semi: don't use SET_ARG t=
o report SYS_HEAPINFO
  Date: Tue,  9 Mar 2021 17:21:26 +0000
  Message-Id: <20210309172127.20470-4-alex.bennee@linaro.org>
  X-Mailer: git-send-email 2.20.1
  In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
  References: <20210309172127.20470-1-alex.bennee@linaro.org>

>
> https://patchew.org/QEMU/20210309172127.20470-1-alex.bennee@linaro.org/
>
> Could you try resending the series, maybe ?

OK

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

