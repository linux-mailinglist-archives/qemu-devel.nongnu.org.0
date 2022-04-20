Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1E50803E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 06:42:01 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh2AD-0008Nc-4Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 00:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh28T-0006vi-4U
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 00:40:13 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh28R-0002eU-08
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 00:40:12 -0400
Received: by mail-ej1-x631.google.com with SMTP id ks6so1087321ejb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 21:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9vnqhveakh2H+Vjc26vm039XpTjIZ7gdLvYShxbz+Y=;
 b=62TIz6YylRDWEwRnI76NNy39U/3PV3Ww4KZchXEDL5G7UPCIATDOQ0Tzhjc5beCl8i
 Y4niD8F7A+SEhQ/WqJ9old/PpLmXfIRhJzO/MaKjyAzCegTmgDbEyJnG75hPYbW2l1nT
 TOQebEDY3ATVRsa/8HpBRd8gQp2wI6p7CSrGncgqXejkTKpeAe6xND7yJQFTmFgDI6BV
 vg/GrSI7TCN6FwY8R36PwXiZiW7J1KXgMRAgI4Jad+CYkQVN4kX3PDE62Y8UvTTq90a3
 HZX/OCK14dM+4ZpQCeyGC/eU/OmMx2YVpSpjHqtb2jg52AEyJVb0iqJ/jcTYtByyO3Gf
 4dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g9vnqhveakh2H+Vjc26vm039XpTjIZ7gdLvYShxbz+Y=;
 b=7BohDGNky3LwaYyU4kpxGg7D9gTlHPzYv4lpdjKLhgjxD13EH7luP3/yUDpDLfMQxy
 7TFF40lkeBGBP6FediMTn60yDahCnQMHvOqgfUNL78YrGpDs+qEKrUJIOTG/6uABxFOC
 GiTRaLyMwSqJ6RXxEg/pUDpgP0/+h2tMrEmzCkPSHAgJ2Qt295+hGFlJNkJIqnvxyv6c
 98cSPiKsAJSjh96voZmepUKj6n9YbuRdnydCsEXMS+8u/vGCqgO8nlaZhBSShmInLWPe
 ijlYK9QMn0b9jLVzMcZd5EqObOkzgGOTBojx7CdL6jt58IeP7y2lp2QwQ+A3pt8FIhqn
 iELQ==
X-Gm-Message-State: AOAM533HTtW5tEAbdSKH+MSta2iBJcxj55xpcrdDugdRnTxlcRVQ1iyh
 b1i4qLmHj6uPjFB5s0OIhxflym66AxFPMeFiEcf3Mw==
X-Google-Smtp-Source: ABdhPJwMv9KfOf/DiI4tJ3aOXGEbysJfz1ErXE/n9DhoP70y8SD6M/jozWkjeCvpCe8vjgcK/GWBVWDl3t/5OyoUYs8=
X-Received: by 2002:a17:907:971b:b0:6e8:67cf:6caf with SMTP id
 jg27-20020a170907971b00b006e867cf6cafmr16937040ejc.259.1650429609212; Tue, 19
 Apr 2022 21:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220228152620.1474806-1-ani@anisinha.ca>
 <CAARzgwxwu1BOFGGOnfxaixrS+WdY57QdiujQgnBj7DxBvEPqNw@mail.gmail.com>
 <20220310174227.60209f3e@redhat.com>
In-Reply-To: <20220310174227.60209f3e@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 20 Apr 2022 10:09:58 +0530
Message-ID: <CAARzgwxRNJ9tgaryJ5NrR-JMuBx3iGyL22p5PEXqfA-_De+wrA@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/i386/e820: remove legacy reserved entries for e820
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have just released QEMU 7.0. I have reposted the patch after rebase.

