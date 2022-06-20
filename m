Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F65521E4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:10:29 +0200 (CEST)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Jyt-0006Bc-Ki
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3JuZ-0000Iv-4j
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o3JuU-0001Ms-KM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655741153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yehjxcesSBfkxhn+EK6QOHNeQJwn3UQsrihZ3XJAVL0=;
 b=bEKQFdtR8IZEbasjuWPzi31U3vDLKsj3NBVc2tueWNInzc7RINEUR6aZyCR4br6cfYxQMb
 bAvIZDJkmbXl6TsrIVzEHN3JXPjiBw8eJSo8X1L6sjKWbR8zrJgb3Y2ipvvzimQA8dEwSw
 NcfyZrG86eGb4yd5kj+R7trrTsRDYL0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-fZt3mGP3MmGRPbf1BIR6rQ-1; Mon, 20 Jun 2022 12:05:52 -0400
X-MC-Unique: fZt3mGP3MmGRPbf1BIR6rQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b10-20020adf9b0a000000b0021a0c74738aso2652602wrc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yehjxcesSBfkxhn+EK6QOHNeQJwn3UQsrihZ3XJAVL0=;
 b=LH9qU1LJBDyYwGVko+oNWe3FzHT+nVDtLfPHsXLP2fudeGcRqapNHkqjOvgjOnzy+/
 kJxgOE0EmTmQijkVbJ6RMa0o8WGzAyIjEaF6E1zArpC0NSRF3axGGZhYw4ycFerry8nb
 4RV7gdETZRky97hS3efMeYK02mwPSyGJhCcJJb/k18+mSzSN4tWR36N4g0I2iYLF3WPC
 pe4lOjlhCvBfZKLciKKQ05LYayCzyKm3EIgy3xNTxKs9NRRzmHnp+dbut4Epz01sCnyB
 3SYz6a6VkPQkvprusf2vd2DLx4DRxfNWnQk4i5xPOCTJM4OGmb2TRIbYqJ1Q+WBSJm2d
 VzvA==
X-Gm-Message-State: AJIora/cDjV2ikWb6mJczLxMwKjPotOljyiz29xeUn/1VhzJAwj/sINE
 Dt30nBsfJtzq7mLPoR1bA528fLP1YKg4QqEMST3tlTEhKR8jBK6I92/Nkcz0Dn9rRybRxtoZYlF
 bwcgd2imo1UWe+oQ=
X-Received: by 2002:a05:600c:35c2:b0:39b:fa1f:4f38 with SMTP id
 r2-20020a05600c35c200b0039bfa1f4f38mr25293050wmq.22.1655741151234; 
 Mon, 20 Jun 2022 09:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOFuf2sI7qlwnNTwfLdjOvqywL0A+a4pVBwRA3f89M/6DwjdSWPxUYWDRpAaom8RGF9vrRtA==
X-Received: by 2002:a05:600c:35c2:b0:39b:fa1f:4f38 with SMTP id
 r2-20020a05600c35c200b0039bfa1f4f38mr25293020wmq.22.1655741150966; 
 Mon, 20 Jun 2022 09:05:50 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c359300b0039c54bb28f2sm16165029wmq.36.2022.06.20.09.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 09:05:50 -0700 (PDT)
Date: Mon, 20 Jun 2022 18:05:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Liu Jingqi
 <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <20220620180549.787983ec@redhat.com>
In-Reply-To: <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
 <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 20 Jun 2022 17:24:18 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Le 20/06/2022 =C3=A0 15:27, Igor Mammedov a =C3=A9crit Machine (2966MB to=
tal) +=20
> Package P#0
> >>     NUMANode P#2 (979MB)
> >>     Group0
> >>       NUMANode P#0 (980MB)
> >>       Core P#0 + PU P#0
> >>       Core P#1 + PU P#1
> >>     Group0
> >>       NUMANode P#1 (1007MB)
> >>       Core P#2 + PU P#2
> >>       Core P#3 + PU P#3 =20
> > here should be a dis-assembled dump of generated HMAT table =20
>=20
>=20
> Hello
>=20
> Like what I added at the end of=20
> https://github.com/bgoglin/qemu/commit/d9b3f5cb1514adafa644afcc2a363f2dc9=
795a32=20
> ?
yep, only full version including headers.

(install acpica-tools on host and then when
you run your test with 'make V=3D1 check-qtest', it will dump
diff on console for you)

> > + a test case, see tests/qtest/bios-tables-test.c
> > for the process (at tho top) and test examples =20
>=20
>=20
> https://github.com/bgoglin/qemu/commit/643dfa2de8b3e1f5b5675825e5d1be5c93=
a9549c
>=20
> This passes make check V=3D1 but I am really not sure about what I did.=20
> The doc is far from easy for new contributors. Only HMAT matters here,=20

improvements to doc comment are welcome

> but it looks like it wanted some other tables too.

if test can't find a table with data.variant, it defaults to checking
against suffix-less variant if such exists.

you will need to provide all tables for your config that differ from
default one (i.e. not only HMAT one).

also CI runs on memory constrained systems, so limit RAM usage
to possible minimum (see other numa tests)

> Also I don't know=20
> about pc vs piix4 vs q35, what "tcg" is, etc.

your case is not tcg or kvm specific, so put it in generic x86 section
(just like you did) and I'd pick q35 as used machine (though it should
work with pc too)

>=20
> Advices appreciated.
>=20
>=20
> How are we supposed to send patches that contain binary changes?

here is a recent example of adding a new test:
https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg01320.html
https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg01320.html
https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg01320.html

idea of splitting it on several patches is to keeps
series bisect-able
  1. whitelist changes/add empty files if necessary,
  2. add test which will spit warnings and one can see what has been change=
d/added
  3. update expected blobs and remove whitelisting, so any unexpected change
     will trigger test failure

(compile after each step to make sure patches are split correctly)

>=20
> Brice
>=20
>=20
>=20


