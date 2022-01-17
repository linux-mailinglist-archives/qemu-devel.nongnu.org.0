Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0ED49023D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 07:59:55 +0100 (CET)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Lze-0006Te-Cb
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 01:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n9LfF-00016k-3i
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:38:52 -0500
Received: from [2607:f8b0:4864:20::102d] (port=33538
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n9LfC-0002iC-3W
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:38:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so9994612pjl.0
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 22:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=RgK1jk/IR3PoZkYMf3T54ssKMhT16xW9qM4Eqsqrfhk=;
 b=mrsQYUbY4lWLIjh6kUkL+d5S/9U+tdkKvaXGq8EQlU7IoVdQKL4dM1YV7UJoxHxxHR
 gHPnVU1FW3Sy50j2VkvnGk7/M0dnNvJSGi1W/W0YETZsWmbvfHH6amyTvPqCfhwg4fb9
 cabKR1E4fiVB3uVLna6tbNo7ORXv0jV7iWZTNe5PDUl5oVj66NE8EWgaECJmiTDKj4z8
 nYFGz/mfFKvUDO4rUc+8gmeeh/f48b6Fs9qC6TcwnkJqahOcCy0u4LqFO4S26QAPYU2j
 aY24W4ddeFpCBp/MhDITtnevdKErZVTLWM/T+5PKZKA3JEm4ObwwUdp9HfhLR57tHZoy
 GwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RgK1jk/IR3PoZkYMf3T54ssKMhT16xW9qM4Eqsqrfhk=;
 b=X+rmlUz28SZS2tg8/9TLwp1ITLvst9N2/89Vfj3CuWoSnSIknBeyKrEtAMoGjygYNu
 4ZH/IERAY7BV03ENaGf5a2TVaokzsFFAxt4W4L/GdXj4z8/QH8ld7nEJa7DEJAm1AR5e
 NxlpiH1k2opG5TeZ+c/mDXhM1q4jX+41PvESTEPXQPA35exgjixX7aQzgoDf4vC8ONU7
 SaEJkJL9bIjfyVfloqVta0MhdKXG7VO/njSuNMOkDFrNDQGvvJPoL6YlOGPPskqSAnhW
 vlWAFmEkVJC59TOFCIQxUqKs2H1YdYO4UqQAcYjAMHlglYLkudFDPrql1Dd5b/PIe4pH
 6UFQ==
X-Gm-Message-State: AOAM5304BhYmfuBQyqb0kbJmtB2zwsPPYIh5jAb5zgp7WgXm1iTGkL72
 4ntQE0lC3/pZKgaXN/0YO3kZwg==
X-Google-Smtp-Source: ABdhPJxjHi3KQImafYUt74XuepF0NRYjez0ZoHRJiqL1r6bCjMfPlEBBGJ6WVBZ6uvs+T+xs7zRzfQ==
X-Received: by 2002:a17:902:ea07:b0:14a:45c0:78a7 with SMTP id
 s7-20020a170902ea0700b0014a45c078a7mr21178272plg.92.1642401523336; 
 Sun, 16 Jan 2022 22:38:43 -0800 (PST)
Received: from localhost ([223.184.90.234])
 by smtp.gmail.com with ESMTPSA id em22sm12403938pjb.23.2022.01.16.22.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 22:38:42 -0800 (PST)
Date: Mon, 17 Jan 2022 12:08:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] hw/virtio: add boilerplate for vhost-user-gpio device
Message-ID: <20220117063840.lyg24ikcavis645b@vireshk-i7>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
 <87zgny8l59.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgny8l59.fsf@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14-01-22, 14:06, Alex Bennée wrote:
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> 
> > This creates the QEMU side of the vhost-user-gpio device which connects
> > to the remote daemon. It is based of vhost-user-i2c code.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> <snip>
> > +++ b/include/hw/virtio/vhost-user-gpio.h
> > @@ -0,0 +1,35 @@
> > +/*
> > + * Vhost-user GPIO virtio device
> > + *
> > + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef _QEMU_VHOST_USER_GPIO_H
> > +#define _QEMU_VHOST_USER_GPIO_H
> > +
> > +#include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> > +#include "hw/virtio/vhost-user.h"
> > +#include "standard-headers/linux/virtio_gpio.h"
> 
> Hmm this fails:
> 
>   In file included from ../../hw/virtio/vhost-user-gpio.c:13:
>   /home/alex/lsrc/qemu.git/include/hw/virtio/vhost-user-gpio.h:15:10: fatal error: standard-headers/linux/virtio_gpio.h: No such file or directory
>      15 | #include "standard-headers/linux/virtio_gpio.h"
>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
> 
> The usual solution is to create a patch that imports the headers using:
> 
>   ./scripts/update-linux-headers.sh
> 
> either from the current mainline (or your own tree if the feature is in
> flight) and mark the patch clearly as not for merging.

I have that patch with me and I planned to mention it in the cover-letter, but
completely failed while sending it.

Should I resend this with the NOT-TO-BE-APPLIED patch now ? Everything is in
mainline, so the committer just needs to run scripts/update-linux-headers.sh.

-- 
viresh

