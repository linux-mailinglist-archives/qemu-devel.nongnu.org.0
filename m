Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F136A8D5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 20:38:06 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lajds-0004lq-IE
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 14:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajaN-0003nT-7Q
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:34:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lajaL-0000Ry-FH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:34:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id w3so81138693ejc.4
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8t70h9neWXabhA//P1LgoFjTn5Db0mQa9V1eENfqW8=;
 b=rThIx779kruX9rwBAioOVCerOoi/LTR37Q7ZOxHDY52yXqErVxWHOJqDRZKeRIyUuz
 Zk1m7QWcGakC1o6NsLRkxk8fUzke5RBIm98TmpAPIMflYkb7jz17MFnETH83crGG9fYK
 xGVMAdwZz4aRWBuggOQHIkdup7AL49Dx8t0uJetuwPpU0wbSjY6TRqzc6xxFGQa7ICLu
 TAqDmN9V1b96Iz9o4pNgIawLif8q4sUioMEr08AakSq4k3P59SCBdvyGhFTjJ5T6kThI
 L4sqr7kRRspIEBQjH0JsG1Z6om2vXWZGpP8LJip3LH/atyfT6KjawF4N/c3kPkD+UnsQ
 f5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8t70h9neWXabhA//P1LgoFjTn5Db0mQa9V1eENfqW8=;
 b=DCtSWLNcXqH/pmo5JufV30qM6vfei7wT/+aGzhPG5eb4L7HN1SGT4m5Q0tj7v6m9BD
 mZ9nHr0/oyu0SK3lV7wMYy3QvUwBLErTZiHfh34DjFMkFWta0hbBBTqnNK5DsudsCsmQ
 q5/Fh+Gd8zUcsZAKc8ykdPwIzfnd/xCHGCGMc2TFlV+Wgbfv3zbIGVBfHC2aQwDZtp4V
 3IKUGltdPUYMwWWI6SdYakpGMoPUC40uHm4xsx+Ajv77xjN4epapiVoKdFGn9LQxbffH
 fbUedWAhtSF4kT9bS62DOo+VAD8L3pwZKpT8glVwbfZ43AZMIat+8P6thZeNIIh0byLP
 UO3w==
X-Gm-Message-State: AOAM532+UH0oQM+KhUg7nJxnN5qjNVY9VM2telOmBEag7omhRu74f+lS
 V+6p+QEaFx6RqN7TwlSpp0bMKsGFF4ep9/DsbpaY4g==
X-Google-Smtp-Source: ABdhPJwr5emE06mTiExCeLzOTkVOPIU2xVWZQ314TqlNLeh7/vwzjCNVVOofZTVdxBTxJ6KA10RA4GYpHsbpIoL+oM0=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr14891202ejt.482.1619375662832; 
 Sun, 25 Apr 2021 11:34:22 -0700 (PDT)
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
In-Reply-To: <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Apr 2021 19:33:25 +0100
Message-ID: <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Apr 2021 at 14:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> I now understand better the diag288 case, but I still don't understand
> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
> is not on a qbus. It is somehow connected to the X86CPU object, but the
> single call to apic_init_reset() is from do_cpu_init() - not a reset
> method -.

pc_machine_reset() calls device_legacy_reset(cpu->apic_state)
which is to say it invokes the DeviceState::reset method,
which is either kvm_apic_reset or apic_reset_common.

thanks
-- PMM

