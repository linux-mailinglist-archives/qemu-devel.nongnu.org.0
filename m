Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49636B1AC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:31:40 +0200 (CEST)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1layWf-0004sC-PN
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1layV8-0003nD-2S
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:30:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1layV6-0001Su-1e
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:30:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id l2so2950594wrm.9
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=e8tcPFRoe+pR5Pzh+75bIq0+MD6MvnLWdHYZaygYq9o=;
 b=yHxgdENeX/i+lj6FDqtKjrtXeSbI3IF+4zu11nvgYVvYZm9GEHTgJwJDWQgkIgCjM8
 orLXVupO0xSHFcvN2FPq0GvWyZM0niC8YeXiQ7Wq/rASUbLSn6CSn5s9gzo6ku293Pnb
 WGk0QwD/RSwjpFtbOTwEzrJ1MnQk4du5XAKHfdPyK6kpcnQyPhkAY+uV1aMFr3gVUn2m
 rfizqqjJmWoBBSujh5jHp7j8V9hiOiwmqE8WdqPeUKlieY8DtyCoQaDNVpbtcqbNEITt
 s1Z0DmYE0aM7qVV4ON1ePAW+p8/XB7pmnBkS5HbMzPrH+UY4xhMgxCctb04MBXvPusTe
 pMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=e8tcPFRoe+pR5Pzh+75bIq0+MD6MvnLWdHYZaygYq9o=;
 b=VsmnfiaSZTu2I/+YNDDDkdIyk9JC3oeJ/dVWP3jcazqHzQX79Rkwu/HMFvD6ec6iXn
 16ytBYUKOwsVX1ysUSJ9w+s8JFW5F0iqqlyzDR++kOjuEHY8miad3wGdGaBG1zEOnpeW
 +Z/h6eFvhBzuIFr9FSxMdk/6FavZjC4DbKh0yMeX/bOlcqse2D5ieKJHl/M8Q/P2yKI9
 dPOqKp7k5ro33yzvoGstmCptQ8RwwGEUahJSPXs6TFF2/rB2/u215DELO3CkrW7lxMIU
 Ic65m7lK7vEG9U04PxJWkGCxWXFLcITEgPeXkPQZe+H9YKize7XOfzmnp4LqBVd6EzmE
 EPfg==
X-Gm-Message-State: AOAM533hM8u/AA2E14sTscCk1o5s4E3ybTy74bkgpRYnAhRlJFw1jiLL
 QM+gsN3aysfYC5pcn86YhnQuMg==
X-Google-Smtp-Source: ABdhPJyg+BSLDPJEa6WxyEZUDroqvEoWezCcnINlX/i4mJl6x/J3qsACvVRNFGNG21UePMuVT+N4hw==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr8082203wry.213.1619432997294; 
 Mon, 26 Apr 2021 03:29:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s83sm17031090wms.16.2021.04.26.03.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 03:29:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDFB41FF7E;
 Mon, 26 Apr 2021 11:29:55 +0100 (BST)
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-14-alex.bennee@linaro.org>
 <df3cbf07-562f-087d-47b2-6b366c11f4ae@amsat.org>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 13/25] hw/tricore: Add testdevice for tests in
 tests/tcg/
Date: Mon, 26 Apr 2021 11:15:20 +0100
In-reply-to: <df3cbf07-562f-087d-47b2-6b366c11f4ae@amsat.org>
Message-ID: <878s55tk2k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 4/19/21 4:54 PM, Alex Benn=C3=A9e wrote:
>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>=20
>> this device is used to verify the correctness of regression tests by
>> allowing guests to write their exit status to this device. This is then
>> used by qemu to exit using the written status.
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>
>> ---
>>  include/hw/tricore/tricore_testdevice.h | 38 ++++++++++++
>>  hw/tricore/tricore_testboard.c          |  8 +++
>>  hw/tricore/tricore_testdevice.c         | 82 +++++++++++++++++++++++++
>>  hw/tricore/meson.build                  |  1 +
>>  4 files changed, 129 insertions(+)
>>  create mode 100644 include/hw/tricore/tricore_testdevice.h
>>  create mode 100644 hw/tricore/tricore_testdevice.c
>
>> +#include "hw/tricore/tricore_testdevice.h"
>> +
>> +static void tricore_testdevice_write(void *opaque, hwaddr offset,
>> +                                      uint64_t value, unsigned size)
>> +{
>> +    exit(value);
>
>    ->  qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>
> I'd rather use a 2 steps check of value such watchdog devices do
> (to be sure the guest is still in control and isn't nut).

This isn't any different to what we do for TARGET_SYS_EXIT_EXTENDED or
the various other semihosting exits. Maybe we could do a better job of
flagging that these devices (or features) give the guest an avenue to
cause QEMU to shutdown but none of these are enabled by default.

>
> A general comments, all targets require a such test feature,
> so we should have a generic user-creatable sysbus-testdev for that.

We also have the isa-debug-exit device used by x86. I believe there is
also a PCI device (pci-testdev) used to submit error-exit results for
kvm-unit-tests.

I'm all for modelling a cleaner abstraction that could be used by all
these methods and avoiding multiple exit paths but I don't want to hold
up Bastian's tests to a higher standard without addressing the other
cases. In the meantime given it improves the testing situation for
Tricore I don't think it's a major issue.

>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

