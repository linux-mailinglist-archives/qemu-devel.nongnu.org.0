Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444664CDCF6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:51:10 +0100 (CET)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD1B-0005Xy-CH
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCst-0002cA-JV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:42:37 -0500
Received: from [2607:f8b0:4864:20::1132] (port=41967
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQCsp-0000Lz-JK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:42:34 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2dc242a79beso90997987b3.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CEuCfvpIBorQMTsDz3wbcVHQolsYMEj2ixXxWFkAFc=;
 b=bM7D5wh5WybhV2x0J31rzpWZ8LbDsrieTud/mf3toY4nPJTa5KVX0t72kCrxcU1T4P
 BjXEjy7NGHNlPqbUPhrQ/Xdz1R57FhMB+VNMSBYPvOdxGOOqsslEPwJUOyOyTuXIDriJ
 biZS7OMsOc19JdFfGY4rJW+2s3DrChBRX2zDqMHdnaRIHVJy61R/XFgQzZvFAyKGorfA
 L/JqWqierQkKtp0x7F6sH9M3xJvRtlfhuBhEM4IIaB1+iNXvSsdSaUtvD6VR1cQ73yKK
 2WQZbhyz2JXUd8U/7q6uKv5OD6uCZbbaW1nxvoJisvhLgRe4fQxCwcb7+hKZ+FZiEmFN
 MF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CEuCfvpIBorQMTsDz3wbcVHQolsYMEj2ixXxWFkAFc=;
 b=xkULUBJui1cZbntU/QvZQga2UyBTFAMmoaVo5LVzkuVYxyH/tHzzbACt5YfzYUw41+
 oJg+7Xiep9A0pRLHjuY4J+wvd5Z8I7ernIixueGUzSOsq49McT64zCFS4pxEvYc9ji9T
 hQCyyIStfu8Bv97639Rlcg0o8b2enDKrEr3Xn3Br0B0rLKInpZajUSL0PV4nZT+4rmag
 t+Rs/5llEOm5+QxneIa3hrxYUIJ4/WONi9gUkphiOYOiAKnQc8HP8RIpMZUNLCrrHJB1
 EU4hcGiWY8+kJUSe9unn6DyZL06rMqb5TVLIOV4E0J3aWM4gwrAZ0xyHVH/mN1UTEK0v
 /ybQ==
X-Gm-Message-State: AOAM531ABU1uSp3edu0OS5N8+TCR/XDihmwHNAuqEsQQh5Tc3e2avyj+
 A1w8avR5BlffBQ/bhthn8ZK82by038w0ZPR/DIiX1tI2wt/ei7e+
X-Google-Smtp-Source: ABdhPJzLRpFKGLpo1N/QS5SI3HQl/Hjb2lCE2CIo4G1GQZ5c2dkI+9cmLSwJhIlf9hhrj7pQ3xTUzGAc06ylzksOF7Q=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr12912937ywe.10.1646419349307; Fri, 04
 Mar 2022 10:42:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 18:42:18 +0000
Message-ID: <CAFEAcA8EN8sSSYYMh=u68-a7qXGaG-oSnAz2hT8kXXGtnDLnww@mail.gmail.com>
Subject: Re: [PULL 00/19] 9p queue 2022-03-04
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 12:32, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 5959ef7d431ffd02db112209cf55e47b677256fd:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220303' into staging (2022-03-03 19:59:38 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220304
>
> for you to fetch changes up to 39edfe337c418995b2932a9a14a612fb0c329dc5:
>
>   fsdev/p9array.h: convert Doxygen -> kerneldoc format (2022-03-04 13:07:39 +0100)
>
> ----------------------------------------------------------------
> 9pfs: introduce macOS host support and cleanup
>
> * Add support for Darwin (a.k.a. macOS) hosts.
>
> * Code cleanup (move qemu_dirent_dup() from osdep -> 9p-util).
>
> * API doc cleanup (convert Doxygen -> kerneldoc format).


This fails to build on my OSX box:

In file included from ../../hw/9pfs/9p-util-darwin.c:12:
../../hw/9pfs/9p-util.h:57:1: error: unused label 'again'
[-Werror,-Wunused-label]
again:
^~~~~~

because the use of the label is inside a #ifndef CONFIG_DARWIN
but the definition is not.

thanks
-- PMM

