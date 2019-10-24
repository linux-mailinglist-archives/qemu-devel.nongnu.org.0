Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587AFE3872
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:43:44 +0200 (CEST)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNgD8-0001Lc-UI
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iNfZD-0007Cs-9m
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iNfZB-0000Jx-5c
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:02:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iNfZB-0000Jm-09
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:02:25 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DCCB85540
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 16:02:23 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id a6so10264770wru.1
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 09:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pXccublvlI0yhiIlEBx7+O6uD7TwgTWoLdy4DphVr1k=;
 b=aNWi2nw23wuQYZv4ZX+QkWc02BZOZ9d9L3TxitiGehIupnlNkYBaq0UD7/ZlGA2dgQ
 uDHcIXXBnryzPCbY2n/QF4HhDvP1B2IaVcdjTA2EL5FHWvZzlrpytooQ8i64BoqEOozl
 w5AovQgLoOzzTpCesomb6Mib/3+7/FycsmguMaA1keJ4X0Hjn7b+yH1nkH2jJ/rk2khG
 NjICyGs47iRIjxC72OtMHswNFQpeq4gEWeE0mNV3HMyaYJfQONgpyvwv7qG+RanUOh0m
 hr2Ws3/3eiEjkIv15oGX2Ga8zh6pxJ0WAov7mKJQZe4WDIt1jEt+VECKOVcR2Avrj0xh
 eMGg==
X-Gm-Message-State: APjAAAXJnIAkMdocyI44uHUS8Qj+63nMcwAbinHb1X1YoeuLLeOL/qzF
 X5z7yT7ST+KmZsn3Yu14M1WUaP1AiNSRzR29/4uS5lzuPYMVuWP96tCr61Ru2Ell0jTgw2TdYHa
 7hEyMXIp9Mj2P6Qs=
X-Received: by 2002:adf:c402:: with SMTP id v2mr4837313wrf.323.1571932941557; 
 Thu, 24 Oct 2019 09:02:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDp6/aFR0UVwCh9b623ivPcJnz6RG7+5H23vFhUB8iqLAcvcP28Zgmofz1Nv9fPCdq+1sX7Q==
X-Received: by 2002:adf:c402:: with SMTP id v2mr4837283wrf.323.1571932941220; 
 Thu, 24 Oct 2019 09:02:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:302c:998e:a769:c583?
 ([2001:b07:6468:f312:302c:998e:a769:c583])
 by smtp.gmail.com with ESMTPSA id c144sm3454417wmd.1.2019.10.24.09.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 09:02:20 -0700 (PDT)
Subject: Re: [PULL 35/39] audio: fix missing break
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
 <1571925835-31930-36-git-send-email-pbonzini@redhat.com>
 <ec80810d-3821-9a30-5f52-c36fd2ba8845@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <af8e8e61-a45c-0d28-cfe3-80215fa9ca1f@redhat.com>
Date: Thu, 24 Oct 2019 18:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec80810d-3821-9a30-5f52-c36fd2ba8845@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/10/19 17:14, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/24/19 4:03 PM, Paolo Bonzini wrote:
>> Reported by Coverity (CID 1406449).
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> I reviewed this one.

Oops, sorry.  I must have lost your R-b when moving the patch from one
computer to the other.

Paolo

>> ---
>> =C2=A0 audio/paaudio.c | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/audio/paaudio.c b/audio/paaudio.c
>> index df541a7..55a91f8 100644
>> --- a/audio/paaudio.c
>> +++ b/audio/paaudio.c
>> @@ -385,6 +385,7 @@ static pa_stream *qpa_simple_new (
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map.map[5] =3D =
PA_CHANNEL_POSITION_REAR_RIGHT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map.map[6] =3D =
PA_CHANNEL_POSITION_SIDE_LEFT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map.map[7] =3D =
PA_CHANNEL_POSITION_SIDE_RIGHT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dolog("Internal=
 error: unsupported channel count %d\n",
>> ss->channels);
>>


