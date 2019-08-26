Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B39D6FF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 21:47:19 +0200 (CEST)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2KxT-00074r-04
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 15:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KvC-0005s4-Fa
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:44:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KvB-0003Py-DM
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:44:58 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41770)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KvB-0003Pd-7D
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:44:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id p127so4458109oic.8
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbCEgxFqL2qw5xiOvJPG7rqFsHipUteLqJzcwEoWU2o=;
 b=hYLA3cTJmTucU2AN8YJvkTrfcVw0vsuawucRgXUYCGU0LCfFp+G92Q0XqrAMwIPSn6
 ovPeDrfi8a97t+ugsxc5shvZKarWf7ox/HTJYY6yzjcCE0IFAJZt3hTDeEZwWI0MG+qE
 +SYDEm2z7rvrID63UKY9eXvRrBT/aPg9Q/qiDOp3k4otVHOAbhXYtrG6iUJ90ONf/GJd
 qz9I5GzS/AVdmQRsO+Nrze64qDqdxwOxD6G4mvNk8/LMnvXLbfdkSdp3ugDPY6ueKySB
 axk4G8FWZZSrf7whRYm7YaZ+VovFRIgTJjwPppQY9oEl9aWw5pV5wctcxBOnAushWo7L
 CXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbCEgxFqL2qw5xiOvJPG7rqFsHipUteLqJzcwEoWU2o=;
 b=D7JusOo4N0Z66P2mRSUImiM8Qa0YMPJ/uay7OfEMen1jn/lP8tpSS/Fyr4fDLwtdGX
 r/RwMf43JcUkr9IOgfxLvVXQ4u8HIgjtCTqzOwpn4gxpITUDg4si/QlyWGrcieTmH2Pq
 QCmDBZMKczZPRcjS/FKKait9YvSIvB1UYTmJMXLQBJDqJsfcPfXqKN/3RY9GvXub1UHb
 NcObh3Ue+AGZ+zzRBcWbLeJBsgu3WpiDQd1gZaCXS3w4YTLsmZdqG7qdnqaUzg1Jsa/U
 CKyn08VVbW1opOCJZrgn9ZFEC1IfWKllTqQq3OiL4NEzH2GmKX6qz1hFv5JsO57+qyjE
 8CfA==
X-Gm-Message-State: APjAAAVpc7Pn3x7Nvt7N88TxGg34kE18uhsHt5GaZuCiZNHkDoljTky4
 dRO3zuObpru4laSgujHHZBH4EFI9MyGglUWlrgaDDw==
X-Google-Smtp-Source: APXvYqyQzToYyuJ0pxz9bF9n/+DUqYXCDhJvSOklEt6eENWm5POEpehpLjdizbIarHTziRYRGRLZnlZQ6aeb297dzNA=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr12712256oib.48.1566848696260; 
 Mon, 26 Aug 2019 12:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-61-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:44:45 +0100
Message-ID: <CAFEAcA-AfHev4Vd8qT+ytqtt=ZopkcQofyS1TTp6Nq_HTkBS=w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 60/68] target/arm: Convert T16,
 push and pop
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 83 ++++++------------------------------------
>  target/arm/t16.decode  | 10 +++++
>  2 files changed, 22 insertions(+), 71 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

