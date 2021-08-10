Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271D3E7C08
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:21:34 +0200 (CEST)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTZN-0004SO-Cs
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTWN-0000cS-SZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:18:27 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDTWL-0001JW-8T
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:18:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id o23so2946711ejc.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9IK5ljYAdD8JPrI1xhVGVAWtQ+2tDFnV3ddxn4CDAAk=;
 b=v3Gk7lhBPLPG/9M8iv7mzYgBmjSQlcTMVR4DwKCOy3f4Fv/oigy+TalUyAvEVwDlCb
 Ozial3qQCTcN4aIl++89AO/OBrIv/P8Ku3cM55rtUMvtNSoEO9RMHKntrdSfZN8cRthH
 HxcGFUlZXVhBbCv74wzlPaV5bImM6JdRpefvkH27hhwxIMeMuswsqiIfioClGFhL2Rik
 2VgsQ/UjpJS8RDKYkWXZwFcCzJKBoKa1ec9DSRoFMxbcd5tg6mUcBcJR9CR42ovL9WKE
 hcQuLNg70YI3OG1mQVhTBWBhiwoGmOYDzOBBNw/nsfDIeZp9onSIjeofTuT3muoPXTEC
 VSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9IK5ljYAdD8JPrI1xhVGVAWtQ+2tDFnV3ddxn4CDAAk=;
 b=P4EWVxNdEJbpur9QJ3v61N5MONLS+BCDnC+ZNSIs8UkCh+z40hseB/Fk9FSTwtgSo/
 tXuAweFgkn1pcyhecpUqWNL8o7f8QB0FHJEK8U70xAlUPhgYWqWWErSIsxZDJk5Tw85O
 2dhMVHKZyx3F8bkIjMR+WWfBUVJyFOdweGyz4VhoMp7nxP5sV6PE13K+WyuRi18EegVz
 QpFfjckudBEf4NPhAUgVEFncKqaTdGaEYXG5bGk27eWtL3rVmb/5wJj5wR7QCz3ZvGHa
 GgjD6VCBm9c4Gf+fjmxAGDnP2Qf0leYxVb7RilX6X8de8YUs/IgNVNtNx6Epfb4SXldp
 iE1A==
X-Gm-Message-State: AOAM532taFn0ojQ1pHY6oA0fsqzzFr6KP3BAd6yFBmMD7EAKv1lCzMQC
 zGky2dv4dZle5+YGw3EUJdLuFK5jAO55xsMH3shSBzah03Y=
X-Google-Smtp-Source: ABdhPJy2Cx9uDKVKMYtOwBn8teuWmFySg12GiO9w0L2jQobGljEWHraGnB22KtZwLKZIRQ6PwXNOr0kAbi3OYe3yquM=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr27842046ejb.382.1628608703267; 
 Tue, 10 Aug 2021 08:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210810124403.771769-1-clg@kaod.org>
In-Reply-To: <20210810124403.771769-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Aug 2021 16:17:38 +0100
Message-ID: <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
Subject: Re: [PULL ppc] powernv queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 13:46, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9=
eb:
>
>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-powernv-20210810
>
> for you to fetch changes up to 91a6b62df830d51f2b6b2ea00b3c92231d0ba9dc:
>
>   ppc/pnv: update skiboot to commit 820d43c0a775. (2021-08-10 14:18:51 +0=
200)
>
> ----------------------------------------------------------------
> ppc/pnv: update skiboot image
>
> ----------------------------------------------------------------
> C=C3=A9dric Le Goater (1):
>       ppc/pnv: update skiboot to commit 820d43c0a775.

That skiboot changelog lists a massive set of changes, which
is correspondingly a larger risk that something in there turns
out to be a must-fix-for-release regression.

For future release cycles, can you try to get guest bios
blob updates in earlier rather than on the day we're trying
to get rc3 out, please?

thanks
-- PMM

