Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBB57FF63
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxdN-0007Sb-Ho
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxT1-0004zD-8L
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:45:47 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFxSy-0002OJ-Sx
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:45:46 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31d85f82f0bso108069767b3.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ADQu1A5r61KHRPI+uUJ/lRjm9x/Z21z0iSnKTRZco64=;
 b=UREoc87bwmwoNw5Ohztges8AQo0tTdrLAewklXye5kUtdvA5BsIbYlv4LV+4twr+a2
 eEEae1L0fypqtJxwlxIMhJQeApG6Z95xn8Whpcv7pXwZX5b5UL4+BXgyFr0xU12EQdow
 F0JEjSxQbgmNTW/Ifro0g3A3M32QOfaffy5wJw1K5nT7Jjx2w1fnsaTwNZx+cMa1UG2S
 RUZXYGHXcOIIEEEVM1ZTgtw1I+sI/klOM1BNs1OtGTcxIj5hKUMEpd4iFo7M7SNgD++q
 1V4tDEOBMpE29A3l/L0MxM2SGF66oBSG6gr03OY5jD3PX/WJ2RnchlZmpDMUzDPAOAzb
 vmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ADQu1A5r61KHRPI+uUJ/lRjm9x/Z21z0iSnKTRZco64=;
 b=tT41iW0v3AdiNTqwd5j9jo8ARZvvUXbqsrv9XQxci09UPdsrWOP2m+Y8cqyIxSDtHp
 bzIhgu1qGGfwKp9jR+dALBLPj/RZrNkWeCWRPgeZrzyB/wKepNxXQiT/Cv+ANtalmqFh
 N5+KG065Bm3IXLmMwRMp8IdxmJa1+DOFf/LgX1wIFQh16/9s4QmKjxak4LdmjGUfYy/W
 PtovYie9kGCKNx4Z6EsTaMhWOzi9QzK/xu+MsitA+ea6xdo4rU2vzZKxcUfzWp3W3xX6
 7Xocp5hQivm1m194rJit4VEaAk2Opldv6LWA2O2Awl+eQ6U+8kg+CXu6RxyCUXV1VPuE
 KK+Q==
X-Gm-Message-State: AJIora/4jVoChU54Lic12NsjyLzRvyl7ISh6elBfFgR/0UuJ7HCxVNzF
 X80izgytTN4+Q0wNLOjOgPvqyp1Z+AvkOQl/eVjE9w==
X-Google-Smtp-Source: AGRyM1t0ugzDF1gf6rg0boqC8XPbhTOvjzkfbfmUQNq3sVj+kUDSonmuY2h9bptan9sNLOoTSNzyGFq0o1uvyt0I24A=
X-Received: by 2002:a81:770a:0:b0:31e:7cd3:f2d0 with SMTP id
 s10-20020a81770a000000b0031e7cd3f2d0mr9874069ywc.347.1658753143697; Mon, 25
 Jul 2022 05:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
In-Reply-To: <Yt561CDN+UjmaDK3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 13:45:04 +0100
Message-ID: <CAFEAcA8d5J-WBp6Z=ECiUtP8wCfjv_XZo5GfYAr+x+mH3GpQww@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Jon Alduan <jon.alduan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 25 Jul 2022 at 12:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
> > For handling guest POSIX timers, we currently use an array
> > g_posix_timers[], whose entries are a host timer_t value, or 0 for
> > "this slot is unused".  When the guest calls the timer_create syscall
> > we look through the array for a slot containing 0, and use that for
> > the new timer.
> >
> > This scheme assumes that host timer_t values can never be zero.  This
> > is unfortunately not a valid assumption -- for some host libc
> > versions, timer_t values are simply indexes starting at 0.  When
> > using this kind of host libc, the effect is that the first and second
> > timers end up sharing a slot, and so when the guest tries to operate
> > on the first timer it changes the second timer instead.
>
> For sake of historical record, could you mention here which specific
> libc impl / version highlights the problem.

Jon, which host libc are you seeing this with?

thanks
-- PMM

