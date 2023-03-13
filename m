Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAD6B7D0A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 17:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkjV-0003vs-B6; Mon, 13 Mar 2023 12:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbkjR-0003vN-7D
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:09:05 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbkjP-0001q2-Du
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:09:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so2650915pjz.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678723742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oahlyynrhwGBdhYeTKn07q7Zx3Hc43sAPFgriPaQbNo=;
 b=MrPuhqffuGPLCJ20+40ReK2zWhmNJVPx+HoSOGt4ZPX9xu9t6t2Uq3vLJPTMneDio0
 pRi27lCcvrqM1htF4BSnXl0Mlz92vV/YXSdBDk28B3Fvkj/L/gECR+T4VMJ3qDufZzPW
 4JrIxMLna3o1Z2CsIZ/Bxuh/8c+cOYSgEL+vUekmNkuxkvSE1KFwK8wQGG5Ev/sKaWnN
 kB5Q4e+8HtP++WOU5zW02Zug+qQnp/BwQODy2OCqrA+0/U2tJBpFWjKBzc6hCx5PSvWM
 C5zitG7BwOxSjD5+y4VXZOggKoc5xysSwOA4QlsNwKnp3idGxSV+eI118o2FkUByyPjY
 JT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678723742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oahlyynrhwGBdhYeTKn07q7Zx3Hc43sAPFgriPaQbNo=;
 b=jCZgrdMOuUJoCsyxnjKQDej+sRK11ftlu/azPzqZHyCqbPDpfiI+hyeTfwY1wbKCvM
 /EQbdQcabyVpBzz16d83JbEDLS/Z9VX9P1Ae7ZiD5jB3DqIx4eJfSsW8JXfD+s3FY+r/
 XSyHdxu6gymyI3glkTgAXX4z2hmY7FjKeOzBlHgYDguCmu4xgWIaWiVnCRkDPWfY4ZEp
 Zjak8a+5Hh/xY0iW4m/z/EW7T+jqOw4PFf5NbraWQFmL0SUAMp8aQEc6HiEn9XRtuKXO
 4C0KAW56sApAb6vhFq+7cHil0lzBOPq3z1+c0s4vsOVkNF2FdDpEn8YlAYahc5wsLRe2
 H58g==
X-Gm-Message-State: AO0yUKXXzB8EV0u4/69Art9rY8JEgD6ZMrfknq/TDgBEj+/ce1FRsNGj
 kxmC4w27NYVgJyQwojADkikqpTTJQMuwVm7mPm6wgw==
X-Google-Smtp-Source: AK7set+QO7/OkGaoQLpThIdfDRebj8XF7Gf8j4b3LVFxOLpsnqfbPSWpgGTRrumpnp5mpIDVpYJ1+KO6jPLMMDaqT+c=
X-Received: by 2002:a17:90a:130c:b0:23d:2b47:e6c8 with SMTP id
 h12-20020a17090a130c00b0023d2b47e6c8mr347926pja.0.1678723742040; Mon, 13 Mar
 2023 09:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
 <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
 <38b1989e-248d-88fb-2551-13c895999841@linaro.org>
In-Reply-To: <38b1989e-248d-88fb-2551-13c895999841@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 16:08:50 +0000
Message-ID: <CAFEAcA95qnh=B3DYTTi_65gF3geErw4gKZ3g3y3zd2tVp_A0aQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 15:41, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> Now I wonder again if this is a good time to merge this change set.

No, I don't think it is at this point in the release
cycle. I would vote for merging it when we reopen for 8.1,
so that we'll have a full cycle to find all the weird corner
cases that it breaks.

thanks
-- PMM

