Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF18364AF6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:04:26 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa89-0000zO-A1
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lYZjL-0003fQ-RI; Mon, 19 Apr 2021 15:38:48 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lYZjI-0001FL-Ux; Mon, 19 Apr 2021 15:38:47 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 09342C602E6;
 Mon, 19 Apr 2021 21:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1618861120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OjnwcJPbwVPbe2ImHKCwLE35rVyNGSXOVVDYhYEYm0=;
 b=EErzK9VcBuZGqfilX4HTUnBteaoSl4q06AQD8tyLM3ZMXR27ESfQrpBh0Ws5O2zxiC0WB8
 EISFQ5JaLYA/4I0Ql/vihaQ+Sw9zIl2KP/bt0odTr9MVFK+syzJEfswJeQoabjbwNVsHjZ
 f4U6Y+6XLZLNI7/mWCSK/jp4P69iqnAhAeWtKNLwrLoOTdDDRv973nHJHa56wfX7Yzm/h+
 0dXAk3ItPO4rtkLfmyuGJuxbNUnYxjaO01P4QbkrJc0fCS72D+hNQ/gJUw94lJu9puzB1I
 wzwip8HLjt6E0Avvy9sZVpVjmUSk1sRNWxnkUIXeCmn/5FoTOQdL+BY3awGQ8w==
Date: Mon, 19 Apr 2021 21:39:47 +0200
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
Message-ID: <20210419193947.lc6nyxubrtxwpiy3@sekoia-pc.home.lmichel.fr>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15:53 Sat 10 Apr     , Philippe Mathieu-Daudé wrote:
> Hi Luc,
> 
> On 4/10/21 3:19 PM, Luc Michel wrote:
> > On 08:23 Fri 09 Apr     , Philippe Mathieu-Daudé wrote:
> >> I've been debugging some odd issue with the clocks:
> >> a clock created in the machine (IOW, not a qdev clock) isn't
> >> always resetted, thus propagating its value.
> >> "not always" is the odd part. In the MPS2 board, the machine
> >> clock is propagated. Apparently because the peripherals are
> >> created directly in the machine_init() handler. When moving
> >> them out in a SoC QOM container, the clock isn't... I'm still
> >> having hard time to understand what is going on.
> > 
> > I think there is a misunderstanding on how the clock API works. If I
> > understand correctly your issue, you expect the callback of an input
> > clock connected to your constant "main oscillator" clock to be called on
> > machine reset.
> > 
> > If I'm not mistaken this is not the way the API has been designed. The
> > callback is called only when the clock period changes. A constant clock
> > does not change on reset, so the callback of child clocks should not be
> > called.
> 
> They why the children of a clock tree fed with constant clock stay with
> a clock of 0? Who is responsible of setting their clock to the constant
> value?

I think we expect the child to be set when we call clock_set_source. In
this function the child period is set to the parent one. Maybe you have
a case where clock_set_source is called before clock_set on the parent?

-- 
Luc

