Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79D583BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:11:46 +0200 (CEST)
Received: from localhost ([::1]:56792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0UZ-0004Fg-H1
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Oz-0008MY-S3
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:05:58 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:33310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Ow-0003LO-OQ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:05:57 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31e47ac84daso14417957b3.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0vw59q5rzQnlKJSB1K7rRqNFJwruNBIcK91sEKRo1UY=;
 b=PPvS0xm+3auW921BDx3cBWuVogloS4JgbG9quiBFllaI3H/u2eGt36vMR7lPAOvqJo
 eaDY6GrTtMzltA59nxchCHnE9o+k81B0IV6GkhFIDcfpG+QVPTUyK9yH6Z0W1NDEWdeI
 TflCkzA29txy0S4CkfL5P/rbj2Y1l/sMhuHOJNkplr/J8W8s83XOMoJVpTHvxg3dfwC8
 JaChIBMXMoRfx7S4lZPHIa8e62wMqKfj6YYu2lRwRcpGcJZBIQc7E3vQVsnlPn1cLK55
 ITCDG9NbdfR2MlkRoMwFP3T1uldGnYeN9GiuPQIjw/4xHVHcbeliT9OTzDqjcmWZwRBn
 HajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0vw59q5rzQnlKJSB1K7rRqNFJwruNBIcK91sEKRo1UY=;
 b=oxS4mFZHcgR8nVLQgsTAxiX7NGN5pCX3UiHEL8tJ8/mugRNyme1gv9Ja8fkNufjWQF
 t68HVVYCGxA5g/Xa5DF90ef9FJZ5OrrmMtp6qi9k4jNqd+0UpWTgd7d1N8MwDGC2tvWZ
 PAhzYlbYu+dRGHdBj4p81eKk1JSEMU/MXedQnh8lCpT/IZvsxLMf+xkzOoYYfndhTjpB
 Q2ZuZG3r2AZ94wT/V2cjy6vYr1ty6FqdZAEZZcYUs76SfsjGd9pbnO0CGfx0eQyrZv62
 VU79dW6HrggQI8x3xHmaZlyXUAW21ep4+MGH4zVhNkyqWLkfWuNH26sdPM2wlUcb72du
 5AIQ==
X-Gm-Message-State: AJIora+SxU+ay32lBI9wAIS/dO33UqjPv36v7A5mwzxdMgsUVPXxSZYn
 tWPgHsyCf47RcszCLspDiIDOoU4AkAVJ1onZxk6Y7Q==
X-Google-Smtp-Source: AGRyM1vEBP8Elb3XYZA81msz04bwMD/KuLcGJerTVArVPEgCbuXGMBzDxHS75xNPXVUNOBApGbYGkw5IFo1p81Swyu8=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr22900664ywg.469.1659002753722; Thu, 28
 Jul 2022 03:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
In-Reply-To: <YuJbaxMbqNF+Cw65@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 11:05:13 +0100
Message-ID: <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com,
 t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org, dgilbert@redhat.com, 
 agraf@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote:
> > QEMU probably can't carry OSK key[1] for legal reasons so it
> > can't supply the valid default key. However when tests are run
> > applesmc will pollute test log with distracting warning,
> > silence that warning so it won't distract maintainers/CI.
>
> What test is causing this problem ?

bios-tables-test -- see here for the relevant bit of the log:

https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=3Dqxqpt=
ZpwTp=3DTkcXrhg@mail.gmail.com/

-- PMM

