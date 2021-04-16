Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6E361E7C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:16:42 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMSn-0005mH-2X
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXMRf-000549-UO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:15:31 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXMRc-0000S3-5n
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:15:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id i3so6115478edt.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mrhJHHHGg1vMzWlVs+H1N1tb/16jLZLZI0RehSdwhzY=;
 b=o8adYulXy6RfIKCXumyppBJAcMLcOHHd0W4VYGOkiD+YOlocDzlbUQHfel5TRBHeux
 tqffa2YK8PD2hbBHnsoPsDo5q190K+Do4NJIjI4d17BjyMN9Ai0fJWVH9JOoVVqbzZUV
 t2CuU7Mbr8fYYNT//0cCktyuXEAoSf/lPPKBQt3p0hqE37R5eu4tZRmC1+tw6Jq+aLuv
 sEMPePUWL3frauziX9gErWrIfAoxSo1SjAegCLemx//VSM43kJE3TRHA0U18XFpBFr+V
 P4zguX57TSAhU87x6t5WtVOXRjKvef6OFZ1HvbW6+3st2h1ZCfQQ3XKQHj+UWCnbFZmS
 yJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mrhJHHHGg1vMzWlVs+H1N1tb/16jLZLZI0RehSdwhzY=;
 b=kJAlV9dVp7BjhePoqGrGswszW19XLIeHygOcL+tEdmhZhvW/zPIHQ300cSJfWJb6P/
 SlZ7LqBdXVWmjql/pcsD/msGawLUDqRtaeVdQKO7XFKpYV70tRd4KqNP0mMnztKKJTVa
 eWUW/IECmWFqzhUfNpEu0WOqDZqf2G5MzJP5AOWqQ3LHQoUBw3+MHGpkBfJBR6de5h04
 plMSprv5MSaVMA7+i64MFXy7vp+Uy6IaiOjc7YmrXTlLtem2Vs71IkBWvOUwVYxjljDo
 IeQhBATcBFL6P2gEBAwcDrZ+erkyertVlrtsjW3xhhj37lP26ArQzik+E/RNjgROpDbJ
 OBWw==
X-Gm-Message-State: AOAM532S7Lon5p6k4CJ/oYcS0dRYe8TVnG4655ai3iREEpu3tTERmIfc
 Q0CdejBditMzcgyUHjbLdpk7gjv0A7DToShMYUVRpg==
X-Google-Smtp-Source: ABdhPJwzurlc6nCYPhvQe0xKW7OO7kfr+/u4EOe0Ti68CF4gAuk3GOM6I5Lt5AYk+cTxUllaXspk+ESjOHJ4pFJHN6s=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr9122017edq.251.1618571725070; 
 Fri, 16 Apr 2021 04:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210416102559.213649-1-philmd@redhat.com>
 <m2v98mjxkg.fsf@oracle.com>
In-Reply-To: <m2v98mjxkg.fsf@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 12:14:36 +0100
Message-ID: <CAFEAcA_QytPTHSHtm+7gH087gmSeuUVXPfa=7HnEBdcQmt9OTA@mail.gmail.com>
Subject: Re: [PATCH-for-6.0?] configure: Improve error message with specified
 meson path is not found
To: Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 12:09, Darren Kenny <darren.kenny@oracle.com> wrote:
>
> On Friday, 2021-04-16 at 12:25:59 +02, Philippe Mathieu-Daud=C3=A9 wrote:
> >   $ ../configure --meson=3D~/.local/bin/meson
> >   ERROR: Meson not found.  Use --meson=3D/path/to/meson (absolute path)

> Interesting that some shells don't expand the tilde (~), when some will
> in this case - but either way this message is a lot clearer.

What shells do expand ~ in the middle of a word? POSIX compliant
shells should not, I think...

thanks
-- PMM

