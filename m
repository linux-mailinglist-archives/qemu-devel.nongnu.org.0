Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E96DDC14
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:31:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmE5D-0002jB-Ch; Tue, 11 Apr 2023 09:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE5B-0002if-LL
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:30:49 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE5A-0006zY-4t
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:30:49 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ga37so20717508ejc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681219845; x=1683811845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O94aUhfnuvCya4y4UJ4vAvaQByeJn2VCA9Aoq3zdYtw=;
 b=TGCvBN1Jifv1z2hM0rM86d2ghsl9+LuLBRxKMMC5nMFV/KPKkxsOMEHuPPMrIqRQLd
 uaOZArSvb+BhIaYZpbVA7r2XtVImt8oqHXpsp5VP9jCkjd4aRMC1MOMSYQNsH1VIB3I5
 +9wc1B+h7wGOKEhdA7QNpSIXFrY72rZB/3jTs6olkMnyX2Xh2b+GcYfebNoJQ3f+iZmd
 G97QkEkvTw41i5tuhrVcCbzefLxMfqw6EJAALRzj6C7EKWSEowe6GC6jvfP3lSEuVUwu
 yiarORchwyeKCc6nHf+OLf5EI4M/PZtm2ZcAjOLNYiNgHg3MnNri/jHW2xxh0phjKjSc
 abHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681219845; x=1683811845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O94aUhfnuvCya4y4UJ4vAvaQByeJn2VCA9Aoq3zdYtw=;
 b=bfSSfqsAwFVLns0bx1lu89JiJ00moo5yxKBFfdwO7ByvmoZiBPOcytf2ri53BUDbFA
 mcBWWn2OQNMyojJNViTvSXRqnuJQ3sS/R98lQsWS85wS6pr3jFCStvEw/LLcBcSgIcP0
 qTq2NFQzYNMCa4YLI8HMpk56+8GhdHhR+amAzmEUWPz2H0si0J8FS8rMrKIkHXbU9/ou
 y+MsJFV26vNpOph4PE8trLSSZa11rGGC4Sepn6rYf6nfRTws52Ff1C/Ca3CoT6tJ3Gt3
 TYcbCKpM83hAzf+FyI3crclbfyEG66S8umrKG9b5C6Iw6PNhEp2nSU0S30+moK+XrDHE
 A/wQ==
X-Gm-Message-State: AAQBX9e7mU4nlblBa81ikaen5Q/o4OFe8HzPS9Ng0zO4pbNVrkF9VoOu
 J/d67hR/hTSsd0MnNvlPVJ1aLCjtsZd9LZfUcKPIjOtQ7TD3o3tn
X-Google-Smtp-Source: AKy350aGAviqXUszOhHx8wsk7eYmXncxgx6A20i8Cd3aspqAAmb1gmmh8bP9m53k7oJVXkk/U000+1KuOVXeyR0A2LA=
X-Received: by 2002:a17:906:730b:b0:939:a51a:dc30 with SMTP id
 di11-20020a170906730b00b00939a51adc30mr6251322ejc.2.1681219845376; Tue, 11
 Apr 2023 06:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:30:34 +0100
Message-ID: <CAFEAcA-f-5VMWXWWadvwHPS=x7taoBP+Tpr-BEc2j8XTDfhEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Basic Allwinner WDT emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Sun, 26 Mar 2023 at 21:23, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch set introduces basic emulation of Allwinner WDT.
> Since WDT in both A10 and H3 is part of Timer module, the WDT
> functionality is added as an overlay in the memory map.
>
> The focus was to enable reboot functionality, so WDT interrupt handling
> is not covered in this patch set.
>
> With these patches the `reboot` command can be used for both Cubieboard
> and Orangepi-PC in order to restart the system.
>
> Also, Cubieboard avocado tests have been improved to include reboot
> steps as well.

Applied to target-arm.next for 8.1, thanks.

-- PMM

