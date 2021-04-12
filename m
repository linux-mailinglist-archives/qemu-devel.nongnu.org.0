Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F4935CA00
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:35:06 +0200 (CEST)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyaf-0002xm-FI
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVyZB-0002Ty-Vi
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:33:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVyZ6-0007xx-SD
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:33:33 -0400
Received: by mail-ej1-x62c.google.com with SMTP id g5so14289854ejx.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=8gA3d2BXxydsegbZamxmwSUB4QOE1CgSFtwvn3F5uNQ=;
 b=f2wPLWV3DQGPSyoHUCusKEb5gw8wMhJ0eItg5fGlignrftwe4/eSS8cePTTQKJLWAn
 9HE7THqmqCV1M2rtYep8IyVuw1ktqnPjz69ZjTdk/N8kIYCiwj9COnmAILDm4huKPw+W
 EgEXJKq7GNVDLuWQh/cgTzscNZANHCQZaxh/KXNhBcJsJFaX6hBrmcndhyTRMdbATf97
 QTPWGaynkf5WPPWNhO8BI+tRLaP4hLe+mexi5ufTZrOKmo0aoNNj3XJXVbONW4EfaUvc
 rhJohqkEKI8euJrvymBSf7KKTX+OIMMuijQdLLurv4hnHW9zl5W1vRSuZTk3Crq8x3w4
 hYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8gA3d2BXxydsegbZamxmwSUB4QOE1CgSFtwvn3F5uNQ=;
 b=hBvJ0DS2DjUsONS3LBcZM5VsBXXvd0n8Kr1DwbTQQomPJShnUPV7RLwsa51RfHYx+H
 qzTB/k5gc0+oZ5uqHBwBOqW6YZb3fB2ADfm1LcasWdLn1tMhPp23YecWMFVCMrqwHVJI
 wCtPYCg8I3XiCVonlyeaETKNBnom1+cJPDe8cheG8Alz9ZimlVsIDb8h2W4Mah8izbHu
 E8t0P+dWKpYaWanioCFtnDi4FPLmB4ZW3qk6vL+iIpiX4Lg3JkepQ/UHoaf+bTNg2aRX
 wM48+tMNYmPU6fF+srzgY3CpmLic6XQ+IYZvw2GUJzIgoB3R9ZvZqFrvxQwDUoeT2A/J
 YVGA==
X-Gm-Message-State: AOAM531xGvo1Q4bAcglnkMLlKALFdDTrWhzitJpKrKZjcT+I225aMolG
 gX+aVc934yr1NwwmHLnYKF/LanaX7FPxbMxgL7FHNpMOrV8cCA==
X-Google-Smtp-Source: ABdhPJx6IaXcQPDhFl1BwGR6HlFDGuY7y1xcCsQshT/Q4oXS+U6Y3iKf8sDNnInR2dcXLcMX5PtofGoBPpDpmNOEzcs=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr27981394ejg.482.1618241607045; 
 Mon, 12 Apr 2021 08:33:27 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 16:32:42 +0100
Message-ID: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
Subject: any remaining for-6.0 issues?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Last call to note anything we need to fix for 6.0 on
https://wiki.qemu.org/Planning/6.0#Known_issues please.
The schedule is to tag rc3 tomorrow, which I would ideally like
to be the last rc before release. After rc3 I will only be taking
fixes for bugs which are absolutely critical...

thanks
-- PMM

