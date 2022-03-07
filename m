Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9914CF281
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:19:54 +0100 (CET)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7eq-0002S5-JK
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shan.gavin@gmail.com>)
 id 1nR7ZH-0006Gx-Ou; Mon, 07 Mar 2022 02:14:09 -0500
Received: from [2607:f8b0:4864:20::631] (port=42506
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shan.gavin@gmail.com>)
 id 1nR7ZG-0002F3-AD; Mon, 07 Mar 2022 02:14:07 -0500
Received: by mail-pl1-x631.google.com with SMTP id p17so12959469plo.9;
 Sun, 06 Mar 2022 23:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M376ZoWuJVPIrPaAWwAv2L61Ez2Yca85DioMcP11gPc=;
 b=lqA4Gy/ujeQUEE/0lfuFCGUSNxkXnM6/cdIesnv3F2BvxJXhrh+9UYevUJAq9RBj+9
 vIAAVoNSggOzwfcRDwUiX/o2FgpBJ2X7Ax3lbLWHmJt/T5cAxO+q8psGoDlxh0JeeRh+
 E1UcleI5+FsvY0iavxdo7xxsAsskfNDf9YdGpZ4PZHkJ064DF+MC9cnlrly+d+5LJ0ha
 nY0Z+Vm/hS0UjYB+ZY7+1Yhmq6rbutZ/z59UwxUjZCuU9/St8tlHnSF9JYzcCyO5U6oB
 9zdSdgP3FaAGvANU38vXz0BpIKiev2oBlD4AWboGmeAkdUWOpM6tCT3vGxQII7aXWvpo
 1gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M376ZoWuJVPIrPaAWwAv2L61Ez2Yca85DioMcP11gPc=;
 b=h+SanQjKtMfPVUhnqycTM/3IR1884jDIh4Qse6RUGVrN9ejhb0yK+m3LurXNQBMmtF
 uKDoEU8Ga2CD6vp7c6nVTwS9CtBfyahRc/5y6CCDfc3ute7r3gUM1SP8/tH9vzL1wRVB
 axirQ/2JaUTK5U7fBiIk291s45PtWt7Su60QAnbYKK+v21pC5JJXXRPfn4WCyWqvMSmv
 OGdjVoCmG7Kl1xDxoW4xCNPLLblK5F/pBxwmCdLNCbBzD1qFpSjuZ4wT4W22AzaS2dy6
 d7DnybC7xvQ0zv6zPtsmxiV32sARPGmG1lByB9OQyotHYfOQuAHUW0AEM52zA+uBcPVd
 Tc8w==
X-Gm-Message-State: AOAM531ZTQFmw2637lsY9zsJGXjTUfh32oY0C2aejbLn/uap8qdEDtkw
 ppbfSp3GkgmTjXOMhnv8dnIoxuoTdZ70jzHhAMw=
X-Google-Smtp-Source: ABdhPJzQDjIH6u+Yf7JqVZQfuMaTAEqrGjNpazNlNryqh2wRO/mrLsT5B9gIOkFgyqhxa0bXrPjRYR68nK6r0UJ+eU4=
X-Received: by 2002:a17:90a:880e:b0:1bc:650b:6be5 with SMTP id
 s14-20020a17090a880e00b001bc650b6be5mr23641595pjn.34.1646637243429; Sun, 06
 Mar 2022 23:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
 <20220304115240.71d241ad@redhat.com>
 <CAFEAcA8BwRnziYaO2ZP7e_hNuAPBV7UOViX-nDu=ae2_7CemKw@mail.gmail.com>
 <1abedac8-00c8-3039-ccfe-783f5eab9439@redhat.com>
In-Reply-To: <1abedac8-00c8-3039-ccfe-783f5eab9439@redhat.com>
From: Shan Gavin <shan.gavin@gmail.com>
Date: Mon, 7 Mar 2022 15:13:52 +0800
Message-ID: <CAOL5Tw=E1iEALPt3H5-T9Tizg3DMpUH8dueiPuuiSvz51AY8UQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=shan.gavin@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, richard.henderson@linaro.org,
 QEMU <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

Yes, I think it's enough to provide the user-friendly error message in EDK2=
.
The command lines to start the VM/guest can be adjusted to have more than
128MB memory associated for NUMA node#0 when it's seen by users.

Thanks,
Gavin

Laszlo Ersek <lersek@redhat.com> =E4=BA=8E2022=E5=B9=B43=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=94 22:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Gerd,
>
> On 03/04/22 11:58, Peter Maydell wrote:
> > On Fri, 4 Mar 2022 at 10:52, Igor Mammedov <imammedo@redhat.com> wrote:
> >> if firmware is not an option, I wouldn't opposed to printing warning
> >> message from QEMU if you can detect that you are running broken edk2
> >> and under condition that no new infa/hooks are invented for this.
> >> (assuming it's worth all the effort at all)
> >
> > I am definitely not in favour of that. QEMU should provide the
> > emulated hardware and let the firmware deal with detecting if
> > it's missing important stuff. It should as far as is possible
> > not have special-case detection-of-broken-guests handling.
> >
> > thanks
> > -- PMM
> >
>
> It's probably simplest if you replace the ASSERT()s in question; please
> see the attachment. (Only smoke tested.) Gavin indicated up-thread he'd
> be OK with an easier-to-understand error message.
>
> Laszlo

