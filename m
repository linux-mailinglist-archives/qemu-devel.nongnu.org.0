Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C93E2C10
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:04:27 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0SY-0001WC-9M
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mC0Qp-0008MA-19
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:02:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mC0Qn-00035V-9q
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:02:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id k4so11274532wrc.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7fYUvCBG9HsobiPlt8RKPNj2sO7IptOiKTXs+LEUE1c=;
 b=Ko3v8xLn4jjHiwznKzN75gnH9xdbck036INq/WGZ1yt6QE9XNEZ++UQEpGOHLTWvzh
 ubc00lPwxyE3Xvxmgzk1O03RXIHSXC95o1db3PuE3N4fi56jc8tb1QxsevbPvs4He7M5
 dXq5XHX5YWSj02BbE/yfly212P3bZNvp7josFFKwgpfq77iDPTir0thMDsi0tmg34Kav
 wklzli6Yams31DeLC766RsB8xfuT2DLJffZBpcgHQBRRczoyKyE5eG1ZITF0TlD8n4nd
 nR7IJQxAPlR3bF+f4mejDitJbbj19T8Uu6GbASLjRt7v7yC8zeBKJ5r/AdqF+BxQiS5/
 Chtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7fYUvCBG9HsobiPlt8RKPNj2sO7IptOiKTXs+LEUE1c=;
 b=G5ATTuYcpszPwHnjvB0E3Atp+v4nkboRB5XvvpXzZyd4WA9FP+dnbO5qv69ivr803b
 4Si+UuFy2UEdmg9Nj80MQFvVaYTw3euOZL7ycw9smHKKrRlMhgEJxCkp5lvl3ITS330U
 3NDxXiJnGar+bnirYH73nxGJwKh5gLFATZmooMVtSSNQGByxxOsPuUJoSm05ZmrwQ4ZP
 8vRNwqBAZgFNuMbm5jpqY2pfqAQwcx3eGtBz9U3U7sFUWwex+l7RzNPMNELe6/YX0Yr9
 tIO0V5y17IG+gqE/uTFvn+OPhfhHERKYWZNtrWQxnWqSgdM15BB8F4+XsFQRDcY7Y9yp
 nywg==
X-Gm-Message-State: AOAM530sZXTMVZwwB6Dn9vnHBUlJVKrvlb+DgU1VIuUN3+Hi5e9kKH7q
 0miKgd93pqfD8V6+mSanqXuVoZ67LJafmJmm
X-Google-Smtp-Source: ABdhPJyibQdFz+p8lEjCTj7Pu87TOJYT1IhJcZza1S6c8XN7rdrDUnUkqCL1uAOQrDPq6Qrrbc95cw==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr11054338wru.421.1628258555342; 
 Fri, 06 Aug 2021 07:02:35 -0700 (PDT)
Received: from smtpclient.apple (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id l9sm9503223wro.92.2021.08.06.07.02.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:02:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAEUhbmXjC_RaN0rMZO0-FFAP8Cce-Kpxy=ZORpi1k=0Nv7OLiw@mail.gmail.com>
Date: Fri, 6 Aug 2021 15:02:32 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <45C09F20-488D-4C9F-9221-99FB9BD38A28@jrtc27.com>
References: <775EB0C4-04FF-4D76-8248-D5B16D238B3B@jrtc27.com>
 <CAEUhbmXjC_RaN0rMZO0-FFAP8Cce-Kpxy=ZORpi1k=0Nv7OLiw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x433.google.com
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
Cc: "Ruinland Chuan-Tzu Tsa\(\(\(\(\(\(\(\(\(\(\)" <ruinland@andestech.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6 Aug 2021, at 14:54, Bin Meng <bmeng.cn@gmail.com> wrote:
> On Fri, Aug 6, 2021 at 8:58 PM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
>>=20
>>> On Fri, Aug 6, 2021 at 10:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>=20
>>>> On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
>>>> <ruinland@andestech.com> wrote:
>>>>>=20
>>>>> From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
>>>>>=20
>>>>> Adding option `riscv_custom` to configure script, meson.build and
>>>>> meson_options.txt so as to toggle custom CSR and =
will-be-upstreamed custom
>>>>> instructions handling logic.
>>>>>=20
>>>>> Signed-off-by: Dylan Jhong <dylan@andestech.com>
>>>>> ---
>>>>> configure         | 6 ++++++
>>>>> meson.build       | 2 ++
>>>>> meson_options.txt | 2 ++
>>>>> 3 files changed, 10 insertions(+)
>>>>>=20
>>>>=20
>>>> This sounds like unnecessary to bring such a config option to the =
meson level.
>>>>=20
>>>> I believe a Kconfig option should just be fine.
>>>=20
>>> +Alistair
>>=20
>> I don=E2=80=99t see why this is even a config option. If you request =
a vendor=E2=80=99s
>> CPU you should get any custom CSRs defined for that vendor=E2=80=99s =
CPU. If
>> you don=E2=80=99t you don=E2=80=99t. This should be purely a run-time =
thing, no?
>=20
> In a generic use case where we build all RISC-V machines into one
> qemu-system-riscv{32,64} executable this makes no difference. The
> Kconfig option will be turned on if any one of the machines requires
> it. It only gets benefits when we build a QEMU executable on a
> per-machine basis.

The machines live in hw, the current patch is using the config option
in target, and hw depends on target not the other way round. I don=E2=80=99=
t
see how your example fits with that; it=E2=80=99d result in a layering
violation (target depending on a hw config option), no?

In your example you still wouldn=E2=80=99t have a config option for the
feature, I believe. You=E2=80=99d always have the hooks in target, and =
then if
you enable support for a specific CPU at compile time you get its CSRs
along with all its other bits, and at run-time you choose which to use.

So I still don=E2=80=99t see how this option is useful.

Jess


