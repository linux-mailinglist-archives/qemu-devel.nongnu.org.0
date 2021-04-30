Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7136FBDB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:02:52 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTjH-0001Zf-BJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTga-000093-GS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:00:06 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTgW-0005hn-1W
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:00:04 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h10so82732343edt.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yh3myPI4YDfab4Kis5sDPDizWZ/yk+kn8pttN6/sTk4=;
 b=b0OosvuccrJE4nLv/FDDjd49qqyZ1bFKReVN/YpMzkh4vEWBh7BNQaQYIyM4xueKTS
 I3YRL+LfzL/y8OdkugCJGMFfXF2szQHr7DVVKiiQIWYrhTVUEAYZVXSUVTIjEH5HN6vW
 SVaR1aaElD/VtTDXo17WlUqHQtDvoEWRzMh+GgCtJ88Y3PkaHEoZQtOmMZvbPeK/KR3N
 ksMvQmDqPiKIpAjiVgL3uGqBHz8OktpUREJMKciLoUTpmKVRwFzI/vRhiNic2XkisDG5
 RGSP6//3eTlXVGl3cqsCEvf9UM4gNizjfo1TFKpmjy8sy+XnUN+ltX6EiofIuMVwiKQH
 UdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yh3myPI4YDfab4Kis5sDPDizWZ/yk+kn8pttN6/sTk4=;
 b=KWfQTqDdNDWQZId9U1p4BQFXx/VYwYsvPJ82qWlnfrVDx6crtL5/m7lGwGK+a93Whh
 sCrTf+v/z8PNQ18DDiCWDvzJMt69tFuvUwaUYllUl+z1jIdnMMJZdHM0xNu1+frMrWIU
 ol3tnYgNSGbeWXVcbbI50JgLJUr6Layf/OXe4TEAJuD5V4D39o+ZCXgsM9zcSUt4c2TV
 4NKlsxcAY5fpAmpBKCC4/I7RQsOHDerSsEanzMLpcDhCNhDxb7hPXbhewon5EhNelGAN
 CZV0+rJrK/nFV7fNXDK0n+KT4/FsI/nWRRtiguDzogzXlSpPEwn11stWM/cIZKoWcEOY
 XO5A==
X-Gm-Message-State: AOAM532sIHFedduYgKCVhc1TBAq1ZJj3KfhqRUF9p1O4gwIz5dkK/WfB
 wlxMRxX8Pivbr0sqlUC/TXfFSAgOgV1S0ZX3xbKagA==
X-Google-Smtp-Source: ABdhPJxIayfhM47dZC1GoBPe2BTb1uKMvAnQ8kUI8ClIQ8k5Ihg5raA2hsiLL9pjgQUKUU0JCokkuU/94dWyVZybeu4=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr6141025edt.36.1619791197142; 
 Fri, 30 Apr 2021 06:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210428131316.31390-1-alex.bennee@linaro.org>
In-Reply-To: <20210428131316.31390-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 14:58:55 +0100
Message-ID: <CAFEAcA-BRMzKG28c=4auWFV7A9-se=dw39n-Jtn1wY21jqWdyQ@mail.gmail.com>
Subject: Re: [PATCH] docs: fix link in sbsa description
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:SBSA-REF" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 14:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A trailing _ makes all the difference to the rendered link.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/sbsa.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

