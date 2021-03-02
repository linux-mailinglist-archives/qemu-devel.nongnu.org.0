Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51332AC2A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:22:18 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCTB-0005FP-NW
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHCDP-0004te-9b
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:05:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHCDN-0001wM-6w
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:05:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id w7so3371407wmb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=P8sesIi1LIIC93ukixvpuvKcps6CZw8enMnFjTtmtIw=;
 b=rh4riaLW0pFbOI0M6F19aWwcix2NaVsiqaJhKPNcC3i3OaWOxO5tHgD9hPtHXJe28o
 PBoJTM6icd0t+1/rIu28SqUWlOFB2jPPiJ8CuXmvRp9iiEZvgKV3KwxNl5DsUjZUBHi5
 B/jczQBNhKsvlTVh+60qbZE/ECVsMGccnMENEtTZzqUG+K1ITDu3x96cIItMlG5QdHis
 Nq10DJJfavj6b140F0RbBGRWV9FmtJzoPcnBTU2ZATbrPueH2ms/jstqVkWkRAoDDMwh
 jPtzIoiClHw0B9RBmtsvgIW1j3+Rvy1ybSWqfSJ+kOVFDu51lHRTglWSXD1C1aieSZMB
 TNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=P8sesIi1LIIC93ukixvpuvKcps6CZw8enMnFjTtmtIw=;
 b=GdsLbyzL9CYx8UKR9D+4GvE+mZ8E2z9THHPprez10TIzA2Tovb5wuLfnrb1yhwZ+rR
 uNE4vedOSUp/Lka34t8V1kFXDXUZ4y2lod+/GaaRRp//UW4ci2f7MfZPY6lyvLDiqtM5
 m2pa8g4qbk6pWAs6uQl9x0lIeNyp0GDOw60LRUGRmAhdKFshFPT5V4PGverAC9iZCOlp
 pRr7GArVW84sDHbQQT71C+9AJkQsQRlxY7XVViqvaD/FRp7TEsNiDaLIYiYwUKxAYIiw
 keEeo7zRFHYkYphSyUBDfgsSQtfgkc8ZFy5RSFS3XeOW48f6lpX8SZqGRfdrTgwE2EF1
 8iYA==
X-Gm-Message-State: AOAM531c7IB2/NzqYEJ0/wHi5lZglgnTVeJnbRvqBnkRJHxexG6KPn7y
 +j/9VPie1sNCcFEnWhaRVEQM3Q==
X-Google-Smtp-Source: ABdhPJy868Wafl6rAmGrF2QPCzmE/qUCmwReJXc7yWcp+9zzqAIEy4dknlqmh2dLhtNcz+oYqWpmFg==
X-Received: by 2002:a1c:3286:: with SMTP id y128mr5778892wmy.104.1614719155697; 
 Tue, 02 Mar 2021 13:05:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm38399844wrd.9.2021.03.02.13.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 13:05:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E0931FF7E;
 Tue,  2 Mar 2021 21:05:53 +0000 (GMT)
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org> <YDQYrptOxAjs0Pf0@strawberry.localdomain>
 <YDVrYk9O2gBPwxe4@strawberry.localdomain>
 <YD5atyGBcnxG8+ZK@strawberry.localdomain> <87sg5dilp7.fsf@linaro.org>
 <YD6U2dC1dWbixriR@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Date: Tue, 02 Mar 2021 21:04:48 +0000
In-reply-to: <YD6U2dC1dWbixriR@strawberry.localdomain>
Message-ID: <87pn0hi7v2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> On Mar 02 16:06, Alex Benn=C3=A9e wrote:
>>=20
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>>=20
>> > On Feb 23 15:53, Aaron Lindsay wrote:
>> >> On Feb 22 15:48, Aaron Lindsay wrote:
>> >> > On Feb 22 19:30, Alex Benn=C3=A9e wrote:
>> >> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> >> > > That said I think we could add an additional helper to translate a
>> >> > > hwaddr to a global address space address. I'm open to suggestions=
 of the
>> >> > > best way to structure this.
>> >> >=20
>> >> > Haven't put a ton of thought into it, but what about something like=
 this
>> >> > (untested):
>> >> >=20
>> >> > uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwad=
dr *haddr)
>> >> > {
>> >> > #ifdef CONFIG_SOFTMMU
>> >> >     if (haddr) {
>> >> >         if (!haddr->is_io) {
>> >> >             RAMBlock *block;
>> >> >             ram_addr_t offset;
>> >> >=20
>> >> >             block =3D qemu_ram_block_from_host((void *) haddr->v.ra=
m.hostaddr, false, &offset);
>> >> >             if (!block) {
>> >> >                 error_report("Bad ram pointer %"PRIx64"", haddr->v.=
ram.hostaddr);
>> >> >                 abort();
>> >> >             }
>> >> >=20
>> >> >             return block->offset + offset + block->mr->addr;
>> >> >         } else {
>> >> >             MemoryRegionSection *mrs =3D haddr->v.io.section;
>> >> >             return haddr->v.io.offset + mrs->mr->addr;
>> >> >         }
>> >> >     }
>> >> > #endif
>> >> >     return 0;
>> >> > }
>> >>=20
>> >> This appears to successfully return correct physical addresses for RAM
>> >> at least, though I've not tested it thoroughly for MMIO yet.
>> >>=20
>> >> If it ends up being desirable based on the discussion elsewhere on th=
is
>> >> thread I am willing to perform more complete testing, turn this into a
>> >> patch, and submit it.
>> >
>> > Ping - Is this something worth me pursuing?
>>=20
>> Yes please.=20
>
> Okay, I'll work on it. Is your thinking that this would this be a
> separate call as shown above, or a replacement of the existing
> qemu_plugin_hwaddr_device_offset function? And, if a replacement, should
> we keep the name similar to retain compatibility, or make a clean break?
>
> It seemed like Peter may have been saying the device offset shouldn't be
> exposed at all (leading me to consider full replacement), but I also
> don't see a definitive resolution of that conversation.

I think a full replacement and an increment of the minimum API version.
That way people will at least query why the plugin failed to load and
hopefully will read the release notes ;-)

>
> -Aaron


--=20
Alex Benn=C3=A9e

