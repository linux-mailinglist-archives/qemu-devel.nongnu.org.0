Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908723644BF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:34:39 +0200 (CEST)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYU2w-0004XN-MR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYU1O-0003yz-59
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:33:04 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYU1M-0006rV-0f
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:33:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id i3so15033603edt.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P+o04o6g5Rd/J13Yr5Uu55otUu/W1uQsnOynmTwxsOk=;
 b=U/ikKvlOJWTWwuR67yYXm8Aqz/WjOIbN6RjcMwCJs1MhFsyYQXaKYAoP6VuvQDWxjG
 m4BRc9pM9R4p44Om5N9sS0ytgUWu7GojFUBbuqCyqMPer/QxjVbzMindfCdOtnapKNCO
 KK5Mz+54pcgklFzFdMKM54pRzL7FCevOnkH0TseLBkNgfPA6+fGBKC74T23AzAPaELEr
 hGafmia4DSGz7dkM5smImV1JAXv/cRCu34HRASW+P5QfWksSehuPGWGwajTrL9kMVR1v
 lwRVe9iiik2yEYwI2gSPn07DW3M3GHKFPGz6pcbDtXflibvWps9agbCYF1akxoJpLzpO
 QkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P+o04o6g5Rd/J13Yr5Uu55otUu/W1uQsnOynmTwxsOk=;
 b=HthQ+8GwkPCaC00FiXDQQTmYWVRjn+94Ii87UeFvsmg6EaXb5Z1pZIe8I8cTVOLDno
 cWNrdRB055tmBcn6wBQ37/G3UArCJ0hLkm0qiilr3/eeEax7H7PPQ85UWMNmYSGtXeW3
 8jHX56V1t7OaLsse60DEO0unC3Nn/dqK+x6pXAmoiT4vcYgG8LcFX9SvjzWLwzKtMNLj
 ALX/H1O0oTnvmqk1obaiNMIbhdu1xxWZCO2WO28vK8A9doN0jdhWLyuzib5TQ/xy0QAs
 ZrpiWEWWdkM/r1oCvdDxxj6SJ0MBzQwAJkvjZ3l5YhfG9TDWYk7V0yh62NlP9BfLR0VB
 flOQ==
X-Gm-Message-State: AOAM530ZjH9uL9lyS+IW/h2ky6N0rOEN5Odbjp52qaSNnGlwXIbM8+cR
 PuGm/YiycEpEaotPgnvj8Z/1P5WAexAoFK4JK6vOOg==
X-Google-Smtp-Source: ABdhPJwmGD6DINd1u6Tuiug9yL2kJtX8SdKHuH23VdlvFF9uOHAt5gyYnC35sKbz5E4LOkDxHEyM6FBHJ/eUtdevfQc=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr25625500edb.204.1618839177470; 
 Mon, 19 Apr 2021 06:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210418053039.811996-1-philmd@redhat.com>
In-Reply-To: <20210418053039.811996-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 14:32:06 +0100
Message-ID: <CAFEAcA80RVpQt4v2LntVYbwinbptim4+YaA2+ijmQk7KEB2seQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.0? v2] mptsas: Remove unused MPTSASState 'pending'
 field (CVE-2021-3392)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Don Slutz <Don@cloudswitch.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Apr 2021 at 06:30, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> From: Michael Tokarev <mjt@tls.msk.ru>
>
> While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
> the Megaraid emulator appends new MPTSASRequest object 'req' to
> the 's->pending' queue. In case of an error, this same object gets
> dequeued in mptsas_free_request() only if SCSIRequest object
> 'req->sreq' is initialised. This may lead to a use-after-free issue.
>
> Since s->pending is actually not used, simply remove it from
> MPTSASState.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
> [PMD: Reworded description, added more tags]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Supersedes: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
>
> MJT patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html
>
> Since rc4 is soon, I'm directly respining his patch with my comments
> addressed.
>
> This is not a new regression (present since QEMU v2.6.0) but is a
> CVE...
>
> PJP first patch:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
> ---
>  hw/scsi/mptsas.h | 1 -
>  hw/scsi/mptsas.c | 4 ----
>  2 files changed, 5 deletions(-)

This fails to compile:

../../hw/scsi/mptsas.c: In function =E2=80=98mptsas_free_request=E2=80=99:
../../hw/scsi/mptsas.c:254:18: error: unused variable =E2=80=98s=E2=80=99
[-Werror=3Dunused-variable]
     MPTSASState *s =3D req->dev;
                  ^
cc1: all warnings being treated as errors


thanks
-- PMM

