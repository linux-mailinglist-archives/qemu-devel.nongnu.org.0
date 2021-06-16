Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E03AA431
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:21:27 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltb6M-0004dG-E2
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltb5J-0003gX-NX
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:20:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltb5G-0003li-0j
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:20:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id ba2so626430edb.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pX5gL407y/AbP5Q9O0yMSPRFA0LA88Hz1+noJ2ARdvQ=;
 b=iGyPF/LEPQccB+TJCKoZpk0sUaE+n7/3dQgvOnwLsPc6JLyhjzW7DHI1krvS7H19vy
 nrp50TOQlNAH70jSzkSnlAd5qHuYebqSSDt3KmPoMnnUOlHUrTqzWBxk/kfC3DfGclJd
 v45baqoPPMIBWLoQfzpnCAe6p2ujkmReGlwQPA8/u0dqRiNwBnyWxe7kG0AnAru4FFw+
 /97Aqpuv+Pyg+rPtGBA3oxqfRYoFe6j/84hUqzgnBPe50zVRm99KNOH0qn8z3sMABSEt
 DhHJozo9hgcCWN91XqI6Q/AJWbo0lcvoOzuDF27vcVMLQCZVyF/JdDdOl8vigvaa9ruz
 ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pX5gL407y/AbP5Q9O0yMSPRFA0LA88Hz1+noJ2ARdvQ=;
 b=UuQSeKLsI9CuVSb2wp5HRcxWd0/0u9d+oZVwjoVwvPMXb6o5XsXJY/WrNfYlERm6hb
 mQzVFk1VcTnRuN9mKzPUAqdcuUQe4dT5CT80FnhO5cCLYyvHb9VlRXnhn/y6Dnk7j5US
 LHhlmPquUqeuUIUGpVAsOcDBjaIYrgwjavNs0DZrE77vZnNVvEom10/wOMga7EOzGY2Q
 7K9SiadHKrHTP1OXEfmpRlERqan252D+H4MIA/3kXHO+/w3eM6Ddwiqjy0O5RgkVKrhV
 XnrMMRQBBdewZP67FmXR8b/6aTCYWl04YyLA6tDZo3anC89QOS/AXnDz8yYv5tbZtWl2
 5Otw==
X-Gm-Message-State: AOAM530JrBXcb5yKxvst3rkCdg6Rl7kB+KY2sCPah+qi1VgWDnx79rss
 zPgmIl5PG0BtD/YgOCyQHL1GMdErwY68WAskT/ismAz/uDkxIg==
X-Google-Smtp-Source: ABdhPJzLCHMqtf8JqtW+wlMsg8vVdisgVEQa0/okTwJ4i6hG45ijNupJMBmtfZ03TdNcxwzCySg1D5U6xlWqSU8eG7k=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr1607405edb.52.1623871215203; 
 Wed, 16 Jun 2021 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210615160652.29485-1-peter.maydell@linaro.org>
 <878s3bgkgg.fsf@linaro.org>
In-Reply-To: <878s3bgkgg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 20:19:40 +0100
Message-ID: <CAFEAcA_c0J4S6MwME3gLuMifht71v6g38gz4f3Bywf4rpmOoJg@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Document which architecture extensions
 we emulate
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 17:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > These days the Arm architecture has a wide range of fine-grained
> > optional extra architectural features. We implement quite a lot
> > of these but by no means all of them. Document what we do implement,
> > so that users can find out without having to dig through back-issues
> > of our Changelog on the wiki.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The FEAT_ lists are in the order the features are listed in
> > the Arm ARM; alternatively we could alphabetize them?
>
> Maybe a slight preference for alphabetical order. And crossed fingers
> the ARM ARM doesn't change it's names again ;-)

Yeah, I guess alpha-order is better: that way we have a
reasonable chance at being consistent or at least fixing
our mistakes when we add new entries to the list.

Also, I just realized I missed
- The Scalable Vector Extension v2 (SVE2)

off the list...

-- PMM

