Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF0535334
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 20:16:58 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuI2b-0000zk-1a
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 14:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuI1D-0000IF-Ng
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:15:31 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuI1C-0000Yq-0s
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:15:31 -0400
Received: by mail-yb1-xb36.google.com with SMTP id q184so4151343ybg.11
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iz1yzrnRHoN6Rb6xr7xTTY49b3HBp9aHTSBn0qfpaVU=;
 b=hT821f8jWdLSaZW/r4fREKugsS0qNG1/Q4V5ma7X1toIhYiDnoAw+gWXDNaRyrbpER
 1ixFeZ6KZNVHmnRq1UjjhhCo1fdVajPMmNc9usq1AoASxpb6vra9hGtqxphHjiFwpG9F
 PyQgbbTPbEW0zwl3EmoMNfUUqssth5s3D4Pugv6cDHW1WAsP9Opz90FSMweaOgi4jjXI
 M6yr51OvErbN50nVCfpZ7GyKjoalnzaWYYKdLVRWak4Qc7aZdRv1WWJufb1ySiUErkBk
 fv3dgLPaZ4IgEkAGvCQJ1e7fkhxvXuJr6QIQJbOagaycoT/ABVndEbZqiX/NJ3owS12Z
 DzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iz1yzrnRHoN6Rb6xr7xTTY49b3HBp9aHTSBn0qfpaVU=;
 b=gRHG0SzkYO6zCqfQV8pDfHkTH3j5qf6hx3VTGgnFxEdf08AjpmCHX99I0qXJiH06tU
 9CTJHQ2R4zt51U7fc+WIoz4RFDm6+74V/nmjWQSiKmwwKBCXL44bR3+KhuwuJDacWTtC
 VneFpqIDa7ClxPSyzcz+cbeOkmUUnP8rvbdKVprJGKzFcRiHbw8aurFbSZYt0slJadjI
 iWs0MWjrDi24me2yBmt9kDjeA16qvTEkOYDzmPpUbqadgxcvCgMiBwQBp66JHN3IlO2x
 Bdnn/k+Zs5jxTun1h81+0aTk1Lkopm+oFPyy2kxW6zrdQUZi/vKQjSDkiqyiicswrkhF
 VZ5Q==
X-Gm-Message-State: AOAM530v7XYsw7o7G2mBO7xHs1/aP2G6Tl9zzn4rw6qvpw0NzdAo6RFt
 diohY9CvdAoPF0PADDOM7H8N8dwI5rVkQGvdh02WIQ==
X-Google-Smtp-Source: ABdhPJz6wpOGetZ1jDi5SU6R6EyMUUhxl1tVmOk7JrjIpzQvgCzoyamVCgxgXtbZoAZsNvr4/WTXWVPNXP/WiRJL3OM=
X-Received: by 2002:a05:6902:1021:b0:64f:51d0:f421 with SMTP id
 x1-20020a056902102100b0064f51d0f421mr32823567ybt.39.1653588928627; Thu, 26
 May 2022 11:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+WntOtM1J2C1607kWW_n9iTBctgMW26iF5JVYaWy9FSt8qqag@mail.gmail.com>
In-Reply-To: <CA+WntOtM1J2C1607kWW_n9iTBctgMW26iF5JVYaWy9FSt8qqag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 19:15:17 +0100
Message-ID: <CAFEAcA_i5Q-5OEjoHFk=aKZSOB5cA-6i4acUKAeHo_Yx0qznjw@mail.gmail.com>
Subject: Re: building e2k qemu errors
To: Joe Nosay <superbisquit@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Thu, 26 May 2022 at 18:14, Joe Nosay <superbisquit@gmail.com> wrote:
>
> The errors occur at the end of the attached file.

...which is to say:

../net/eth.c: In function =E2=80=98eth_parse_ipv6_hdr=E2=80=99:
../net/eth.c:410:15: error: array subscript =E2=80=98struct
ip6_ext_hdr_routing[0]=E2=80=99 is partly outside array bounds of =E2=80=98=
struct
ip6_ext_hdr[1]=E2=80=99 [-Werror=3Darray-bounds]
  410 |     if ((rthdr->rtype =3D=3D 2) &&
      |          ~~~~~^~~~~~~
../net/eth.c:487:24: note: while referencing =E2=80=98ext_hdr=E2=80=99
  487 |     struct ip6_ext_hdr ext_hdr;
      |                        ^~~~~~~
../net/eth.c:411:15: error: array subscript =E2=80=98struct
ip6_ext_hdr_routing[0]=E2=80=99 is partly outside array bounds of =E2=80=98=
struct
ip6_ext_hdr[1]=E2=80=99 [-Werror=3Darray-bounds]
  411 |         (rthdr->len =3D=3D sizeof(struct in6_address) / 8) &&
      |          ~~~~~^~~~~
../net/eth.c:487:24: note: while referencing =E2=80=98ext_hdr=E2=80=99
  487 |     struct ip6_ext_hdr ext_hdr;
      |                        ^~~~~~~
../net/eth.c:412:15: error: array subscript =E2=80=98struct
ip6_ext_hdr_routing[0]=E2=80=99 is partly outside array bounds of =E2=80=98=
struct
ip6_ext_hdr[1]=E2=80=99 [-Werror=3Darray-bounds]
  412 |         (rthdr->segleft =3D=3D 1)) {
      |          ~~~~~^~~~~~~~~
../net/eth.c:487:24: note: while referencing =E2=80=98ext_hdr=E2=80=99
  487 |     struct ip6_ext_hdr ext_hdr;
      |                        ^~~~~~~


These are fixed in upstream commit 7d6a4f123e00c9, which
went into QEMU a year ago (should be in QEMU 6.1, I think).

In general this kind of situation where a newer compiler
is better at identifying and warning about problems can
happen where you're building an older QEMU with a newer
compiler that hadn't been released at the time that the
QEMU you're building was released. There are three basic
ways to resolve it:

(1) use a newer QEMU
(2) use an older compiler
(3) if the problem is only a warning, configure QEMU with
    --disable-werror so it isn't fatal. (Looks like for
    this specific case that wouldn't help, though.)

thanks
-- PMM

