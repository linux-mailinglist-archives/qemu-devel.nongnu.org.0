Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCD564EC3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:35:06 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Gbp-0001Rw-Sb
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GXd-0005pc-AI; Mon, 04 Jul 2022 03:30:45 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o8GXb-0003gR-RH; Mon, 04 Jul 2022 03:30:45 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e69so8796087ybh.2;
 Mon, 04 Jul 2022 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EidGeHXsLhEJAWDxOtAM7svcU3qJlR8RlVa48S0xoY0=;
 b=C/L4NeDQIppXnx4Slc4pm4pVFlhOTIBYnCgankbD7GTfafYo7KhGlQ7TDJihzECOqc
 3Pm1kw8AYbc0ACf3/F39CzfWdevlVR9AE2FGhI50QpXsl4hc+ZG2dvTDsuKrnCeT8L4l
 yeEVNRcpC4pxNfq3LJFuAgxK2QUfbP40509CQgtQF0Lf0U3JehDT5ZWqxIcIS2rKdx3Q
 RrvY7NF5oMP+0uWxlnI8qRxm+LiMjpyfn0DCbS2ACAPgKczjvAKbouKL6JoUm3DNsULY
 DgmfvoZnco5l4IS1Kjl8Y3nQq/L8z6C97ItGCuAr7MQn3dNx9cOpfSPuuvGpyeLgB0+h
 91sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EidGeHXsLhEJAWDxOtAM7svcU3qJlR8RlVa48S0xoY0=;
 b=RVyKuXw2WtSOhtXrI0vReI30TUFuNP3Lt3bWmj/HKpFig94rh2ekAQ9y4h3+fKMUmu
 o7BlQWzHR8TBN+ZGPSo0KbHl2pBU6wx2Ezu5MndvC+1y+FlAcKVj+jskztmZv2QHBGlb
 t2j50Dz9cHtQFuRXOO8eXa743iV7fr9h6ZVlZ7EluGbkfyftAdOfm3Y7cNkbizaDL2Qj
 34VD6Sir8W3vm5jJuTuU/aycQhw15dy72orB+ut0DuEDd5pAM/sM5C1dIsf4GzZcaEcG
 NP1mDbookcjrV5d+UA3TbFgmYPklKu2u36zpnzZb+Hs8ozNqKa/5/a66tS1UqF8qtpCG
 epZQ==
X-Gm-Message-State: AJIora+/VvRQ2GMPAp/hYXBveGRtVFBWCOqRnsYI/9BNnzDCqEFCvWe6
 91kuUy8LBGtttmmeDZ64M6QTsAk2r72nZWpnSbg=
X-Google-Smtp-Source: AGRyM1v3e2JfG6yxEVgDVYCC3jxK/RJHWumO7FdCA+YTxW8XIR8yiLpuXU8newe1JSWOEUGzl8cD2hJ9xODHf6IpZoo=
X-Received: by 2002:a25:4d4:0:b0:66e:29d0:4d81 with SMTP id
 203-20020a2504d4000000b0066e29d04d81mr11726948ybe.118.1656919842182; Mon, 04
 Jul 2022 00:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220704064254.18187-1-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-1-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 4 Jul 2022 08:30:30 +0100
Message-ID: <CAJSP0QXeT=0Lvm_ve+JaoCQksCBdWw3TziazsvC2zg9AELEg+w@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts/make-release: Decrease the size of the
 release tarballs
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Thanks for doing this! I haven't reviewed the licensing impact.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

