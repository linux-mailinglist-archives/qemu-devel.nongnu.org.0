Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11836B0BD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:36:22 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxfB-00075R-LM
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxdA-00069v-NZ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:34:16 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxd9-0001Yr-37
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:34:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id e7so64805843edu.10
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZW3nweaB4W3xyOYksKhEtOpLVHGfLuZqWsY3PmnSPA=;
 b=t2Qs2kAMBnOFZgf6ZlXEAZMN6Nm0qNYdQkp5+7N7SbXM49ENnIpzUduCu635QL31CZ
 9dWSRQa+Ic655ZU6J3DTYTLRbOUqnWlLrKa9wCjOH5nZUBSJWEQLRbURBOAYtYpldvPQ
 XDcDdAatjQQ5C3Fl+F4cPSe0VpithUSvkQwGpzQrIYLZKFyWBFqqX3utvUzRkTS8c7PF
 Bkk5WEyBwxwwurdPd829/x65yPUrIgsoifKz/CSvV2IM3dVZXm/6u+FyZIY+lXFFxDgW
 EkMvIDP3pRCfpQHK+VWLqiQVs2dX+/kx9zPL5NMGijD2e9mPVJCt9RmjEd/CbBhjwm5t
 837g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZW3nweaB4W3xyOYksKhEtOpLVHGfLuZqWsY3PmnSPA=;
 b=FoY3Ncw2IApOYT17pxPQNkWyCXe5Pq4x/jdMfv0Y9U0nZgodOBiUXo08mUglAuwnW3
 rJ/Id8wN47VgxwsrPKmiFRRVEJkYtw/PYCyF29kuo2+ccGcMfflSNt2SOvlJw6NwqBtH
 9kdu2s/bPDc1uEZG6EvJVSvk5Fupy13P5ee00hgGICxkCLJnmLCRC5G2xj1FB6RpseoQ
 wdaAp+Zl2OY/eEsyd4womdzcEJUPLmVU37lYk/R5lDVdroejfVq3mIubX1WyPz3bsNKV
 NLabHlL1Toa94vtMMmZiMEjN7Ty+9EFuHP7968S8M2FS9/oSboJlb94p0Ag3wgBkw/cf
 f5/g==
X-Gm-Message-State: AOAM53016jEyeTRpMQX01+nGdzhmqTzDw/n9YYF3DdFvJ30GGovN3iLN
 iJwuaE8vPDTdmq5R7ODP9spMDiMnF/WnbXdS+yLJ7w==
X-Google-Smtp-Source: ABdhPJy3LSfF51TMDAwhmmN24cjlj6dk5UqD+rNikLuTrQ+Tk/9iKvg5djQKFWY1hBYU4wY5TCBljcmBrEz1xq7J9OQ=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr19701741edv.44.1619429653669; 
 Mon, 26 Apr 2021 02:34:13 -0700 (PDT)
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
 <b3f8daaf-521d-edbe-c2f3-4af9cd74e46e@amsat.org>
In-Reply-To: <b3f8daaf-521d-edbe-c2f3-4af9cd74e46e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Apr 2021 10:33:15 +0100
Message-ID: <CAFEAcA_8TR6B0Ffz3aqxX4_2LJCsxfcR7D7zB0TYHONWG-57zw@mail.gmail.com>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 at 10:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 4/25/21 8:33 PM, Peter Maydell wrote:
> > On Sat, 24 Apr 2021 at 14:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> I now understand better the diag288 case, but I still don't understand
> >> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
> >> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
> >> is not on a qbus. It is somehow connected to the X86CPU object, but th=
e
> >> single call to apic_init_reset() is from do_cpu_init() - not a reset
> >> method -.
> >
> > pc_machine_reset() calls device_legacy_reset(cpu->apic_state)
> > which is to say it invokes the DeviceState::reset method,
> > which is either kvm_apic_reset or apic_reset_common.
>
> Oh, thanks! I guess "convoluted" is the proper adjective to describe
> this reset logic. I suppose APIC is a very old device, part of the
> Frankenstein PC, so hard to rework (because we are scared of the
> implications of changing old & heavily used devices).

This is mostly just another instance of "our reset logic doesn't
deal well with devices which aren't on buses". The APIC isn't on a bus,
so the machine that uses it has a local workaround to manually arrange
for it to reset, just as it does for the CPU.

thanks
-- PMM

