Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73BB508457
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 11:01:45 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh6DW-0007Te-Gp
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 05:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh68B-0005bb-EI
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:56:13 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh687-0000Nc-29
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:56:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z99so1379730ede.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRZAOmzYhR/NVStiCEHQAIrVknyTQohKimvm2zg6OX4=;
 b=EOCpsb5fOsuBeYjJMDnnXzfG3UrkBb1xc1VTQvmxqL/ENgZCw7ofSshYJI6cnCtp9N
 ulJJsFSG0bdyi++3q7nWP2Lgmvv2jgn8TUIOJ5sd5cXI1b6jy+plhN47tv7bGbuZyD/T
 n7CDDnyeF+AAqmux7TKEeNNZI0mDWZdwhPIupczy4hBL/rAvImmnYT1+Up4QOROXbHJ3
 KkOMTQFfjthWc1fg8txdjVPwSMmemqGhbONVTv9LLGcfgi8Ve6AOnJ8HSCJxqnYQCdT8
 3yp8me5pUEIYFJ29ch8WBHyzvMKQhnrLB+q7Dj4iphXXtiOG3vKZugKLQ7wic4gRmmcT
 HqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRZAOmzYhR/NVStiCEHQAIrVknyTQohKimvm2zg6OX4=;
 b=F2XhLzhTFOo7eK96K8kjMJrGPGxRWD4JoEPKD6JtTrbXesxdC6iq8PfQFvvZekD+3Q
 Kspnb+R2opOJ8lAXRwe8KA034oHre0OEJPEEFxjkGuusmA8TKlJhDr7vvJdkXTHZRhEd
 1aKAjwhEng/YcaOblChqA1qYRLHOj0b4JPz7R7OZftn1fgseO+Ug8KCb/qipEaL7q/3q
 rp13OhWE54MROS8FF7z9U83I5f3HygcAFj3hdXmVm0OQef/0z3sIQOGPbOhOmwhk768W
 xTLXLtjPaAMMOlVNyw+qgk7sZ9SC/pyZW28dWLoZmE8X6vc433fJzkOkWw+cdihAhS85
 782A==
X-Gm-Message-State: AOAM53233Yr1S8YJQO+zFQPxKTVbsEqDRgd8fNQIcRC+Md5/N7EWBnta
 JXGHOKmdsmhGEHjDbei9ox8jwOhkuavRlqv6EC8n2Q==
X-Google-Smtp-Source: ABdhPJwI5p8Asc17OzAP8c/vFAfNNg+Ty+7slLY3qAUXmcuLA1iYVlIWE5r2375AeEPiIGYlGDtvlGSava8NjcNcqUs=
X-Received: by 2002:a50:d4d9:0:b0:41d:6ee0:80d with SMTP id
 e25-20020a50d4d9000000b0041d6ee0080dmr21563168edj.254.1650444965456; Wed, 20
 Apr 2022 01:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220420043904.1225153-1-ani@anisinha.ca>
 <20220420082636.jugea2h24qajh3zt@sirius.home.kraxel.org>
In-Reply-To: <20220420082636.jugea2h24qajh3zt@sirius.home.kraxel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 20 Apr 2022 14:25:54 +0530
Message-ID: <CAARzgwx-huW2GpHUJMFf7GK=Eub7QBSFHvBoB1z5uc4ZmU2VKA@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/e820: remove legacy reserved entries for e820
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Apr 20, 2022 at 10:09:04AM +0530, Ani Sinha wrote:
> > e820 reserved entries were used before the dynamic entries with fw config files
> > were intoduced. Please see the following change:
> > 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> >
> > Identical support was introduced into seabios as well with the following commit:
> > ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
> >
> > Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
> > use the reserved entries. Seabios uses fw config files and
>
> We still support machine types 1.6 & older (although they are
> deprecated already), so I think this has to wait until the 1.7 + older
> machine types are actually dropped.

How much time does it need to pass before something is dropped after
depreciation?

>
> Otherwise:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
> take care,
>   Gerd
>

