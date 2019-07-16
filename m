Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA96A4E2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 11:27:47 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnJkQ-0002DM-OX
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 05:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56563)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <npiggin@gmail.com>) id 1hnJkC-0001hf-Pb
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 05:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1hnJkB-0006Lm-PH
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 05:27:32 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1hnJkB-0006LL-JP; Tue, 16 Jul 2019 05:27:31 -0400
Received: by mail-pl1-x643.google.com with SMTP id ay6so9802019plb.9;
 Tue, 16 Jul 2019 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=oIMuBMYHwMH7XKZNCAMZT+QyxODbXrcyxvM9slCCySw=;
 b=ngZed/QX4ckJJp8DMgDzj/ZIhlR4Zwo5dtmevXcwKtExVFhcngpa4j0IPmFFg2ft5l
 obj9K6hRxK5300UTOqT+/66aGDHpP2DiGd5OmVphYR1QyPOG7ins6UNVaZhMIxSWN3u2
 OhVyHnuVPf2Axep6W8OSBKuFEhIndAwhTRvtVkFAPzJoepkKL+/+XXub3dSc3Uq2aKJH
 OpvUSUbd0jVvYsA/undyQ+8NLehO0WBlMuRovifF49KVdEPPW+cEjfwGLYfdjYHJy+V/
 3YXfHeDfnshklJ9/q+yNAYOmxa8zaV8GRr2qqTrZI3nl7gimjht/7V//HYUJ4JUi+EAS
 jhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=oIMuBMYHwMH7XKZNCAMZT+QyxODbXrcyxvM9slCCySw=;
 b=JxQuD7IBwH8HFyseFgQ69uMyFHNJ9143giWnVPpnZDoouXwJKaFwNu7yAfNkWS7DsW
 2jBK+Rg0W7E4RTQHUJoCsz9e0og80f2ApSqhZU84X3cl6m0woQLQiIUhFqIuoTmfdIIY
 w5VUei5cflhsNGtzEwQlRkdW5yBlogdag2cnVL/CXsonKiavubG2n3cg3YIY5e/ce9AK
 NxFbNYDNELmb5czEjS2y+FW3RRSAomi+FmGk4vP8P5GRPj7ixMdauWEIPPHftocxY92a
 anntF5OUTTfov8oyIv+RCyzEYWU26m1U7Fx53ZP9ezs63nNhEVX453e6MUZ7Wj7KV3dZ
 y+Ww==
X-Gm-Message-State: APjAAAVwuT+n0xogjZHydlWB+SwRxrpiLTt8DhQLlymhCRY/7g98LW2j
 04vZ0HnHTmkJENdSqd0GZUs=
X-Google-Smtp-Source: APXvYqxl2f3vXThvpYqgtSu1NxolGDAPtIiHmeXKJ0Pbq7F7n/M7+qbva5HVPKHsQdwIrJZ6ywCFUg==
X-Received: by 2002:a17:902:27e6:: with SMTP id
 i35mr33825918plg.190.1563269250299; 
 Tue, 16 Jul 2019 02:27:30 -0700 (PDT)
Received: from localhost ([203.220.8.141])
 by smtp.gmail.com with ESMTPSA id v10sm19689791pfe.163.2019.07.16.02.27.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 02:27:28 -0700 (PDT)
Date: Tue, 16 Jul 2019 19:27:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190716024726.17864-1-npiggin@gmail.com>
 <20190716024726.17864-2-npiggin@gmail.com>
 <20190716073433.GC7525@umbus.fritz.box>
In-Reply-To: <20190716073433.GC7525@umbus.fritz.box>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1563269012.r4tmfz9h7z.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v4 1/5] spapr: Implement dispatch counter
 and prod bit on tcg
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson's on July 16, 2019 5:34 pm:
> On Tue, Jul 16, 2019 at 12:47:22PM +1000, Nicholas Piggin wrote:
>> Implement cpu_exec_enter/exit on ppc which calls into new methods of
>> the same name in PPCVirtualHypervisorClass. These are used by spapr
>> to implement these splpar elements, used in subsequent changes.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr.c                  | 25 +++++++++++++++++++++++++
>>  hw/ppc/spapr_cpu_core.c         |  5 ++++-
>>  hw/ppc/spapr_hcall.c            |  5 -----
>>  include/hw/ppc/spapr.h          |  7 +++++++
>>  include/hw/ppc/spapr_cpu_core.h |  2 ++
>>  target/ppc/cpu.h                |  2 ++
>>  target/ppc/translate_init.inc.c | 25 +++++++++++++++++++++++++
>>  7 files changed, 65 insertions(+), 6 deletions(-)
>=20
> Mostly LGTM.  Please do address the style issues that the bot
> reported.

Will do.

> In addition, do the dispatch_counter and prod values need to be
> migrated?

I was thinking no, it should be just a blip. But could the guest
be reading the dispatch counter in the vpa for some other reason?
There are other (unimplemented) dispatch statistics in there AFAIKS.
Linux doesn't, but others might.

And what about KVM, does any of the VPA data get migrated for=20
KVM guests?

Thanks,
Nick
=

