Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4B653EF2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JXq-00081e-QI; Thu, 22 Dec 2022 06:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p8JXW-0007z6-1s
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:15:14 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p8JXU-0002lh-BH
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:15:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id n3so540003wrc.5
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeY4RvyOTpoYTjUSEBaQdQun8nRrEn4iF6nPXRdk9iM=;
 b=I+m0JvCG78oI1KGZtUIEc51aHFwJLgXTkuPxJSqugxM01Dc7qaliitZLmFsuiys4zQ
 gPrVYG9IPlv462lQBVRW+UaYuYW/e+IAGEkjHfu/i9pKVKQdbJVyqC82kml2WE90YuJR
 wO3iG54Jy8B6ipUC/w7PLdoXsvCABUPG89tFFIRKH7vGBMemmaQYUfLGUm8JyBttWre8
 kzvFXf+br70OxJYL8hyVasx4NdmQoI0vFnLlElRX1sq2peAy5k4BFyfpspwwEfkKdlz3
 bW9kB5G+iyzfol+qy6LS5gprEIZ+pbtpfDny1PH8tewxT4DajePrwvyKY4manYxwaFuI
 PBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeY4RvyOTpoYTjUSEBaQdQun8nRrEn4iF6nPXRdk9iM=;
 b=wZX+hzSg0XAhapiNZGbO6iymV7oc/6R4E4NYga+ZoS7H8BPPuBEQUCjItZNp6N5Xj0
 +lhqcmzqA5G3oLF3MGBu7hgi+4WuYMB6SkcneT+3Z/lfx9Io7pKhSIJKCa/QgIQF6Z1y
 xIMnziV4GHsHe84UPIxIRlYIrJQEwQeoeOv0Q9kPD98q7TkmCm7Ub2676R0qgUDlJ9aE
 /wbsGjZV2qbqILxP379gdY6jVvY+OJs99Ket4AzHqxRv96GczxgzydMevwpPME3rLWMz
 fKoMT67px4x6ynHamaereNVO19OZFAAhxO8VGRVBH58ybCC6Z0tEj0ZdlvTmvrsUMxiO
 hWog==
X-Gm-Message-State: AFqh2ko6S6AhkpNZ5uSYI6sAIiUFkfTdWwgKc7aQuDdGAAJokUptXAaI
 v/PgtHEHlKgIkZFUmCKvxKV7UMKxqhekW/bxpN76bA==
X-Google-Smtp-Source: AMrXdXvg6dwowSDFWqca2MkvtI5VfxReDGSk+phPPECxzrNrqgMHqmoenWfkUdYLldpTgtpr8Z6uyiJC61x1I9Z8qJI=
X-Received: by 2002:a5d:4fcd:0:b0:242:61ab:5976 with SMTP id
 h13-20020a5d4fcd000000b0024261ab5976mr166174wrw.257.1671707700462; Thu, 22
 Dec 2022 03:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
In-Reply-To: <20221221144019.2149905-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Dec 2022 11:14:46 +0000
Message-ID: <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
Subject: Re: [PULL 0/6] testing updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

On Wed, 21 Dec 2022 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6ef=
bc:
>
>   Merge tag 'hppa-fixes-pull-request' of https://github.com/hdeller/qemu-=
hppa into staging (2022-12-20 15:32:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-211222-1
>
> for you to fetch changes up to 7a8ec48480c116db93e0d91688be1dcf34147795:
>
>   gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabl=
ed jobs (2022-12-21 11:19:05 +0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - fix minor shell-ism that can break check-tcg
>   - turn off verbose logging on custom runners
>   - make configure echo call in CI
>   - fix unused variable in linux-test
>   - add binary compiler docker image for hexagon
>   - disable doc and gui builds for tci and disable-tcg builds
>

Gitlab's CI marks this with a "yaml invalid" tag:
https://gitlab.com/qemu-project/qemu/-/pipelines/729324088

and the error:
'build-user-hexagon' job needs 'hexagon-cross-container' job, but
'hexagon-cross-container' is not in any previous stage

thanks
-- PMM

