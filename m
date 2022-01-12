Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58E48BF4A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 08:54:24 +0100 (CET)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7YSc-0004j6-PH
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 02:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7YOd-00026S-22
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7YOZ-0004iE-6K
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641973809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcxWfml6Lvf/SJfXovC+dCTzKx8pqZIZca7Fx5Q1nEI=;
 b=TM8T+CowKZjO04iPM9pxkbRfiFiLNBvhxm7EWupGc44wsU7pKqWIyIKH1DKCLVFJF0h0Sa
 S/r0XsajxHdwpk02kCcZsl235wVVxh8m8SMK9p3qdUpymJpnUaTv0pdo1Ksl4aA0L/efI3
 m30gLs2I86y9jkrrnYR/1xa2gnB69To=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-GJVoc3QhNf6PLLO3Bb441A-1; Wed, 12 Jan 2022 02:50:06 -0500
X-MC-Unique: GJVoc3QhNf6PLLO3Bb441A-1
Received: by mail-lf1-f71.google.com with SMTP id
 i16-20020a056512319000b00425efb1c65eso1094616lfe.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 23:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VcxWfml6Lvf/SJfXovC+dCTzKx8pqZIZca7Fx5Q1nEI=;
 b=hl1RMmE3Z0KX4tXco3wAldg2M772bOI4MbyWrbUZ1C/KQeviWgsy48SpmlcHMllb38
 pPFAEpO11Lz4Eooa1+4nfoC8fVMdNka/k1S62eexjMw9eYxSlunWKp3DY4bT9M80kgJ5
 UV9Wyg2S5/MZmfxAPoKeQq1SM3gGzbK6iOJzC37YC9GU97z/hoeMZUKFjsYh2MMGANuv
 qJiutsDCz3k9YlLAr/ayFowVk5O0Dc0d+KKQn38Of6NJNLTU+E11NsChdU/oiPEBVhOe
 oPdtHv5LRd/oQpkSuEaKgMAZKivT/H8Lug645rG4R0XmFv29FmT95L7oj328U0rcPX9n
 MldA==
X-Gm-Message-State: AOAM533Go+Mvjx3zVC52WCHDarx6MEfYLKN3nEDE9gAIRBzYDDII3+SQ
 tI5bDgWn6sQ2Mg613g2bgb8M1wjNqq+9rS0131nTrk40Ghtzl8BKaGX8r0zPYJwjrRWAr/2frmr
 /exl+o5tMo4twCv94M3TUiGEs0BQzLfc=
X-Received: by 2002:a05:6512:230f:: with SMTP id
 o15mr6332286lfu.348.1641973804980; 
 Tue, 11 Jan 2022 23:50:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0bW67IKM+vGEQ1dI28N2D18EQ673sftzbdTL0IpiR9YJ0kdfnRyl13j42TPdoxoRW60ABM41UFas5BI5a/Ek=
X-Received: by 2002:a05:6512:230f:: with SMTP id
 o15mr6332273lfu.348.1641973804700; 
 Tue, 11 Jan 2022 23:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
 <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
 <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
 <CADO9X9TQq1W+NXm3qEnc06v7mRK8TJefMS7M+T=S5uhdSvfVSg@mail.gmail.com>
In-Reply-To: <CADO9X9TQq1W+NXm3qEnc06v7mRK8TJefMS7M+T=S5uhdSvfVSg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Jan 2022 15:49:53 +0800
Message-ID: <CACGkMEuzEncD72-dyD0QHRxafAQeBF_HTwnEbxn5+RCAbVDT0A@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 2:19 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D1=81=D1=80, 12 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 8:39 AM Jason Wang <ja=
sowang@redhat.com>:
>>
>>
>> =E5=9C=A8 2022/1/12 =E4=B8=8A=E5=8D=886:02, Vladislav Yaroshchuk =E5=86=
=99=E9=81=93:
>> >
>> >
>> > =D0=B2=D1=82, 11 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3., 5:10 AM Jason Wang =
<jasowang@redhat.com>:
>> >
>> >     On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell
>> >     <peter.maydell@linaro.org> wrote:
>> >     >
>> >     > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com>
>> >     wrote:
>> >     > >
>> >     > > The following changes since commit
>> >     df722e33d5da26ea8604500ca8f509245a0ea524:
>> >     > >
>> >     > >   Merge tag 'bsd-user-arm-pull-request' of
>> >     gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
>> >     > >
>> >     > > are available in the git repository at:
>> >     > >
>> >     > > https://github.com/jasowang/qemu.git tags/net-pull-request
>> >     > >
>> >     > > for you to fetch changes up to
>> >     5136cc6d3b8b74f4fa572f0874656947a401330e:
>> >     > >
>> >     > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +080=
0)
>> >     > >
>> >     > > --------------------------------------------------------------=
--
>> >     > >
>> >     > > --------------------------------------------------------------=
--
>> >     >
>> >     > Fails to build on OSX Catalina:
>> >     >
>> >     > ../../net/vmnet-common.m:165:10: error: use of undeclared identi=
fier
>> >     > 'VMNET_SHARING_SERVICE_BUSY'
>> >     >     case VMNET_SHARING_SERVICE_BUSY:
>> >     >          ^
>> >     >
>> >     > This constant only got added in macOS 11.0. I guess that technic=
ally
>> >     > our supported-platforms policy only requires us to support 11
>> >     (Big Sur)
>> >     > and 12 (Monterey) at this point, but it would be nice to still
>> >     be able
>> >     > to build on Catalina (10.15).
>> >
>> >     Yes, it was only supported by the vmnet framework starting from
>> >     Catalyst according to
>> >     https://developer.apple.com/documentation/vmnet?language=3Dobjc.
>> >
>> >
>> > Yes, there are some symbols from macOS >=3D 11.0 new backend
>> > uses, not only this one, ex. vmnet_enable_isolation_key:
>> > https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation=
_key
>> >
>> >     >
>> >     > (Personally I would like Catalina still to work at least for a
>> >     little
>> >     > while, because my x86 Mac is old enough that it is not supported=
 by
>> >     > Big Sur. I'll have to dump it once Apple stops doing security
>> >     support
>> >     > for Catalina, but they haven't done that quite yet.)
>> >
>> >
>> > Sure, broken builds on old macOSes are bad. For this case I think
>> > it's enough to disable vmnet for macOS < 11.0 with a probe while
>> > configure build step. Especially given that Apple supports ~three
>> > latest macOS versions, support for Catalina is expected to end
>> > in 2022, when QEMU releases 7.0.
>>
>>
>> That should be fine.
>>
>>
>> >
>> > If this workaround is not suitable and it's required to support vmnet
>> > in Catalina 10.15 with a subset of available features, it can be done.
>> > But I'll be ready to handle this in approximately two-three weeks only=
.
>> >
>> >     Sure, Vladislav please fix this and send a new version.
>> >
>> >
>> > Quick fix as described above is available in v10:
>> > https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.c=
om/
>>
>>
>> Have you got chance to test that for macOS < 11.0?
>
>
> Yes, tested on Catalina 10.15.Works as expected.

Cool.

Thanks

>
>> Thanks
>>
>>
>> >     Thanks
>> >
>> >     >
>> >     > -- PMM
>> >     >
>> >
>> >
>> >
>> >
>> > --
>> > Best Regards,
>> >
>> > Vladislav Yaroshchuk
>>
>>
>>


