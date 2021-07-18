Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B663CC85B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 11:39:21 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m53Ga-0001FT-GB
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 05:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m53FQ-0000ZX-37
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 05:38:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m53FO-0001TG-8M
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 05:38:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id bu12so22939761ejb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tMgwVE0D2V4aI163O0cFtMbc6ifnJhvV4YbFNGzuhwc=;
 b=UOuOGCDQ/6lyF/zL/RNL7IrL4z1O/UKeFvsXqvN8axpcjfW90xl6Pe9au0qwucdH2M
 TzeMejq1Tm3gZ3c13DKshEJtKy+gtAT4iatGsReMn5L4c8rkILN8ntjJ5Tc1lRD5XAeC
 xc/N+2ulIFZ42/nCE6uTXE2q6VBNMf8ZLoAKHPCBsvo/icYUq1IibfgXsADp8NbMTODR
 ZSlb0hnpo0HvMCX9NZ4ShyrSZHeQSuzxrh0SyWn4ynw9hMW7BaLK8t73+4+aU6YHT89q
 +Dv25STqpmzi07edygwE8iKhtKkfa2Z1ATTXUyIK22Xu9aCDFwkFoM2KtsbPRjorvKp/
 7KYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tMgwVE0D2V4aI163O0cFtMbc6ifnJhvV4YbFNGzuhwc=;
 b=XGLqZ2K76xtnxLbbHxeWTUsNgKn7b2BEAulkQM/sJw5Zm6OwdhVlTahrKQCTgTkxFg
 Yr9uismH5puvscV6EfYa8DXw8G8O1F+ostZTbRBRlIt0kBUYJ8ljQ8vVbOEhW97IrbOi
 RaLh5yNu8JEyYt+lr83RWUwqFd5gLuqwIaIWjq2qe8+2z9r76FAJGw9A3VS2LxhiJ1ea
 WvfnSZ0Ig/MseYIyIuWV+fIM+/PyVEJY3yIv0khg7BOPDsaCXLZkrpkJ921jgg/VXMgY
 B9SUyBCemufq8mhZohSjR4PvCwfjHQJlCVHFvz+karlelHOkQmx5dBXZAElW+pOTnPtm
 E/Gw==
X-Gm-Message-State: AOAM532B8ehf54I2hkeYq+k8PQtuv+m0D3obYuGGEF6Ec2pOEPpvBRKw
 W1aT98KLEjwBQHzYE7DmCAVFC0qPe+1Jm+O8DnDBoQ==
X-Google-Smtp-Source: ABdhPJxyli+b6XYKi0mm9RbQYUiQ66AA7oKO5x5s2uwNEtXVJrTEd5bIUd88vLzZ3jt4SkFjxEBjAxUirOZ0JK4Vj9g=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr15088595eja.85.1626601084331; 
 Sun, 18 Jul 2021 02:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-4-peter.maydell@linaro.org>
 <2e43d49d-f135-3475-afa4-2ce8de7b63ff@amsat.org>
In-Reply-To: <2e43d49d-f135-3475-afa4-2ce8de7b63ff@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 10:37:23 +0100
Message-ID: <CAFEAcA8b-njexTuUZ=asqJE4UrkEkq3vBr3-=b0i5hc8rFd4Yw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 03/10] linux-user: Split signal-related prototypes
 into sighandling.h
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 08:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> The difference between "signal-common.h" and "sighandling.h"
> is not clear. Could they be merged?

Yeah, you're right, we don't really need two separate headers
here. (signal-common.h was originally "the stuff that signal.c
and the per-target-arch signal.c need to share", from when we
split the per-arch stuff out of signal.c, whereas the stuff
that was in qemu.h and this patch moves into sighandling.h is
the interface between the signals code and the rest of linux-user;
but this doesn't really seem like a very clear or obviously
useful distinction.)

-- PMM

