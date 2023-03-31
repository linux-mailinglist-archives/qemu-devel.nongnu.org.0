Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23E6D1F94
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 14:01:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piDQ8-0002FZ-6I; Fri, 31 Mar 2023 07:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piDQ3-0002Eg-DK
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:59:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piDQ1-00023w-M7
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:59:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id w9so88629498edc.3
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680263981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDKFzVXZBWMoXiFCIehXWh1o5hNKlhQNbYYngCO8MMg=;
 b=Y8AydajIYQJJe91k6FfMYXgBxJnrR68T8zVH8q+96N38eQWHwo6rQGGgf/3GEYnCmw
 ATsxXddxxEnZFigolPWGjfP5qFHduzf2KapKWJE6FRKec7g1D+r+eUZn42xLfNrRKwxL
 CKUKZO92dN/uZ+yktfGGpXVFMqxKTEIHaIn/c+dQmwlEoSYqPmK0BUFgbwTBmiSILjhu
 /44qCMjPPq++tfMCOLNAq4EEsJ5+krmjZnrh6zABEZz9VHFJf0MCTf4MFTVr0I1fHWMY
 ktmHz+oVOoFCbsbSvUiufWuvVgRabQQH5OpZScLJetIAc7tZ7lk43FlgGv5+fQ0SaIGt
 3SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680263981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDKFzVXZBWMoXiFCIehXWh1o5hNKlhQNbYYngCO8MMg=;
 b=j1yUItFJRw9zd54KH9MljFxZcNKSbUB9lYGL+bG0lclR7gImomNiStOBEnKXA5ICfY
 3wyDcvJgaIv2XxfO9HGJ1K0iCHIY4wCRpamCJ9Z+Qs7oFPAqCBY8Xlsk+5r1lKg1kQ5+
 QiQl8gmbsVs8RLUFS1slbYEv4q32G+dBWd1tuNR8FQYYLQrFblSBp/L2Gs2wn7VHLDyg
 BJyg69dr3y99VxDJqUp67O0xNGkS7HgxOPWOqv2FUPof0wKI/cwVPg8qufTx96OoqPag
 wufYec9LFpilCXIs2vd6EBbg8+1AJY1s2vJoTBsRzRGxEHdnUtdU8tygkluVv9dU6+rY
 RuKg==
X-Gm-Message-State: AAQBX9dG7Cu8EFDjjPhoWwSSXTFEmm39gMGWkYbRgyezCYTQDN3GZzv1
 0tIl1yw5RjaXAG9olkYTthQwVjxDEqE04AADG+rr0Q==
X-Google-Smtp-Source: AKy350Yx/VASHk4cAT56cYHvwSq+MLV1RSdQbVPPMkd88L0BDxLzWkBKamKnmxMn6w67G5FjbhkJ4RtdhcYUIBG0C/M=
X-Received: by 2002:a50:8e41:0:b0:4fb:e0e8:5140 with SMTP id
 1-20020a508e41000000b004fbe0e85140mr13088305edx.6.1680263981084; Fri, 31 Mar
 2023 04:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230330131856.94210-1-philmd@linaro.org>
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Mar 2023 12:59:30 +0100
Message-ID: <CAFEAcA8CDY6m8gugCgGsp8Yoxwu7x5H3siRL-6heiUj6zuOeZA@mail.gmail.com>
Subject: Re: [PULL 0/6] Misc fixes for 2023-03-30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>, 
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org
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

On Thu, 30 Mar 2023 at 14:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit f00506aeca2f6d92318967693f8da8c713c163=
f3:
>
>   Merge tag 'pull-tcg-20230328' of https://gitlab.com/rth7680/qemu into s=
taging (2023-03-29 11:19:19 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/misc-fixes-20230330
>
> for you to fetch changes up to aad3eb1ffeb65205153fb31d81d4f268186cde7a:
>
>   block/dmg: Ignore C99 prototype declaration mismatch from <lzfse.h> (20=
23-03-30 15:03:36 +0200)
>
> ----------------------------------------------------------------
> - linux-user:
>   . Don't use 16-bit UIDs with SPARC V9
>   . Pick MIPS3 CPU by default to run NaN2008 ELF binaries
>
> - HW:
>   . Fix invalid GT64120 north bridge endianness register swap
>   . Prevent NULL pointer dereference by SMBus devices
>
> - Buildsys:
>   . Fix compiling with liblzfse on Darwin
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

