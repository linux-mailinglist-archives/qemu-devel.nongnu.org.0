Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5284D5CB3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:50:30 +0100 (CET)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSa2f-00012f-BR
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:50:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSa0X-0007m1-Hx
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:48:17 -0500
Received: from [2a00:1450:4864:20::633] (port=33684
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nSa0V-0007Y7-GU
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:48:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id kt27so17420281ejb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 23:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMzha7ur3Dbtw+PK4BbNMjqxBZZPTBLs0U2XoA+CKgw=;
 b=FsfzQO8bSoJxSsnAEH+lcK5ekU55PGVp9ohj/0Jp36b74u1GCr1GsaPp/7q01dN1U+
 /9mboI4CUk7bTAjvTb0AGCp2vJqoo9SBTKtd8kOGzxiEZQy0dRhTWRz8xugeEkgg9DBx
 npAXvFh1q+a9Tz0AA6X6pt2OhKlJWDNLAj2ykFPnX/iHuM6Lwo47cXfmJTWn5m/7sGz1
 1tKqJ7Z3LsKqKJipUj52j68zk3Lw8C8FNyOZ5nz+6KZU/gMfRRamslDe83SzpmMHsQPV
 N7Sfa+bYBwOkn4LOuU0hBu7x/eQiJuCeXyT6iTXV9XIDU8bLRn9ZmnkFsgMC8hop4M8O
 7mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMzha7ur3Dbtw+PK4BbNMjqxBZZPTBLs0U2XoA+CKgw=;
 b=FrAwwT138eT6uOU0yfJdJT7f2QcdYizEG1d5rOsCFgAFL+OrRmKrtVCCgA+shVsn11
 Pn//o2I9S/hHRUPTrLzMibvpiPSFJm0lRQNYnnbJ+hEbNFQCmwl4vWGJoxYJBlbEDVsh
 E5IdTMfXpsIPhJMngHq3kGwj28roxbyuOxI+ieDpVlQTC1LPtTIatR+yESqmgkXvLAZI
 wilqAzpkc8CDYQ+nVOxeO3rhbLq0/Zvm1+Uvi2SwPocItfZTM4dW0Re2v4U0Qeahs7q6
 LCw5r90Myj4T5nLTh+oRqGa95iX6lDmNenQkLLyV6isSDv3ZWpbgY8pNgVPHQ19QHiNG
 9i4g==
X-Gm-Message-State: AOAM532sTdJ3dNAsd6+l0QCv9+8q+8/mfWI65dm3tEU8I5TPlLjQSPAd
 dv15z3fKVXVeOVCI+82S52vCD/LuI26NWwjxELeTNg==
X-Google-Smtp-Source: ABdhPJyQHxrEWiI+oq68b8/ekeiutMkkybCXReU58vcZFqWln1aI9RzWgP2DBhlr93fuBd5wR5mFIXPFr/Pd/1Vc72E=
X-Received: by 2002:a17:906:4793:b0:6db:8b75:962f with SMTP id
 cw19-20020a170906479300b006db8b75962fmr4721908ejc.51.1646984889991; Thu, 10
 Mar 2022 23:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20220228152620.1474806-1-ani@anisinha.ca>
 <CAARzgwxwu1BOFGGOnfxaixrS+WdY57QdiujQgnBj7DxBvEPqNw@mail.gmail.com>
 <20220310174227.60209f3e@redhat.com>
In-Reply-To: <20220310174227.60209f3e@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Mar 2022 13:17:58 +0530
Message-ID: <CAARzgwwA3oZ3Kjk=LFy_dqD_XU5uLmvHSp1CTLw1p1iA04_Gmg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/i386/e820: remove legacy reserved entries for e820
To: Igor Mammedov <imammedo@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 10:12 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 10 Mar 2022 11:51:37 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Mon, Feb 28, 2022 at 8:56 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > e820 reserved entries were used before the dynamic entries with fw config files
> > > were intoduced into qemu with the following change:
> > > 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> > >
> > > Identical support was introduced into seabios as well with the following commit:
> > > ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
> > >
> > > Both the above commits are now quite old. Seabios uses fw config files and
> > > dynamic e820 entries by default and only falls back to using reserved entries
> > > when it has to work with old qemu (versions earlier than 1.7). Please see
> > > functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
> > > FW_CFG_E820_TABLE and associated code. It would be incredibly rare to run the
> > > latest qemu version with a very old version of seabios that did not support
> > > fw config files for e820.
> > >
> > > As far as I could see, edk2/ovfm never supported reserved entries and uses fw
> > > config files from the beginning. So there should be no incompatibilities with
> > > ovfm as well.
> >
> > Igor, Gerd, as I had replied in the other thread, I am not sure if we
> > need the compatibility dance in order to do this. I think we can't
> > carry this legacy stuff on forever.
> > Please advice.
>
> see commit 7d67110f2d
> until we have older machine types it must stay or have a compat knob,
> once they are gone we can remove it as 1.7 and older machine types
> are supposed to have newer SeaBIOS version that doesn't utilize
> it anymore.
>
> so add a compat knob (not sure if it's worth the trouble) or
> wait till pre 1.7 machines are gone and then rebase/repost.

Ok fine,. I will wait till 7.0 is released at which point
pc-1440fx-1.7 machine will be deprecated.
I will repost it again after that.

