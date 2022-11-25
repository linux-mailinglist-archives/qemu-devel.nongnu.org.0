Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539A638800
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWNe-0008EC-7S; Fri, 25 Nov 2022 05:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyWNd-0008Dy-58
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:56:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyWNb-0007sd-J9
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:56:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso1345284pjb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KZK9MjQmu1XwqbKARqh+rWQRVj0TBvp5vgtw1qrPy+w=;
 b=zhKefR8OmnuHZSWBoOenBULCNDOHtpaPLqJ7DzU5fFqZl8fgpvXkcyVYUn3v2Ym5MQ
 lgECOQZNP5PL8fnWP6hbmhv79/2bM0Nn7Z1Q5e6wxP9I+yTNQ3XSsu6plWF5muGGpAua
 TsrUIpZvBLfcF5gj+tVoCmAZSBf33wwxFFujCqTePkzZVXSpgYEEtt8NEnVpg7vXxk9S
 hasCY+nnWMESSNuRoe+1wEfoSyd75jLP24w9i9jL18S1+YYk1qhAbcAPxCjwf8bxxhSN
 nVzehlanDqA4Ajz2rqksQ/aMuM0kJkcyDjZNki4/W5uKSM27DZe/0eN4idDfgILlp+oo
 ZJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KZK9MjQmu1XwqbKARqh+rWQRVj0TBvp5vgtw1qrPy+w=;
 b=F9NbssWSGOeMbU0hhZ5GZyGPVg/6JmOG9CBeHyjFwGaPIj1Z/Vinnse4FNA0C/QU/q
 O0ROw2QXpx8RJkV5qq89OFBI/L7Fp+4Jv8o2pXPolgSQPRvsVK7QeQ5m4Cj4nZnu7A3Z
 osbvJ1rUwpP23KxVFTHoYQ+RcdPsODgyUVHzWHubr3yoUXyZ4LmJRFkjFs+egjye/IfU
 p4IFqeCNcqiXCBBf1a2dHBweeQiywYpx6rmrkwtGE93HD4358dLSZJPYOKOcJ9mlLcq+
 6Dd9NFg3iNZsHgJ5f1B7m2nZMYhVjIxEYIU29cmOLh7FJVUv7NeuScmE+5FP7w7VhHhy
 P0iA==
X-Gm-Message-State: ANoB5pnK9GQAnGYQr+CLUtmIbK7trPEdHME4opXp5MhGwUnMhTGcJpj4
 +wBTYLdfU1DdZDKuBvxchCRqeo0KAExPh4oaD5FvVw==
X-Google-Smtp-Source: AA0mqf6RqZqp3TEnB3VBdZGTEj2RyrPEpsuZZkeLIG0u144VsoQm7MFwSWdaxKZ5O9uIHM0w12J/Az+lh69yAlXPKyU=
X-Received: by 2002:a17:902:b691:b0:188:5240:50ec with SMTP id
 c17-20020a170902b69100b00188524050ecmr18141824pls.168.1669373781295; Fri, 25
 Nov 2022 02:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20221124071602.1109150-1-kraxel@redhat.com>
 <CAJSP0QUh2Pp9PdxTQ4HvrraF03eKBeUMJR8WhPN4GgEW36K93w@mail.gmail.com>
 <20221125063421.y7th23snmahilgpt@sirius.home.kraxel.org>
In-Reply-To: <20221125063421.y7th23snmahilgpt@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 10:56:09 +0000
Message-ID: <CAFEAcA8kmormkD9_b5VyB6Jhx_HPgGxvnnexQ0xJN8z6W=G8iA@mail.gmail.com>
Subject: Re: [PULL 0/4] Fixes 20221124 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 25 Nov 2022 at 06:34, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Nov 24, 2022 at 01:03:21PM -0500, Stefan Hajnoczi wrote:
> > On Thu, 24 Nov 2022 at 02:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > usb+ui: fixes for 7.2
> >
> > Hi Gerd,
> > I already applied your previous pull request so these patches are in
> > qemu.git/master. Do you want to revert the 8.0 patches that were
> > included in your previous pull request? I don't know how risky it is
> > to have them in 7.2. It's up to you.
> >
> > 7d3cf19548 hw/audio/intel-hda: Drop unnecessary prototype
> > 3e95ef49e6 hw/audio/intel-hda: don't reset codecs twice
> > 1dfb7a175f hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()
>
> They look rather safe to me, Peter raised concerns though so I've
> re-sent the pull with them dropped.
>
> Peter?

Stefan's point is that they're already upstream, so if you don't
want them you now need to send a pull with reverts in.

I think the patches should be OK, but the trouble with all
this reset stuff is that there are sometimes hidden
dependencies on exact ordering or I missed some interaction
with an old bit of the reset handling; and basic 'make check'
style testing doesn't always catch "this works fine until
the guest is rebooted and then it breaks on reboot" or
similar scenarios. So I was targeting 8.0 as the "safe option".

thanks
-- PMM

