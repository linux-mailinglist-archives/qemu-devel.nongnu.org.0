Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFA6C8F70
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 17:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6lP-0006Kp-Bt; Sat, 25 Mar 2023 12:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6lM-0006KP-UF
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:29:04 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6lL-0005Cf-7s
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:29:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id cn12so19578599edb.4
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679761741;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SFZrfo31sHR+K9G8GmvyTykMXPX+1I7gfTJoc4BlDG8=;
 b=shYFr/FREvGOx2uYd56IWzZ66ZjZK5URuklz4lumyA1S6BzwQn+TwFGRyWJn16BI4R
 A9VANnoj8wmtBGRL2x/FdFbx7funCYgKQWmv9kKrVneEW3d6ju+R35ARoDCtfuVnP2Pe
 +2l0Z76mQKvWL/wjbJYEElwXW4l8nbPXvRSzrLevniFM/PkagVkuIjbEvHtapA4+JURR
 Nsrgb4B9i3b/Mxf69kJe2cWVR2/VycYFOlTJ/fOQViQi+LgHoNHNelaihq1vRDDmKhmL
 3ENLRGWfeUlZsFcYnNTpvcXYvaSn6wOJlT6aO814KMisY8rWSqWht6WtL1lke0sXxDte
 uFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679761741;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFZrfo31sHR+K9G8GmvyTykMXPX+1I7gfTJoc4BlDG8=;
 b=E//Ot20RnQQ5qjbD1xsoVggURT8Lhsv8ll9UEZ//f8oLlI96ARYy5S+W+gQdfJaRgq
 tXlWIUIPEKlfrk12b+66qbjz8zj9gFKbAfCXRMmjdjRMbQsKxUyTJBbBaxD86ZqnqaFx
 1nWUJ+MdkVFGAvFTqjuLOQ4w0bNCcu0apHKabQd1mu4XzHnHLuOohvuxN/ypE8NaBZMv
 gQH1dtiTBPU2z4ESW9gL6MJgeequcvdmNVYh+hMGBUsTlugDk9MbJ6tJDdXn/akvWavr
 UYEUuzb2bDJiLgqRFHQDgYRVq+jaDaV7b7MO3/dL/HwsUCnnJchhzNiGmJa8S+bf+Ma+
 TjeQ==
X-Gm-Message-State: AAQBX9dUOWGE85pj6hIah5N5Gwsl/cLUZ4SpluudWYP8C+eDLEtaFIWW
 42ECcACiXVyc5TCtspru8OKlsGuNRWAyrkxq9XMCGtR3ELUd3umJ
X-Google-Smtp-Source: AKy350Y5fe8ACSF2TW0CNUN5om6Z6MOVsDuQ1zr1Hm8JFPxyluPemiS4XK7uY3RjaZ4Q2jtb11Bpj8u9DcP/eAa04H8=
X-Received: by 2002:a50:d517:0:b0:4fb:7e7a:ebf1 with SMTP id
 u23-20020a50d517000000b004fb7e7aebf1mr3123684edi.6.1679761741481; Sat, 25 Mar
 2023 09:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230324145613.41502-1-anthony.perard@citrix.com>
In-Reply-To: <20230324145613.41502-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Mar 2023 16:28:50 +0000
Message-ID: <CAFEAcA_PUtJpMicxTMUn8d7C+4t7h2fnLpFb5SptMeuVGtK-Kg@mail.gmail.com>
Subject: Re: [PULL 0/2] xen queue
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 24 Mar 2023 at 14:56, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
>
>   Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230324
>
> for you to fetch changes up to 670d8c6ebf7a2c425575bbd6fbaeb27d21edd6c6:
>
>   hw/xenpv: Initialize Xen backend operations (2023-03-24 14:52:14 +0000)
>
> ----------------------------------------------------------------
> Xen queue
>
> - fix guest creation when -xen-domid-restrict is used.
> - fix Xen PV guest creation.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

