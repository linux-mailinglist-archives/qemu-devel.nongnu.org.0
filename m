Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D52D963B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:23:39 +0100 (CET)
Received: from localhost ([::1]:39538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kol10-00065k-NK
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokyW-0004ur-W8
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:21:05 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kokyU-0000pj-NF
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:21:04 -0500
Received: by mail-ed1-x543.google.com with SMTP id i24so16555800edj.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cp3tmOSbRuiBendh34xpsw19ImbzF5jcH8bDzsPXLhE=;
 b=zZ5BRNQLYZfMqheNPN5Gf0zsUFiuqrXvkON4+OjgadQ3NofATNCjj1wf1TNec8vjYa
 fh8VS5l4rBis2Qk1ZxGGt8mB04h8YaOWEgJ0e4K3Eqc672Xz8B+xyj+I4ePHtjSFho6E
 5F7zgxQvcXJ0nUG9VN0NDD+fmysXjPYdTlRZo9VpdNfh24puUK0R/DnZZNac1QB/lv3l
 n2Fkit86aarcReRcOUtYzObvtsVSqSNjjdwjzXoOBn6I1rQ4evl+H4XWc8dDCPFrIhBb
 Ty8JzZ//0jn0i3t02j8RIcOV4ylhGOlXGlckWgiTYYbQy8qEF9UcdNY3A2GRgQ5haRti
 ZVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cp3tmOSbRuiBendh34xpsw19ImbzF5jcH8bDzsPXLhE=;
 b=F9SvW9Li8mzr69zw7TH+dLJyWT4frIIa/ADeyFAYYU2nPM1+LU8RBMxFIeZc939h3f
 JJLwVG3tj9R4KxrL4WfNduRmoY8AT5mYYV2p60fQXnkWsuQWWw9OiuVfXVyfzYIefXIq
 F90W8tnEcNVcQ3kx9r1WsOXZsPrmLYrCxU/+1nzJgP1xf0I/piVBl8WbzI+iG+vEEAXw
 k84b7ks+GDPzufn6GSySz5G4mtKdm5Tt2n2qmNfbjQXKJcgbe7DUArY5/w4ObFg2zSCO
 I8Xr9ERNr1CQMJ8O2d0uiHa5Qo2Gi3ntR4DGtO71RRAN1GsIxeBPaWVQEzUrUE0sA9KX
 XELw==
X-Gm-Message-State: AOAM532D5HI3pksnJx1o/gGpk9T8IJhkemp7YUR/VR94mgAXNcQRYITP
 HFT0XX999VaN7A8hVl09XsDKAdXlIbm1UsZEKPrpIEdtCRI=
X-Google-Smtp-Source: ABdhPJytxFiLl3ZynUPM9D7gnQKpBAnbjIWhur9LL/VIarNZ7lCfNYdsnlQR2czo9k2wlEH1fVWH2wGQicURXmOOF4E=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr23867091edq.36.1607941260079; 
 Mon, 14 Dec 2020 02:21:00 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-3-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-3-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:20:48 +0000
Message-ID: <CAFEAcA9bWME82s7j=xjuPXhKvr8cs=vYDZ1RSWmgwokLbzC5FA@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/misc/pvpanic: Cosmetic renaming
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:20, Mihai Carabas <mihai.carabas@oracle.com> wrot=
e:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> To ease the MMIO device addition in the next patch, rename:

I guess this should say "PCI device" now...

> - ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
> - PVPanicState -> PVPanicISAState.
> - TYPE_PVPANIC -> TYPE_PVPANIC_ISA.
> - MemoryRegion io -> mr.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

thanks
-- PMM

