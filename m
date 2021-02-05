Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A2311100
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:22:47 +0100 (CET)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86go-0003hV-U1
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86fJ-0002yH-1w
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:21:14 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86f9-0005E8-JX
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:21:12 -0500
Received: by mail-ed1-x531.google.com with SMTP id q2so10153062edi.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 11:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bRRgxEAc7dTKtwvAAELeHVlGL4wN8nTZ2F46g97ej2Q=;
 b=KBEb4VZDcRrl9XI19d0na1hkjxCgwAOKRc6XUB/gO6q5VDvFZ3Kp+kJGMGEPp+dnGF
 D6QFQaEyuuLPQHMyzldlberVOhw2XvEvjKpdZxksEUuUKllTDaQB6HTwmGSi7C++IK49
 S9YowSCbUpAJDvEsCs2N7sE5QinMgXELgNLNofJOLUmSyzECJj5yyzjC1EP1AYrqZt4R
 0yphete09v8UbQYGkro0T4om5bmLj5Nk0ris0dfp+YYsrDSRqCHCFRegFi2r2CTsFczc
 /LsArqSDHthjvIPJVge4MEhLeV8dlj1suPlS7YwWh/OwyINYYhBCAhu2jqEcKUBtM3r3
 26Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bRRgxEAc7dTKtwvAAELeHVlGL4wN8nTZ2F46g97ej2Q=;
 b=nfzHzjzJmuVbjY0Vmhn/l3A/ow+zw/cna9O4gM2yKg4Vkvl8eVyUUu70IF2zEF/9hO
 6RV5VTN/VoB/gEp1WilxN+GoHKFBV1gMtqHInL8UKt6bEbE2PptJFlMHN2dbIF4+oEK6
 H+6o4GkkmvOJEz5e+S1lpURBiIjtjDfNNFwRYuHDat+n+kkRdzKk0ScMWxtoJi1wrrZQ
 ppBDx95hzP4ldh7j0/mNw/lH5EyRJsTR7fa82TKMNlha5LEtsjTqtApB83jFtJjavr47
 MJIiAExgih9HgRr8Kggo5uDYruReQRdPJ3iIzDsEt3/9yo6GFdZUO6auh7dRPXRKXIC1
 zOSQ==
X-Gm-Message-State: AOAM533Wt72VmA4koXP/jQviiNrlLhFwrnk7floT8D//BS+6OUXc6bOM
 fuEoJlAQB20XrVn0OT68GErkksDFv3YVrHKa2Ib9LQ==
X-Google-Smtp-Source: ABdhPJyVGF3zK3LlWC8E4wckoXQKWZOu3gBuRyp4m8rh56GyfxLsT5ZrveJRmJuGLb9QfoX3pJTReiPnUoMK4ucnRL8=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr5059453edd.52.1612552861393; 
 Fri, 05 Feb 2021 11:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
In-Reply-To: <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:20:50 +0000
Message-ID: <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 2/5/21 5:59 PM, Peter Maydell wrote:
> > (The selftest is part of the AN524
> > download so it's behind a EULA click-through and we can't put it
> > into an acceptance test. We might be able to get something
> > based on Zephyr or Arm TFM.)
>
> Wondering about that... If anyone can go/click/accepts the EULA and
> download artifacts, then I'd like these tests to be committed to the
> repository, with a comment containing the download link, and the test
> can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> binary I downloaded is the same you used for your test.

I would rather not get into that. The selftest doesn't actually
exercise as much of the emulation as you might think anyway.

-- PMM

