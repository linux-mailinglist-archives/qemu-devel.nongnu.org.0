Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1446DFCCC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 19:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmeKg-0003Fv-Dq; Wed, 12 Apr 2023 13:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmeKe-0003Fn-Do
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 13:32:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmeKb-0003NR-HJ
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 13:32:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id q23so21307266ejz.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681320746; x=1683912746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XUs+LCBWUtxx33hkW9i3IDeRlOCtoQvYfIWZAzIkPTI=;
 b=roWGJ34MjAyFcu0g+t4m0iirh5xcdu4s5aArzsAWmFhWS9ei1GVAtagJaANxusvXh5
 07KEERFkYB9/Ao4EXzzph4HQtiZ3uj0jTmtjh7LH5i/19duveDrj+YUkPTYUw+jYJXcs
 IFdIJmtB2ZEwvzmd2r0tSbbaj0i85ekXpd/srp35KKxQhqM9vbgWhDZBO0Aqbjicc9W+
 Kucp1o0sShaKPGQcD3qJOuP5rqP+E9Qwou4y+xPdNVqt8LT0iph5fuT0H+HMeoPS/1Ki
 dTn4dn+3h2w1q+M5d50nYoHaid3pCzscCH4dmzI1bIpGV/s4JACHs2BNpgDKA8zWePLz
 9Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681320746; x=1683912746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XUs+LCBWUtxx33hkW9i3IDeRlOCtoQvYfIWZAzIkPTI=;
 b=EM1etUAldRKDIt35zJcAItdUbcp9/3k+o9Xp3TXjxTwjrUBQXThhCJd89bagp/zk2d
 FsP2JAC8RBPKzmRsoEqWvxX+cu2A9UnmiRJuMtCcDojIcbKwvIBS7Ym6nAIlGb6ijD9O
 G8tH0LQXdT1WKRANztRTP2WxF9XqjLHx8wUy9m/srPsB9Yz1ZK9a67dqRogNbpCWvZpC
 zgc19F7I/w4R2xKFaRP6Zbz27SJ/MrcYh6Mj50LqB36jB5it0GRcxrklINKGXavIV3Oh
 xRgnnz9MV8Lhqje/7XkfWkVuZySAPAZRrtwzacEh+WGWVpzRvbX1mXNlJL8/lK+/a1nA
 rCyw==
X-Gm-Message-State: AAQBX9dGtTjJzHHZ/BQAogXWi5REF4MiWkAt5Bg/hEazs3jXhGhmCvl7
 1EGufpfqMJGgFAprYBfJhh7RhtWKtQXg6W/OKspK6Q==
X-Google-Smtp-Source: AKy350ZYWTaYb5mzNfVuM8/+3FaxU8S6ORE9oXuL9M8NaVyo+VeNtY0tSFVf3KlG79u022ye575SrQdm2f5VCCtRaJk=
X-Received: by 2002:a17:907:d30a:b0:94e:5c27:dc5f with SMTP id
 vg10-20020a170907d30a00b0094e5c27dc5fmr1475387ejc.6.1681320746169; Wed, 12
 Apr 2023 10:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230412125842.573dc418.olaf@aepfle.de>
 <873555pakr.fsf@linaro.org>
 <20230412142022.4b88df69.olaf@aepfle.de>
 <80e7920a8947fe58d94003c7591af6e876edf706.camel@infradead.org>
 <20230412184118.7069e990.olaf@aepfle.de>
 <841857d534d6f46e1cb293cb90ec5bd599f4db54.camel@infradead.org>
In-Reply-To: <841857d534d6f46e1cb293cb90ec5bd599f4db54.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 18:32:14 +0100
Message-ID: <CAFEAcA_67X3mEpfNDuShsBK2i+taGZVb3JYf+r_qr3fY+aY74w@mail.gmail.com>
Subject: Re: qemu v8.0-rc3 fails to compile with Xen
To: David Woodhouse <dwmw2@infradead.org>
Cc: Olaf Hering <olaf@aepfle.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 12 Apr 2023 at 17:58, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Wed, 2023-04-12 at 18:41 +0200, Olaf Hering wrote:
> > The error with this patch applied looks like this:
>
> Thanks. So I think I fixed that one but there are others. I'll make
> myself a build environment rather than getting you to help me play
> whack-a-mole.

Is it worth the effort if this version of Xen
is old enough that it's outside our standard supported
build platforms policy?
https://www.qemu.org/docs/master/about/build-platforms.html
You could just remove all the no-longer-needed compat code
instead...

thanks
-- PMM

