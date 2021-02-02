Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2B30C193
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:28:16 +0100 (CET)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wf9-0007uf-T3
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wc0-0004dH-AN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:25:00 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:45065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6wby-0001pv-MU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:25:00 -0500
Received: by mail-ot1-f51.google.com with SMTP id n42so19928888ota.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0zj576h3thU8kVVuB3Kg+GElINU7SlQKwHds48k57RQ=;
 b=NasGOpCiNh0nav7W/gLmGxlbjplTvj42H6BrVhZ+ReosUg3vmYtCI0Y2/Q985p0uga
 reKGiPk8oiF/ANAqY6DWF8xNMY3TixB4Z5zJoZcnsZWNBSWX94OyxE95g9kp6T8E0AqE
 dy6e1pZfXDgiDgJBev6TgqCCJhwUfcj+G2h8dLveA1MNDPxaUez2iUypRqMfZ5kM/Pk8
 VMOJLfAgACe39okpSKFjsqrwkKONnznaORPWkAO29p34XG7W1GjeiUuhdBOyXrPfqLLx
 PLgK4kAWmNPAm2aXz7nI+JwsbHJQ3hgiC24F6xhpFe2MyaH6TKQVFmf3wZP1PvYgb1IF
 wU3Q==
X-Gm-Message-State: AOAM532KtQMTScvsPdb/h3XD0xxLVSa2eOdRrp4C2n/83cwRotQ/QfVK
 Dil9GmfdYfy2GgSd6cXfIi9mi+DZ6RWvmRc+80k=
X-Google-Smtp-Source: ABdhPJw7Jj3jM7+DdIQA4MOYDfp+JNnGIdnGtmWEf4eCe88gi+J2M66YKpBbNOWJntAnSy9B+r2R35mG4ZJIX/J2+Uk=
X-Received: by 2002:a9d:6f17:: with SMTP id n23mr15584019otq.371.1612275897610; 
 Tue, 02 Feb 2021 06:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-12-alex.bennee@linaro.org>
 <15438de7-ad2a-b0c3-3d35-1e78c6b1ce13@amsat.org>
In-Reply-To: <15438de7-ad2a-b0c3-3d35-1e78c6b1ce13@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 2 Feb 2021 15:24:46 +0100
Message-ID: <CAAdtpL7EttPLAJaFWRpvM93n342MyaAREpEtxr6-dmnfmu=wZg@mail.gmail.com>
Subject: Re: [PATCH v1 11/15] tests/tcg: Replace /bin/true by true (required
 on macOS)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 2, 2021 at 3:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> On 2/2/21 2:39 PM, Alex Benn=C3=A9e wrote:
> > From: Stefan Weil <sw@weilnetz.de>
> >
> > /bin/true is missing on macOS, but simply "true" is available as a shel=
l builtin.
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> Reviewed ... :
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777004.html
> ... before Peter:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777010.html
>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> His tag is and mine isn't... Is it possible this is a b4 bug when
> names use UTF-8 encoding?

FWIW the version I'm using works:

$ b4 --version
0.5.2

$ b4 am 20210128135627.2067003-1-sw@weilnetz.de
Looking up https://lore.kernel.org/r/20210128135627.2067003-1-sw%40weilnetz=
.de
Grabbing thread from lore.kernel.org/qemu-devel
Analyzing 4 messages in the thread
---
Writing ./20210128_sw_tests_tcg_replace_bin_true_by_true_required_on_macos.=
mbx
 [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
   + Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
   + Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
Total patches: 1
---
Link: https://lore.kernel.org/r/20210128135627.2067003-1-sw@weilnetz.de
Base: not found
      git am ./20210128_sw_tests_tcg_replace_bin_true_by_true_required_on_m=
acos.mbx

> Again:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
> > ---
> >  tests/tcg/Makefile.qemu | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)

