Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A337FB63
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:21:48 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhE5r-0005ma-63
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhE3H-0003tC-D2
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:19:07 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhE3E-0005Yc-Ft
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:19:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id c22so12552029ejd.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pVH5hCif0vbSUOTjS1VO0oEYmFc8PTLBa8bjR2qPpj8=;
 b=BYZlU0cid5C+77Z9BhOl3aA9ZqmymO3/ZZGYQEVuF2TWCtlTct6Swl4BxPWpFKCevU
 orlPhAExT4ybr+J/0xrMKHHBiiMEnzeuq+6U8ZwWDAPpP0enw2cqVU6nt46xVJlb+s7R
 zbhkChA84Beb31CnOW429P1QC6UIkSgbMS9AXNXIRrWCYdpiqym5aLN5fM7fBsxe0wkB
 aciVmOBUy/DpxUoW3c+MJU1Jk3THRw6S1hCwSuWmLICmkdX/kKX5T+kAy6MSdHxrC3VU
 W1ieV/3goFXISboHcgIbERJchp3a5qxElRVG4o6gEYgApmxrSPXZzLhQdfoJ6lnXR/+u
 +SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVH5hCif0vbSUOTjS1VO0oEYmFc8PTLBa8bjR2qPpj8=;
 b=TATGrQQyuwwOikLPebnKeeAnXQUJGZ26Iga17YmOymnLCS2LQC/hxiei95G96PvvMD
 6GrSvVDNTjwDZNmk/ddlH1geEho0oaVDZuMK5UgbuMHQkUP2Ur4Yn7W8xGpafT1a1ZsT
 T1ILx5bSPDstkcNnddfA82v8asUeT1fsimmOB2FK7autbjakgbx7GmONF6RqyQj8+Vtv
 LTEhuuMhDCYRL77KbaeEdjqwSYY+qj6QkqSS/ojMhE0rfxUG6vat0oC8lkC3EdhMsr+2
 c2lFM09UdfXzNnjbvTjdvr0hA8v9gS72K8XJWRNnDqr+60jxYrEEaG0buZBLV9btqQ1C
 B0PA==
X-Gm-Message-State: AOAM5319iGoZ4Gc7CiEN03TqUrB/25gb6O8KmvDu3HEA9aj7sAUtyhqg
 UDtS5EkQqxvdepvbBgsaL36z8gIBLPqupUR4GBZxIA==
X-Google-Smtp-Source: ABdhPJymKB1xmusErSKu0nLxY1OpUflAn4jTzTJSgg+XNBFAWgWxS4QrTRHIAoPscsS/j82b8jrL5j0NbtAp6WYVG0A=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr43895069ejb.407.1620922742884; 
 Thu, 13 May 2021 09:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210511161504.3076204-1-philmd@redhat.com>
In-Reply-To: <20210511161504.3076204-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:18:51 +0100
Message-ID: <CAFEAcA-=toKT+r4XXM3EfsOTmjeA9ZY688THUMtPtobNu3cPcA@mail.gmail.com>
Subject: Re: [PULL 0/2] pflash patches for 2021-05-11
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 17:20, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit f9a576a818044133f8564e0d243ebd97df0b32=
80:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiof=
s-20210506' into staging (2021-05-11 13:03:44 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/pflash-20210511
>
> for you to fetch changes up to 27545c9df24f509c6d1c1f17478281a357125554:
>
>   hw/block/pflash_cfi02: Do not create aliases when not necessary (2021-0=
5-11 18:11:02 +0200)
>
> ----------------------------------------------------------------
> Parallel NOR Flash patches queue
>
> - Simplify memory layout when no pflash_cfi02 mapping requested
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

