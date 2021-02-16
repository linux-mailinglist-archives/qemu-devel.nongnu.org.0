Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2731CF90
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:51:00 +0100 (CET)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4V1-0002G9-N7
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4TB-0001Is-Jw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:49:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4T8-0002ip-48
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:49:05 -0500
Received: by mail-ed1-x531.google.com with SMTP id n1so2978522edv.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZZX1Sa337D65ibdqvSU/ayZF9NTLNO1SBwNKxR5/dp8=;
 b=l/ozeZ7EvYgrqmNu+in/+HpBCmYTYj5qQl4XCgZ7aYCUWUpE0dl2LoLSUkj31Z00Li
 aST+8kd2KQbqv4eN2lX0IudWZNuiup8/SFZJ2BW+HOtw0O+SnTqIObSyf6Jvgl/fjmIU
 piUHRbofjg+4SjiYQuVJIKYfkZP/lPKK1bK0fOZ3Fomq8dusyfKmqDxGXxkhS/UMRNJ3
 /QCjF6amk9CY9xMIPPqhOGfGd20ltoD+Uga31Do6ZnK/zUTl9DaQkdQJ+KEiFpmIr2Ql
 DpPNBKQnj9XsZPAo/WIHBwZ+LdonR3AFwhHRQ2MNZCPhPJxKwXrzsQj0YNevGo6CY+lE
 wEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZZX1Sa337D65ibdqvSU/ayZF9NTLNO1SBwNKxR5/dp8=;
 b=GiAGNm6CD/aWKlBd9Era9dQEwtZt03bZml4C7+GZq6h1+TAmQoCQfyXpmEeJnKOLTO
 N/juhbCGliXWo57TK3goYW3dxNr0iz/2ks1NFPenqXLNZyPuPDCDSduhoeS+9gdO/ev5
 waKdmc23ifPXkPAqbXYPd5hrghCfm7kx0XuoWzJjQvi1u8SfSHv0js7P8k09SaZpgxJ4
 Pp4ZqYFUa1hZuGoI99NWsxSxj1fW4FQTBonUlHsjtKRXT1rXfPwrIyl5Kv6DKkICj3q0
 MRV8+qYPF0PEt5UAea1UoCkdzsuoYjMxR7NeEIxoJAu01KrAeML0Vdq9zvykNr5cOlZK
 SeIg==
X-Gm-Message-State: AOAM530wdEas3U+JkQrEYzrEGxtF6RazwGldeSSUVs9+W43nytkl+ERW
 7V2uGoJjiQ7vLSQSFnYD/TXF3rvehHDwAEAFI7ZKFw==
X-Google-Smtp-Source: ABdhPJxFMdPo5uo4H61GvKU1487OPnEaFCs++mvlQu4cJ2ocw3pZv5nhJOy2SmkC87tHfOSTHPHG8NyyVwR/yydFVBw=
X-Received: by 2002:a05:6402:177b:: with SMTP id
 da27mr14196259edb.251.1613497740026; 
 Tue, 16 Feb 2021 09:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20201102163336.115444-1-alxndr@bu.edu>
 <CAFEAcA9d=ZTXzK+u5rjFvkiA53izTBq5Hm5VwQ9=WEAZX+TRJg@mail.gmail.com>
 <20210216150025.ujuq7cxspep2kaei@mozz.bu.edu>
 <25d3918d-913b-a2c6-209f-92732002e823@redhat.com>
In-Reply-To: <25d3918d-913b-a2c6-209f-92732002e823@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 17:48:49 +0000
Message-ID: <CAFEAcA_AX_yN-7grqg0nVY-RB5ZJh9nApRB3T3DY+JhUyD1dpg@mail.gmail.com>
Subject: Re: [PATCH] qtest: add a reproducer for LP#1878642
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Laurent Vivier <lvivier@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 17:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/16/21 4:00 PM, Alexander Bulekov wrote:
> > On 210216 1325, Peter Maydell wrote:
> >> Hi; I just noticed this, but why does this test case pass
> >> "-trace pci*" to QEMU? It doesn't look like it does anything to
> >> try to capture the trace output, which thus winds up just going
> >> to the stdout/stderr of the "make check" run. Similarly I'm not
> >> sure '-d guest_errors' is going to do anything helpful unless
> >> you take steps to capture the output and check it.
>
> I suppose Alex took it from commit 4177b062fc5 ("hw/isa/lpc_ich9:
> Ignore reserved/invalid SCI IRQ") where it is used to show the
> problem the fuzzer reproducer triggers. Not useful in regular testing.
>
> > Ah, I sometimes include those in the initial report, if the device has
> > trace-events. I can remove this from fuzz-test.c, if it is slowing
> > things down.
>
> I doubt it is slowing things down, but it probably make it harder to
> find other problems (I suppose Peter got confused when looking for
> another failure and found these traces).

Not even that; it just looks a bit weird in the 'make check'
output. If there's no particular reason for them to be in there
we might as well remove them.

-- PMM

