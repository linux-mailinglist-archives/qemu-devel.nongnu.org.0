Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D56999ED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh3t-0000sU-SD; Thu, 16 Feb 2023 11:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh3r-0000rc-Iu
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:24:43 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh3q-00086a-21
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:24:43 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gd1so2405646pjb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILOlkr33qnTV9X85UzfOUAyhWiKaGbpNvfWSmNqdamc=;
 b=d/2ODgcbH88rrY5hTkt7Y5x6G7m7hQM74/2WdnRO6poFnaIoSsg6340PeT/AdmWUB+
 jsZsbqZSTIPHJ9WqdsIUQa5w52wJmWMwaqjB4+v5G0fQcNLn1OieUcw/yqTZ8EX6AVC7
 EATDK8jMq92AX5mHSMeoK5Mq+ELQDNHZZSmHFXkDhmdGRSifLAaNZ/E7w9373R7SnfTN
 ahU7Wg6eoCn+SoHlSbi0sKtIEiJ9zUGiJCVeBAK8fFxMxC3HyF8+3d7Nepi+3Kj0+jyB
 OtkM9vf6im79ILg6xMf7+8L1dy7j8KyhqkGT3zQJqqf83Q8TpcYb8LmJRfOpCZcnyzb/
 lMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILOlkr33qnTV9X85UzfOUAyhWiKaGbpNvfWSmNqdamc=;
 b=v/+HyFBXH8Y65SV4mmwR9X5U78oOYTxff8i07L9MQV4rKMfzszuMJhgEjBXPpaLHDn
 7nAZ+jL4angpg9o/mG+rC1YG1AkyoFcxUEkkIlmF0wc5W39Us14NDSkuel/sSK3OXJfq
 7d5aOWR5LD1Zs2PsVpOUU0hmQbg1xqgHY6bNyUii5yw2tMGpJ1+JJL/U/GpSLJrxJKS1
 WrSGWod5VF/eP5hDqWnvmaYOE4kCkIVoyBnHg7dxOOwJw4WU9YyuXf2U0C1yG8wiYPFJ
 cDnfR5eEv/fBJWe8XahYPaFy3aPjBnyoCynLxOz1t3VBEMEgQhaOE28sq6sDRPJ1OZpt
 bz2A==
X-Gm-Message-State: AO0yUKVdNm3ngpEvr2eW8OjeTe08um2sOC+S53130wvFon+aY7gAQs8m
 OOoSpNUoUjGE1KZKjsoWYsZCJN0mU+fYVlapPNcEPg==
X-Google-Smtp-Source: AK7set9qeMvKLC5kHiquYDfBDa0j/5iWsNAv37uD7NdcB3JbcYOrOyW3bjngGvoOz0yJ30lb9/PLGocF2zAYVJ5glB4=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr760603pjb.92.1676564680677; Thu, 16 Feb
 2023 08:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
 <20230213202927.28992-18-farosas@suse.de>
In-Reply-To: <20230213202927.28992-18-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:24:29 +0000
Message-ID: <CAFEAcA-6E_Eds0bv5xyYwYzE6nn=Wg4KhYZfFTswcfjTuhK97Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 17/28] target/arm: Move cortex sysregs into
 cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 20:32, Fabiano Rosas <farosas@suse.de> wrote:
>
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into cpregs.c along with all the others.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/cpregs.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpregs.h    |  6 +++++
>  target/arm/cpu64.c     |  1 +
>  target/arm/cpu_tcg.c   | 59 ------------------------------------------
>  target/arm/internals.h |  6 -----
>  5 files changed, 66 insertions(+), 65 deletions(-)

This patch too is throwing more code into cpregs.c. These
are nicely separated out because they are the impdef
registers for the CPU models being defined here. This
is a much better place for them to live, since again
cpu_tcg.c is a smaller source file with a more well-defined
purpose.

thanks
-- PMM

