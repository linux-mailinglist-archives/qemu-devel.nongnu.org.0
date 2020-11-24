Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F58E2C33AD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 23:07:09 +0100 (CET)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khgSp-00058H-PK
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 17:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khgRV-0004eR-Ad
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:05:45 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khgRT-0001fq-OT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:05:44 -0500
Received: by mail-ej1-x642.google.com with SMTP id bo9so103880ejb.13
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QboLXfmB5aYm/cVYNfSoVbEMKUbOLED1Ak18+1YstkQ=;
 b=xDw3DbfOGA2uC41wjJRrtQaIJG/QU+eTLWjsw1Ah3oBYfPo26A0GFkr6vwm7JahVbY
 oKWDJ6Z1VflYL+bX7HI4qrEk0w9sgkdt5mZRpdXc21sfmit1qNxtfwdVRtrUWET1BBwe
 9A/emol9aEvqRlE0us4EBMqzDXgc0S0/27Bl0j0RqlEVn2QJCMFu/m0stg3tQfoJe/xl
 ee5lOxayz+zkpM6Yj5Nf94A5ioHBGVZ7ae/CKOWFtBjN/xf4UbwuEzSM/7XgPHTRV1FZ
 DarrS54rc0kIH5i40MfERuDUZ2jsBhMscxFYTJHj4vsltm0i5q5iKGKmG2g/gTS32E8W
 d43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QboLXfmB5aYm/cVYNfSoVbEMKUbOLED1Ak18+1YstkQ=;
 b=Wp4itKVouPDB/3w+nkNVj13eXKSbQBrf63lykOSg97okuuaFVoINgi+n/E34YZHWeE
 qArCskMzOIcLe0/32qskWvAT/3qNnEww/in+WXfHmiY4KZsmDj/mwr7O4xIiWXZouCg0
 F53zeAzqPRMCQBy+xjJHKV1YgbbYMNE2VbRVIfKMX8WW4teCTjta/MVtN02UhVWTQdit
 bGgRk+bGxI5POT/ccVyNdqPTXFyYIlDVL05Yx++1Nn65Ytj44mVK6FzQDwByr2GII0XK
 AJlDcBwzu0EQoX2Ffuvo3ST3vGTE+dFZ93VLf1juJP6LNAxU9P0rNIvDB+zQYiiZlp+D
 M1/g==
X-Gm-Message-State: AOAM530FilFKxAgOISI0FAMiwIGuvDRxoozrdUh+7kV3gOcfVonM1eXy
 EdAwfnAQLqTN1CV0fCTy62yLG7TrMUs4QngRdjwhgQ==
X-Google-Smtp-Source: ABdhPJwj1vSEK2y4jDhlB9SayX4yIHC2Zq1elFkFoBQboPOYUPljYFtr06QVoYeGTWkW6S/tbAXYp+A8APvi031qjXc=
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr488094ejg.250.1606255541834; 
 Tue, 24 Nov 2020 14:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201120122702.4413-1-lma@suse.com>
 <CAJ+F1CLuY7XtvpJXRfkK5dBpi3ZU5VYcmJ9XndP0S8CLQ1uXPw@mail.gmail.com>
 <ec802fc0-d348-6206-5cdd-20f28294d9a8@redhat.com>
In-Reply-To: <ec802fc0-d348-6206-5cdd-20f28294d9a8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 22:05:30 +0000
Message-ID: <CAFEAcA9J9Hw-AUGSeBjASXq9EfVEpWLpKxpfiyMrRQQWS+5c5Q@mail.gmail.com>
Subject: Re: [PATCH v3] qga: Correct loop count in qmp_guest_get_vcpus()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 14:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> As we are going to tag 5.2-rc3, what is the status of this fix?

'git blame' says none of the code changed here is newer than 2018,
so it seems unlikely that this is a regression since 5.1. rc3 is
now ready to tag, so this is going to get postponed to 6.0
unless somebody has a really solid argument for why it is
a release-critical bug.

thanks
-- PMM

