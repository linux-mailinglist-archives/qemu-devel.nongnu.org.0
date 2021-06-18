Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12593ACBAB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:03:09 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luE9M-0002xe-9g
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luE7c-0001fz-UV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:01:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luE7a-0007R7-M3
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 09:01:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id s15so8489577edt.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g2hck1l/5XWH701+rXdUy3Mpx5wrEbQcVwL4iuR0B9E=;
 b=c3XPTShogdVP+iA3ea7FIu4CW7LE743JPwdyY4S/rIMCkPWxZ00aDtg3aL1gWLsOuo
 I+BVuFXAYF3HkpSG7r04W8sjjwTsz6+m4621wH1P5B03u3xfFRrwT58Vto9g3cJCtDBc
 65rIuGNug6IZ4Pdmu1z7VuzoQFZqBgSlS7B0Pq9uK90UwkdmJRD658Q5XlIZ9XeCQFne
 WE368lGSuWhiqLUisk1JHK0PkR3TlpgpfPLRVeF+0IkYPFst+dZ1FCLtyhyzdnUxm+Jj
 V0gcWSM1zr9SC1gVyfml9t+Kk+IVI/wlCW0kHbjAb4AG5JTnhmUHxqTHOoxblWC3lMCT
 UUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g2hck1l/5XWH701+rXdUy3Mpx5wrEbQcVwL4iuR0B9E=;
 b=ghDigtFqjxcY06jDjMUSftGPelsYf1f0Nh4cOW9i3rmn61AkI/FvAnJIIZ1TU61xNM
 /5waQt35naf2VMNeXRcgZLIIo8nTJo4tVFsptBtLT43vVq5Be2bTTow5iOPQ33G3T/HT
 pBlc63Dn9ru7Q5xWXf6X50vg1yrs6sbhuo6iS+09WV80ATLkDJHdzaio72Vhom9DHSwD
 WrS70HTILBsQDcU05x6nTxUmMZnlLfuRP0ijBui2XaYIPe6ZwmLRQWi+OZgntIvQOwto
 88EGz/wGCjP6RWtLLmcKzrmVEN58qhIqN/Tn0D8FY3hpOBmacCLRkn5rS95PU8HbN8lT
 iBsA==
X-Gm-Message-State: AOAM532cpCF2wzyXbl96iOQdoLKqXt1DB521jR7oMn0UgCAvkz9P9C7a
 2VjBUad/UjJHSrQLY0erpirzVBxkh5dHeTgTdkz6/g==
X-Google-Smtp-Source: ABdhPJxB8SufbKNDZBLOWx7Er/1lMD8yYYpD3wU8u/Bgz4q5WeFU7EDgv4KLK20vi6xo3/JCYA+WU/u4vehL6ehRgKY=
X-Received: by 2002:a05:6402:748:: with SMTP id
 p8mr2456472edy.251.1624021276771; 
 Fri, 18 Jun 2021 06:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210617124107.2386073-1-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 14:00:41 +0100
Message-ID: <CAFEAcA_06h2QwNC=_8AZQfdvMO_nAuP7pABoFqGXUMSTi5HcEA@mail.gmail.com>
Subject: Re: [PULL 0/7] Audio 20210617 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 13:55, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 38848ce565849e5b867a5e08022b3c755039c1=
1a:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10616' into staging (2021-06-16 17:02:30 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20210617-pull-request
>
> for you to fetch changes up to 986bdbc6a29c4d7ef125299c5013783e30dc2cae:
>
>   coreaudio: Fix output stream format settings (2021-06-17 12:00:26 +0200=
)
>
> ----------------------------------------------------------------
> audio: bugfix collection.
>
> ----------------------------------------------------------------
>
> Akihiko Odaki (2):
>   audio: Fix format specifications of debug logs
>   coreaudio: Fix output stream format settings
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   hw/audio/sb16: Avoid assertion by restricting I/O sampling rate range
>
> Volker R=C3=BCmelin (4):
>   alsaaudio: remove #ifdef DEBUG to avoid bit rot
>   paaudio: remove unused stream flags
>   audio: move code to audio/audio.c
>   jackaudio: avoid that the client name contains the word (NULL)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

