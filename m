Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F352F24A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:14:01 +0200 (CEST)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns78S-0006Jj-Pg
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6yB-00074Y-TY; Fri, 20 May 2022 14:03:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6yA-0004PG-6N; Fri, 20 May 2022 14:03:23 -0400
Received: by mail-ej1-x636.google.com with SMTP id f21so3352187ejh.11;
 Fri, 20 May 2022 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=zX0yY/KgxM2YTUqJHXyzcFNQgPO8k1hG5P4tzjSyENg=;
 b=AmzHQ1Zd25DJYoVjRh0vhOwBNXbYwae8LnG32w0w856Im6pbHXD+O1kF7oe7MCwA8+
 fYZbHoulQRaK4pFOEXa/YtkzfY3L3YEgTRRUygRGfMcsSWIpSUCOEb41gM+/0+jT04g3
 GEzqyyTBEE2hzr+OtQUUcLi36UsEBO3Lf/E08OgEgNWwXZmJ6VNqEsDwpUGLAslwnqAy
 wb6GwAuBGZZ4HNEyVS0PWGobNjV+3fv/VFx0O7tDd1Zn6+0qEFa0gJw3E9GkNOaWVsA1
 9GT2hek4ce1dz33WoN1U1VbiSj2jqGZjL0C3Zdz7hT4a1W3DpiOwwXMvXwrGKrhrt9AW
 jQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=zX0yY/KgxM2YTUqJHXyzcFNQgPO8k1hG5P4tzjSyENg=;
 b=B8dh0uBdJ4DlllR3hAcnvZUkiMpiYibXrVMJQxal5rOrG5wdnCiMnb51N00asgvwVa
 pRVuNUo3tsqEIdV40w0fjm/JnxozKJtpnvZcMbJ1tOXXylmZwsAd7ZGkFFv97Y2W3mWG
 VqstgeJJVZoVHyPFzGec1m0CDU1+Yr71R2XMyDnf6Gjzo9Q/mlJ3a0wjbSqwFBhGbolt
 1J0GYeSGSEyTLacXonLUj8a+uQ27a2icXldA60ezwZf31kUY8ddFsk3RAYARle3txT1w
 h0NaxZ9cNBnjLseOa5vZboAdjv/XmPBh29yAzhwrztCC347/nigQAxLH3Y7vJxKU7Mlw
 rRtw==
X-Gm-Message-State: AOAM530OQDw1WOCsaMZPQQXvsE3Thv/9CXtKBqSXvF+k25uc8+Y8otqY
 +/msSgNQFIT9ajs/3+YCkimSMhdwF+M=
X-Google-Smtp-Source: ABdhPJxlCQ6iPKRx11/e3uviEwnjNX/gfrVSgu9b4cdwMlXQKGeCpNiAh8m1WFWxq+fbNDJTtiCDLg==
X-Received: by 2002:a17:907:3e28:b0:6fe:b5fa:fa9c with SMTP id
 hp40-20020a1709073e2800b006feb5fafa9cmr2360224ejc.464.1653069797551; 
 Fri, 20 May 2022 11:03:17 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-209-236.89.14.pool.telefonica.de.
 [89.14.209.236]) by smtp.gmail.com with ESMTPSA id
 w6-20020a05640234c600b0042ab48ea729sm4903935edc.88.2022.05.20.11.03.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 May 2022 11:03:17 -0700 (PDT)
Date: Fri, 20 May 2022 18:03:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH v2 10/10] docs/devel: Fix link to developer mailing lists
In-Reply-To: <20220520180109.8224-11-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-11-shentey@gmail.com>
Message-ID: <71C4A92B-A9AA-4EF2-92FA-6529118C6979@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

Am 20=2E Mai 2022 18:01:09 UTC schrieb Bernhard Beschow <shentey@gmail=2Eco=
m>:
>Ammends commit 9f73de8df0335c9387f4ee39e207a65a1615676f 'docs: rSTify
>the "SubmitAPatch" wiki'=2E
>
>Cc: qemu-stable@nongnu=2Eorg
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> docs/devel/submitting-a-patch=2Erst | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/docs/devel/submitting-a-patch=2Erst b/docs/devel/submitting-=
a-patch=2Erst
>index e51259eb9c=2E=2E21ed52bd82 100644
>--- a/docs/devel/submitting-a-patch=2Erst
>+++ b/docs/devel/submitting-a-patch=2Erst
>@@ -18,9 +18,9 @@ one-shot fix, the bare minimum we ask is that:
>    <http://git=2Ekernel=2Eorg/cgit/linux/kernel/git/torvalds/linux=2Egit=
/tree/Documentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a=
60d8157f#n297>`__
>    policy=2E) ``git commit -s`` or ``git format-patch -s`` will add one=
=2E
> -  All contributions to QEMU must be **sent as patches** to the
>-   qemu-devel `mailing list <MailingLists>`__=2E Patch contributions
>-   should not be posted on the bug tracker, posted on forums, or
>-   externally hosted and linked to=2E (We have other mailing lists too,
>+   qemu-devel `mailing list <https://wiki=2Eqemu=2Eorg/Contribute/Mailin=
gLists>`__=2E
>+   Patch contributions should not be posted on the bug tracker, posted o=
n
>+   forums, or externally hosted and linked to=2E (We have other mailing =
lists too,
>    but all patches must go to qemu-devel, possibly with a Cc: to another
>    list=2E) ``git send-email`` (`step-by-step setup
>    guide <https://git-send-email=2Eio/>`__ and `hints and

Ping

