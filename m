Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1174174A8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:08:21 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkw8-0000pQ-5q
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTkW9-0006yV-0x
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:41:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTkW6-0005tY-Kl
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:41:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d6so26979707wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Nv4Gt85ylkoWnk8TokAGCsMOavDPDNgO4lTlw1kM6Y=;
 b=zW+2PP2fgS3jixjzhceKW/Y4MIYvO9fAxH/TQboTNuPEzo22FCVecw9NEZwbnCUEYM
 Kf8KBGmZX4Bb0XL9AiIVlNkFnxM042mWD2Lf86uwZywgojLFwMI9HRwq5iXKcagtwZ0d
 yMQkwld5SdmUxc5UUc3MDK2di4UztbDAIJLzm3jzAjQe4OZGkuM2+5te9vr7Tq2c7uYQ
 /GYIw2WL1Jjw0acBZ2Zp42pt3pHxV05Fr3GxeLJZ0rP67UZe3ZCVXtG+NKS5ICI688PF
 rTsIRZWJHXydgzj71Z6TSJMOhek1A6KFFBoU4Mhz2mGiADLnXgijzPrz2JDwx/Rf7MGR
 LZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Nv4Gt85ylkoWnk8TokAGCsMOavDPDNgO4lTlw1kM6Y=;
 b=PyU6LjzC7bUCzhfem5kpive3f7P7OLBLEAJN2ziuyuSYM1J+pfP8Dwp/Zx0Nchyuhu
 dXybvo6C8Ivs7p1QII0bYWfP1UOM6F/HhIBEw1V//pbp4ucIgFRf4DLq/cKX8c02G3W7
 gPbJoqFZOdxVc2QIo8mQz2YRl7jqs0BO6oqAu3NWOxd4r/72kNOyCtZjGr/z/oZSdzju
 /+AR8YpkvFt5exTaANYgbEzxEs6NDGjGUxZDu+sGuyt/+6fMwo2XADFc1Hy+tb5v+QrX
 Vz1gI/Z2g4kTtMTCJjphksG5lB73ojhwJ8aYHE0+IpOdEdLu5n/YaCTW17ZjLW5mIwj1
 xN2A==
X-Gm-Message-State: AOAM530kDWSp2Q5aRSHnnIPTNhikHBVDVdN9CcD3OLMn5Xed0BRLaFoE
 m5PxBhS3n/kA7PJ/W+jtEveE1LUTW+Evkat5MuEzMw==
X-Google-Smtp-Source: ABdhPJxH2iNvDdVX83tYMXvgWVo3IHH5Mz8JP9YIJAWYpAdO65h/8JEUe/4VN/FJZ8fkqbQoNDrkmNb7r7XYBObWPWE=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr1874637wmi.37.1632487284085; 
 Fri, 24 Sep 2021 05:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 <874kaarwou.fsf@dusky.pond.sub.org>
 <CAMxuvawZ65aPw2Cs2torjoHBjYcS1ePDC16fEiHDt7N486A83Q@mail.gmail.com>
In-Reply-To: <CAMxuvawZ65aPw2Cs2torjoHBjYcS1ePDC16fEiHDt7N486A83Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 13:40:31 +0100
Message-ID: <CAFEAcA_PEsPfF_QBx4Af4O-LpFQfG7yzerVkxqzgKyF3wY4LZw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 13:29, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> On Fri, Sep 24, 2021 at 4:21 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > Could we reconsider this change? It seems to me to be adding
>> > complexity and build time and I don't really see the advantage
>> > that compensates for that.
>>
>> No objection.  Marc-Andr=C3=A9?
>
>
> Not at this point. As hinted in the commit note, the patch was more of an=
 RFC, I wasn't so sure about it either.

Thanks. I'll send out a patch that rolls back this change,
probably this afternoon.

-- PMM

