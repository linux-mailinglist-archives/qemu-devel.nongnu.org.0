Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAF3EB41B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 12:35:27 +0200 (CEST)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUX8-0002c5-GZ
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 06:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEUWK-0001y1-57
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:34:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEUWI-0004YW-Bc
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:34:35 -0400
Received: by mail-ej1-x635.google.com with SMTP id lo4so17346043ejb.7
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ISHEuYA/3TiuV3QE2puglwYPE76uRu4ozBRZ5HUHK8=;
 b=BGbwpU49PWINoeny/HnXXdQapNIMxEMmHOn1C74tR8eHoRNcD5Gssek8Y5lrbU2pEe
 ZSc8GhBaMclsAZaDFnM7hIWF6TbHsgyued9Vb8k5cE/n9grDwre/le24bI7z/MHQruNr
 7nvRlkEixYdrV1kZiqhui3tPCN87HDJzM5GsuD1jUJqXI8phVdKPOjZfc4/GQzrWiwF1
 BtocVqtLqBmbJt1+8rIaemXYuzBwNjp42V5SZOMaupfmMHQ/IGdhuU2K4flJWdT9rupE
 9B3aEBI8Hh+G6eyLMVMU4K3LB4A8JtCZvIC6UQqDGihadCYmFSKp5NqSf78qvRqSTrih
 /UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ISHEuYA/3TiuV3QE2puglwYPE76uRu4ozBRZ5HUHK8=;
 b=k5M5fZQIbsR3HjB2pdJghc2LoIrkycjgIlhwyfrCjW/8VuAhgR8QHolEawCbx1wMUC
 CVkwTeK+g93Wc92PpOR9JjXzvYsuV6/R0P/dBWf1eAKI4SveMUG3dnCkSv8nwRXQdzFX
 JVLM3l9wxLpguljfo6IlaBZIDwgzM+hJtLq/L2hG2TAAgJlih8jT6BxRWxNkklCZcRos
 p8z64j9Le2wnR4ysSb5/1vMlh1ucLwQEtpX8hXOAQPlgJd9niCZonwrMhGscL4UT/uyB
 htwJBghv+1WnLffwlAUoYS9wa2twMKFYSpYhevAhm+93mHUEqAXIZuBxcUoj0GebcgLH
 Ez3A==
X-Gm-Message-State: AOAM530MuSzPa5QpAp9+ygRRVviuYHlB0WHTaLWrZiJCsLUbLpFhgqY+
 Z+IUkZ70Qgf82s4Fahk5pu/VMUZf7UVZWuAplvgP1A==
X-Google-Smtp-Source: ABdhPJwh4TynDnL9OESVMfmpLM+ahpU7/+sI7s3aagqfyQtQ9B1WTQ249yedS/BJMdAu0Fdom39rp3nAgcdFeuqDgmU=
X-Received: by 2002:a17:906:edc7:: with SMTP id
 sb7mr1750620ejb.85.1628850872537; 
 Fri, 13 Aug 2021 03:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
In-Reply-To: <20210810232530.1033519-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 11:33:47 +0100
Message-ID: <CAFEAcA-VPdakAoYiDN=y0x7g+tGaWkoU1Cw4kX87TdUbgEC5yw@mail.gmail.com>
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need to be able to represent VEX.W on a 32-bit host, where REX.W
> will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This patch fixes the "wget https://github.com/ -O /dev/null" part of
the test case in issue 385, but not the "apt update" part: I see
this with an i686 qemu-arm binary:

root@e104462:/# apt-get update
Get:1 http://archive.raspberrypi.org/debian buster InRelease [32.6 kB]
Get:2 http://raspbian.raspberrypi.org/raspbian buster InRelease [15.0 kB]
Err:1 http://archive.raspberrypi.org/debian buster InRelease
  At least one invalid signature was encountered.
Err:2 http://raspbian.raspberrypi.org/raspbian buster InRelease
  At least one invalid signature was encountered.
Fetched 47.6 kB in 1s (91.3 kB/s)
Reading package lists... Done
W: An error occurred during the signature verification. The repository
is not updated and the previous index files will be used. GPG error:
http://archive.raspberrypi.org/debian buster InRelease: At least one
invalid signature was encountered.
W: An error occurred during the signature verification. The repository
is not updated and the previous index files will be used. GPG error:
http://raspbian.raspberrypi.org/raspbian buster InRelease: At least
one invalid signature was encountered.
W: Failed to fetch
http://raspbian.raspberrypi.org/raspbian/dists/buster/InRelease  At
least one invalid signature was encountered.
W: Failed to fetch
http://archive.raspberrypi.org/debian/dists/buster/InRelease  At least
one invalid signature was encountered.
W: Some index files failed to download. They have been ignored, or old
ones used instead.

whereas an x86-64 binary downloads everything without errors:

root@e104462:/# apt update
Get:1 http://archive.raspberrypi.org/debian buster InRelease [32.6 kB]
Get:2 http://raspbian.raspberrypi.org/raspbian buster InRelease [15.0 kB]
Get:3 http://archive.raspberrypi.org/debian buster/main armhf Packages
[378 kB]
Get:4 http://raspbian.raspberrypi.org/raspbian buster/main armhf
Packages [13.0 MB]
Fetched 13.4 MB in 49s (272 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
44 packages can be upgraded. Run 'apt list --upgradable' to see them.


So there must still be another bug here...

-- PMM

