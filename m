Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF839B73D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:38:35 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7Dl-0002dv-Gy
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp7Ca-0001Tw-Of
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:37:20 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp7CW-00066X-0x
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:37:20 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b9so13701758ejc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkWoVfUEcHp6KaXjgqrFMAnQ2spq921Goi3opiL4IAA=;
 b=i1nqCoV+LCs/Ifrt5mEWKjsdhf9AzJr7GvVg7NXOcjgkLAE55h1A6b2SSZOhGEWrjA
 eCdtclG2DgBnFY8yHohhNNzzfqdkef0qf4UcuFxgRi/pc1v315DCAwEqfSF9hlBIxOst
 vvNY/X2ZjPPDyOvl9ytPm7H9A7t9MJvuJL8xivlqN/jf+3HCGZ74gNn6aeUr+W7FYk9z
 v1Tcwe/YDyVnFCz3LBlgxvAFuEEyRh5pzCHxqEAZH/dy82XjA5C6hKW6Jkj57dM44cHo
 SV2gl6MFiO1UE6Li80y1cDLyyFxuE+xbj2i0lSbBBtSIYqj3jW4gRgjXuoIB/LHJ2Uby
 nKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkWoVfUEcHp6KaXjgqrFMAnQ2spq921Goi3opiL4IAA=;
 b=HbUE8SIhCWGrlhNo0QRBJhuZ7i8p+IKsmWjZY/34b3ZkI9WfIctsXVFf6zYH9X2H9q
 HBPVEWskUHQjOqvoiNglCZY9QgLSxDDAahCoxN41u001KUFgZjDoh09q0Z1yYhnpt9L0
 H4d43HBGK37ZbEbBsuEqxWXRs1DrZSfnUMMFgE0dxUzQ26F9K8YFwQoRrz08lAbxNQMc
 dmtf5gLiMKXbGUVhB7fzKqyvTrBoDAXK/3a5GlJRXc2SzVmwOh+uTaQs5hArBTxzwSBv
 zfaTmBjcXw2Hzfe24TWVYAnGOQvOju4nCO9FO2KAKv9sfo6PJvlzpVbfi/ewsO5tK0Ca
 aNjA==
X-Gm-Message-State: AOAM531cMOjSacrITEf5ZbiT6XJAuOfjAcJJ1abS9taK/gv7AHGJMwFb
 TycZfzO61Lj7nkYSVGRtPkB7sq7ZS0zNug0cu5LMqQ==
X-Google-Smtp-Source: ABdhPJxxfqkoFNeImecRUG3MJ9ATYB2z1wOS/aNhQxyg/h+iHvbx4hZ+Iyl5siCGo2WAw2jWKPVYqMTyW2evSCW7Ru8=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr3636796ejk.250.1622803034446; 
 Fri, 04 Jun 2021 03:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210603214131.629841-1-richard.henderson@linaro.org>
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 11:36:40 +0100
Message-ID: <CAFEAcA8YkNVR5oaKLHRiW55HDyK1a5mwL3rAGDzp1obMtpEd7w@mail.gmail.com>
Subject: Re: [PULL 00/29] softfloat patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Thu, 3 Jun 2021 at 22:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 453d9c61dd5681159051c6e4d07e7b2633de2e70:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210603' into staging (2021-06-03 16:59:46 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-fpu-20210603
>
> for you to fetch changes up to 5d0204b82ade0ea0630d6add894954135ee54ab1:
>
>   softfloat: Use hard-float for {u}int64_to_float{32,64} (2021-06-03 14:09:03 -0700)
>
> ----------------------------------------------------------------
> Finish conversion of float128 and floatx80 to FloatParts.
> Implement float128_muladd and float128_{min,max}*.
> Optimize int-to-float conversion with hard-float.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

