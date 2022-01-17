Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5279B490736
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:39:09 +0100 (CET)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QLr-0000C4-TP
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9QJ5-0007Kj-9J
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:36:15 -0500
Received: from [2a00:1450:4864:20::329] (port=55019
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9QJ0-0007uW-J2
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:36:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id p18so19611870wmg.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4XWsqiG/LNzveZmAFdOkYaK47sv2isdj252Zsurq3Y=;
 b=rW+R5RbvYKy+YFqdS5DCkylcpsVZi9150zEV66d2ZEHRvaphy5KJ4H+GdXYAQDv7gy
 +UP35/OXS9vfnYSOpCWIGD7AuxQU4FcdDIKnjVIhbf0fSU2cuTBq1c/yIjiyFs6Sjfqg
 GXd5mcPAvETnR0I6QbjKsULIjfSI+ClL5Xs7bZDeOk6IfLhJesxBYqAko+GKGZcJWOwl
 bzyPQ5p8jVW5WU2G8p/dvO2WCh4ZPA8bMFSSEy3oo9F9TCXNw+vU96LRXtTLyGK615lY
 zLgdP2p9h7OG3nh+ShJS7MqeaHurLAX9+u6fCMVrUIJuP4/bInfbp9e5jBtuOddjRJ9i
 RGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4XWsqiG/LNzveZmAFdOkYaK47sv2isdj252Zsurq3Y=;
 b=H25Bbs5/d5SD6zKDkDYNaxKu6Tm7XGpKga3CV2bT8mKj/dv50uMKr9RV39caO8vbvU
 b3S7876Ao658tcSa3ZD32xWTr2A7soqX3SF2ksJdjId87zt/ZkchaefzOl9JkS4TbBfx
 /15EOOc8x3TaPZZ+kMlpso8HC1FNc2uRQGyuwqPADilPjfjIhGrsYRKL/MCSd9wTPyDW
 PBFLr9xuxfPtIV8W9D1wrW7AxDO+S/E1yqF7wnclQDZgIkDNKIunxmAvpknNgD83F7q/
 Xh/CVK6TgRr78TSZzvPo+o9wTphmIYIzDUZBZXn31uW6Il3S6qknEKSu9xkXmJwvarUb
 TXLw==
X-Gm-Message-State: AOAM5313vMTP9B5Jtyh2O5GxcQuOM3qq8WXzTXlgr1P7IljH+lGGCAU1
 faqCMGyrfsKPPSGI/Ey7Ae1zgLN2YIAZQRlufoT7Rg==
X-Google-Smtp-Source: ABdhPJzuhoGYKvcLIFjFZzdaJEF+KtdsFolpP6tAb0dDhmWH4PiHVS4X1ZWhnmu4NN2jcLmh1aXNlXBlEZft3On28bk=
X-Received: by 2002:a05:600c:4f51:: with SMTP id
 m17mr5214726wmq.32.1642419369169; 
 Mon, 17 Jan 2022 03:36:09 -0800 (PST)
MIME-Version: 1.0
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
In-Reply-To: <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 11:35:58 +0000
Message-ID: <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 11:21, Liviu Ionescu <ilg@livius.net> wrote:
> I did not check the implementation details, but if Cocoa is
> mandatory when building on macOS, why is it even allowed to
> choose SDL during configure?

Because (1) the macOS host support in QEMU is not very well
maintained, so the default is "it doesn't change", and
(2) the "use SDL" option seems to have worked for at least
some people in the past: here's a bug report from 2019
https://bugs.launchpad.net/qemu/+bug/1847906 where the
reporter said that cocoa didn't work for him but SDL did,
for instance.

-- PMM

