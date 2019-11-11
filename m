Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567DF7D97
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 19:58:31 +0100 (CET)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUEtR-0008Qd-2D
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 13:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iUEsY-0007lZ-T6
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 13:57:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iUEsX-0003Gf-EN
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 13:57:34 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:41954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iUEsX-0003Cs-5r
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 13:57:33 -0500
Received: by mail-lf1-x132.google.com with SMTP id j14so10698652lfb.8
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=b6KAQXUJcOVKlVt+aFtkv4+WZPXEiFKs8GrOxAjWWUU=;
 b=wvZCXoOjpDM+gUNpVRnpWUU2GlEMqfF4A0pd3gm3kSYgygkMDVFaMFyH2qNiS7nfO2
 9bXQSfK1hRSnvlvKlfzUFo4x+hbePdX2jS6yAVlsgk0LoKx+CzxgqbxTFulWZjjfH2dQ
 ie7HItTRncdKym7fsCyyfaUnBj1XXGxGl4vFQIOu6S5NtOi0UfSrSFTm8VOZFO2PsHFs
 2Zw7l9W6m2erZE55KQwyyz/OOpQEYtq+akMSDizTXjBz6EhUhSxBbYdC6zqftcBWnzNZ
 9THvNggN9/r/Tshit6+64y/M+KXOg430Lcvpii/paJn+QcifeTOfREmoIL2u5V0u0ytP
 xKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=b6KAQXUJcOVKlVt+aFtkv4+WZPXEiFKs8GrOxAjWWUU=;
 b=UB1WkgGTbwuJA36hP846ZnV+1sXmKrrU+K2ih/hFuLgRe4eaTXLb3+P8mCK6uHsYT+
 RvlEH+LSijcwBx0fFeP1k37ZzaPdCcePZxUFxshf/0A/Qd0bwOFc3ZfQyUb7LQAAXWYa
 P2+gYhz+4msBVUs0yMgVHomspdAz1WX7yimQ8sNTjlMQdmldtBKgt2KCdiY2+iRK3ljo
 HSHIAtwbv9aqNIiczHq30rgjO0bCbFhTs5P7FtWgYHfU7Kad9wyMl5SxWxA8YhQMJPd1
 kKUyU/P0V9oGJJHMntDJCBB3479OigfkIiAknuAONTzXkDXuvr602RhFUIiddhi7cfRw
 EAlA==
X-Gm-Message-State: APjAAAXaeGEx9IiOTplzJTsJuvyylsAIHhA5ZMTY1Sgc7o+u3BPWGK+S
 fv1xTg4vfNvJb1y25aRiRNgeuhnYzYZQ3psRmeAqYQ==
X-Google-Smtp-Source: APXvYqz2DU+6dAY5F3MMbVUcAv5IQuDTY9sRABza6FpnBBYrB38TlxipaDk0Fe46CfpvPvJ/qZHjoXLDZBjMf09CF1A=
X-Received: by 2002:a19:c606:: with SMTP id w6mr16242932lff.71.1573498641172; 
 Mon, 11 Nov 2019 10:57:21 -0800 (PST)
MIME-Version: 1.0
From: Robert Foley <robert.foley@linaro.org>
Date: Mon, 11 Nov 2019 13:57:10 -0500
Message-ID: <CAEyhzFurM_eGktFU2qRs9BXUET=qZoGcFod6BLihZBm3hSbo4w@mail.gmail.com>
Subject: RE: [PATCH v2] tcg plugins: expose an API version concept
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::132
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
Cc: cota@braap.org, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Nov 2019 at 06:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a very simple versioning API which allows the plugin
> infrastructure to check the API a plugin was built against. We also
> expose a min/cur API version to the plugin via the info block in case
> it wants to avoid using old deprecated APIs in the future.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> ---
> v2
>   - error out on missing plugin version symbol
>   - fix missing symbol on hotblocks.so
>   - more verbose error text, avoid bad grammar
> ---

Reviewed-by: Robert Foley <robert.foley@linaro.org>
Thanks,
Rob

