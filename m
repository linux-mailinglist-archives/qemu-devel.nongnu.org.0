Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3426531CBEF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:29:54 +0100 (CET)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1MP-0005zD-8e
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1L8-0004oM-E7
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:28:34 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1L6-00029Z-Ni
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:28:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id v9so8008791edw.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXvIjZLSRlLvRRws129RT6N1WdoTZ8M6i8FNBLzvwJo=;
 b=OFt1LVN4SEnSvI9dLl3eDLXqv8beOxirXdF+dKdyEcXi+DNkPnc9nFtpWHx2xZ8r65
 OELOpapKI2HAi963bGgdvdyaQX4iVtY8XE/jwQr4YVxvLDhP3BKB3vkkodUEB2Yk2WOo
 Y0/ijQzBdnw8s90PGQjI3kK/uphn8+IN12CSsnrOL46fByIBD6hPYZe6f8no0ZIpD6eH
 +s87c8z2duHiksilV4tBEed7dEQ2R3be5WnzkSHzOlz2/XxTIAqMrLpTouy9cwpt7aUu
 GoMHH7iK/kro9RYfFRC7Mev5/YcZWuKWJ8xc1lhoX/7c7llUAnqhW5OGCVG8dlhfpG6Z
 w/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXvIjZLSRlLvRRws129RT6N1WdoTZ8M6i8FNBLzvwJo=;
 b=V+/deRfPJ5kMFTWHaQ0wq3A4AhXg2P1fLpjPkX6g8Imhg5MyToIXrK7BdKlr0+v9P2
 6DB/Vrg/G699wgZGiqunuQ9GBsTwkJKhjrBfZIXx76i8rwqsbVLRvC6pK85247rzcRUT
 9Sosq+HFykSigtpRNeqkVGpNjYXZcFYFGRwWQDUs7gBkhukTQ49UDJYuxe66IDg0XDup
 nfLgH4iJroTrjL3NnSJEZJ90LzXy1bbwI/x0r6udR1oBKTFXW2Q6X8DsyiR+y86GWVFM
 gwqaLWUwh0geJ7t+EAOTXFJ/VGtXsHWFWyuKgnu72GyhFIPXtY3xEzczT0j778PLNVrh
 Vowg==
X-Gm-Message-State: AOAM530KItkgzO3e3lmtG6J0tjsm6+ZXcRQtJVwxNxuptYl68y7H2fud
 mhTGr/A2OA3KpqQhK7SPYpUphgPTpwCwfITP0G736w==
X-Google-Smtp-Source: ABdhPJxSdvihZi6fF3mWqewOyWsXud5IuVKgoFuOu0Cz5PAL6G+qeIeqROL+utjRBXz5iqv+xP5ytQxgm7lCSQ0ew4c=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr20705792edd.100.1613485711344; 
 Tue, 16 Feb 2021 06:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20210213002520.1374134-1-dje@google.com>
In-Reply-To: <20210213002520.1374134-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:28:20 +0000
Message-ID: <CAFEAcA-5LdAO+m8enMxxUc7TczrKV407VGCt4vS5PS3jdDr2XQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Feb 2021 at 00:25, Doug Evans <dje@google.com> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Doug Evans (3):
>   hw/net: Add npcm7xx emc model
>   hw/arm: Add npcm7xx emc model
>   tests/qtests: Add npcm7xx emc model test
>


Applied to target-arm.next, thanks.

-- PMM

