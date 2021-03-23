Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E8345C65
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:03:22 +0100 (CET)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeoj-0003wa-AM
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOemZ-0002eU-Fz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:01:10 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOemT-0007kf-B4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:01:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id e14so8132642ejz.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BCP2Bi93b73/pIUT1UuR0zwOwmhRnt9acaKY0mbXK7E=;
 b=n57cmEjIEYKTcyZw9kxt6meDIAbRM39VQX5pW1xDcMJAfZfo6ktu8qg+6s39AiTvNF
 GdpuxT3eTBV6RAaEym3a8abb8I4CPzNIf35sWGebgp1WGfk0q/0zaf2WL0yaBVKhdhSB
 Avk4Wlj2+uFgzZkh3fLWJbvHJL5lV399k849jQglBp2K47zmc7kZk+FKOGVeNZBpnT1Q
 e1l9ogdPAP92QzP7lxcK8Vho0WgmqpbWJitgMLA5S3OLdfRghxVbSKuAuqhwAEEkSACr
 prBDLKLKCHFImgURQXhbO95sgzvd4WQpOps6kaDzlXIiA+M+LNuRwMP/gHe7njuy9UMs
 hI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BCP2Bi93b73/pIUT1UuR0zwOwmhRnt9acaKY0mbXK7E=;
 b=LVM3PlodtDtA83T7WWlA4UtHW/OisRVnElRSMdOnGksX/oG3XAYoOCCDLidBtB7xO4
 tSWbDRwJbSvvGwikL1vrbdDXZJ6pAe/dCF9wtk86F5uSHBac0p//jZ7hqdx4H9MjrJYf
 ToUD9Ak5rhtNvJqjZ7rn1zbQhYrN4bZ+aiFmi0cngyPD/DJdmKDQPjSo4yloIlIrKIu3
 2azrW668H85Hw3tNtlIVDL/vKLgLp9motf8gkfgIWASawDv2oLihLTYCwgQtdH/MbNL/
 6PsAq4ArqsMt2ElJN7VrL7AY1I9Cjg5DrPRvf/0RviGubBaCCESWaRiTb5kjFh0UNc2T
 Bgaw==
X-Gm-Message-State: AOAM533dIFMd2w6ge1G7EY/3XNrPI1mEh6gL02hsw58VeYUMXf5dy70T
 WD0i5fpKFOLPli/x2c+KHTme1FqTVyDuLTAhF+yhoQ==
X-Google-Smtp-Source: ABdhPJybPa0stG7/a+NHNlHiMGhErlHBx/HXBpnnNhIzXyu6LUPsqDKGem+yby4rdkEdxlNtSKTinv08NtnN2+dYwDI=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr4251695ejc.407.1616497258823; 
 Tue, 23 Mar 2021 04:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
In-Reply-To: <YFnCfhiaixbn7lMy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 11:00:29 +0000
Message-ID: <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 10:27, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Mar 22, 2021 at 02:52:34PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The default "alabaster" sphinx theme has a couple shortcomings:
> > - the navbar moves along the page
> > - the search bar is not always at the same place
> > - it lacks some contrast and colours
> >
> > The "rtd" theme from readthedocs.org is a popular third party theme use=
d
> > notably by the kernel, with a custom style sheet. I like it better,
> > perhaps others do too. It also simplify "Edit on Gitlab" links.

> >  # Add any paths that contain custom static files (such as style sheets=
) here,
> >  # relative to this directory. They are copied after the builtin static=
 files,
> >  # so a file named "default.css" will overwrite the builtin "default.cs=
s".
> > -# QEMU doesn't yet have any static files, so comment this out so we do=
n't
> > -# get a warning about a missing directory.
> > -# If we do ever add this then it would probably be better to call the
> > -# subdirectory sphinx_static, as the Linux kernel does.
> > -# html_static_path =3D ['_static']
> > +html_static_path =3D [os.path.join(qemu_docdir, "sphinx-static")]
> > +
> > +html_css_files =3D [
> > +    'theme_overrides.css',
> > +]
>
> Does this still have a good result in the case where we fall back
> to alabaster theme ?

How much do we want to retain support for multiple themes? When
I was first putting in the Sphinx documentation I found that some
things were kind of theme-specific, in that tweaking things to look
and read sensibly in one theme made them look a bit weird in another.
If we said "we support only the rtd theme and mandate it" would that
cause much pain for downstreams and end-users ?

thanks
-- PMM

