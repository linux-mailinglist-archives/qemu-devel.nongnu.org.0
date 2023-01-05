Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17965EE8A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQyX-0004nl-Vl; Thu, 05 Jan 2023 09:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQyV-0004nM-Of
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:12:07 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQyT-00015V-A1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:12:07 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 17so39501324pll.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKMUz6e++lzgET99/eAxEn9FQmWF7PmC1Ou66z/XW9E=;
 b=SYGTVBYr1erf/ZGFRHypVY4IRe6/yBsdUKNl5PMm8qzeiXZoErOUzpfg6qCZB0BKWT
 u3f6+WEAuaUEuFDoqcGAAcqmgeREcbpSCa0ra6xPGDErAH20slJ7gG3xwHK8oi+eG48y
 f8EQ4IWcuzzR08W31d68LmkR9KkudpiWsbzaTWTfsjAdPoHwJTSevQYPGb4HNUCXBx2h
 BsLMYJrrM0lpWzEDCGkHeaAM/H8MjXSAAc7T/1JI9Bd71q3D3HB1TQw4v3zehmIUdOy/
 PH04EP6EAQ3PvtZLajS4BP/CizIHiDDeLNr0gBXocUnX/JiaFe64QOE2azlzTcICRHy+
 xdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKMUz6e++lzgET99/eAxEn9FQmWF7PmC1Ou66z/XW9E=;
 b=vle7oBwtfL3X/1B+yqaMRCjPb9cLvM/F4vIQ7whIkmgr7Z2lQmSyZ+/99dfIXeKGIW
 TNFDUGCmJDlsNyhYIO99WKIRj8Wk1j22NEq4yRAtZIdM0diVxWW8qq+MEdFdHqAcczt5
 LXDbVZDp9Z116HWJg/xMjeF6FzmT3FcpzV4VFA8i+ytrC/XF8Gp5P85feTTIGCMHEm80
 puTJyyembu4/9OoRnGIdwcitPfRb3L+vk8rOfCfRvDAWJ3wtuIRaxYVQeJ/ntfYfckhd
 7EEwoG2yIAHHSybiTuWDcGIoR8ZCmfejRitM65H49ky8rmj1Mpv8xgAH4i1jQrRNBK5H
 LY3g==
X-Gm-Message-State: AFqh2kqPP4t+kh/PfRGodkfPIrHRJBYtKgAZZ4slzWxVwbYJFwGfNKJb
 eVPoyQI/kg8oKMX83ypqAcQXTk15XD1ShJGoII6xxA==
X-Google-Smtp-Source: AMrXdXvbnoGkvY4H+esHjrHA5JqW6lDyPapDztybmfGa090UTbnCeb2DlH6gvnyGMRe52cn9lAthXiVpgrLyBF8LX6w=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr471627plb.19.1672927923573; Thu, 05
 Jan 2023 06:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20221220142520.24094-1-philmd@linaro.org>
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 14:11:52 +0000
Message-ID: <CAFEAcA_UA-N-WTCLLS9=CXSYCnjOfESVj0T=ND6KHGhYuwM-Dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/nseries: Minor housekeeping
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

On Tue, 20 Dec 2022 at 14:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Constify read-only arrays and remove some -Wextra warnings.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/input/tsc2xxx: Constify set_transform()'s MouseTransformInfo arg
>   hw/arm/nseries: Constify various read-only arrays
>   hw/arm/nseries: Silent -Wmissing-field-initializers warning
>
>  hw/arm/nseries.c           | 28 +++++++++++++---------------
>  hw/input/tsc2005.c         |  2 +-
>  hw/input/tsc210x.c         |  3 +--
>  include/hw/input/tsc2xxx.h |  4 ++--
>  4 files changed, 17 insertions(+), 20 deletions(-)




Applied to target-arm.next, thanks.

-- PMM

