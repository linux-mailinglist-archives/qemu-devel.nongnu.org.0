Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CE34F2923
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 10:41:44 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbekx-0006No-9E
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 04:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbeZn-0003tS-4o
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:30:15 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbeZl-0007xE-FL
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:30:10 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2eb543fe73eso68105967b3.5
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2xqwTkKc+4sGOULsNDkBzhNriIRVBn1UyqXWTpOguM=;
 b=La8WNNzXSKn6nGqd5TFUNR0C7nQdPvQQ5tXseX+0ElP6iVRI/976X4mZRBVDJTD2vf
 V4NJVr90FrE4zFAREJyw6N6OY5bSZ0y7NeYiR8rXcw+s9fYxvDTZAcMqKKEw62a0Yj6y
 vv91S6GMCLlu7oclutTHIq3x0w9bKO6CUoyGxtamcHitqR6oBLmVyltL3CLhedP4Kvt7
 JPsYlKW78GjZC7BmSy3CF46/OYTy0+bA5K6NlXJAb89dw8EcfEBe79DBAO7DlycTbYkX
 SKmEixxJKc9n4mmuO0C+y3xKoMo3AE6P4qg5cMNfr1pYwwEEcmvsVJ0bYMp2C7LYqfk6
 95og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2xqwTkKc+4sGOULsNDkBzhNriIRVBn1UyqXWTpOguM=;
 b=zl+Khx0UIgjPeF6c+KGoH38+A2lA81m0kS+3rhfbZwYUUTgASaHmA53PQ+naMKKcoO
 lIwGiRVu2P4Fqnn6J6gXR0EccyzMixjBCbOGSId7aJTJD/dsIZRPTP5ez5U/XQaP72P2
 NwBLRU54nKjiJB+FQpRFUQf2/15RfKUZYPPXZ+jna+oVdcLhJ+tfuLWENbO1vLG5Wo3Q
 EkIMgdEzQFrCIma76UPj2ilmCyOdYrjv5E9OcdS82kumSX+SVINHe+YXqlKZ7+cUfrWL
 jurymsiKBRdpArRTqEcaObL6kryOSkoFvjQcm/CQ2PQgT9h8tpcHwgP2yMEq768xnizX
 ZQdA==
X-Gm-Message-State: AOAM5338FvJnFTVnBESfHy/G+X1Ze0vWo02Cc97s5bPNCdq4jJITvkTZ
 LDQWlNBXzgFP76BWTxTla3COa1j+AFMX22H/lA0vRUjE5x8=
X-Google-Smtp-Source: ABdhPJzFFxfLBO6zema9pdxHkXvh1RGuU5PeUSgyyAU98F7eSRPStEwjpWkegqw4UdeFc5UnNpnn6nGFb7MpN4LAWn4=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr1606284ywa.455.1649147402589; Tue, 05
 Apr 2022 01:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220402204523.32643-1-pisa@cmp.felk.cvut.cz>
In-Reply-To: <20220402204523.32643-1-pisa@cmp.felk.cvut.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 09:29:51 +0100
Message-ID: <CAFEAcA9eas_8k=a1HK1ssa=gf+8GOLqK-cHdghpJGRqGizUhsw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/devices/can.rst: correct links to CTU CAN FD
 IP core documentation.
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Apr 2022 at 21:47, Pavel Pisa <pisa@cmp.felk.cvut.cz> wrote:
>
> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> ---
>  docs/system/devices/can.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)



Applied to target-arm.next for 7.0, thanks.

-- PMM

