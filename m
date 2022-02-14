Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A724B52E5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:13:17 +0100 (CET)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJc6O-0000nc-47
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJbao-0007oO-Tq
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:40:38 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=38473
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJban-0006ZS-58
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:40:38 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso19304062oon.5; 
 Mon, 14 Feb 2022 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/8P9BlF6r3FsVOjBcnYjI11vsp16GRkATaSnjf7IA/8=;
 b=SabpKGCCgrJMU2YupNx/5PopAySmZ4vpN400A1nABLt4QhqVo4wAUPabuyhdsWvvmH
 Gomsa/OQrKsq3tzNj3ykJ9FYvNYWjFfRnIlIvQ0CR7r3qV7+xSuEXCwCPNxrn7z7uJpg
 knlyE9n5ZadWnlg2V4zGs+FE4t2RUjnOsT5iwY5UQU6tQ/ZZhNO1K0omSxlGlhtkmyii
 ucOVhnM6CQmfBG47CkmQfA2TxTijbbAhiJMr5UOP1KVemnB7A+FcumYJ6L9ygBsuD/xo
 bRiCArd8zuAffIKr5FSaq0rqZuaKalfwR4qPLzU/qQw2M/HuoxamM11tmuSNxkL6+/2L
 VRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8P9BlF6r3FsVOjBcnYjI11vsp16GRkATaSnjf7IA/8=;
 b=uIMOiMAoyCanld5CfXm5CQNEZ9P9U+4HP2F2Pzw6gKETgWVIqnxnpjB2l9NXFVuYC7
 LXajsZjt1u2WzUWJpeiiz+RLTtL/R0bb26nfKS9ETVfZkL2CqZcQU+7fnZOKaKtR1MoH
 j//A/hGEf9N+TDxgGmi8mQc5oS8vE9l7y977KV6eMELxFnnwGWXTEsvvCv9zH4MEBQbW
 Xpgwjl/wSsMC+FxGH2RFrllghVK0idElzcLttN1LbHTlqJTEmrYalz9eSWEJ+G+MR01j
 +pHLhpiSxI3iiLF3MazdNcAE3jBTdr3Uep8HcmAMHUjg+1xxXDWqICSxxVl9+8ja9WRO
 xzyg==
X-Gm-Message-State: AOAM532d0d4SmfxQT/fwT1PsmNtsx/6+akrrV0zsXmJSWZbbOXotb/sm
 tDfrvy0BrU+TR2MFAwUIB/Efw72BZL782tL2XGU=
X-Google-Smtp-Source: ABdhPJwaKcvY+qgPjeUI25Rs6PX3rZa/3huydaipy1pne6406ySFTCL+5AtxZgEo7I93oWvI7Kek4orNBF6zD2Ji8KA=
X-Received: by 2002:a4a:c98a:: with SMTP id u10mr4485483ooq.51.1644846032878; 
 Mon, 14 Feb 2022 05:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20220213021418.2155-1-akihiko.odaki@gmail.com>
 <2ba4330a-849a-3197-1c8d-3f1d655921b1@amsat.org>
In-Reply-To: <2ba4330a-849a-3197-1c8d-3f1d655921b1@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 14 Feb 2022 22:40:22 +0900
Message-ID: <CAMVc7JWnz8hjA2M0g-NmuQRxvRxXmmPddfy=Lhp5kcALzMKUgA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not alert even without block devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 9:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Is this menu updated when removable blkdev are hot-plugged from
> the monitor or QMP?

Actually no.

