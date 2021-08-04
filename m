Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E313E06B1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:21:48 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKaR-0003OJ-Pn
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBIFX-0001HP-MG
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:52:04 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBIFW-0002yf-5J
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:52:03 -0400
Received: by mail-ed1-x529.google.com with SMTP id x90so3867443ede.8
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kYRqU6N59uDauo1UMZVwtWJmMX4tThuDwH/EZF6mFyY=;
 b=qVMBjlHjaPVgYbbcc1XbpCM23qMwYKXC8veIedqe/zTsGLuD33hhPEv4LySes4IIT/
 07nVC0Q6cEl3xxjidPAMgctbV/twufE5+iyJ7bifBK5zhFkibG1yzsoujpYwy157J3qV
 Z0+cagY7IEV5w+gnGPQ9IlgMQnsEvfmZT5N6JFgK4tZxxm0PmglFBFOf4BXwLjX9cyRl
 mRbwBynE8U9DQH3aXRTkF1WRU9I7INgSG0qZZ16R8hQUzq5C33w59UPZ7qwCaWXcCDMb
 q9x2Bxu9KjyvDJbwZd+yLwBBXYYu3vMZynqPSSxj6thgjr84MVbvcu3BigcjBLzPLf/P
 HGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kYRqU6N59uDauo1UMZVwtWJmMX4tThuDwH/EZF6mFyY=;
 b=tqHc2f1POjkzSPGbzdRKKiIXT8oo/a/zlf/otBYn+/f8bfvW/3yNNeQAEHkAl1K3kD
 hwT3pjHnDICf4rk7VriQFYQytx0Um149JOu41FFN8Xn6SNPkRm6PsZUYvjyvx45EN1eJ
 65vVVOlF8QrEn47gPBIT++DorJPIVTeSdc43yfob1Z4Gxf04Uesz29eC5+3ZzIxKLoBv
 uLqFQ1CAYjkt3JOHMJevyrYwQgAlNOi4xaU/cQrYj0m5Q3wURVirQpBnr5FQvjJ6F7Ox
 7gJIM7JXBvT+OBgDihIVAXnV6zSC5t6nANB3Ek7QSGFrdrqenezQQz+5+Vo8fdez+Jvt
 xORw==
X-Gm-Message-State: AOAM533/Jsg76FkeFPb1ovQLVAPEbjYCbvDS1IzO9nmNr23VVZ3vKR5k
 j13nzeqeN9xPWUfUEIoCeTTcUCMzRFKMVReQiDqm2Q==
X-Google-Smtp-Source: ABdhPJzLXdLOwWULnm232BAjMOtt1AvNLcjAt87QK47zTgxDU949eUCeWz8u0/Zxca8DsN+akryNq1D5njoREyfPYOA=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr144475edt.100.1628088720464; 
 Wed, 04 Aug 2021 07:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210720235619.2048797-1-jsnow@redhat.com>
 <CAFEAcA8fG4Tuk04VuOHoeRBPdjvgDYhyyBUqyKOj045=uqxH1Q@mail.gmail.com>
 <87im0lioj6.fsf@dusky.pond.sub.org>
 <CAFn=p-a6pNUV4N6Ziq=9tgNaviNH_XnFUvAf2a9YCXoV7NYMNQ@mail.gmail.com>
In-Reply-To: <CAFn=p-a6pNUV4N6Ziq=9tgNaviNH_XnFUvAf2a9YCXoV7NYMNQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Aug 2021 15:51:17 +0100
Message-ID: <CAFEAcA-3q00AczY-NFFm5YTuUceRMBMz+mEozVT3xsysvh3+dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] docs: convert qapi-code-gen.txt to qapi-code-gen.rst
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 at 15:49, John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Wed, Aug 4, 2021 at 4:48 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> For 6.1, or "don't rock the boat now"?
>
>
> No preference. In response to the same question on the other doc conversion patch, "No preference."

I have no strong preference either. Docs changes are about
as safe as it gets so I don't mind them in rc3.

-- PMM

