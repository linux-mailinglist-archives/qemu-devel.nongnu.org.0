Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1B36D9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:04:10 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbljV-0004kd-KU
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblbL-0007lT-Gh
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:55:43 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblbJ-0001KI-QQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:55:43 -0400
Received: by mail-ej1-x630.google.com with SMTP id w3so95134070ejc.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1zZ1WAqNWL0tF3GL9pN8AK656pZe2n3vLhcB1Px6YY=;
 b=fUnslNFgSB06dgjqMSHqC/MZd0AZRcHpvzkAIdydpavBlLiTmIXweyfKTbNDccNoLE
 mUfkLTOuGDXS7VeXKG6jqX+sfrSPRHtjqWR7Cd7joYDWDtvq4/NzD/ASS8+qSg3nBTfo
 nzmRxC4u4WsGx7ZdetaJyo5d42wPlVohCcZKcydLMWYnzIc9ibS+E9p0LGEc++KjvnZX
 t2qXbLF48F1z/h4bf5R3C5Bgj54FmwSof0hR6zzCkdv7noQKGTIniepMGTLt9H7yCesn
 wbutzys+k7Vdvf3hsBqbu/8jySIefBRaeUNS2/l921D3OzNCG/xnifLUBsruusOCtWTn
 yHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1zZ1WAqNWL0tF3GL9pN8AK656pZe2n3vLhcB1Px6YY=;
 b=jeAqUldLshEPv68TnWysaf7nh55EEup/SEM45BTOVEZERwYE/o6WnaYqq/PzWKHFu5
 Bawt5tLItzGyb8Knuq2uh/FGGvlT5wT6LpobVyAK9lYjCFWjmRIA8cNx5UgC/vHqc+zk
 pg2yP4ZF8V1FCTtOQqtH7jn5Eg7ZvYw/Ff4U3clXr4YXoK+jpgNdWd9apBnr7JUSR4Ga
 LD/xvuw+2Vc0o/i783b6gjkMMM6G/JFmBukOTJtC0pElChLT+wn6QqN/iaxqmlntOuSd
 ZDjhJ8j9S+2mN1TkX4tlDXQetYbicErMDC7Bm9FZlZ03t/vwNVCOOrJVfUl0gHT0dDtq
 5ihw==
X-Gm-Message-State: AOAM531DcJejYG4Ox+io8LZPRp87u0dqaJfeetDJfFzZbyhzevee/r1C
 dHEbftqprcBwYxPyRnrITi4/0XlAuk1avNMnURLKaA==
X-Google-Smtp-Source: ABdhPJx5OgV26ZhgSBZTZwPNwBm1GJzaVz0T8t6yLijW1J7xfPFLmy6MW8lnjUvot9jxwJLcn6p8OE9W6nrLZBG3J2E=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr29074890ejh.4.1619621740203; 
 Wed, 28 Apr 2021 07:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
 <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
 <20210427212707.3tckau5r3kraciam@habkost.net>
 <87lf93q9ul.fsf@dusky.pond.sub.org>
 <CAFEAcA9u1ftq94B1HQhAb0=909VfvcU1d5FVUwkbJ9orexBt=Q@mail.gmail.com>
 <87sg3ailkr.fsf@dusky.pond.sub.org>
In-Reply-To: <87sg3ailkr.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Apr 2021 15:54:40 +0100
Message-ID: <CAFEAcA9mEAhDxPoYcGOqGT4yA56iXNfSrY1-XLr=gaV8K8mjKw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Edgar Iglesias <edgari@xilinx.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 14:29, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > These are two separate things:
> >  1) callsites which want to reset some other device, and currently
> >     mostly use eg device_legacy_reset() -- the transition to be done
> >     is to move them to use device_cold_reset(). Similarly, callsites
> >     which currently reset a bus with qbus_reset_all() and should move
> >     to bus_cold_reset().
> >  2) devices which implement reset and currently do so with a
> >     single reset method -- the transition to be done is to have
> >     them implement however many phases of 3-phase reset they need
> >
> > (1) is easier than (2) because there are many fewer callsites
> > trying to manually reset devices or buses than there are
> > devices that implement reset.
>
> My ignorance on "these are two separate things" is further evidence that
> working examples are needed.  Damien?  Peter?  Pretty-please?

On (1), see the other email thread we had a day or so ago. The
conversion is mostly going to be "replace the device_legacy_reset
call with device_cold_reset" but the tricky bit is checking that
the device being reset doesn't have any qbuses attached, or if
it does that we want them to be reset. On (2), there are a few
examples of converted devices in the tree.

thanks
-- PMM

