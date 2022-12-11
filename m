Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4976493A2
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 11:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Jc2-0006pb-7M; Sun, 11 Dec 2022 05:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4Jbv-0006n3-Pp
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:31:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4Jbt-0003d3-Uu
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:31:07 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bj12so21259245ejb.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5CMrC0cSKFXuFRvZeXvn2dBbQUYK9YIyF3T76xuH9c=;
 b=md79dKU2M7CNxYjzHzp/Ma80dkwLgYkek3MCTFvaDea4Z08+VcXCPuAq1851r5exK9
 1AGExT6NTs9JPBgGtYWFkh7Tqo5agyDPXbWzn4OzaCPz8X5PBkkEp/WMHXTEgzRlascP
 OsrL/MobxTv3Znz5u1SzoJJwLo9fe2ZUQI0v9QHkJB7+pGOOQ83kavflKUqZ3v4Ct4Sh
 7i7NKJW5leO8al4/1DNIRRNnyPDDFNwAqWkmW32539Ar5+SNek850bv1Tm9XXF+XKcIm
 mGGNZMP5yeTA6VZaXnQDtMVA3H8duaM2aEYDuJA8UjbGMyA+u6ZNXgipaS4qIaVNKrYg
 BDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5CMrC0cSKFXuFRvZeXvn2dBbQUYK9YIyF3T76xuH9c=;
 b=LC0GOuGx+D53vQNJMoZYf+tCrjU/Z7Le2KYgNfChyFFbpYOxKHkZOsG3yzj4YGMCNR
 oSoQTOgiAzfXhKX1JKlPurHiSZtZgWkVs4XqLMG+6Rxm4+Dp66PFbq46CydOFhDrQS4g
 qgfMH65g1InqMAzQP/B0yW50tc72W4OBXxjL7TCmG3qElbRhTEaqvbJM7Dp8IzA1qYR6
 Icm1GyhvjBrgCRdk/e68378ipKXC6y8zDUO+hdY4Xl4Ph8Hnq/CqtPZrn8vobtWS80qd
 qX/C8lg9aHq+KkOs//ZagaJeYIngXGuVDB2yf9MlHZcNuXZV61Z+TGbm3DH2OnQku5bf
 /8mA==
X-Gm-Message-State: ANoB5plBCoNnsdeK2K1e++fBjSvB87abTX5TlL7SemGrQTUgx1TwkzSx
 qQzJc+IJIgpLSOAmD98Se1I=
X-Google-Smtp-Source: AA0mqf69AFXjbtrfHzK2746GB3dEMUeVl2tM5zn65X+QnyFR49HLsvz0WYrvjHpdTkSLAWTAKRhwdw==
X-Received: by 2002:a17:906:7fc3:b0:7bb:5cd8:ec93 with SMTP id
 r3-20020a1709067fc300b007bb5cd8ec93mr9740767ejs.17.1670754662532; 
 Sun, 11 Dec 2022 02:31:02 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b007ba46867e6asm1997621ejh.16.2022.12.11.02.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 02:31:02 -0800 (PST)
Date: Sun, 11 Dec 2022 10:30:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
CC: Michael S Tsirkin <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_hw/rtc/mc146818rtc=3A?=
 =?US-ASCII?Q?_Make_this_rtc_device_target_independent?=
In-Reply-To: <4e62e8a4-7ffe-bd6c-83dc-14edd370f9ac@redhat.com>
References: <20221206200641.339116-1-thuth@redhat.com>
 <FA330EEE-29A4-41CF-B4E8-13E5DED680B3@gmail.com>
 <4e62e8a4-7ffe-bd6c-83dc-14edd370f9ac@redhat.com>
Message-ID: <4A8BA45B-758F-48F4-A15D-4A0F438248C7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 9=2E Dezember 2022 09:00:56 UTC schrieb Thomas Huth <thuth@redhat=2Ecom=
>:
>On 07/12/2022 15=2E47, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 6=2E Dezember 2022 20:06:41 UTC schrieb Thomas Huth <thuth@redhat=2E=
com>:
>>> The only code that is really, really target dependent is the apic-rela=
ted
>>> code in rtc_policy_slew_deliver_irq()=2E By moving this code into the =
hw/i386/
>>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing thi=
s
>>> function as parameter to mc146818_rtc_init(), we can make the RTC comp=
letely
>>> target-independent=2E
>>>=20
>>> Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>>> ---
>>> include/hw/rtc/mc146818rtc=2Eh |  7 +++++--
>>> hw/alpha/dp264=2Ec             |  2 +-
>>> hw/hppa/machine=2Ec            |  2 +-
>>> hw/i386/microvm=2Ec            |  3 ++-
>>> hw/i386/pc=2Ec                 | 10 +++++++++-
>>> hw/mips/jazz=2Ec               |  2 +-
>>> hw/ppc/pnv=2Ec                 |  2 +-
>>> hw/rtc/mc146818rtc=2Ec         | 34 +++++++++++-----------------------
>>> hw/rtc/meson=2Ebuild           |  3 +--
>>> 9 files changed, 32 insertions(+), 33 deletions(-)
>>>=20
>>> diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818r=
tc=2Eh
>>> index 1db0fcee92=2E=2Ec687953cc4 100644
>>> --- a/include/hw/rtc/mc146818rtc=2Eh
>>> +++ b/include/hw/rtc/mc146818rtc=2Eh
>>> @@ -46,14 +46,17 @@ struct RTCState {
>>>      Notifier clock_reset_notifier;
>>>      LostTickPolicy lost_tick_policy;
>>=20
>> This lost_tick_policy attribute along with its enum is now redundant an=
d can be removed=2E Removing it avoids an error condition (see below)=2E
>
>lost_tick_policy is used for a property of the device which gets set from=
 softmmu/rtc=2Ec, so I would not say that it is unused =2E=2E=2E or do I mi=
ss something?

Never mind=2E I was mislead by the switch statement but there are more pol=
icies=2E Also, the enum is also used in the PIT=2E

Best regards,
Bernhard
>
> Thomas
>

