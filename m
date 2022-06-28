Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3055E523
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:58:38 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Bjh-0002jh-KC
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6Bh6-0000vY-3z
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:55:57 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6Bh3-00088x-Fi
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:55:55 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31780ad7535so117762317b3.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9shwlynRSwa/Wyn/bxn4CoQxZk+30joJouS2O1JHN3E=;
 b=sIusoYs19qGrz9LQ165hNiag14dvb6n8EHaHv8HKdjxmLmMD/BdJUK1gbCT+DMowmS
 vZIQnwiCZo86SW4eL3PBiavThkxef09S7SPAtB6AjsQG7LNVes7Dic0TybziLqOAx8em
 rQ0BJKEB0kquaXvzyvrhjZU7RtZZ2yQKA2Ol0NWzjMV2dszdqb4EuU52Ms2TIOSO+vzG
 SHMBeuqm2L8xVhv6Cwm3WcVbzzZOAjhtb+C6Wu56cbkp1HmnwSpqH2gELQr6+HdLaic4
 n3F6CS8vS0TbVuCN02lgAmbRmQ6JN2n8cH5hJiVDWfETpXXBhbfsADmb4RzqAkks7iRy
 EC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9shwlynRSwa/Wyn/bxn4CoQxZk+30joJouS2O1JHN3E=;
 b=i4qAe/PkFCJplQAtqKp4DOFLdDtMRmZvBYzwyzddgYKAAzX61COfVtEQy4OT6OTi3x
 YcKpRTLIN4on5JM5XyrWUHEQ58MuSFonZFSD8OGfWrlDZ8TgBArrP36bi2n/YEseDcWV
 fve03sKT2l2N22/cFV60YFPrPqz8h6156IyZKrD4RG9YV6XQiDC1aQxbbYOz10iKS0uA
 33hR+Jqi/E5mnIMY56FW+Y3uHzgPMZ0slMPGtbCfZdO8S/XQRNAuCeRfKtMI4cTuoa6z
 T0MD0LEwNEE+Lt2hx1yHHLRbYBhvXB4HF3ItFGj/f6rvBirBztLlv7FKu0XQkAfA3LNE
 qJKw==
X-Gm-Message-State: AJIora9nAvWmeMZ+/V1t2xYIfs0x5vLpB9qHDEVxMWu1owzko/UVtFBU
 2nk8lvlVOYgJ5SIxeR3qFDWyA6KKPQalXVGuHXAWtg==
X-Google-Smtp-Source: AGRyM1vkrvMjngfPySCiWZTc3GxQrY56u55tHSxXP3huBGJ/244dqpqcb2lWgK0YgL4A+yuSTwQhO722LJ8vKEUoghE=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr21840175ywd.64.1656424552258; Tue, 28
 Jun 2022 06:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
 <Yrr6VDCuKpp8SqW9@redhat.com>
 <CAARzgww4LP7xjDPjWuCCERO1fRp9JwuTtPTG6Lix0KDWPC9FUA@mail.gmail.com>
 <CAFEAcA-Rsqze4zKR7NZKRGSJLqQ77Lcc7Grh=tTSCQCZSNHozA@mail.gmail.com>
 <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
In-Reply-To: <CAARzgwxNkgJTjecG6rAz5LgWmtg=OMEh0a0M4kt7QUFeWaNoyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 14:55:13 +0100
Message-ID: <CAFEAcA94eQ9-fKA_4PAeLTu-x4HG7RU8ZnffVGGGua2jek6srw@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Ani Sinha <ani@anisinha.ca>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jun 2022 at 14:53, Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Tue, Jun 28, 2022 at 19:15 Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> On Tue, 28 Jun 2022 at 14:23, Ani Sinha <ani@anisinha.ca> wrote:
>> > On Tue, Jun 28, 2022 at 6:25 PM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
>> > > This proposed biosbits test also involves a considerable download.
>> >
>> > I do not think 50 MB is "considerable" . Last time I tried to run
>> > avocado tests, my laptop ran out of disk space!
>>
>> I think 50MB is pretty big. It might be smaller than some other
>> avocado tests, but it's not exactly the "no binary involved"
>> that most qtests are.
>
>
> Well bios-tables-test uses the binary blobs of the acpi tables. Only diff=
erence is that in this case, we could maintain them within  the qemu tree. =
In this case the blob in slightly larger and comes from a third party. That=
 is the difference.

Yes. That is exactly the difference that means it should go in
the avocado tests.

-- PMM

