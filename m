Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0842C724
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:01:05 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahcm-0001RS-6E
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mahad-0000Qk-41
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:58:52 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mahaX-0006md-5I
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:58:50 -0400
Received: by mail-ua1-x92e.google.com with SMTP id h4so5918397uaw.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=orshusUWkG9djDVlR5S/7u3/FDeXmyB9rT2NHTk3YRM=;
 b=RNY/aJMrAyu67yryTY9BJFkmP5P1ecebO4nkrpiORWcq6xRq8UFlzD8ap7usXV+7n2
 n8EYiESV96pD4pdMUMCNgwv1lcivhDQT+EK/1BZJ7w6XMQactsAUxMG5hHwijZGtBhib
 yEdDw4DY3S3+GaK9VEHOJbCsX3/LhPYIHlvSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=orshusUWkG9djDVlR5S/7u3/FDeXmyB9rT2NHTk3YRM=;
 b=YsWRCu9kC2NLn0cvAHuCwYPKPrfuvMOz5cxsfqn5bQei6um+oIp+78uC+fauk9QRUq
 yTFO9apvWA8JQrofZgkVYbFVuu+gt96h4UwYbWj1W9PgGcXPJ+Vz/4GlH/7b6ah9NdBB
 eQOewF3GWtRKGdctBDF9wMTK2m3EmrBEaK4cDEEQ+baIXC4BO/1OXurD9Zj4oueYNwv7
 eBEoOLuZL58bq2FIWpMtYA+zbdX+l2sVLrxJNbI0ReStXg3W2SVMg26MFAOyP5goTlcg
 b4Vmtkj6I0Kavmi3XJnii9ZABcqJXLGTf6EfY2+4XEJ8ZaKubRGwMTx4KK4ekTHAT6N2
 8SKA==
X-Gm-Message-State: AOAM530ywLA9KWmgWjgXNycU+EmofEGLpealqWXyxR+4P+7NxEbcRIeZ
 lsd5j0QqWy8JnhQSnpsu0yfh+I+A+eywlaWe414hFA==
X-Google-Smtp-Source: ABdhPJylJjFq0kx7UIOc9JnQTH3HurLQWJA+gF2wgflOJsip7Ov4xnx6bPFZuvjL1ZkIFURgY1irtK0Prl/wbVRzf4E=
X-Received: by 2002:ab0:14a7:: with SMTP id d36mr332709uae.96.1634144322112;
 Wed, 13 Oct 2021 09:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-3-sjg@chromium.org>
 <CAHFG_=Wj9w0w8C88O4BNN4pO-C+wMqFuqmVh4F1avcwsqE_csQ@mail.gmail.com>
In-Reply-To: <CAHFG_=Wj9w0w8C88O4BNN4pO-C+wMqFuqmVh4F1avcwsqE_csQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Oct 2021 10:58:31 -0600
Message-ID: <CAPnjgZ1g4j4YdcgWKfJU81xC8NViA2Wew62Ygp0VO2QbrT6zhQ@mail.gmail.com>
Subject: Re: [PATCH 02/16] arm: qemu: Explain how to extract the generate
 devicetree
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=sjg@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Tom Rini <trini@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fran=C3=A7ois,

On Tue, 12 Oct 2021 at 19:20, Fran=C3=A7ois Ozog <francois.ozog@linaro.org>=
 wrote:
>
>
>
> Le mer. 13 oct. 2021 =C3=A0 03:02, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
>>
>> QEMU currently generates a devicetree for use with U-Boot. Explain how t=
o
>> obtain it.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>> ---
>>
>>  doc/board/emulation/qemu-arm.rst | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu=
-arm.rst
>> index 97b6ec64905..b458a398c69 100644
>> --- a/doc/board/emulation/qemu-arm.rst
>> +++ b/doc/board/emulation/qemu-arm.rst
>> @@ -91,3 +91,15 @@ The debug UART on the ARM virt board uses these setti=
ngs::
>>      CONFIG_DEBUG_UART_PL010=3Dy
>>      CONFIG_DEBUG_UART_BASE=3D0x9000000
>>      CONFIG_DEBUG_UART_CLOCK=3D0
>> +
>> +Obtaining the QEMU devicetree
>> +-----------------------------
>> +
>> +QEMU generates its own devicetree to pass to U-Boot and does this by de=
fault.
>> +You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree ver=
sion.
>
> this is for either Qemu experts or u-boot for Qemu maintainers. Not for t=
he kernel d=C3=A9velopper as it is recipe for problems: could you add this =
warning ?

Yes I can do that...or would it be better to hide this in doc/develop
somewhere with a link here?

>>
>>
>> +
>> +To obtain the devicetree that qemu generates, add `-machine dumpdtb=3Dd=
tb.dtb`,
>> +e.g.::
>> +
>> +    qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57 \
>> +           -bios u-boot.bin -machine dumpdtb=3Ddtb.dtb
>> --
>> 2.33.0.882.g93a45727a2-goog
>>

Regards,
Simon

