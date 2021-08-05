Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C53E1ABE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:48:49 +0200 (CEST)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBhU8-0005cs-Gl
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBhTQ-0004wx-L1
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:48:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBhTP-0001y2-2L
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:48:04 -0400
Received: by mail-ed1-x529.google.com with SMTP id cf5so9573491edb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6MFFjMRstg3IIlWBWbpunfVWgwjoLCi59yxrMrVjI6w=;
 b=TeCWN/7RvPQywJL0ZiLbatXPfsuTYvDnDGzqiAMiUVUeOpSdpX0eBOWc/2ENHTQF3m
 o0bDaBEYtZomeg8i3TCoVosF+NbcEjbSa2nrw/1/9lHxVugbwonyzEPidXv8FrfivUHR
 42Q8FiIjm4smdCF2lKo97U5hpiBE6WefcYOLfR2FoDUuhf38VSBar1lY06RyDHGCgnG3
 PMWR4k+DZ7VoaNpi0joWFTc5Og3atKr6uUC/klqdf624+03siMfWdjsWCRgDtdGvn5SW
 03391DYK9r9UR+zaxyQeq1ohzcO7RwarhjfejpfZ4BELQ54fEdUu8FS8fKM80M9dSJG0
 7Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6MFFjMRstg3IIlWBWbpunfVWgwjoLCi59yxrMrVjI6w=;
 b=ggOgOpcxrz1ppdKyqAZ4l8DxOdan+9kBs92MaNsrvaidqoR5F88IqL9d1EB8nSzQCw
 zf3caR47hwdh8F0ZkI1OzQlPKMOsIA43MnSQ7LysN8WaqkcKQusNWDZnXnAKbHpX5cdA
 QB5z7YRPBsWaZtrKNgWkhw0nbcpeoVkudfd2u6tBsCHYYHrqQ06PajoIdiGTEHd+z4c5
 SYRLXgFgjzed08lohEYbZrzylIEGjN/WCs9l6Lunm1wq0BoUjApjcBrFhZ71uNKTPiDI
 HEJmpjFYgaxeo+Hw9qLze3wSDVMJ4M0HOb03dy+2CaxIgYCKL+obzfWyVs2WFK0ij/jP
 E+eQ==
X-Gm-Message-State: AOAM53124nt3B4aWNGnzOyNpSYhHBc0hWsmhCafWr3Uxj0BmY+WpeAUj
 ZqWyMM9hjCbhjj9TAoMVGcyopsmqyHXYpn+lOpteNw==
X-Google-Smtp-Source: ABdhPJzysY/zuAzv8x5YoC8cbVqgU898YPv/Qs8xH2WP+9GDmzInhyUsR6VpNWYv5YsAxkt8jMbObNoypWsD714E6fw=
X-Received: by 2002:a50:f615:: with SMTP id c21mr8351017edn.146.1628185681358; 
 Thu, 05 Aug 2021 10:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Aug 2021 18:47:17 +0100
Message-ID: <CAFEAcA8Bwfyw=DNOgi1RCevUZfkg4wZeGtb=Q7fqiJAPUXufpA@mail.gmail.com>
Subject: Re: [PULL 0/8] chardev fixes for 6.1
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 at 13:53, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9=
eb:
>
>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/chr-fix-pull-request
>
> for you to fetch changes up to a68403b0a6843f106e381b0bbeaacb29f6d27255:
>
>   chardev: report a simpler error about duplicated id (2021-08-05 16:15:3=
3 +0400)
>
> ----------------------------------------------------------------
> Chardev-related fixes
>
> Hi
>
> Here are some bug fixes worthy for 6.1.
>
> thanks



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

