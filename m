Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2E58A074
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:26:01 +0200 (CEST)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfXk-00014x-53
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfR6-0006K7-9q
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:19:09 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfR3-0001MG-Dw
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:19:07 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 199so335522ybl.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=InvY6oZlM5XWHHRMna6Q0Qhb65ggbvW+ycsKQOdjUg4=;
 b=aXG1AUiTEZob9vjaAgV2KcKFCPwgdLVjdK7VLfyRQRLaEWaE5eS/dKGGO9DdIzEAu+
 4ycZPTl45dkV5QRma+91550b6HHqrYOiG3/iFE86eDB/UtPjBPQGTcvfbPbwTlbc3l3c
 8rwhovIQPKyfeexvBSjfOKOSIss6DkYGm4ayPUu8mehQUAIjiFWpNe1eTOMLKQMszSrX
 muZtyQZZJ/+VGCmRW7cnqLHtfoD0SJY/Yro1ouojKa2tNUsbpW9qp8q1NRdpQ8oTFzov
 EkC1gR8+Eoa+TmguppDk9alm0U+5O0OYb/KOzn4dF/7v/9oXAI5sZgLcqjBcAnTRu6RZ
 aMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=InvY6oZlM5XWHHRMna6Q0Qhb65ggbvW+ycsKQOdjUg4=;
 b=1SiX4G42mGx+GU2CuuKNiKjWZWwSWYCSLdQjxn1z5uyoqMNxsmaBz00aAWI1yk4T5m
 Vmt4HegmGt7rRTZREZOV+/wbVdZhVcn1rI3bcZp1ARRZtiWIqedHxaUjnkYsV9slZiuN
 nFhViazN1bN+bYIhyjoKRiMk2D3KyAp0YR6QT2Usfvdt4KuD9tY4sXC2ueTuucnaoNqs
 EUXh8WK+hqsVoi5mqoKDC6/gMJrx9U8iM1EAu+qZdpc1v4HNiu4+u699NYo7hJg4zDsK
 AmHMDgoSmF9Qgm9e7oZCse9+Y6/FTUSopeAise+bmBbDIjMQcTBxIkuS3yMmWcy7hmEt
 mGgQ==
X-Gm-Message-State: ACgBeo3GSyz72frVNEsbm4XyC9z4RfDzszlXZEvulNSPF9oUpumIkzWI
 oY8oW0Q3i4NjKQE9PE9/BbeUOAk+jszZS39eCLsFlA==
X-Google-Smtp-Source: AA6agR4VTt1oduTN40mvgcHW+L2QDPMQ5pTrkxLYE/IQn1kXfDlxrBpLE/KCAVVZApd9AR+QT2WhwQFZ00Kf/5fm+Wo=
X-Received: by 2002:a25:820b:0:b0:677:3a88:48ff with SMTP id
 q11-20020a25820b000000b006773a8848ffmr2449455ybk.39.1659637143998; Thu, 04
 Aug 2022 11:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
In-Reply-To: <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 19:18:23 +0100
Message-ID: <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 4 Aug 2022 at 19:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I was trying to find out how to do it but I don't understand QOM enough to
> answer the simple question of how to get the cpu object from QOM. My
> guesses are:
>
> object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL)
>
> or maybe
>
> object_resolve_path_at(OBJECT(dev)->parent, "cpu")
>
> or how do these functions work and what is the preferred way to retrieve
> an object from the QOM tree? This is what I hoped someone with more
> understanding of QOM could answer.

The standard approach that we use elsewhere in the tree for handling
"this device needs to have a pointer to a CPU object or whatever"
is "the device has a QOM link property, and the SoC sets that
property when it creates the device".

There are other ways it could in theory be done, but there is
benefit in consistency, and "define and set the property" is
straightforward. It also means the device object doesn't have
to know anything about the way the SoC container is laid out.

(It's usually worth looking at whether there are cleanups
that could mean the device doesn't have to have a pointer to
that other object at all -- but that isn't always the case,
or the cleanups would be a big job in their own right that
are better not tangled up with QOMification.)

thanks
-- PMM

