Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960AB2D3E4D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:16:51 +0100 (CET)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvac-0002nA-5v
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvYN-0002KY-8R
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:14:31 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvYI-000436-7o
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:14:30 -0500
Received: by mail-wm1-x341.google.com with SMTP id c198so770830wmd.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6vy6oszdD9MIBktb6ONskzKh1S2QGCkFrxM8obMkH10=;
 b=OwYz1RteeTr6Q27TxNscZKENQSXHAsrIcMLcyo2oPjUkDZixvG1iGEsSwDBOmwavqT
 L1qUObc85bSvIMPg+qGdmkqAp+EuGdbw9fvvtCcT8v8SOnbk+i8EQqa4+AOAp+3nSauy
 GE2Dnbd5TzH1Rz/UXLVcM80ecLGWjqEkdjLXWzRpT0eh8koP4R9R+wBHQK9W9ISEkaoN
 9VU2EpsSfiPmxsNbIEwIbaeuUZmffIVe1mrGKjKNdoT1gsF7wbuNLGSsDs3s/EbZEPIc
 c1jJkepDeDbRWzpbxMYOL8do9BPl4EiIS+ZN0CCAHyLnlhXTiNNfHXpdZ7HA9OybVRpy
 VbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6vy6oszdD9MIBktb6ONskzKh1S2QGCkFrxM8obMkH10=;
 b=mHydEGRpE+KNmXzJ+Q4uvzJenVlrU4P7sg+zFBI4fzyJ9B0Fk0v5llNDvZAGk0No5h
 krDhHyVD6/qa/tJqEz2Gz8Q9MDP8qWVpzWq8ecc242NVzv759GpTykNawWYadA4/kj77
 Caruc+jzByCMdsBysSZFZ7Y8+JvUqHkgjGc7Hq8CnJQXmvwEq0BsztrIPf2SMTQ+IthD
 onAbX5KG5lB3SR2NzJT3FEq4+H3veg9XE6TtF7Z3BIoK20ESUdg0Oy5yeZxEwudoNf6Z
 du6Zm763MmXyvO3IZaWKd1bCgqvDrzESNOR5mRf1Ww539pTAgLyR81T/6+THJTEfRhJE
 8qeA==
X-Gm-Message-State: AOAM5332Yicq/I99NwiD+FSZ3WwNsc2QOeIMOmIKYUEHepGrzDvhARUh
 V3UNM01uwRDoRaaNR9SGygzwgw==
X-Google-Smtp-Source: ABdhPJwYltaFHhZR3XvvnsXIVaDx6/NGbFXK1LAZFkeoapeP0+b6fl/iEdNdb7QQsGsfT6R5R/v55g==
X-Received: by 2002:a1c:b788:: with SMTP id h130mr1653813wmf.94.1607505264254; 
 Wed, 09 Dec 2020 01:14:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm2048262wml.8.2020.12.09.01.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:14:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6AEC1FF7E;
 Wed,  9 Dec 2020 09:14:21 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-4-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 03/32] accel/tcg: rename tcg-cpus functions to match
 module name
Date: Wed, 09 Dec 2020 09:10:38 +0000
In-reply-to: <20201208194839.31305-4-cfontana@suse.de>
Message-ID: <87pn3jfij6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G .
 Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-cpus-icount.c | 24 ++++++------
>  accel/tcg/tcg-cpus-icount.h |  6 +--
>  accel/tcg/tcg-cpus-mttcg.c  | 10 ++---
>  accel/tcg/tcg-cpus-rr.c     | 74 ++++++++++++++++++-------------------
>  accel/tcg/tcg-cpus-rr.h     |  2 +-
>  accel/tcg/tcg-cpus.c        |  6 +--
>  accel/tcg/tcg-cpus.h        |  6 +--
>  7 files changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index 82dbe2cacf..9f45432275 100644
> --- a/accel/tcg/tcg-cpus-icount.c
> +++ b/accel/tcg/tcg-cpus-icount.c
> @@ -36,7 +36,7 @@
>  #include "tcg-cpus-icount.h"
>  #include "tcg-cpus-rr.h"
>=20=20
> -static int64_t tcg_get_icount_limit(void)
> +static int64_t icount_get_limit(void)
>  {
>      int64_t deadline;
>=20=20
> @@ -68,37 +68,37 @@ static int64_t tcg_get_icount_limit(void)
>      }
>  }
>=20=20
> -static void notify_aio_contexts(void)
> +static void icount_notify_aio_contexts(void)
>  {
>      /* Wake up other AioContexts.  */
>      qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>      qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
>  }

nit: for static functions it's probably overkill but whatever...

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

