Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6EE78883
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 11:35:48 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs24J-0000UN-OX
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 05:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs23n-0008SG-Qi
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs23m-0001ZP-Rm
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:15 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:37509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs23m-0001ZB-Nm
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 05:35:14 -0400
Received: by mail-oi1-x234.google.com with SMTP id t76so44812901oih.4
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=rTURHtTjQzJ2KmYKh82f2bhQxI4AT/GY7Ra/tFh9xBo=;
 b=Yth5dw5mG11imd34qoZYaXLt4pFYnhw6VDa4h0xhQsQEEWPUs/Hf55ZG+DKcjef7Ss
 ZS4/rsovWuSTp4cFatDvwwxl2n9rV44VAFSJlVVecXzf5z473+r6iSzUwAB1zuzBUKra
 u35WJf5/pVaWAoIChIKA64fKE0BzgYfLVfkaR+iqoILkxT4C0jJhriSYNIdWKcpkKwUU
 s++Odcsd5gr+LawQhyXiA/m9qRpnhSpi6DKYsbkwc5UgxKdQkHV7tqHweHJBJ90bbXQA
 sn8H4ZPMRTPumf04e29vihRSszm0pFQUK4PFxDu9kOX/nZo/Ny77L8Ebx6wYn3Xcltm0
 FASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rTURHtTjQzJ2KmYKh82f2bhQxI4AT/GY7Ra/tFh9xBo=;
 b=pbzsMYuJWzlFJK5hAw8dZqMEZOnuL/tSr6z2Bkm8t5ab50uHcLBTcWoMII2HyGlW7G
 uMXHlE5OygnyC2gNy9l3fwq8YzuwIhXVaO1tSRwPUT5J4vqIBQkt5PB8XTc3SdeY8Th9
 lj+lG8MB4i4PJohDF+9Rm9QlScSwR1re+A4w+EYJjEmmHK3KtIsqdT70tB/QzID9pSD4
 ZwLwBzh3kO4bjSOgaVpAn7i+yjTx+y12H5W7V12SYrdTjE3iGXed127ZUEgjmDc0spkl
 y2Mr+4nh8AWcZzEfbpwVCBi0SzZhlIOwU+/Kbq9EH7UkLwdYxSRkZInlfrqwMuVgeM2B
 AzdQ==
X-Gm-Message-State: APjAAAVzIqiZIyoPbUJTuKk+RjGjdKzY9DsxpnR8+6o15zCbzo3VMI+/
 hwObFFrs3OlnrlOQaJlDlpyQVfR6cES+8DDdKvvFjN1fb1o=
X-Google-Smtp-Source: APXvYqz1HVWyaOhXVYMvfgOp+bh3diSrf52FZ8g+NAXFIKyluiC+9SITxyeKmALqZbIelrWCwA6UobWILvWDFabWOtk=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr51385016oie.48.1564392913746; 
 Mon, 29 Jul 2019 02:35:13 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 10:35:03 +0100
Message-ID: <CAFEAcA9-CcpqnPXxpvSdUK=ZxSFgjtab4U3nQOPjKWRu=WmG9w@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
Subject: [Qemu-devel] Reminder: rc3 tomorrow,
 please list any remaining release-critical issues on wiki
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

Hi; are there any remaining release-critical issues for 4.1?
If you know of any, please list them on the wiki page:
https://wiki.qemu.org/Planning/4.1#Known_issues
(and/or just reply to this email)

rc3 will be tomorrow, and ideally that will be the final
rc before our release.

thanks
-- PMM

