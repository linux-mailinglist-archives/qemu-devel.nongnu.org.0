Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD94D386F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:08:04 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS0jD-0003nF-7i
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:08:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS0ht-0002ZR-Hl
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:06:41 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=43701
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nS0hr-0003AB-UP
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:06:41 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id g26so6026259ybj.10
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lw93NI9dEHV/SI7d3pa2bW9/kCRx5oqpNDsNr4eOUXc=;
 b=HeOhFDPGIydfnvF4jcKNqxmwrMPgCTqNWJ9fcOWOJ7fRcB+UpXf7GN9BAK7N2ywtz9
 kjREKBBKAxlVf+yTC2hYISo/xb4lT1xgqcCLjwsGiIGBT/MKyh+ZHPIb9WzTIS2fXBeq
 2AUzs7kkCZMGKZgCDDv3xk881IcgMONbfpyWfUhmttenCODjCJ7e8fIAXSHt2AeHCZfG
 2AHd26/XJDrmiErTilhPDgZw3d50P5getHjcBHdYMPA/eIYv8Sd4wQkOzx8wT1zJlDcc
 TD0M1rDCVilnyxa7u/5QkVXT1mCUPZkt+01QoTmGnxjQrDkewTspKny/MfCvxPviGzkq
 uUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lw93NI9dEHV/SI7d3pa2bW9/kCRx5oqpNDsNr4eOUXc=;
 b=4JtGVs3hsRQY4MK+R91AM1nUNaEyeIJAbVZgBTNLuUKeNVk67by9c7qYvglmnEe0hx
 a1EuPxcscB7grHmkCMqoM3u9W1s+N6zZ2yXoel+4YZp27yJvmwNJSoy9icjlTe3pNObP
 qWRceFdNnj9LIVslPK69uC1T8+5ARjfL5c502SZl9abjfl1HNeU6GRb/x+j2U5ir3MB+
 bSY2QDj1C5oUsSae7kqzpWBMoJ8cy9Ms+JbMRbJttKDh4htnlaEeDw0wxZsjRqGsNRox
 eJGWVCcn5HROfRQ6DZqiBOoTWOPvpMs6v56dfGFOuz6nNhUKgRqyehHvN6yDC7KBdFW/
 tz7A==
X-Gm-Message-State: AOAM533XfZus+mS8YVwxpJHjKIhcVK8lJkTpxkTI+/Cch67BOYTCxGGD
 0Ax5FmfJAj0VAswe5aAMT7syZSuZLr9CKmBatG9/0MmwsFxJUA==
X-Google-Smtp-Source: ABdhPJwQ4XgVOqLxdNMOUEd+/edD9rOF4XSIgImFCHy6LHMwGsFHvY+ohWbYecP3OLgpP1bFIxGHUninPuG6IKhhzOQ=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr820220ybq.479.1646849198790; Wed, 09 Mar
 2022 10:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20220308081601.23803-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220308081601.23803-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 18:06:27 +0000
Message-ID: <CAFEAcA-u12ffXvqP=2dQCBuJLj31x8g+bv4CwRdan0HPZqMn7w@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20220308
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 08:16, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-03-07' into staging (2022-03-07 17:14:09 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-openbios-20220308
>
> for you to fetch changes up to ab71472dfb05eaa11d3e216c24d499b6e64499f9:
>
>   roms/openbios: update OpenBIOS images to 0e0afae6 built from submodule (2022-03-07 23:12:01 +0000)
>
> ----------------------------------------------------------------
> qemu-openbios queue
> - Fixes for milliseconds and CUDA get-time
> - Remove .stabs ELF section from openbios-ppc to prevent crashing newer gdb
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

