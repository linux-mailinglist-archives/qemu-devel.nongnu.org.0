Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6094C2FF0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:47:25 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2d7E-0008KE-18
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2d4r-0007IM-LP
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:44:58 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2d4o-0000TW-CF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:44:56 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so3503798ejf.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 08:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cvkjIzLADIGYKHPlJNZ4Nc13oIn/1WSchp0rKWnNP7E=;
 b=Eb4piYqQuGMNWmdbMgTO5+Ab4fGqI/gWQz7hU3MJyCwaRvw1iRfULczCsI6VyP8C4Y
 ylD2V1I7o/PykI5Lt38X3TJpaq9fHdeIlcLMz8WgHKXX6lyi1tE+H08rbhduOBou3USG
 fakF6QeV3YLmvB0SBmJ3X2CVppxNe3AyOPRKuRbGnhUKKVxc37ThX1UVzxIXUNSPwgYm
 4y/F5+k2uxum5aWn3ObojstXhepZc8YkxvBv3RDv+FFuCQBl/IqgL3NsIAjzxxp3cWn3
 tSSCKyU26QC+2OQnS5Dyr+eCB+K5OMlyWpEcBpnRC4JBWgK0jCS35/qUzLjAGm1xeyqe
 NqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cvkjIzLADIGYKHPlJNZ4Nc13oIn/1WSchp0rKWnNP7E=;
 b=oz24UGJo9MxvA++oKNmo01PfoIA1zl8jYi9dMFfLXEhN9j7Db7JfraiVNXYkirew2r
 Ck6GrVV42Sxq5Gb5rvfMOeGm/t/7dTnqlkrsncFp1J7GWxs4A1p5J6TnwNcDFeZWoQEq
 KfpZPbtQaueOHGEC3QeLA/SbfDigtCuD9rAwXGP9kFlHigjTeLFf/Poe/uiq/LpWEM6j
 HA5zu/J/7xiaFaud3nNnQh/cVvc+ZFKyjQS5JO1dvsBKmGyZUVMUWolw+PgmvAUEEEW5
 9Qa9F+i9zMNkcrlo2yNaY8IpOWBdiaO5TOs2ggl2nwXbRDz9E/um7hcEpmsxenziNWUl
 5w2Q==
X-Gm-Message-State: AOAM531IZpVG5R1K1wYSizhUSTk87QuazYckeQ9K3sXPmmLzkvTnnkbf
 zEktgOoNdNvHqYO4Waq0eIbvtHrK4SmR96dNw9Ymdg==
X-Google-Smtp-Source: ABdhPJwAw9qtfeZj/Bcy2ezs821ZQ/uYvOYEmdYyicjmE9VqmzjT5Zmada3y/qAGEdI3fCf40lOPQBKasIF2l5adkbk=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr265077ejt.56.1611247492029; 
 Thu, 21 Jan 2021 08:44:52 -0800 (PST)
MIME-Version: 1.0
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
 <20210121160733.GP3125227@redhat.com>
In-Reply-To: <20210121160733.GP3125227@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jan 2021 16:44:40 +0000
Message-ID: <CAFEAcA-zVvu+16xxjCvXqeZxZMqppUUb7aQkL-5nBTNY+JeyGg@mail.gmail.com>
Subject: Re: Thread safety of coroutine-sigaltstack
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 at 16:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> FWIW The libucontext impl is all ASM based and has coverage for all the
> arches we care about:
>
>    https://github.com/kaniini/libucontext
>
> so doesn't seem like there's a need for  coroutine-asm if we can rely
> on libucontext for portability where neede.

The README for that notes a couple of pretty major omissions:
 * it doesn't handle floating point registers
 * it doesn't do anything about the signal mask
I'm pretty sure that not handling the fp regs could cause breakage
for Arm at least (depending on what the compiler chooses to do
in the functions that work with the ucontext functions). The
signal mask stuff might be OK for us because of the carefully
limited use we make of the ucontext functions, but it would be
a bit of a pain to have to analyse that code for both sets of semantics.

thanks
-- PMM

