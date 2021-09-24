Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE3417450
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:06:17 +0200 (CEST)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTku8-0002vg-1g
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTkV9-0005jN-Aq
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:40:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTkV7-0005a5-Ly
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:40:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t8so27235712wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZvv+hgGy2Jgnk7C22oZUrKiS+A9mleLS2YPo919jNI=;
 b=DecSg/djRdXdgxwzQWGUrXO/VAoS5MXrTthXcEK1i+qyeaODv7o1ZMekwtaRErYK4j
 wDaB9P7C/shpj6gratP9WJFwVdh0Dj0WIN+NPg2zAnQX+7Y+EZ9osmvTjb9rcnWHPUcx
 66Fjhi5uPRxmwSDWnkp1Ow7PFAAyoyNkfSIsnseJ/eQdshzf3Bn0UHAB4nOmk+Z3ndW4
 T5CnasqPZcoJXc8Oahx+Pb7lz1LNA1JecieUnQVmjh8G6ShYCPCnenw07O0u9IqLSk9M
 nSJBCvNuT6tvpLqqLbmyxkzZGdpu8FSFfJhW2Hei68IlnzyH7RqYnlQCruJTBG5FrQcy
 mkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZvv+hgGy2Jgnk7C22oZUrKiS+A9mleLS2YPo919jNI=;
 b=3FNzlWlpeFsLOKxmSWrE3BU/3puL4slAuRiJHlXUnkLbezVaMdM6k9A/fntZ4+BI9v
 lAPSWhz5GlyqOQRdVDUmFesCQKL9hPRKMSl/ogo4W8z83V247CkQBir8RjlrQaMb8Q7c
 FUg+hjKKeJVRS6LxZXk+9yfa399r4r9jyKaUtc6l6PcVDdzK+iGVvv8NCm5qiXwHBApi
 JlaV33cDRDOrlcOhGSWQgsbUj91chNE89ERSIbKgFP/AOQySsZxUMw5Ik8UN58JPTGdH
 68z9mWt7BziUtLZrVjWGFQvqrWnGTf8+eKD8GYOnEBDTNMiz+b+RL7Y3s/rQ7aEB2gx9
 7o/g==
X-Gm-Message-State: AOAM530qO5XScdd6FZgF+KpRUZqacJLKbPGpXKCZMALa7rAcbJ99cUGM
 iAnqK1Jep3wRkWOXEeaIrbre3QteN8W5AnzumpqYIQ==
X-Google-Smtp-Source: ABdhPJwmYhFlidLHTdTnTIHWsBzXzI00yN6ilKzIKm7mPURkNB2mDNob7UI9iQuOgewrSbZ4YSDO8VaaIbYgkY9BZtE=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr1953384wmh.126.1632487222550; 
 Fri, 24 Sep 2021 05:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 <874kaarwou.fsf@dusky.pond.sub.org>
In-Reply-To: <874kaarwou.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 13:39:29 +0100
Message-ID: <CAFEAcA8mMzzgKyDbUUTh+W0r=5C0_HJv+7MMZ3Rdx-E2vcsRZA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 13:21, Markus Armbruster <armbru@redhat.com> wrote:
> ... this isn't really *target*-specific, it's *device*-specific: some
> devices implement the event, some don't.
>
> Ideally, we'd just fix that.

Would you want to tell the far end "this machine simply does
not have an RTC device at all (because the hardware it's emulating
doesn't have one) and so you won't get RTC_CHANGE events" ?

A good first step for getting more devices to implement the
RTC_CHANGE support would be if there was any documentation on how
to do it. The JSON schema says the offset should be "offset between
base RTC clock (as specified by -rtc base), and new RTC clock value",
but there aren't any hints (either there or elsewhere) as to how a
device is supposed to determine that value, and there's no
documentation of what the behaviour or intent is of the
qemu_timedate_diff() function that the existing implementations
use to calculate the offset.

Side note: probably the JSON schema should document the units
for 'offset'. Code inspection suggests it wants seconds.

Side side note: the JSON event doesn't seem to contemplate
the possibility that a machine might have more than one RTC...

thanks
-- PMM

