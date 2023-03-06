Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FB6ABD71
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8Vz-0000ID-8r; Mon, 06 Mar 2023 05:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8Vu-0000HH-6B
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:56:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ8Vr-000222-NV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:56:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so12753016pjb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678100173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+WoYORE9OMrBiSUYAnQLFIV76lFUiJemJwY5hzx2c8=;
 b=zP/OAoG7Vp5q6gaNv8q8YGgfhpLYHkbeUQMaVIuEolHyYKThc7F0M7WyonthCsjA6F
 GQ/p8qhRGlETfIVWL4Srw+VaTkE3z5LBA6l0doox8zyVBUgaYCe6pZEHFuHRfLknSbPG
 abfa6UGuGCRksu1ftCkHfOID2/p8vCPYTtA9yaJp9CdCfYgFqWWeryv+iwRIVImrTWpW
 arve414bDeNDBpSg3UspvWlYdvXcU7iYQ3oBjcJ6PlOaEdQ1qlLyMOnyAgzpGcIo98L6
 9zp0R+EG4EztxFIWrIhO7brO/yoQnuMtP3aWyliZh4mDoR5B4btzuO4jwdE+rOTpe+a2
 cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678100173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+WoYORE9OMrBiSUYAnQLFIV76lFUiJemJwY5hzx2c8=;
 b=pGThImx2oG/kI9fvOMQEKy4EgDvfx7D2hNh8Ot8E/O+03GbvFtBx5mUTovywzX5ytM
 +9ujKWkm4Mn+pzQ8iZtpvmOubOL5hgQ1lxJG5gSi4GANixx4/2PX8AwJ11AiilT23RzK
 W39VqJzkRSPeiu/t3deg84YNf2b7idJdz/nJA56o1uqZyE32b91r1vUkLdruLn8NZXc1
 wpMVFsUwmunb6r0yt0bPjcUvcakHQ4jzRhtc8g0zcrAaxTm8OCI1FYbQ3eNw3xfvGSH5
 jXqn8cQNtKI5ZzFbRSTDKDgibCMKhTEQ/JEHt+E3V507UW2wNJNw+4uuIhoAcvnRhcaK
 N8dQ==
X-Gm-Message-State: AO0yUKU8OWu4fD0C7bBWaaiMG7QVo+z/e4Rhn1FY8k0Oz6g9C8Ozd9S3
 eETsP2MgLnNOpjrBQck1VXYFFiUf/3a0llsqKeCOcQ==
X-Google-Smtp-Source: AK7set9+yutBX+OqK3KGkW5gqvHtNOjzkIRwTukQYFL+fFCA4XEfEfa1Na/z07VLIUzGpR7+ZnlTIXqg88/61jvQUFE=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr3674365pjv.0.1678100172949; Mon, 06 Mar
 2023 02:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20230303160109.3626966-1-ardb@kernel.org>
In-Reply-To: <20230303160109.3626966-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 10:56:01 +0000
Message-ID: <CAFEAcA9v5QsPjt3u8SrXx60-5KXrPRrOcZG6DnnA=hknMHvU8w@mail.gmail.com>
Subject: Re: [PATCH v2] hw: arm: Support direct boot for Linux/arm64 EFI zboot
 images
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 3 Mar 2023 at 16:01, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
> format, using gzip compression for the payload.
>
> For doing EFI boot in QEMU, this is completely transparent, as the
> firmware or bootloader will take care of this. However, for direct
> kernel boot without firmware, we will lose the ability to boot such
> distro kernels unless we deal with the new format directly.
>
> EFI zboot images contain metadata in the header regarding the placement
> of the compressed payload inside the image, and the type of compression
> used. This means we can wire up the existing gzip support without too
> much hassle, by parsing the header and grabbing the payload from inside
> the loaded zboot image.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

