Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEF68E34A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:12:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWAu-00070W-N2; Tue, 07 Feb 2023 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPWAo-0006zl-Da
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:10:46 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPWAm-0003tZ-Ot
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:10:46 -0500
Received: by mail-pg1-x534.google.com with SMTP id q9so11436711pgq.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 14:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRKnaWz2seEzH+vZ1Vks165VGrnQpRizTdVClwYbdoQ=;
 b=lKd+E6ZzjmhNb8xROguQwe9m3nM0ck3pHRMaQQ87fzZVES+UXwVO2E8YxAuRP2RHkY
 ilcucr/NDLs58aVRfksruYoLWKEP+sDcBip3LhZJv+jgUXg+UczAhXvgVFtAGk1f7FV9
 WoVpokork2XJPZ2ABT6B1JUlNE4Lp1hGgrCYUWAcMMwLkgtOLDRD1fd5YRVe6iIQZU+f
 fUHMVzqpAArBXgVGdHENJvzl96KqFDox4ruRBQDP+HpI7FL+IKEQbxFgXDbGrlVsV24J
 gibA9Hty7ak92l4+nkr+D+u0eKnThQdyyM6ecNexNv30LRv0SlhWDVNe6KqtdfSoGFko
 gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRKnaWz2seEzH+vZ1Vks165VGrnQpRizTdVClwYbdoQ=;
 b=GvzQ8R5nlFwM6obiQQzFo3Hi1WypPBonQtcnQ6QCy+5tQzcXvwZ2XWyUBm1VM19CLd
 /A3YsYkXgBEchjGb2hTq9tzD40VEkUz3n9I9d2IfB+kp7p93UIYf49SQBmmxLO7ZTZUc
 WBSDJKJnvPYQt12ksG5ZLf4MEATsTxhq/5Y3CHEneRW0hQNTsborfWaQDoUKDd7+6Cmp
 +76nFmHAhKit3KboMuPGx9Ni1JlfagTjplSfH7aheo1L8aq1BONdWLI2stHdbTRMsfnS
 VE3cm8pO3UHlP6e8jquBpzeU9qIVgqScksDY6OMIV4sSoYY+elbV964VYASaiXHrt3G6
 8/uA==
X-Gm-Message-State: AO0yUKV9c9v0j1rrm/hS+iAuxsvmzamXOpQHqb3KYV38CxaDGeUjzLI8
 oDkII8nqRKA65oYj2aw/D4lowFy6ubUBO3v6phQvnybl5yU6jA==
X-Google-Smtp-Source: AK7set+HyE67M1bLPP8LMxRKEYYeLEiOx/bU16dxkX7fzudATQxORbcMmRQQJ3V72Z/m0Idb7owCKyMvpw82pLN60ow=
X-Received: by 2002:a63:7207:0:b0:4fa:b562:f29a with SMTP id
 n7-20020a637207000000b004fab562f29amr906238pgc.120.1675807840185; Tue, 07 Feb
 2023 14:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20230207100744.698694-1-clg@kaod.org>
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 22:10:28 +0000
Message-ID: <CAFEAcA8rejLeXarhqgpymV82-1GwKhy72cPERQTvi6PQKbOHSA@mail.gmail.com>
Subject: Re: [PULL 00/25] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Tue, 7 Feb 2023 at 10:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e=
8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into =
staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230207
>
> for you to fetch changes up to bf81b8f8acda4f1f774adc5f8e76225d472c6ae5:
>
>   aspeed/sdmc: Drop unnecessary scu include (2023-02-07 09:02:05 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * various small cleanups and fixes
> * new variant of the supermicrox11-bmc machine using an ast2500-a1 SoC
> * at24c_eeprom extension to define eeprom contents with static arrays
> * ast10x0 model and test improvements
> * avocado update of images to use the latest


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

