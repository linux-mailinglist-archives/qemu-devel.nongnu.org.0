Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611E51C5A6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:02:30 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmes0-0008QB-K5
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmemB-0005IF-3z; Thu, 05 May 2022 12:56:27 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmem9-000743-2z; Thu, 05 May 2022 12:56:26 -0400
Received: by mail-ej1-x62d.google.com with SMTP id kq17so9902719ejb.4;
 Thu, 05 May 2022 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=aT8n2Q/86mgGHyA52H8QO57xMKfk9owtluLVyhl3rJM=;
 b=RO075sw+Qc8bN17Cb7VDOx6wLx0tg2DUukKC+wKRvifrTns/8wKFyZieA4352tTfeN
 xdrit8Qmfi91NumKp0XwlYSymQD/hA05i/UklqRDs63xj5u+0+xcUEfoJDl+Y9hFbg7n
 QZt7UFjaA5BKriX+NGHr7SgeSg+ugYwbtW9LT6HNoQUx9lJrFkl045sABRtxIW8/lZDv
 D3RYO/YSmG2lP/SL7+55h4tmcueaqvt4W4xPoUALMPXYg6UzZ3gfstrWaLV0emcXIBxg
 tORkX0tmQaMR5zpqV+ziezxPqCwefrhsBYj5dyA7PnzkAxbwsZlwuE3nSyL1CE2jF6rK
 96Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=aT8n2Q/86mgGHyA52H8QO57xMKfk9owtluLVyhl3rJM=;
 b=Ln8szLDUBu38VaxtCjeTrUkjNmvSEqOQeF41ZoS5rZNKkNNz9yZ0ldxuGPuIpXRBBN
 GOUTl2DlRVRTFC0krqTeb6bkLHxB9rpcwLgTMBMnPmvha5c44QWsqU6QvpjdOGW4xmkt
 TPAgJIu+Fm9TmP2wndUikkO5Xl5JLx5zVTsOiNd8uIDrLPYAXGRn2FnckjdvL5IDf5jB
 ZBdEcDdMtP3czA3x/qwRKsp1nAUjrpuVWXCa23Xcl1MmmWlDsVrJ5iDAayi6aikXBENZ
 SyA2iXGPujBMUv/356BDNHjVlZF5U7DT6zp4OAWb74kC0vNLibrG+0QNuz56m2EniacK
 GfrA==
X-Gm-Message-State: AOAM530DlVLCRSE9rUXVgQYaDDrjnwJ4SIURcAwLiLwnuOp5nqJfAq3y
 QxL4ZwHgoFNglUoo+EDJT8BKDcTIlXs=
X-Google-Smtp-Source: ABdhPJygDgK4GMH3gssMVYGlTRXqpKn7pFaVEUxM8eb/rL7Zj8agSKAdOt+gS73K9IaJI5o8060nUQ==
X-Received: by 2002:a17:907:1c20:b0:6f4:639e:9400 with SMTP id
 nc32-20020a1709071c2000b006f4639e9400mr18753602ejc.485.1651769783085; 
 Thu, 05 May 2022 09:56:23 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-123-159.78.54.pool.telefonica.de.
 [78.54.123.159]) by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214e60sm898957ejc.198.2022.05.05.09.56.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 May 2022 09:56:22 -0700 (PDT)
Date: Thu, 05 May 2022 16:56:21 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 0/2] Confine igd-passthrough-isa-bridge to XEN
In-Reply-To: <20220326165825.30794-1-shentey@gmail.com>
References: <20220326165825.30794-1-shentey@gmail.com>
Message-ID: <F58C8DE7-6EF1-49B5-AABA-FE7D754C7FC8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Am 26=2E M=C3=A4rz 2022 16:58:22 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>This patch series changes the "igd-passthrough-isa-bridge" device only to=
 be
>provided if CONFIG_XEN_PCI_PASSTHROUGH is true=2E With it xen_pt gets dec=
oupled
>from i386/pc=2E
>
>Bernhard Beschow (2):
>  hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
>  hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection
>
> hw/i386/pc_piix=2Ec        | 118 -------------------------------------
> hw/xen/xen_pt=2Ec          |  12 ----
> hw/xen/xen_pt=2Eh          |   2 +
> hw/xen/xen_pt_graphics=2Ec | 122 +++++++++++++++++++++++++++++++++++++++
> include/hw/i386/pc=2Eh     |   1 -
> 5 files changed, 124 insertions(+), 131 deletions(-)
>

Ping

Thanks to Anthony the series is reviewed=2E Which tree wants to pick it up=
?

Best regards,
Bernhard

