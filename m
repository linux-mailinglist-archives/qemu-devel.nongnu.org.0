Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5544C500D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:50:56 +0100 (CET)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhYF-0004dR-EC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhWJ-0003IM-7y
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:48:55 -0500
Received: from [2a00:1450:4864:20::633] (port=35397
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhWH-0000XG-Qf
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:48:54 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk11so13149748ejb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=jnMJzFNP9ugE6DUBPXNkyTiPX9Jjlf377HwCKDoPFzw=;
 b=WsKafa6jXUH6dHJFGwSH48+DrAxynkQbfsL4R/WzNmlLc60/fk9WodoRh365Conf8u
 r5JXbt2Kime88WGvefGPhYPpWCGAeE95bZGu1ZE6TQwwVlfNbhrisQoMIHIWO31rATjB
 2iBDLrjybbpRWZoHV6JiBvsgAIsLyGIMIAoghlWwkx0QuRZjXgcYvvT8lH5NMq5iC2Wt
 n6EWgJiqXGq4wrVkZnly5AQcFzvGPROXtu2/ICov7EQKsfMEQUe8KQjLciYWi+5GfsQX
 f5BSJ0kMB4dOfyDV7OKI+jQ/QrPFy0m4OxFR/EZZC1lF2evSVUOruWVpWPHl+5vEbGvu
 Q9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=jnMJzFNP9ugE6DUBPXNkyTiPX9Jjlf377HwCKDoPFzw=;
 b=eHJMJPW/DQ3ZuGa3vVkAdnJPrIzGIiI/eAVfjQRIZmNA/9apkZOWFDJAnOKqJPrJHC
 RyGwqGE4nJR000X5qARbAp/2dlX2EyF5ms9GioCsNPw2bQeqonyPv+fnD5+JDMdoY4I4
 +ypnF3xQ8n6gquBeOAV3p/y0kVzNnbvykBr7f56PBT/I+X4D75woEy8LyII4EhvMxSNN
 5xdw2KkjLK06zsULGpf0xlBbNvlnHUdkgftGc0w5KzYuWsS4YFd5zmLDCmH5y1JEhuZg
 pBF2ehy4fahRoQun9/lwo81OfEOj267rBlVzx3XbiDdT+iigj9iugGmcoZBWKGb8P8sW
 J3MQ==
X-Gm-Message-State: AOAM531M53t/L5E3nIbGnnkcaHH/eWI1WKf/2PNN3NmNEEd0iCs5FLkV
 BJfyte3Vlnb5T22gpUcHr/BwzNdG3Tw=
X-Google-Smtp-Source: ABdhPJwf12aKGSZOqKmqmCE9QIfqIXix0DMLvPNNSS5q6BWyFhNERQ0AA6+LWVbpC6PPA8UqmiGiEg==
X-Received: by 2002:a17:906:8457:b0:6cf:741b:dfaa with SMTP id
 e23-20020a170906845700b006cf741bdfaamr7444313ejy.700.1645822131898; 
 Fri, 25 Feb 2022 12:48:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-087-117.78.54.pool.telefonica.de.
 [78.54.87.117]) by smtp.gmail.com with ESMTPSA id
 x8-20020aa7dac8000000b0041291913c15sm1925746eds.1.2022.02.25.12.48.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:48:51 -0800 (PST)
Date: Fri, 25 Feb 2022 20:48:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Resolve some redundant property accessors
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
Message-ID: <078489ED-CA95-4012-8EB6-815C65084856@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Am 17=2E Februar 2022 22:53:48 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>The QOM API already provides appropriate accessors, so reuse them=2E
>
>Testing done:
>
>  :$ make check
>  Ok:                 569
>  Expected Fail:      0
>  Fail:               0
>  Unexpected Pass:    0
>  Skipped:            178
>  Timeout:            0
>
>Bernhard Beschow (2):
>  hw/vfio/pci-quirks: Resolve redundant property getters
>  hw/riscv/sifive_u: Resolve redundant property accessors
>
> hw/riscv/sifive_u=2Ec  | 24 ++++--------------------
> hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
> 2 files changed, 13 insertions(+), 45 deletions(-)
>

Hi,

all 2 patches in this series are reviewed=2E What's missing?

Note: The lonely [PATCH] slipped underneath this series=2E Is this a probl=
em?It was supposed to be submitted toplevel but git send-email doesn't seem=
 to support sending multiple independent series at once=2E

Best regards,
Bernhard

