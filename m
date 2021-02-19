Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F131F887
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:42:49 +0100 (CET)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4BM-0001Zu-R0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD49w-0000kI-Bj
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:41:20 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD49s-0000Yf-Lb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:41:19 -0500
Received: by mail-ej1-x62f.google.com with SMTP id do6so12469789ejc.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/fxbtANUSsT+blvkorjzE7rMm+HflTK8q+PkK3WQKBU=;
 b=NFLZfewfO0tTSRw5YrzLXtqrntS7Z1tRe7gp9/F4+QZ1Hq9efz8ej9rJ1gzJKsjiiz
 z0vDGQGXIglG6VgFjwmWoLYEO67FQkd9b1UEvUu12+YIzrZYA5zJDYxzudWiUAIxiPzU
 ELSlpoSEaZtQ6KUnyLAGuswFj6NtDaj/RM8vEzM/gKDiUFpYEEvo4Oa/nLiArcCnA6tG
 33lGpRSqqqp0RPBgiyPzhEB1YX0yEt9NTFMHER9RQ+HfLUvJVCu32rYKZIr9FpHknsjr
 Y2jfASZui3oA2DfsfaYZwHqAVKrp0SqfnmfngHIVsTz7T5hLiFj4KrHMrEoYVcGzJX5V
 7GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/fxbtANUSsT+blvkorjzE7rMm+HflTK8q+PkK3WQKBU=;
 b=mQwbqBfrOXFMC5a7Ms5FxS00JVEme9xYLxYEHThGYQ2ApP6BYeZYrt/P5l3uu4cJBW
 ERkHSg9arbuDNMNJL5crIG+7OOy8BdXTpekRsSxUz3ej3ekYUacYt3dsaiwfNwwL2PaP
 AB7Le+Z2vnNwkI8o+ha8yySQoRiPTiiKSaWMRDOqzpszZXgHSzkxd8qM2AHxEEPDKuZo
 NWE8pb8XF6zDH/H4xcz7nm4TSp98cu2IK55m/nBlhHzM+Obt9eMSh4Qo0Q73mh4euxic
 QhpCvNNailPv145EJ7qZxbTJNSwAThj6hh+1e8TZ6jdKSA1mJvKFZsDbGaydkQh6s5P/
 gxzQ==
X-Gm-Message-State: AOAM53192wcIlaCG34TBp/CeLZTt66ctsFevzXJi1dfMtO3ODcHdTUPe
 HKP+w9RTg7ha+LOHIF1XqlYUN5mqYYtawV628I6jrw==
X-Google-Smtp-Source: ABdhPJzous3uJ7UpSuDDqDIz4yn2veoYkm09U1mlXTezBm93qB86wK2xlJw8UOlrMYp+8gTSrlmQ8QVJGOjGG8B67As=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr8672045ejd.250.1613734874265; 
 Fri, 19 Feb 2021 03:41:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9VGhEV=7YAEZQUdtukY=5Kfax9fmX_wj-UtjLN6JOfog@mail.gmail.com>
 <20210219112841.35246-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210219112841.35246-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 11:41:02 +0000
Message-ID: <CAFEAcA-fFsO5FzDfcsbFJGbMGtA-zJOC6N1EEdZ+gXnxjgSpGw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use kCGColorSpaceSRGB
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 11:28, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> kCGColorSpaceGenericRGB | Apple Developer Documentation
> https://developer.apple.com/documentation/coregraphics/kcgcolorspacegenericrgb
> > Deprecated
> > Use kCGColorSpaceSRGB instead.
>
> This change also removes the legacy color space specification for
> PowerPC.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

