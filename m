Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633B589201
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 20:03:10 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIi3-0001MI-SX
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 14:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJIg3-0007us-Ni
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 14:01:03 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJIg0-0005df-W9
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 14:01:03 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-32269d60830so179405687b3.2
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=+SwjVSmd+QjliaItykZykRJQj7IclE3ECDUFPGyMGi0=;
 b=pDlumQhJUpqrYUu4a8yQf1Dhm9pf6Veho6/c46+i6ugVuVkICRQJne7e6cSgzgNTff
 PzAhy9QN//Jvz++nvs6RYz8XmfRlmgOmIU6KMiSFfk7CK06P8gSJH6/FOSR1FUqqQfLk
 wqCuUBSBVO+pDyLpD2RAe2Uod9x67BX5SpzT/IH+fDPKtBSB2NhDMnOvJCPfo28bAlNb
 T0s42NwR9TQcrYFvpkmbMrkx9y9gi8ir8xs9CSFQpQzaOQvXHkKJp50Q4jVvk6A2Ol2m
 OPDk05raQlG+0uMWXK2glRLKn7adKRYyxBsdCD2LnS2iU/+14B1C75GtJBjqEOlx1aVW
 tkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=+SwjVSmd+QjliaItykZykRJQj7IclE3ECDUFPGyMGi0=;
 b=1WO8pqXX+Sgq7LMFkmqfxFIuDDkooknrZe6QmjcckF7w9qB1Gzu9SQlR83oMKQ4lAl
 O4FgnT6372ZMCEeSxgOA4HQdhvhJmT5NYGV7+kjZFDJytrEAhYKa+yF5dqS+CmZxA8L8
 1GV2NRRKvwN20ZYi6bbsPGg7VYIwInSV5+lblkVP7JIFnyd9usZguhJAxfqo+1JCVwYz
 X2u9hGYbsTocFVLTrK/RqVU7qsILCNJxf/7hf155uSQQIauoCYz2ECqKwAh1g80s0tMF
 iLO7B6VwYHMmqn0wpeTxMQ5ApeyqRis5WveZy9q99xpN6tJ27oITGYW3lmtl1gsb2rgO
 c+Xg==
X-Gm-Message-State: ACgBeo2d5m6BsqR79ORDPBdoqEBUddvpMliuetVhNI6Z8kCLeHoZqGuE
 MoCurBGBj7S2v6eXna4ggMza2k4bu5aRjPtpYatLgQ==
X-Google-Smtp-Source: AA6agR7evB7fez16R+p7SylDQTch4OqvAQbXoDZnK0bp4nTnGu/2jXCPEiL433XnumGVj2DRIXi+v0H5lAbRwuzjYvQ=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr24778664ywd.347.1659549659214; Wed, 03
 Aug 2022 11:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
In-Reply-To: <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Aug 2022 19:00:18 +0100
Message-ID: <CAFEAcA8Lp8djo3byv3HsU1rOGZBkGRFezAYH-WpMenX9otW6Ww@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Ani Sinha <ani@anisinha.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 3 Aug 2022 at 18:26, Bernhard Beschow <shentey@gmail.com> wrote:
>
> On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <qemu-deve=
l@nongnu.org> wrote:
>>
>> On 28/7/22 15:16, Igor Mammedov wrote:
>> > On Thu, 28 Jul 2022 13:29:07 +0100
>> > Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> wro=
te:
>> >>> Disable compiled out features using compat properties as the least
>> >>> risky way to deal with issue.
>>
>> So now MIPS is forced to use meaningless compat[] to satisfy X86.
>>
>> Am I wrong seeing this as a dirty hack creeping in, yet another
>> technical debt that will hit (me...) back in a close future?
>>
>> Are we sure there are no better solution (probably more time consuming
>> and involving refactors) we could do instead?
>
>
> Working on the consolidation of piix3 and -4 soutbridges [1] I've stumble=
d over certain design decisions where board/platform specific assumptions a=
re baked into the piix device models. I figure that's the core of the issue=
.
>
> In our case the ACPI functionality is implemented by inheritance while pe=
rhaps it should be implemented using composition. With composition, the ACP=
I functionality could be injected by the caller: The pc board would inject =
it while the Malta board wouldn't. This would solve both the crash and abov=
e design problem.
>
> I'd be willing to implement it but can't make any promises about the time=
 frame since I'm currently doing this in my free time. Any hints regarding =
the implementation would be welcome, though.


For the 7.1 release (coming up real soon now) can we get consensus
on this patch from Igor as the least risky way to at least fix
the segfault ? We can look at better approaches for 7.2.

thanks
-- PMM

