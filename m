Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09C5BEDE4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:37:11 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaj3O-0004i2-8V
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf0a-0005is-Gr
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:18:05 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf0Y-0006bf-RK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:18:00 -0400
Received: by mail-ej1-x630.google.com with SMTP id lh5so6934095ejb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6b4FO4Y2selTSZprGTVO96FDSGRYgtDzZnaiLJGueHw=;
 b=oTdHgvPXlqz4AnYIXW9o9/mo8zxAA9VU6fHQItkovpIF3ZxIWacHu3FIbpeiUgzEBD
 +e0B93In2Fcp1WpdX/OyhXIy9ggDnEvgaDgVoxwjK6LqJv0NU+eeE4tD4+9s1zshxk70
 k3rvw6fThWHJC+SiqrAVs+CIPF4Fi9IJrQK5vW/WM3Te/TGakBjjv0Dm3vi4ajrZqDK3
 Cj9cSa2qRoPUdfRU0PNJBFkC8ivbQ/2AkzQh2y8Yb6j9j5RVOU68duKVNAhh5KPFYeTJ
 8iOtYZobm5hE4tfqe1DjdI1ajddo0vXANAzXmb113q5gnHd0YG4sIO4OYxwBF/7L5Anh
 Np9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6b4FO4Y2selTSZprGTVO96FDSGRYgtDzZnaiLJGueHw=;
 b=R9Xlt8r4EZuowu6Oqcv5uzIUd0qFr447CN/RCIn5HwI2Sz2KXfsHhoEIsa0oLw3y/e
 9a8+Z4nULhNGhwm3JOWWxrl4AAppFaP3z+yf4qf9//akaoSXDI4NATi1q0iFL5fde1wQ
 pvf+aK6DppX5cyzWOPQrbF5v/zK9nx7GwKB1HSq0e+CppE/ga3hZvVv54aWyOZYOqT/6
 fz3dTZTNko+sg4Rk/42zGNvhJUqvPUx4595TvUP8UUa2pNNN3V2goyg7YpNRm3bgxYhn
 ce9RmyczGlk6sAwMDyvxqW8J34nSzIssongd38w27B0b4IDPoi5FP1QN6fKik6hsR7+r
 Z7zQ==
X-Gm-Message-State: ACrzQf0n5sPiW/lovFAUt341eOHqsWqLO03UK2tlyizdV1lPL85TXv3q
 UVMlOoRYAdmXM2mZ1tEpvQYKkTKHc6Bmb8wCZwpj+qrhqZY=
X-Google-Smtp-Source: AMsMyM45FLBTPBLU+FFJ/9m/wqdOxVKVegwmVXr8IKPlYoKZ5NjpzoQt0of71DrHVIj0YnNuDxSScXzLRZuWXGt4NyM=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr17888120ejc.659.1663687077075; Tue, 20
 Sep 2022 08:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-20-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:17:45 +0100
Message-ID: <CAFEAcA9VDnyR6++kLGCZSS8uQQPT-eh-gwvbX_13-QTdRE223A@mail.gmail.com>
Subject: Re: [PATCH v2 19/66] target/arm: Add is_secure parameter to
 regime_translation_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from regime_translation_disabled,
> using the new parameter instead.
>
> This fixes a bug in S1_ptw_translate and get_phys_addr where we had
> passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
> Stage2 is disabled, affecting FEAT_SEL2.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

