Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286269953B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSe1J-0004zW-14; Thu, 16 Feb 2023 08:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSe1G-0004ye-Vw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:09:51 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSe1F-0006VQ-7o
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:09:50 -0500
Received: by mail-pl1-x629.google.com with SMTP id e12so1962233plh.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bKO2U+IBl5Utg7VKRyLsikM6TseiqxvFNrfIkW2St9I=;
 b=eCL0uDKCnKYJeZkXmpj1AnA6b6ySLri5wM+ja4UcoePlPJE8XkucOVKSXhkdenjwee
 /QsHFffUGQxzUR9lw1h5aMuksPQGbG+nw8tSZ8VS9YEGQO9sdwqDRKMVpSDh/f//hoyX
 0r4MRcEg9cGvKwafemM1jUPGxrWb4SSukq0q0eh24is0io8VNjuQ8/GbFtvwv9Z3tMkv
 bedIWR+VE+6wHbaFqEq2jkHh5eTuAoYm1DxPkJjkj303vuNpV305PO4ROgVgWkeK2AmR
 4FraTQ+xyvyMgMV+lpUwthTg3gzE6mOPzHkAnOcN+LoB9feeUZvjsfnb+u1xx2aUqYuY
 Daiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKO2U+IBl5Utg7VKRyLsikM6TseiqxvFNrfIkW2St9I=;
 b=enddKL1UjTIw312JiUDdg0ZlLHDaAo+kqDI8Ez/gYEvGE+Q3+Y+SFVjfFhub50d5Nx
 gyFgOdyTz77iRL5c694C2E9HyDKwdDDTY2YIlxkARVwBNpo6hyXNiBYDxpf32weezh5e
 Vk0b7m2lnEPJTUzP4wsZ8X4csmVDhzG/Cr3JI3OKWrsexBP1VBqnK/isIXBHFMfN6r5y
 I/JGt2WX3BTYfcXBqDdBCA/YCT9aYYMK+uq6e2pDuB9i7v/3puVrPCBJmi3m2v7Xiu+c
 sxWk3ecVlvLQvzL+aAkSMZMTxuz7xjZPpZPy0oPGLhLDU6cJ2UJfGtq5+q14VAaYg5/r
 Qb+g==
X-Gm-Message-State: AO0yUKUfEbfRGtMh3TJjg0jzm6v9YD2eBG3t8VEHLlNrOu4dl8BP4L3K
 4+K4DCodi5Qdpz6v8JCDaqrYnAP664BByCPvHfpTAA==
X-Google-Smtp-Source: AK7set/CryqhY1fZohCUpnWYeucmTZawOxqIemKEcedJrspAxt19av9Yi2+0xSzZ2SCOX2PxcCxkBiFd4rs5Dr7TzC8=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr594639pjb.92.1676552987563; Thu, 16 Feb
 2023 05:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20230215181434.143843-1-pbonzini@redhat.com>
In-Reply-To: <20230215181434.143843-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:09:35 +0000
Message-ID: <CAFEAcA9xed18QDsZEWW-DuTk92ftcDrYOv6VGxk3D09-1xWKiA@mail.gmail.com>
Subject: Re: [PULL v3 00/10] Misc patches for 2023-02-08
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Wed, 15 Feb 2023 at 18:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 3b33ae48ec28e1e0d1bc28a85c7423724bcb1a2c:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-02-09 15:29:14 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 12008ff748d8cfb62fb937559c0fd844371bab5e:
>
>   libqtest: ensure waitpid() is only called once (2023-02-11 09:20:38 +0100)
>
> ----------------------------------------------------------------
> * block/iscsi: fix double-free on BUSY or similar statuses
> * catch [accel] entry without accelerator
> * target/i386: various fixes for BMI and ADX instructions
> * make the contents of meson-buildoptions.sh stable
>
> ----------------------------------------------------------------
> v2->v3: dropped the test that failed on the BSDs, because it could not be
>         reproduced on a VM. :(
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

