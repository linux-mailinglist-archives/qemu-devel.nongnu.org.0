Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E248E84F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:24:59 +0100 (CET)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8JlS-0006Q4-H2
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:24:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Jkb-0005bN-Bn
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:24:05 -0500
Received: from [2a00:1450:4864:20::332] (port=38777
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8JkZ-0005Sg-PN
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:24:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso7019657wmc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2O09dV3SFpeKGTWgEXGcCDRm69tJ2XcEtwmJ8LAWF+Q=;
 b=zObjgfBUlZFDf6iU/7QUcasuK+DWNuXhLrrEeOCyLF6j/B6I3rEMarjMjugUVIT/zE
 XufhIXPSeaD7sIzAD+wfH4k14S+eo7vPPWp7UzYgrpsjUtmmZc9zx6dhua1RzxiDeS0w
 HC21dy5gzIwsTonEy7r6RJgYK1tcNDykyKM4j33yeqzVcGivu0f8snd+ws4YKv1lHNTH
 9AQKGxx8K0y0TZwe5p4X4U+6QDr70IIEDqyboyX34IgIrLu+/4N7H2pnjqYrFCw3f4B7
 XUvpfFCZveVOsalurU5SUZbUUjZpm1DwAoaLigRpoAanN8KHCbXXYgq5+hBWbpNr6EuM
 ZYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2O09dV3SFpeKGTWgEXGcCDRm69tJ2XcEtwmJ8LAWF+Q=;
 b=f65RvTF/xBG5MbdRtH4lYGO42MgiFXPLV8gKJlIV2YhpqUb/du/k2+HujR+8x+B6hD
 D4mXOtRr95IBEIBnGVJaYdtTahJOBxP3eWhNaKDMLQ6BZKBA7Co8pR6gfMhpuL8CdUrS
 AKdmGBUJDyToq+ebEoY2lN8+GnE8kUWqeXoKPqaxqtUBEaqvtYHi0oucPF4bnj39WyFe
 qGnBcAvFox3Gpm9qHeTMVLYeO0X9N2aAalw5RxXjug+JiNJhXiauetp7eWKJTt7uhX7l
 iy1S56Rn4/kKBfiPWy+lMiBiGI1bWneKKyDrOlbADW3IdP/e9X+iihAWXPnwx2WyQBvw
 wZvw==
X-Gm-Message-State: AOAM530Bk2RUAsqLGQlo02/8z7mmpkkA4WIyT4mzPtpU/z5itzFpnVbN
 LjnIjE7dMvlF+g4y1FWj+WfIDIysQ2eQq+gbMxRllw==
X-Google-Smtp-Source: ABdhPJx193dE/ZqvAr1bGO4LAeEnjpPJBKV0rUSqSEbIdJBTAiwQq7a0P9Chz6YYX3YmaS3Dc1qX7xT2of0sr3qBKCE=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr7718464wms.32.1642155842284; 
 Fri, 14 Jan 2022 02:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20220114050909.27133-1-jasowang@redhat.com>
 <3756d550-8f03-4546-f138-9905f0485661@redhat.com>
In-Reply-To: <3756d550-8f03-4546-f138-9905f0485661@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 10:23:51 +0000
Message-ID: <CAFEAcA8=mEbNKfLr52ezkgeAw6YJLpwJ5VESNHuzRUbtduVQjw@mail.gmail.com>
Subject: Re: [PULL V3 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 09:19, Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/14 =E4=B8=8B=E5=8D=881:08, Jason Wang =E5=86=99=E9=81=93=
:
> > The following changes since commit f8d75e10d3e0033a0a29a7a7e4777a4fbc17=
a016:
> >
> >    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-2022011=
2' into staging (2022-01-13 11:18:24 +0000)
> >
> > are available in the git repository at:
> >
> >    https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to 818692f0a01587d02220916b31d5bb8e7dced611=
:
> >
> >    net/vmnet: update MAINTAINERS list (2022-01-14 12:58:19 +0800)
> >
> > ----------------------------------------------------------------
> >
> > Changes since V2:
> >
> > - Try to make vmnet work on some old mac version
>
>
> I tend to hold this pull request since new issues were spotted in the
> vmnet series.

OK; I'll drop this one from my queue.

thanks
-- PMM

