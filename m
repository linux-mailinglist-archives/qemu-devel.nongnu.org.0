Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD836B04B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:11:55 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxHV-0003GI-PO
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxGd-0002qO-G6
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:10:59 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxGb-0004Fx-Pp
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:10:59 -0400
Received: by mail-ed1-x531.google.com with SMTP id z5so28326123edr.11
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Un2J2IwK+5n9Pr/H1s15ZB+DFSaUZzAgKtQ/VSbl3r4=;
 b=YVqJ4Jd5Y7szhE79hwA5x/rpM2EM1YkI/An3phxDRcqicTXOnC+o5kGC2WliIAKtSL
 BAxxlyvBCvZ7O31uJVnaMv9JunKJbVH4zo7uRY/CpB+QOXI7nKxzVBxYWBo+q92QfGXt
 15H5PnfjSiWnsyheb14rBg0RAysdpweS6B4Y6Lvhr0h8ZHkPwbPitQAH2vYnNZSL3e9q
 3dhHh2e63g71+8L5F/OS2K8Qi+nrHga+iUSiOZ54iLTAIhrQ2KxFQysHLSjowWrIPa65
 buRtcx+ga2SrdL4HmoANaJyNXrIaclOTa8OUUslyLcqVj3kldx6UjhSmkcQMPIyVO3+A
 DOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Un2J2IwK+5n9Pr/H1s15ZB+DFSaUZzAgKtQ/VSbl3r4=;
 b=hTNAroDL2/gkGLOGpq4V1RYw9rWUnRaC/Xr/sNATzwHpyPz5d0WuczEeYtolzOCz/P
 h9zWF4nt9q2oU/TLp8RIP0AEv0L/6jiAmNAnPhT2lcAXPORMok6BGct/+6KWTf2MNgfH
 zDtnz0YKfWXCqm1O/qgZWTg9p/ALvfETmX7nTgdjp1TpTOfx4hJMzD0rVec74yxqy94Q
 qD+nKBdCZ8U+AqWAsna0frdT38t48Y3qCwyb0/KPTt1qvvFAXSwtAaiZ+0dYcaKKhTq1
 OpKbwEg/dQP6BybrOH33gKw4IT8ps5vXZuQKe46NSFbtLtvwoHHmGQlXbN/cpimkBJDw
 SorQ==
X-Gm-Message-State: AOAM5309D1nIKtdwKNhwh4Eae/LckH8rTXCzup1b4Psuv0Qf6/2JGk5k
 ur+Wo9PfxdDmluBmPRBYyaskeYzE7tYc7CzNO+C61w==
X-Google-Smtp-Source: ABdhPJyGV70VYzAynAgqADVP7tLf5F3OjBS5eCVeR24PjDZ6SSs/cSnW/vayYWJuKTDZ6Muw/kSRZjLbaMbVpvJbDpY=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr19853011edu.100.1619428255837; 
 Mon, 26 Apr 2021 02:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
 <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
 <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
 <878s5539ni.fsf@dusky.pond.sub.org>
In-Reply-To: <878s5539ni.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Apr 2021 10:09:58 +0100
Message-ID: <CAFEAcA_d5SQMCD7CLPmuLw9emkHAw1pvvXOJZ+RUuryZeQJJEw@mail.gmail.com>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 at 06:19, Markus Armbruster <armbru@redhat.com> wrote:
> device_legacy_reset() is deprecated:
>
>     /**
>      * device_legacy_reset:
>      *
>      * Reset a single device (by calling the reset method).
>      * Note: This function is deprecated and will be removed when it becomes unused.
>      * Please use device_cold_reset() now.
>      */
>     void device_legacy_reset(DeviceState *dev);
>
> Good to know, but how do we get from here to there?  If we could simply
> replace one call by the other, surely we'd have done it already.

device_legacy_reset() semantics:
 * call the reset method on this device, and do nothing else
device_cold_reset() semantics:
 * call the reset method on this device
 * reset any qbuses this device owns (and so on recursively
   down the qbus tree)

So if the device has no qbuses they're equivalent and we can
just replace one call with the other. If the device does have
a qbus then it's more complicated (and I would start by asking
"do we really want to simulate power-cycling the device but *not*
power-cycling of its bus here?"...)

There are less than 20 callers of device_legacy_reset(), I guess
we should at least go through and identify "which of these are
definitely not resetting a device with qbuses" and update those.

thanks
-- PMM

