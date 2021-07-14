Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D863C87DD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:41:38 +0200 (CEST)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3h0z-0000eZ-2x
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1m3grj-00051o-UY
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:32:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1m3gri-0002zF-7V
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:32:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id f9so3708507wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/HDR0gho49WLVY78YCj2oWreeJaSzx0ePYBDXEc2lpI=;
 b=qH36x5ZDc3j0dWNKXvodKwrxbnIHY1H0/Y+2qkPwZqDI/z6/17Lhk7glRCyPpiZ1xS
 NBUwMExsmdci9zU9DZuiBQCh1eSPcXJnS53R1xFugZQ8Rryks+iQZjoA8SvIR3+RoL1V
 vkhWIqnTPHD3whguMb86Yj/ToNUDn74z1RYMK1awnGBPWK6ZisKIWpRuSbDRm6jm1TRD
 5m27nITSUwhixgexsNgJDtWyNq520JDxn5BDpdfNxwNH2N6n8o6VE+wCmnfyabltCHcO
 OZ7FzelJiqMRA3TEFjrGsWkhQvY/p253rtF7/m9Z+3lrWsUtrNywjY4bhFSgM25bnvIZ
 upkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/HDR0gho49WLVY78YCj2oWreeJaSzx0ePYBDXEc2lpI=;
 b=G6jYJzY5bnDiTdrqb42z5DBTJu4u82fZbctQpKWmhVrwcWMHP2m9Vh6Alnh0+2j0xP
 T8rYjN2dK1ofehbU6CG35S9ONSmhRt+Rm/SaQ9eMme8GtW/P+WfN9Kzxqfpr/DWq9aN4
 m6d1JqYoZdxUpRMyMsNhbtAIq1WJYjDArdWwJ4TnGnjoYlfmEaIu+YE3b+l6oOi6OYfR
 QdrK/LOTjqKMXeaAAzta64ecWq/CxPnit0HpRFRMrjQ/Ot6+HGWCGJi9t+HGM5vx2JJ3
 2EGGlDDYwi/czJ6IMtZHVpyzj1TH4J7740e7yKOl318BGUqriVm67tP8fEDvzs2Kn9/C
 YWZQ==
X-Gm-Message-State: AOAM5310DY2X6xMRDnl+QdkJzUPPZj2GzEo05J9Tbm/qNY8/26SmL4O3
 Pp1pzcKqjThWIiS3gDU5LnhPjavEb4Tq8YVkdKM=
X-Google-Smtp-Source: ABdhPJwLNYwPuG6RMLtYDWxapkMAuY+6HYehicvhSZxEn8dWNriua/Nm88S3ss2KbXbBBMTjAbAFTJIhYj/izghs870=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr13876331wri.301.1626276719560; 
 Wed, 14 Jul 2021 08:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714100628.10460-1-alex.bennee@linaro.org>
In-Reply-To: <20210714100628.10460-1-alex.bennee@linaro.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 14 Jul 2021 23:31:23 +0800
Message-ID: <CAKXe6SKziLR3=cNfTz5TE40i8LTVBZayb7yoS_sXAKjj115RKg@mail.gmail.com>
Subject: Re: [PATCH v1 21/21] contrib/gitdm: add more individual contributor
 entries.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=liq3ea@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Chetan Pant <chetan4windows@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> =E4=BA=8E2021=E5=B9=B47=E6=9C=881=
4=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:06=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Again this is guess work based on public websites.
>
>  - Chetan lists himself as a freelancer on twitter.
>  - Akihiko lists themselves as an individual developer on GitHub
>  - Jiaxun's website looks like a personal one
>

Hello Alex,

> [AJB: Won't merge without confirmation from appropriate people.]
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
> Cc: Li Qiang <liq3ea@gmail.com>
> Cc: Li Qiang <liq3ea@163.com>

These two are both my email address, please use the gmail address.
I'm an individual contributor in qemu project.

Thanks,
Li Qiang

> Cc: Chetan Pant <chetan4windows@gmail.com>
> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  contrib/gitdm/group-map-individuals | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
> index 36bbb77c39..853fb98bc3 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -29,3 +29,9 @@ mrolnik@gmail.com
>  huth@tuxfamily.org
>  jhogan@kernel.org
>  atar4qemu@gmail.com
> +dirty.ice.hu@gmail.com
> +liq3ea@163.com
> +liq3ea@gmail.com
> +chetan4windows@gmail.com
> +akihiko.odaki@gmail.com
> +jiaxun.yang@flygoat.com
> --
> 2.20.1
>

