Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF96F4172
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:23:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnAU-0000fj-TR; Tue, 02 May 2023 06:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnAS-0000fQ-U8
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:23:32 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnAR-0002pi-DZ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:23:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso4940418a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023009; x=1685615009;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QwiVVt3oLppkZq39EYDxEi/7t+3LdE7OOzcJj34YbjY=;
 b=ErnH3cMbvl5K+3BvZLfaX09WUN6/Q+whe0k39ElO2OiE5YmuUvYkWGuPOenvj0OJuM
 xHzut1bgZ5qTzWp+k2Wnp3mtG8cc5L3Gqind1ZkPZzLNGJwMWlYXwzgD3ZZPvju+9co4
 mIxyzw4IsOXNORsggCAIb+TGR931YYOTTPx7TmvW+ohr3DUA6v7ZOf7ViDPWoKN0NCIL
 l80UHJmxqVU5v7k9f+2Urqk3gdc06mv3oxi5ff5nV+olf7T/cij7oel8romy8ogloRpu
 5fCThYtEJqE0l7W+9pV/yvH2gywnOM7ziU47fDfsNzGJCJSsM3I3cH9ttM+a1F3Zfcyy
 V+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023009; x=1685615009;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QwiVVt3oLppkZq39EYDxEi/7t+3LdE7OOzcJj34YbjY=;
 b=CemxcVA8a3oIsnFLSF2B1oMoWI3iyQzaHhVBFhRqsN/DDcmNQB6NfmMZ9CIHYaB3Py
 ZAJPQMCciy+vXI/w2k5YstHgC5RKPFEpCnSkXE7PNEbDmGBOQ9cXbX55MRjo3NlYmOsl
 tf+wwz02dlbUUwC4rvfdFpZA68PeS3yJcJt2UwdSQw2DnWgaQPHFo2mPHpW42+Y5lmGU
 2ZjOPGFLxWreNFLyPCAbhn01uXddJNG6KAYtAtQ8jffTcJJggLkLlbxzb3tuVa5QoC87
 ZHLhiups938GY33twOsh9gm1Og1sa5LA75BKBZp50mNZwdC2zkZTcbbfIrwtT+bJ/1GP
 lWTA==
X-Gm-Message-State: AC+VfDyjaerqhELwFOTwiHT9LsANfpq/y2NQ8C+AeyQlbFhGJ7gweHtn
 K/k0ac0mpHI2GPsTLg1xOGjiLFmvkI4JOscPujYIZ3LAqd6BDQyq
X-Google-Smtp-Source: ACHHUZ47PC+lJbdA0+gzPxzA0bWyLARO8ioH/wmJcky0CkJzaPmHOd+bAIlFhdKuioQCR5akhZAFUiEmIRndh4IHdYU=
X-Received: by 2002:aa7:c758:0:b0:50b:c3a0:40e5 with SMTP id
 c24-20020aa7c758000000b0050bc3a040e5mr5930456eds.21.1683023009640; Tue, 02
 May 2023 03:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230420122256.1023709-1-peter.maydell@linaro.org>
In-Reply-To: <20230420122256.1023709-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:23:18 +0100
Message-ID: <CAFEAcA_ZDg6AQjA2TMptS5On1-n2Lt+EsniKTZH4KhZbKeCR8Q@mail.gmail.com>
Subject: Re: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Thu, 20 Apr 2023 at 13:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
> the virt board, but forgot the "since n.n" tag in the documentation
> of this in deprecated.rst.
>
> This deprecation note first appeared in the 7.1 release, so
> retrospectively add the correct "since 7.1" annotation to it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> My mistake, since I added the deprecation.rst text to that commit.



Applied to target-arm.next, thanks.

-- PMM

