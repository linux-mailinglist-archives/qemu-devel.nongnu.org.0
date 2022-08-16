Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD5595D91
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:42:40 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNwq7-0006Qa-0C
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNwom-0004m4-Py
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:41:16 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNwol-000557-9K
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:41:16 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-32a09b909f6so151954377b3.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=oshouHDwubFlJXg2xEAfcCikzQKWZyD+FpOmT6bY5w8=;
 b=t792caD5e7qCYcWDitDSzvsDj6QnsxKT0w/5M2IiJJYCUE3+soL6QDJQHv2+NRKsIL
 Z83S01EBGWSIwu65AAOYKwaHwmdTIxUVrjLee858Wds3UPcPmR0hJb2/rlXUUPwBv65f
 Z7Qq6jZges6uRg9GLgZwEhJw15yHEECzC5Bh1nS1aTn6sGQESbxRKi0YStqcIfkNra5w
 Um8843Xoc51nl+22NYH+keE4hbetUn47TOdRG1lW6oOAtlDMHp0Wpe/LzASZw5tLViAG
 19XPJen78e58Ht9Gk+oOunv90/pN/DT0CtjzH5p0xtp16czC0nQeaEtvEY8WMsyqS1Pq
 5Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=oshouHDwubFlJXg2xEAfcCikzQKWZyD+FpOmT6bY5w8=;
 b=ge8E/cHgFGd5VYNxPa5iejSATpdV+YLjIizgx7DG1lhwcWYtBu/oMECb/ptkwQh0gD
 CG1fQOUGfrosclBSmNXuqE9Gd10c6O47GvsjS7eOte5AptT9GHDEjpLnOJVNmpt5XK66
 nBBXXb8+BsLhSvsGjLa3yCf++ynDYApd8ZgIaC/JHmNes2n7IpncrkDB/E85qf+HvoQk
 lDbqUF61bakzKX2RsJ6OA/nHslwJm1O+LjCc7/jcPAg+Dp7EFs38vkS0hUu7pKi9ee6Z
 r75z1F1i14koNaTZOh8JGxhqJVXmJhqkxzWDMIdCIEaaXpt/85hZ4FbdqJ5awFvNnaxj
 qXPA==
X-Gm-Message-State: ACgBeo0S06NWOQd6fwX4tkLf37t4Mn5LOLatV8TUGvn+PpIfR1U7wjup
 ej06fJoku5mJJJp6V8mjkknmv5k9so9xcI6FGAUpkw==
X-Google-Smtp-Source: AA6agR5Jz1bCS1CMDoSyfQpWs86VYZzcnF3ST5kSRDm3TCUjnEYVio8EVxiAbcYT/hOx6hXb3hUbIfFSc5zl6T99K0Q=
X-Received: by 2002:a25:40cc:0:b0:68d:5ef2:67c8 with SMTP id
 n195-20020a2540cc000000b0068d5ef267c8mr3096495yba.39.1660657273813; Tue, 16
 Aug 2022 06:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-3-alex.bennee@linaro.org>
 <CAFEAcA-+MtvsRJfpcjknT2FHkUO75AP_zySWBWi=KAAkMGdjnQ@mail.gmail.com>
 <87mtc4b9d7.fsf@linaro.org>
In-Reply-To: <87mtc4b9d7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 14:40:32 +0100
Message-ID: <CAFEAcA8oPjTq9quHxOCSczckwmmBSP0fY6dtCzwrNs59pMrNCw@mail.gmail.com>
Subject: Re: [PULL 2/3] tests/avocado: add timeout to the aspeed tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Tue, 16 Aug 2022 at 14:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Is there some place (in the superclass??) that we can put a
> > default timeout that applies to *all* avocado tests, so we
> > don't have the risk of forgetting it in a particular test?
>
> It's a bit muddy. Most tests are sub-classed on LinuxTest which does
> define a default timeout:
>
>   class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>       """Facilitates having a cloud-image Linux based available.
>
>       For tests that indent to interact with guests, this is a better cho=
ice
>       to start with than the more vanilla `QemuSystemTest` class.
>       """
>
>       timeout =3D 900
>       distro =3D None
>       username =3D 'root'
>       password =3D 'password'
>       smp =3D '2'
>       memory =3D '1024'
>
> However the aspeed tests are directly derived from QemuSystemTest.
> Perhaps we should just move the timeout down to that or maybe
> QemuBaseTest?

Ideally, we should do it at whatever level ensures it is applied
to every single test that 'check-avocado' runs, regardless of how
the test was written. "QemuBaseTest" still sounds a bit higher
than the absolute basic "this is a test" level, but maybe that's
the lowest level we have access to?

thanks
-- PMM

