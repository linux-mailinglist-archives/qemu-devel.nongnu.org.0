Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1728F575
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 17:03:24 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT4mp-00033a-Fp
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 11:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kT4cu-0008Rw-R3
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:53:08 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kT4cs-00029N-OJ
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 10:53:08 -0400
Received: by mail-wm1-x341.google.com with SMTP id f21so3475676wml.3
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kecx9Eq9WszlWduQzP7DGV5HfsbbV5bdLDhXP87FxYc=;
 b=J2hzmY8KcutMHVzlCc7BSav5PAJ9metakN8mJRl1qEvztqRR4E+Hzp90M7WeBL3nej
 wGLHLiFB4b9JA4kkYp6iswTX+kgnsSolAUVHQEUvjbGKTYqMMCAgZpVfJeHqgn6WSNs5
 aIqSBJ2wtwf7YR4mHiVW34v1PXG5kRt74ognTfMvId2XeoNvUrsQEOz1259Khiedmj8Q
 LAOvvdOM1HjzUM5v9Bkd5KXnBE0Hcv0vg4H/lW7xEbn3PnVEDFmIl3DEzTEY1ZlEwG4f
 1/tu+rKDbmdGCNTruY0eMuX+dsAhdFIs2gNQQTiOH9+zzvI6pi0AqQfL0Yr6LANVQtyP
 poPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kecx9Eq9WszlWduQzP7DGV5HfsbbV5bdLDhXP87FxYc=;
 b=g2sTdturg/TBuqEFEnK+V2mKbIKtfmdqXVQ6b201IK9vMkfl2mt9lOaqtYVAfpMM9Q
 aYoK2WfaitzU7qa+HZIpu9I8YTR0MQqkMAVeHfZn7bY1G8Rad5ygAXrl7M86icCxWo3Q
 kuszntGlkANhVSrNmJJfohSAyaqCvuXHWvLhAfyMxC0liXo6DmrSxOua/n95WT1KvOo3
 hnIeJzVayRae4bhayMByc1eM9sqHwdp2Wc4pyhEdEjKkUVBtnBUzJldeyPZI9IlVpBqT
 7Ib+V32RZI85Y4BKUem6A3oK+kstexlElrYngC8lzcab1IEscc444ZXEzBHO5J/pCaL6
 jB8Q==
X-Gm-Message-State: AOAM53102mN/4qK5srHgea+UIWUlPTgUdrtAvjjcv7U6NDAoH8G1jjDf
 BCT5eMUt84dXMttsvR461R2SMazorituqR1MBBP4Pw==
X-Google-Smtp-Source: ABdhPJyxKPY/4klDyusPBEatL6yg6osLxkpj5bgTo+VKgBcViYFWi9inBJyIXYAOc9UuAfAHaj0D6Zfxl7zhOCs6UMU=
X-Received: by 2002:a1c:b18a:: with SMTP id a132mr4649906wmf.59.1602773584477; 
 Thu, 15 Oct 2020 07:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201007161940.1478-1-ani@anisinha.ca>
 <0250c54c-ea93-335b-7d37-cbfe79e4086f@amsat.org>
 <CAARzgwxfPKRT0+rr3oBDqUMY2PK-abHH+3oxgG6YLkE1ayzudQ@mail.gmail.com>
In-Reply-To: <CAARzgwxfPKRT0+rr3oBDqUMY2PK-abHH+3oxgG6YLkE1ayzudQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 15 Oct 2020 20:22:53 +0530
Message-ID: <CAARzgwx=K6PDPngxQgdd3Z3aTfo=y5DSEw7WBy0CzKTRQbsBXg@mail.gmail.com>
Subject: Re: [PATCH v2] Adding ani's email as an individual contributor
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::341;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ...

On Mon, Oct 12, 2020 at 8:27 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Request to queue this patch for the next pull.
>
> On Wed, Oct 7, 2020 at 23:25 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>>
>> On 10/7/20 6:19 PM, Ani Sinha wrote:
>> > Ani is an individual contributor into qemu project. Adding my email in=
to the
>> > correct file to reflect so.
>> >
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Thanks!
>>
>> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>> > ---
>> >  contrib/gitdm/group-map-individuals | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > changelog:
>> > v2: removed accidentally added submodule update into this commit
>> > v1: initial patch
>> >
>> > diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group=
-map-individuals
>> > index cf8a2ce367..64cb859193 100644
>> > --- a/contrib/gitdm/group-map-individuals
>> > +++ b/contrib/gitdm/group-map-individuals
>> > @@ -16,3 +16,4 @@ aurelien@aurel32.net
>> >  balaton@eik.bme.hu
>> >  e.emanuelegiuseppe@gmail.com
>> >  andrew.smirnov@gmail.com
>> > +ani@anisinha.ca
>> >

