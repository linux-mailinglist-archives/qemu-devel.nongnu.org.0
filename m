Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F9364889
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:51:13 +0200 (CEST)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYX78-0005U5-SS
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYX4E-0004NH-Eb
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:48:10 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYX4C-0005LU-Kf
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:48:10 -0400
Received: by mail-ed1-x530.google.com with SMTP id w18so41631072edc.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xe6+eYRTA/q907EnIwZ95EsYnW6DRiwPeFS9nctEHHM=;
 b=ehlqrGrPmeUGWD3WXVt9DGs4+CrXT05lhZA0ACpoN/oIhWOrWW3/yWcDPY1ckQTC9Z
 j7VFSC5lXqc5dEJAT0rlAtxLusDuv5qvOow2CFKbXxnwhXKwvkkjROXC6/b/RwrjajLj
 9apaYAw/aXLanN+opDDw/Ug9nGWvcob/5ud8APh2mYBcwGtRm4OK40fbkZP3nQDxZgYM
 K4lMv6053hkf4XPdXWcTw2REUYzV6OgE9AtCrTvs+u63tUYS8NEUvXAQQeYf04MGxyvV
 oiQH687r8Wv1Jebv6QB793dKV98rR5uUFaX9lGF2gQvXWV+tsJHtYn3zwYMNuOv6uPus
 OALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xe6+eYRTA/q907EnIwZ95EsYnW6DRiwPeFS9nctEHHM=;
 b=mdSWrFm5WdoqEKHc21fT0K+NxOcyVJ0KjzwuiJjWtmbGU7Wkhwb6X1ZHlq3a6EWNjb
 msPuviy7Vo/AAZPuDJqq4NE+DKyDazDYNmjPjQqOJyqLsXh5o4AzYJQnFnx5VjuGh2+B
 WnG4NopRsum9jQrUn8DodISDrhdJChM/ZvIstzBKvMzFAJWNBST+MMiZ5WnFGxPCPpqw
 CMS9F7hq6lXXUhXcjk/Ep+D2ftauUZIry7IGFFJbQzGJ2dsQqduUzk6XjQU+GCFYtXn9
 UCz33fhG6rD5/DaQvCGzRs11QTYxvS3XXGiMZinhyGeCSa7EHO7rrmaB9tUoerHxFQnZ
 vbrA==
X-Gm-Message-State: AOAM530JFRbkuTOLvJxQKhf29pzALE0SreITU8hGgEiro2sUrakLwon3
 UczW38csjXhMWHw8PuTlShsuSbhW72Nu818neDE1Ew==
X-Google-Smtp-Source: ABdhPJylbZce3Ga9l8AeLbtzyTDrz0lQ/Lj+OxwCjpzNmo9EUuy2e/z2DF6xJhzoG8hWKKnruO8bFOMFc0QIQgYvGZc=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26710300edb.204.1618850885141; 
 Mon, 19 Apr 2021 09:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210419134247.1467982-1-f4bug@amsat.org>
In-Reply-To: <20210419134247.1467982-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:47:13 +0100
Message-ID: <CAFEAcA-NvHvstggDD=wy_HFcaeQQikWA0M46vS_Jn27=qq1gWw@mail.gmail.com>
Subject: Re: [PATCH-for-6.0? v3] mptsas: Remove unused MPTSASState 'pending'
 field (CVE-2021-3392)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
 Cheolwoo Myung <cwmyung@snu.ac.kr>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 at 14:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
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
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
> Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
> [PMD: Reworded description, added more tags]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v3: Remove now unused variable in mptsas_free_request (pm215)
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

This is clearly-safe and since it's marked as a CVE and we're doing
rc4 anyway we might as well put it in. Applied to master, thanks.

-- PMM

