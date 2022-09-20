Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64ED5BE47E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:29:58 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabRt-0002xs-OC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaPp-0003UT-1V
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:23:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaPm-0002Ze-VT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:23:44 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x94so3084481ede.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=p8eCfwXyxbVOtx2Ul+DNXv/DSwNYB7qCIpdD5hsi1mk=;
 b=V/zLD7v+pJS/vhTgPfPSnoo/yDG/Ihd/bbgAstY0oJeQYD+e3SOVJxZJhQw8gqT5tN
 CIuzEq/7yU1SrXjMtjdK0Hn9tsSigKWvGNqDq90UoAShri0FMEVxJSHfLq3RgYq7DbFh
 PFMdZE8tWg3hT6mS1/b2Sq9pOG3QQJmZhxu5roHd+fkuBMb7wLDeVzpAkyZjmJ0mO58s
 M4ySeksbvhAzdZHrwYFoM5OOdm9yGcaYtpnOC8bPAlzWLIolOdtOjWeOySZOVQAK6YS8
 +i8uCMApcbbnUgOb9wUK9yLK+iczFZzN20yDpoyoRLIFYZEEtBE3gYa04CpQRTy6RGMq
 Ts8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=p8eCfwXyxbVOtx2Ul+DNXv/DSwNYB7qCIpdD5hsi1mk=;
 b=2QmUvBMBpyQSOywyUZr/bKY6YVC1W3ZjLUA0V3/3lwwdBo09ftn+Xn/EDeYZYdN+d8
 ked/xoeDnrOtKKEWMAfudrfF0///fHIplnGEwFL5crZL9jxFWSGabryip4WRr33cbt63
 8Ay0ikC6wr5TzBL/AhBQZAPH5x/GDJG4Ys+E+yW9Gv0KQZX963JVNyyqkn78gtT2xzp8
 BLdinKI7uVnU5O/Yb9mYTTF0gPdMyIDsPeHL3fWk0ze3dg+051/0n/bO9k3DYfZH7SRb
 Sj0zoVFHNHyCWJa/Zi27E4/jgHN64bPcwdAet/fd76u7fzyJcWqLTOti8eAhDzvAB49S
 cJHg==
X-Gm-Message-State: ACrzQf0Wwnrnp6KGWkfMGLcqMGGQ8HWq8q6l5Kn6vEfh50BPqBYH9/Vc
 OTv41SS91DJBU1dO91GNSzV+x0x98jr3RfL9Oi3jWg==
X-Google-Smtp-Source: AMsMyM7Qht2sxnNA9eNB+N2aI/7oFJnoxdXcyfEnqiteHuwOUMazpHH9rW9MVxjStrwV8i/FViuhOQgysgeGIfdPHLw=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr19758223edw.53.1663669420852; Tue, 20
 Sep 2022 03:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220827180702.39462-1-frederik@fvhovell.nl>
In-Reply-To: <20220827180702.39462-1-frederik@fvhovell.nl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:23:29 +0100
Message-ID: <CAFEAcA-QJOua_ZhnJXrSYw95xBZNbs9QSUsrZtd-C0DpfabdQQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: fix the position of vcram for raspi
To: =?UTF-8?Q?Frederik_van_H=C3=B6vell?= <frederik@fvhovell.nl>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Bishop <cleverca22@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 27 Aug 2022 at 21:09, Frederik van H=C3=B6vell <frederik@fvhovell.n=
l> wrote:
>
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> The previous calculation fell over when I tried to create a 8gb Pi 4
> because the values were only 32 bit. However the quirk of the Pi
> hardware is the vcram can only appear in the first 1gb of address
> space. This also limits where the initial kernel and DTB can be
> loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
> Fix this cleaning up setup_boot to directly use vcram_base and
> documenting what is going on.
>
> NB: the aliases are confusing.

Hi Frederik -- could you say why you've re-sent this patch from
Alex's rpi4 RFC patchset? As I understand it, the code as it is
at the moment works OK for the rpi models we have so far, because
they happen not to have enough RAM to trigger the problem, so
this patch would only be needed with the rpi4 model. Or is there
a setup with our existing rpi models where this fix is needed?

thanks
-- PMM

