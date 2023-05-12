Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A7700AA0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:47:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxU2v-0004zL-Di; Fri, 12 May 2023 10:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU2s-0004lo-PG
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:46:58 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU2q-0005qN-Fx
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:46:58 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc040c7b8so15250613a12.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902814; x=1686494814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPU14pOSY/PCURzbFqEqxjo2Aqsydj5jxb0kRzQ6P2U=;
 b=EEMu1zau9+g0iR1edIn5kmkLoSvEVlH9XSLamM3qcF8RCbXvD82PrPGmDuyHxKx8TZ
 AZF7DcXPomRmQF7/lqYUYdbIZ0Ds28z45iTuH4xymEUSclIfPbrXXBlnowgm11X0aiNm
 dD47tr1INuIbzzpJg8IuafUuMkuy7Sjki6q8eiq+k+qGLJvAUVnfs3ey+mnRkgxBYfrh
 G5V0O78+bqvdrqX6tUWU3w1M910lm0/H4w2Ou6azHVrll/2XsKGklFjW+UADZaKJ4Vu2
 6vFuiHQQSmhNG5ekm0Pe3CBuxl/NTZmo7WhFpT/qfgwhODjy4lGJU+UfUnLh1cmamTFx
 9PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902814; x=1686494814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPU14pOSY/PCURzbFqEqxjo2Aqsydj5jxb0kRzQ6P2U=;
 b=Lz+Wh8hfBoUsLhKLXKNLJcCUzVb/cI604sLv3mIqEOGP5Ps11YiBc68e/AQvPjn0Bi
 6QyEDQHX7g9Ov/BUL3gJO2xMqS/ZAOXMijGXxTB49G3y2c4qkEd47UESMSd/WMw0Lz5f
 IRgZ6xAb8Ms27c/Gkq0dknMoXQj3fMKzfa2YAvsmaWmOrKMyNGJdiwY3ucGJmUpk67ge
 pfG5D1QUSXuSTDs+Kde57b3AqkLz5TdggIztgMtXrCdU5xW+/WFmG15LYzW2MPN/hLUQ
 d/Rr9QRdYB3oQChbfhuKLCcNMz5vCvlc2vP8KQh+5G2EviC/yJlLsHY1q8W2dK/mewrp
 wYtQ==
X-Gm-Message-State: AC+VfDxGCwsfLSGzT6Z2FVKR3SH8rBPwea1sqLBFTEUtkWY8qKEHe/Os
 iH7tEM3K+er2cPEtSneh4YVhRJ/dkYYsv2Vy2f9/9w==
X-Google-Smtp-Source: ACHHUZ4GjB/j1FtEJpqZvWTNrvYUzxULpi89IfKQ0eB0iXd96pAMLmlpkCMv7Cg6tHdPcaF69BjHzuE1ZGPnQ1aRC98=
X-Received: by 2002:a50:fe8c:0:b0:506:ba8d:c317 with SMTP id
 d12-20020a50fe8c000000b00506ba8dc317mr18569012edt.40.1683902814596; Fri, 12
 May 2023 07:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:46:43 +0100
Message-ID: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 1 Apr 2023 at 11:49, Mostafa Saleh <smostafa@google.com> wrote:
>
> This patch series adds stage-2 translation support for SMMUv3. It is
> controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
> - When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and s=
upported (default
> behaviour)
> - When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and s=
upported.
> - Value =E2=80=9Call=E2=80=9D is reserved for nesting support. However it=
 is not
> implemented in this patch series (more about this in the end)
>
> Features implemented in stage-2 are mostly synonymous with stage-1
> - VMID16.
> - Only AArch64 translation tables are supported.
> - Only little endian translation table supported.
> - Stall is not supported.
> - HTTU is not supported, SW is expected to maintain the Access flag.

Eric: are you planning to review this v3? I think only
patches 2, 4, 5, 8, 10 still need review.

Mostafa: is there anything in particular here that means this
patchset should stay an RFC and isn't ready to go into the tree?

thanks
-- PMM

