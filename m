Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2F193E28
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 12:47:52 +0100 (CET)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHQzH-0003uG-22
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 07:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHQyB-0003UF-Lr
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHQyA-0008Sm-6h
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:46:43 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:40059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHQy9-0008SO-Sj
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 07:46:42 -0400
Received: by mail-oi1-x230.google.com with SMTP id y71so5167406oia.7
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jxwT8PWUXBBGZbam0ZVazsD28qGL4Kzog1zA7bh9gAA=;
 b=uUe22/+LJT+5HkzhCzc6XorWkXxM3+yFHV79SQzQgNV8CFwQgCeXlb4vCHv30WTGFd
 CoUpgmAisG+9WUyQV/0pixrEKPSn7kVbAbq127hN8dj6yPa9wjaayM5f3gYvq+t7+BM4
 u4aTiiuNlx4Q0//Nkmud+c0So9n9W15QsTyJMXhXNwiVQyBoCtc4CRHqndE2o9P9+fnC
 BTCvw7oHX+VM/dQR6WKHKbE2qwrhdM7pe27vk1s3pJBLyiwZ9tUdz0o7wFlP5nLkGIsC
 fsSgFB1qj8tVKKf3fHW/hF3YE3HKP3UDyatWyONWJzkDCwE9CD35rkHjVBK9NmizMPZk
 inYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jxwT8PWUXBBGZbam0ZVazsD28qGL4Kzog1zA7bh9gAA=;
 b=LuSGHPnqmswRIrAjLPbvIKkt9RdJjoIQBqHWs6QVNglwfL0TBqmeO1ZlbWI9fnA3Bm
 /tvgp3jkJNVw4EY3NbAFt38Iltb3cBdJ15vsfO1YgT7ZgweRQuv4eMBEff4aFEwUu6Lw
 xIxEqSG+YrPWk0cRGkose2uw306vyQ8oWD1JiDQDMTDp6oImJ40o7PerKjvvmdPfJuNp
 jLHRyzyXf0NCoe6oU2E9/+HzIt94N01OlBFjmwruVbe84kI+dtw1BPLBCmM2NcYQTp5M
 ZlK+5qYwPH4u6VTZgz+cf+EyEcsvtyGXAG4P4cqnUmYipK4TMtz4til6yV1vvwD2z8JD
 9zsg==
X-Gm-Message-State: ANhLgQ2SdONNABEDVvAPdzPb2zzKE6FpVecQjx9ntLPxQ9K51AhgMyRs
 1GnK8DzKRXLI4ICOyiyjOBinbJvp3NcW2UDmDyL3aA==
X-Google-Smtp-Source: ADFU+vuBrCtZ7AQLblKNFDZkutGSF0sJdYm/rf+/IIf300q8JM3k/feal1693uI8zZXrllRInS8AZ9gMQsZAlhd/uvM=
X-Received: by 2002:aca:c608:: with SMTP id w8mr1458631oif.163.1585223200856; 
 Thu, 26 Mar 2020 04:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200325151543.32478-1-alex.bennee@linaro.org>
In-Reply-To: <20200325151543.32478-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 11:46:29 +0000
Message-ID: <CAFEAcA-GgfeswdrGBjCmFyc1DzPyVpsYC5sopze3MDc6vQzpwQ@mail.gmail.com>
Subject: Re: [PULL for 5.0-rc1 00/11] testing updates (+ one mttcg change)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Mar 2020 at 15:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 736cf607e40674776d752acc201f565723e860=
45:
>
>   Update version for v5.0.0-rc0 release (2020-03-24 17:50:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-250320-1
>
> for you to fetch changes up to 6a5970988e7c9ce7f9fa9747397b63e8455144c6:
>
>   .travis.yml: Add a KVM-only s390x job (2020-03-25 14:40:14 +0000)
>
> ----------------------------------------------------------------
> Testing updates:
>
>   - docker updates (various dependencies)
>   - travis updates (s390x KVM build)
>   - test/vm updates (NetBSD -> 9.0, FreeBSD -> 12.1)
>   - disable MTTCG for mips64/mips64el

This produces some new warnings for the freebsd test:

In file included from /home/qemu/qemu-test.XaCd3t/src/net/netmap.c:36:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/sysemu/sysemu=
.h:5:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/qemu/timer.h:=
4:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/qemu/bitops.h=
:17:
/home/qemu/qemu-test.XaCd3t/src/include/qemu/atomic.h:211:9: warning:
'atomic_fetch_add' macro redefined [-Wmacro-redefined]
#define atomic_fetch_add(ptr, n) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CS=
T)
        ^
/usr/include/stdatomic.h:350:9: note: previous definition is here
#define atomic_fetch_add(object, operand)                               \
        ^
In file included from /home/qemu/qemu-test.XaCd3t/src/net/netmap.c:36:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/sysemu/sysemu=
.h:5:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/qemu/timer.h:=
4:
In file included from /home/qemu/qemu-test.XaCd3t/src/include/qemu/bitops.h=
:17:
/home/qemu/qemu-test.XaCd3t/src/include/qemu/atomic.h:212:9: warning:
'atomic_fetch_sub' macro redefined [-Wmacro-redefined]
#define atomic_fetch_sub(ptr, n) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CS=
T)
        ^
/usr/include/stdatomic.h:356:9: note: previous definition is here
#define atomic_fetch_sub(object, operand)                               \
        ^

(similarly for _and, _or, _xor).

thanks
-- PMM

