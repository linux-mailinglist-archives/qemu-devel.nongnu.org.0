Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A771E51A464
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:46:06 +0200 (CEST)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmHCX-0002oR-Kc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmH9Y-0007jd-Ab
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:43:00 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmH9W-0001Gn-T7
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:42:59 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f16645872fso19893917b3.4
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIAGHFysAE7FymnPBQh9fuenU/UShUqpLCrWNY05OB0=;
 b=QooVhg+WYmBJyHlFUxithk7A86KDigVPUPJOmqMDfklUi41dKsJp7mF/LlpGw9Z0Is
 I7/uPgXbP/gSDyrWrXv5WKNnZU7P9aBh/IvUoZ9i1LyUwFJFValmYvgbNIr6yjtXMj3R
 iCYoh8aNkfrJPHu23ToJANSFVA1go2eqOGaQicjF4uCm/Ka0EalpQXonqwDM1ku9KdYH
 SwMSsz/4Tt90SMNI1rU22DgLRiMekrxhZtWMatf0mUexZdOb8Qs8OUU/Aa1Zv1dzYKll
 C9KEAGqRIqnESZ5EaXCHKOGdKolplUcSlrYaD3B4zks3jcGh8PIx5imre+n8wwqf9h4X
 sfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIAGHFysAE7FymnPBQh9fuenU/UShUqpLCrWNY05OB0=;
 b=LIA0QUVQZssEVfOiAInpg9QFmc/RdCyEIT0+o/Zortl8YyPBMr3gxqJsCVaTk2NhLK
 jYGoswX9EpWSmc4Owm744HGMuns4jycsxywYGbkyQ98PEOa+c8CW+mKc8ny04w1RbIVD
 giapYNOi4+UFsDQtfcPB5aQDQdvrteHlZ4aJjQd0CvMKgAWnwHdkOneXex0D9IrFB95S
 yUo8kuBZsfbSO7aCz5OChRIzJiYnjJ2pia3denHfJlHqvVmpoJYDlHahYMo327dWXzBy
 Flyhw5doswTFvyEI1EEJSlTwYIE6ZLzHcpTyZGyvOUIgQhfn+BhflWFNqQ9lg8zG7ITf
 wRkw==
X-Gm-Message-State: AOAM533lz1A8+ErdjkJMhbYoy2B0PVO4i3I3PbK1va8NMtp8bgp4UJV5
 pODKhzThfkHCckOHgre9c10OGtNCj6UkWBWjD/ZaWA==
X-Google-Smtp-Source: ABdhPJykIphNVjseVIGZI1IfNjl3H+SfYASVvOYAgyqH/WY8XnLk2rjmLUQqaFQTJqBMl/nViCWuNTIAcqmauLHHOac=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr7269491ywd.10.1651678977541; Wed, 04
 May 2022 08:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
 <20220504153708.10352-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220504153708.10352-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2022 16:42:45 +0100
Message-ID: <CAFEAcA9v13deLj=YA82LQ7NJ9p1FJE+QzJJSj8nJ7--7Pxu_Bw@mail.gmail.com>
Subject: Re: [PATCH 2/3] artist: remove unused ROP8OFF() macro
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: deller@gmx.de, svens@stackframe.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 May 2022 at 16:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This macro is unused and so can simply be removed.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

