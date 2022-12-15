Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B964DCB8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5osy-0004eb-A0; Thu, 15 Dec 2022 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p5osq-0004de-IY
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:06:51 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p5oso-00035T-PR
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:06:48 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3f15a6f72d0so42519357b3.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bWzsJK0aQxjW1D1nBmSJisBU6IcmRMp+XFQVo24cTCE=;
 b=YI2FGQnVvpwIz9E0+4UopF7EHKAVhUme4u0a7RNXApa0uZinj/+neg3SgbJt/9+GWj
 1VJiVqIqEUy2DyXQ8X/Pv1KYsIax5noC7Ux9Od8VvaEwJpr0Vs+yk94wC3uAA5Xr4i1M
 TMdmlPYSAqwh52QypwJ6SiHvzmVCVdETRt7eg6a2HmWO63AKIbq7GK99UAIrQo2UpRD/
 5iOEw1G82Tvm7jtjBTsORhZJVHpRRZUVB7G+vs/vTlucBcXmVPF4bS1wzE2Wy5FpdQVd
 UhVtndQ7LJrA/3+MkFnkS4cYtfaRIZug6FcDKI25sG+oVSgR1TfOiSOpDDWyLlbm/mi4
 A6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWzsJK0aQxjW1D1nBmSJisBU6IcmRMp+XFQVo24cTCE=;
 b=IKb5Kz1j1Pn/xSZYfObsAcrsgjJZMW+BaXYal8pYk5QrWyp1NH15F/GjbzTFRBxOMJ
 TBO46dffKBDM2aqHIiHOoC8IT8cXrkVsbITcuQbi3dNBBr/L9MGF+dzJH7ayQwgd4dUi
 63u72529OtEuvlHM5x2aXwaGRVQ2Fp6XaJcDY1C+4s+wzhWYauAUz1xbSp8KSVFCMnm0
 0tiEciRBcvaWMKhADAmlTkfHY1erg43i4f4l/mksk0w+8dP+7+jxm6jMW54BJU+R1YYt
 Vws0qSDmNE5K7KPhu9nwAq9iLrbt198SBnEZRN+8ZGxDslbXHXLnKjiz4Fv+sc7csN7W
 WZMA==
X-Gm-Message-State: ANoB5pnW4KDlsRe9elfhrn3AHzosc7dhCOX5BjHGncuGSPPNTD9pwzZu
 KeWsu3awkij3bAwFmQuSCTzb43YoDWRy0UNe5OM=
X-Google-Smtp-Source: AA0mqf5rRfuFL1ioDAWpnCEOhX/yLdKru76UVV9XGrjNspkyBgD804yPka1qPASpSB8NY4V2vUJz7wFKNLD18sk45Ak=
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id
 190-20020a8103c7000000b003eb447b56ccmr22162955ywd.296.1671113205448; Thu, 15
 Dec 2022 06:06:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
 <1F7AFCBF-66D5-4EC1-8FBE-FC8A4E5C88D2@comsecuris.com>
In-Reply-To: <1F7AFCBF-66D5-4EC1-8FBE-FC8A4E5C88D2@comsecuris.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 15 Dec 2022 09:06:33 -0500
Message-ID: <CAJSP0QWM0CyXfT1x=G50b7fPOD+3T7YuPLDxMsqtUNd=twkd3g@mail.gmail.com>
Subject: Re: QEMU PPC VLE support
To: Ralf-Philipp Weinmann <ralf@comsecuris.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 15 Dec 2022 at 08:51, Ralf-Philipp Weinmann <ralf@comsecuris.com> wrote:
> > On 15. Dec 2022, at 14:37, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > Hi,
> > I came across this post where Ralf-Philipp is looking for a freelancer
> > to implement PPC VLE support in QEMU:
> > https://chaos.social/@rpw/109516326028642262
> >
> > It mentions upstreaming the code and I've included QEMU PPC
> > maintainers in this email so they can discuss the project with
> > Ralf-Philipp. That way the chances of a mergable result will be
> > maximized.
> >
> > The Rust aspect is interesting, but QEMU does not have any existing
> > targets implemented in Rust. It might be a major effort to create the
> > necessary C<->Rust interfacing, so I'm not sure whether that's
> > realistic given the timeframe for the project.
> >
> > Does anyone have time to take on this freelancing project or know
> > someone who is available?
>
> Thank you, Stefan!

It occurred to me that we could reach out to former QEMU Google Summer
of Code and Outreachy interns. They have prior QEMU contribution
experience and might have time to take on a freelancing gig.

Please let me know if you want to do that and I can put you in touch with them.

Stefan

