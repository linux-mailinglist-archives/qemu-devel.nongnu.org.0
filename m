Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E184949E1D5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:01:51 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3TL-0003eE-0b
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:01:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD31P-0006Lw-4W
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:33:02 -0500
Received: from [2a00:1450:4864:20::32a] (port=41574
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD31I-0000xh-P1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:32:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1680616wme.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MXakyS7EbXLZAHfC1IsIa9VUTszgbmVi81rYXPHQRD0=;
 b=kEStkstgwMzfKCVq4it12LjX1hAfPbEGEhXYj+CtTVxXOSVdEYEav+87r9WNyxeST/
 qNwXqY0dPuPRdj1HNV57NO92IQkzeAm3H3BKg7wBeLUM6LoaQe/OnpScRzYIvp4vQVUt
 TRjOfEOi60UGCauiiDDFmy+bIomvMrO4qpFndUQ/Wqo6Evbkp4/TVRYZykDM4hK8Ckpw
 5Gufc+kskTmn3jCo3fa5L7u4Bdvl9a/QBM7Epx0Eqxqu1qAhdSUWaPX7GhFDbAI+sgxq
 pepQEm6OBEpXDuok+MxXzyIdgVGPX6pCK37vqDh5AT0nn7CobR5zWUuCQGICqnJ0SwtI
 BVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MXakyS7EbXLZAHfC1IsIa9VUTszgbmVi81rYXPHQRD0=;
 b=0a1q9y0jJu0DaPncmcDOPM7+9CLHGGAmwxYYs6d36DHZBm9oJNL7yK8xBwDY4lMWoR
 LrE7Awu8UXXjKCkTalWr2viDrSC9cdfMSBq+XTqljw//rU6nECmvilMuZIcXDgTRTsj0
 5EUZyhWcAGeGANYpUU4kXRqPFJgvaYeEPb8ZOorct4/48CcnIjPvmaNRmK3Ir/h1YSoW
 2z63QlwaghjS9E/izysdJOl3jzNfw5O2pAN5g4QmZjLpj1ndlEFmArH8LtErE5gKqcbH
 H7iW1QiS9qc3Os85CiGI11wLc23UQt7MK8WUwNDyKaiXs/G3rlXxI3EnYTbI1JuS4P3U
 1xtg==
X-Gm-Message-State: AOAM531TdLIHt0BtDJAEqk+7sAR7u/Nb9XLU2MSSUE/QM2ZvASe0anJk
 xOX2PLUP6Z3OETbTk3oiVxwbg5PNHF/taPz8suGfNQ==
X-Google-Smtp-Source: ABdhPJxOooadravhA1H4bDvSqEis71wAIqTfk3rY59WrjoDnJyGUpR1+1fA1FlqCD2RnImGMyvV3mJfmj1p2eVcoEcM=
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr11346345wmq.21.1643283116482; 
 Thu, 27 Jan 2022 03:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20220127111037.457901-1-pbonzini@redhat.com>
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 11:31:45 +0000
Message-ID: <CAFEAcA89uOfQ4t81EJcAQEqZBzmOFEFo0KxF=chx41GHuc7cLw@mail.gmail.com>
Subject: Re: [PULL 00/14] Misc patches for 2022-01-27
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 27 Jan 2022 at 11:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789=
ab:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-req=
uest' into staging (2022-01-22 12:03:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to b3378ce9cd2b10dadf34a59f1bcf2fd80af8b3fa:
>
>   configure: fix parameter expansion of --cross-cc-cflags options (2022-0=
1-27 12:09:10 +0100)
>
> ----------------------------------------------------------------
> * configure and meson fixes
> * "meson test" switch for iotests
> * deprecation of old SGX QAPI
> * unexport InterruptStatsProviderClass-related functions

Philippe Mathieu-Daud=C3=A9 via (1):
      meson: Use find_program() to resolve the entitlement.sh script
ERROR: pull request includes commits attributed to list


could you fix up and resend, please?

thanks
-- PMM

