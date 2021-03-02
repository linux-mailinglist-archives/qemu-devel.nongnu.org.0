Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5132A558
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:08:50 +0100 (CET)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7Zo-0006LA-VG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH7Y9-0005rU-Sd
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:07:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lH7Y8-0006UB-AX
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:07:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id k66so3302646wmf.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s4EBrK9Q9gaAcrDFzRaihdvD47LWi8q8RNS6ZStMe2o=;
 b=TJoBasqnANiol8UtZvkkL7R+5UJUCCqqTM2kmQNcsGhI4Mq+ygp4j0a9CTwpAd+H/7
 7FHQwIanwoOuNtzjktV8JJoaNr7ErqiLQs8+egNdIYzZfiFEE02jacGBlCt4uoNBzf9p
 I7lxUIiUSATephFf0rhQfLwLy7hnyrGQa4n6eipy8Xhow0VSudKPPAT+fKjanA8zERfY
 obELJ32ywIOyHGJf7tcDw8MILh5J18EnYu0xy8wOVuY9yBNQXyov5AQjQhn4Zd74Qsvy
 nV5qz5PAAXBcg1eCTW/rF27OCPIARDyt4rukYIJepBYYv+mkZRf2d7P7AhPCQ52PNfpo
 5HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s4EBrK9Q9gaAcrDFzRaihdvD47LWi8q8RNS6ZStMe2o=;
 b=tc5bGNDipB5r2tYJLUBFabppc+GdcmIPWWe8tjzs0blwaVN8Qlx0BYCYB9ge4IOG07
 N39Tjx939X2dsYzwOvTmDrzvUeZhpQbTXNh5gfAxGQ/yIriteNMojcGtgANXgkSzPxh0
 VcFZ8Dv70J4eCu1tw5mOYeExE7IXC/jbSvHcQdJwJRcF2qGQTugG2MAO/4yyXAocOgT8
 Q9FOIH4Hbm0pcrJffdqvTjbpWiNCwGHCo3cZBRZX2L40jWX7joSoMnrq7usV8ARpt21K
 dctVQcgzXn/0dExAje5dfmmlpO5nifNBV9aMlz86OCmNtFhiHpkRwDHgXw72WZ/0uj3u
 XO5w==
X-Gm-Message-State: AOAM532C9KaypXRIS/JesScbI4yww38bc64FpgGx+nctO14VbYvVOMQO
 fjsY4+v6mesNHxZP9Tv5Gs69Vg==
X-Google-Smtp-Source: ABdhPJyv4qxVkodXrAPcpy8Y5odttfa2T1k7L+inXWtf6PhmGrXvlWCjBx9w6/HSJ9sN5lqtaaCpig==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr4813784wmk.106.1614701222071; 
 Tue, 02 Mar 2021 08:07:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i8sm33707257wry.90.2021.03.02.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 08:07:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53ECC1FF7E;
 Tue,  2 Mar 2021 16:07:00 +0000 (GMT)
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org> <YDQYrptOxAjs0Pf0@strawberry.localdomain>
 <YDVrYk9O2gBPwxe4@strawberry.localdomain>
 <YD5atyGBcnxG8+ZK@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Date: Tue, 02 Mar 2021 16:06:46 +0000
In-reply-to: <YD5atyGBcnxG8+ZK@strawberry.localdomain>
Message-ID: <87sg5dilp7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 23 15:53, Aaron Lindsay wrote:
>> On Feb 22 15:48, Aaron Lindsay wrote:
>> > On Feb 22 19:30, Alex Benn=C3=A9e wrote:
>> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > > That said I think we could add an additional helper to translate a
>> > > hwaddr to a global address space address. I'm open to suggestions of=
 the
>> > > best way to structure this.
>> >=20
>> > Haven't put a ton of thought into it, but what about something like th=
is
>> > (untested):
>> >=20
>> > uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr =
*haddr)
>> > {
>> > #ifdef CONFIG_SOFTMMU
>> >     if (haddr) {
>> >         if (!haddr->is_io) {
>> >             RAMBlock *block;
>> >             ram_addr_t offset;
>> >=20
>> >             block =3D qemu_ram_block_from_host((void *) haddr->v.ram.h=
ostaddr, false, &offset);
>> >             if (!block) {
>> >                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram=
.hostaddr);
>> >                 abort();
>> >             }
>> >=20
>> >             return block->offset + offset + block->mr->addr;
>> >         } else {
>> >             MemoryRegionSection *mrs =3D haddr->v.io.section;
>> >             return haddr->v.io.offset + mrs->mr->addr;
>> >         }
>> >     }
>> > #endif
>> >     return 0;
>> > }
>>=20
>> This appears to successfully return correct physical addresses for RAM
>> at least, though I've not tested it thoroughly for MMIO yet.
>>=20
>> If it ends up being desirable based on the discussion elsewhere on this
>> thread I am willing to perform more complete testing, turn this into a
>> patch, and submit it.
>
> Ping - Is this something worth me pursuing?

Yes please.=20

--=20
Alex Benn=C3=A9e

