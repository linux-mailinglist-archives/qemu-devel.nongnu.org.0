Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED1321995
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:58:42 +0100 (CET)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBjV-00035Q-31
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBh0-0000lC-4t
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:56:06 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBgw-0001AY-Q8
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:56:05 -0500
Received: by mail-ej1-x636.google.com with SMTP id e13so26259197ejl.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MGZw1etjXF4cDPzEevRFNoUXFoM+GQdsBqmrTafmue8=;
 b=o2N72TEBitR4OLnpZ+SN2ryF0P4Vy1KNgxqo8cDUx7FZIXGGQHME5GImb2JM2NQFr5
 /4ImL5aWs7Kd6GHNHH06jneDdEWh2Zx6EEmKGKX9jU8fwBSuafh6fd34s/919EEum2hm
 2eT1HsoB+V/3GmWG/zbFMGzxRJUZ6Cwa9DIQW9zk5oRB5uYnZKBaJzMuPhokiev1iVzM
 m8qwxu6lyShkltdQmFCNhk1Dqsk2e3DiJ/F+NHVzs3crx0IWpGV6VVmNgQFWE3Ot4VVU
 1Ppb6gJq0qqWNgAfncHVDHNVMvoVknBMQiTnt7CUkI5jxQVG/hXVuWV2MtStv/9hT4Ob
 E4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MGZw1etjXF4cDPzEevRFNoUXFoM+GQdsBqmrTafmue8=;
 b=nFUn9vYxAPJ1zTyynWHf6yMVZSK41d9nP5F8A3mQTW3OuKvm83Hcp7/x2NxnS23+44
 6lQNPnjUUN5clbDuAXjClPOEfBlSIVlcIttqmwqGrrDRiGtmBTVOwfZ5v3MGn6HMqryB
 c9XwmbEth05XNs2wn5MMD2kbpP3s59NK4WcVHPFSnRnD4CrSiFa3bPNnM2lU4cQ91I3C
 TzZl4g577kfN5Sg3L/PLHhkyHvhVq6r5uUZCH6QKiIcFkeuwv++s/U93lpi56v69bdFr
 f4xv/qkhHaW8kjBQdSYH/sSZ9Lqk6f/UNPwWOi4kRLpiFXMIq9etJ7ZMlSBS2i6BmNTs
 Kkeg==
X-Gm-Message-State: AOAM533doYn2bzzMkNR1hNclQIt3qPlzmWFa7dgVl63ORA3AJNhOohQ9
 LAQCvrx3tbtqy+ewakqFHxv7+t9NPwdu7QIEl87SdA==
X-Google-Smtp-Source: ABdhPJzMy3U7Ip4wV5rf9vwZHM25iIWccTeR+L8rq1kAmSlYkudpe3xi/Yu/c6FFa0b6ojlcPY8jpr06psIE5EqBCx0=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr4713263ejp.382.1614002159908; 
 Mon, 22 Feb 2021 05:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20210221215915.2568943-1-f4bug@amsat.org>
 <20210221215915.2568943-2-f4bug@amsat.org>
In-Reply-To: <20210221215915.2568943-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 13:55:48 +0000
Message-ID: <CAFEAcA8myJg96kdcMX+aQJm=ngPdW564=b46N=knFCO-dGkiYg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] hw/sh4: Add missing license
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> This code was introduced in commit 27c7ca7e775,
> ("SHIX board emulation (Samuel Tardieu)"). Use
> the same license.
>
> Cc: Samuel Tardieu <sam@rfc1149.net>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/sh4/sh.h | 12 +++++++++---
>  hw/block/tc58128.c  |  7 +++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
> index 93f464bf4cd..33dde7a56dd 100644
> --- a/include/hw/sh4/sh.h
> +++ b/include/hw/sh4/sh.h
> @@ -1,6 +1,12 @@
> -#ifndef QEMU_SH_H
> -#define QEMU_SH_H
> -/* Definitions for SH board emulation.  */
> +/*
> + * Definitions for SH board emulation
> + *
> + * Copyright (c) 2005 Samuel Tardieu
> + *
> + * SPDX-License-Identifier: MIT
> + */

I thought it wasn't generally recommended to convert
a license text to a single SPDX line? The sh7750.c file
has a full 3-para license text.

thanks
-- PMM

