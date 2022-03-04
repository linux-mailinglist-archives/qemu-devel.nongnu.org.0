Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73854CD2CD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:54:19 +0100 (CET)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Zi-0005Wz-VQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5SW-00077A-1x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:46:52 -0500
Received: from [2a00:1450:4864:20::633] (port=46779
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5SU-0003xw-Kt
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:46:51 -0500
Received: by mail-ej1-x633.google.com with SMTP id qx21so16557567ejb.13
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YrAcnP+WyMluQCHwkIk51t51jsys4QNWDQs2Or3bbGA=;
 b=ZYYNvRD/gU4dChtZCCmXEC6Ln0YyAtG8Yd5waXhYl/wEZ4bgbiyE3jGEc2Fd8asS6d
 jjCGBzuEgAiM3sTxvOWqyrYO2RyUdWdFJdbmpOen2MVY2JCuezPrXRrvQVFcMc7lxcNA
 4iU6XcoFYwijlWEoki8zY8tJ4Zcdaxfx0/JbpD/HTTcXPNYTFtoXi1VBRsLh4g9loLp9
 P/DSlRKedgjJJwhDliyYr+3WVdRN3E/wyEq5xhTpuyWWKfDSlpjlRKr9LVLzX7vODf+k
 8pNktMAEgXIj07v4gbnqIc4/zCzH5tBGuMyhbRY1vH3VQk+QSAOcfxS62sBjX3RUB0Ni
 vmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YrAcnP+WyMluQCHwkIk51t51jsys4QNWDQs2Or3bbGA=;
 b=G0Zs1EY2rBVdRxI8nVxSVc72MXXoVrnVOptuBcCstgNmkfxWEa4p/mUAOJK3/adg/d
 ujhrPwzfQ5dFENqFZtQt6RDEeUXKuxmpf+UWz/6qZAKRc/bXtlGPM588cawqulSYXSJl
 f8NjzICcWJOcCSvRZu8zo8XNVFjefos+0d3I1CjdgjHCgG3deX/aO0Epe9H0xt7ukxie
 cm0s8NBQisJO7/6FSW+uqMKnlICauvOAqeaWUs1C+DnV9AyIkRjAcMr/59N8xXzPNw/k
 cq0CShEJ9tB7dAysBp+yxy3tlKjei9qvFEO98Bk7KDWGsJqKu5TCNjNH0DgcvXrinW7o
 8kWg==
X-Gm-Message-State: AOAM5314yJcurTtpa/UFbHRo2UtZEWk9f5UPuSeKBUOX5Uk7CULYoyu9
 mZeFY2uwIGL6DtA+yOxVwjtbsqh/eguAOzNH20MqGQ==
X-Google-Smtp-Source: ABdhPJxRV30JYoKp4REqfqoZj+VdPs/cBLg2xxd4+EEBTzED4VPdST0BL1Hl/SvdZriY2BEweeV4YsJ2wulHZx4aSxY=
X-Received: by 2002:a17:906:c14c:b0:6d7:1278:d80c with SMTP id
 dp12-20020a170906c14c00b006d71278d80cmr12743066ejc.660.1646390809130; Fri, 04
 Mar 2022 02:46:49 -0800 (PST)
MIME-Version: 1.0
References: <CAARzgwyjqEs96QXthDs_yQi_s7qmMsLuH+4YQcq2Hx01_vY3EA@mail.gmail.com>
 <20220303094134.tuhhrvtstxwpksmh@sirius.home.kraxel.org>
 <CAARzgwxFuY=xMQmHU0cocG3ecznhVwQVTF0naaA6wwFkhwvOyA@mail.gmail.com>
 <20220304101846.ct3ge56w6gjq355o@sirius.home.kraxel.org>
 <CAARzgwy33DZwoXzMMYCd1e4-88hyzChX-VpHH65P71PW6Ko4Ng@mail.gmail.com>
In-Reply-To: <CAARzgwy33DZwoXzMMYCd1e4-88hyzChX-VpHH65P71PW6Ko4Ng@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Mar 2022 16:16:38 +0530
Message-ID: <CAARzgwximWns6yiWhTUogPjNVN3iGOPfs4z_i5BR2DLTH4ancg@mail.gmail.com>
Subject: Re: any opinion on the patch "[RFC PATCH] hw/i386/e820: remove legacy
 reserved entries for e820"? EOM
To: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x633.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 4:11 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Fri, Mar 4, 2022 at 3:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 03:12:51PM +0530, Ani Sinha wrote:
> > > On Thu, Mar 3, 2022 at 15:11 Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > > Sorry, no.  Noticed the discussions but don't remember the details and
> > > > didn't took the time to wade through the code to refresh my memory.
> > >
> > > Could you please take a look when you get time? You have the most context
> > > in this space I believe.
> >
> > Should indeed not be needed unless you use a stone-aged seabios version.
> > But I think you can't simply drop it for live migration compatibility
> > reasons.  So you'll need do the compatibility dance and drop it for new
> > machine types only.  I doubt the benefits outweigh that effort ..
>
> Igor what do you think?
Since the static entries are separate from the rom file entries, I
think we are in trouble only if the destination is using an old bios?
Otherwise, the non-existence of the static entries should be simply
ignored right?

