Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966F589A98
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:55:03 +0200 (CEST)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJYVJ-0002dd-Cg
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJYMk-00067j-3y
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:46:10 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJYMZ-00018u-TR
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 06:46:01 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id k12so537644ybk.6
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Orc9/pDrjo98L3bLUg7rj73sR/AGN7a1H6m4O0WxOGs=;
 b=jemgdqfZ60kvcqBq0tXjikvk5QVICF+FylycXyNqbD5jpGU9An+nHiZX3i4Mc54KG5
 terJfOt3t/eS8vR/wqyXZT7NNivUHPNih+Zyt2gJOTSUXiVz3c8XAip4aTVpC5BdaADc
 4rjAkhNEOVm2fSYI9qBfweTCQgRLEuAPkcBCewPDKYD/z9n94y2RFsguZQEdShmS4304
 f5x7CethBwbqJVeL+1H5bSRX3xsITa/Y/+62LOBzFkNZ1uAY/3U0cG/+JDgs5yD/hyE4
 dLFb+E1iBSjEEaOyGOY52jwpTzT+t6PdwDe9hMJ6ItPEIkNI5Wb4ICd6WWyTZYoeG8O0
 eNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Orc9/pDrjo98L3bLUg7rj73sR/AGN7a1H6m4O0WxOGs=;
 b=TtAuqRAoqPiDxsVTTFqcaJhfdm0AZxqlhDBbPrDVzL2XL/XPKJWabr4JBi4Qyw6eb4
 r8dulNId5jFPFvuHjZnA4RI8A94olp8bw6FxHT7KMPu4Qn6nU7Mi3e/ObIYwT6+Qzc1j
 DYuQBzh2wVrSBvtBDO5CLBnB3lbLEgnRitLmNbHxn1A/Xb0mCNq5XED4HvEqi/59dHFG
 f2c3t7MTpoRjU/kwZEd/fozIVDyM6L34wmxmGVB7zynq36v0JIliC6xIH12nzPUCggc/
 u3+cpJrCMKmSRmWb9QZY7F7t2NWNVFvnu9c1NfWDyTV5e2ajtGBvmaoCV04gVg1tmmfl
 Gx3Q==
X-Gm-Message-State: ACgBeo3+h47d/tFa9qDjfAzIvMgrAfk+mHgZYC7cszHA7QmDs6Xd0EaT
 W1fRcgyjyNrzgyxvicgawR7yIJoblt+mWceHwDmjYv73s6A=
X-Google-Smtp-Source: AA6agR5ooLYJbHMNbUdEg5nWEqc4LxcIsOL8XDVFnW3p3i0+kQlUh3d/8ymOhNWalEzJ3fD2kXHsv+5GQJBbY+WR5U0=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr953312ybg.85.1659609955029; Thu, 04 Aug
 2022 03:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220729155932.2477385-1-peter.maydell@linaro.org>
In-Reply-To: <20220729155932.2477385-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 11:45:44 +0100
Message-ID: <CAFEAcA9rpCNrO33tiTUZw_BzVt77_5q_CKp_yBf3prw5C+bAxg@mail.gmail.com>
Subject: Re: [PATCH] hw/net/rocker: Avoid undefined shifts with more than 31
 ports
To: qemu-devel@nongnu.org
Cc: Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

Ping?

thanks
-- PMM

On Fri, 29 Jul 2022 at 16:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In rocker_port_phys_link_status() and rocker_port_phys_enable_read()
> we construct a 64-bit value with one bit per front-panel port.
> However we accidentally do the shift as 32-bit arithmetic, which
> means that if there are more than 31 front-panel ports this is
> undefined behaviour.
>
> Fix the problem by ensuring we use 64-bit arithmetic for the whole
> calculation. (We won't ever shift off the 64-bit value because
> ROCKER_FP_PORTS_MAX is 62.)
>
> Resolves: Coverity CID 1487121, 1487160
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/rocker/rocker.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index 31f2340fb91..d8f3f16fe87 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -1010,7 +1010,7 @@ static uint64_t rocker_port_phys_link_status(Rocker *r)
>          FpPort *port = r->fp_port[i];
>
>          if (fp_port_get_link_up(port)) {
> -            status |= 1 << (i + 1);
> +            status |= 1ULL << (i + 1);
>          }
>      }
>      return status;
> @@ -1025,7 +1025,7 @@ static uint64_t rocker_port_phys_enable_read(Rocker *r)
>          FpPort *port = r->fp_port[i];
>
>          if (fp_port_enabled(port)) {
> -            ret |= 1 << (i + 1);
> +            ret |= 1ULL << (i + 1);
>          }
>      }
>      return ret;

