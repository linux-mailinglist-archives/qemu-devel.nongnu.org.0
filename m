Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56028E3D16
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 22:21:09 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNjbX-0004RK-PT
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 16:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iNjZn-0001MN-Bq
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 16:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iNjZk-00029P-KP
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 16:19:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58574
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iNjZk-00028x-B9
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 16:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571948353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=b+B83v0zRB6I12sXKPyU3mVVPzsdtTwZy+OySAfczHM=;
 b=TMaNU48sCCKwYndBaarxVXEBuMlCO59LYW8fxvUtauliL99RP2T2cJMPk1txho43ERsUOz
 mRjz5J/hp+rhzXX2KqYLxz801ui2zuFWGKfw2hj9h86Qt3PeUdlsZQC7yfvFCssw5t6MIQ
 mPOGVpbTb0qZWKSAgPgRizdMlK/y79g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-MBLSoEfiMi2MNhJA6HcS_Q-1; Thu, 24 Oct 2019 16:19:12 -0400
Received: by mail-wr1-f70.google.com with SMTP id a6so10583927wru.1
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 13:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3/NErIGUucwYc3OFli2Jtp/EMRKvJL6lrD1kSpP+ss=;
 b=q1+/+BcKkJ9YKD/aN5QDkjCloRRiarE6wJOfg5321R9fXRadbHvKDSl5/dPqvFs/Gb
 AyTnaGj5eM4IHgMnSEfoKNK5+hAd0Nl74yjjaCaKt08dGLwxNm08qBRZj84NBmxoMmPN
 gSTY9V1g5Qo2DYHA/LfpWJ07Wfopx/fbescCSmgxca6h8TyEQOkq+nPpdYskaS8y4Xjj
 RhKKVfuccBwuIBpssOVYbx9ubYPuxRlIj/bFCW1R7w8WjtAYbDK2wtAB/S5zU6ukXw5c
 jdxhUY/Pc1ne2G7wJE0WpO5VM4M/iabIis0pVzOVDwDPZxZvGzcRYZO8ralMlt6DO6pq
 yBiQ==
X-Gm-Message-State: APjAAAXEKpSUBwl35cGWY57OSYUO/f3Amtn7GhaNbWhXVr+Xl0qqHjHM
 7KExHF1SA47xw8b0nnfrzZ+CQ86phOs9SBkh9YXViWKWDfW++cWkV84jVYlwuZEr+FBXG3CSHVD
 pBM4CCxUd/PQMy0k=
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr5410288wrc.202.1571948351281; 
 Thu, 24 Oct 2019 13:19:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRduDf+hJ9Xhj9t7GCWZSWOOq8ja00u2IHFAI20u1bPJGgqbHxIbxfIrOZUOoaQ6C8mvS3tw==
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr5410280wrc.202.1571948350959; 
 Thu, 24 Oct 2019 13:19:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:302c:998e:a769:c583?
 ([2001:b07:6468:f312:302c:998e:a769:c583])
 by smtp.gmail.com with ESMTPSA id e3sm3345845wme.36.2019.10.24.13.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 13:19:10 -0700 (PDT)
Subject: Re: [PULL 03/39] Updated Bulgarian translation (19) - 4.1.0
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
 <1571925835-31930-4-git-send-email-pbonzini@redhat.com>
 <CAL1e-=jtrSuPmVzBAbPipjBu+8-ZAyMzTmFyu_ujDCUzbosq-g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e627caaf-2078-97e6-1fbd-ed4c1e1d2d68@redhat.com>
Date: Thu, 24 Oct 2019 22:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=jtrSuPmVzBAbPipjBu+8-ZAyMzTmFyu_ujDCUzbosq-g@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: MBLSoEfiMi2MNhJA6HcS_Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Alexander Shopov <ash@kambanaria.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/10/19 21:54, Aleksandar Markovic wrote:
>=20
> 24.10.2019. 16.26, "Paolo Bonzini" <pbonzini@redhat.com
> <mailto:pbonzini@redhat.com>> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> From: Alexander Shopov <ash@kambanaria.org <mailto:ash@kambanaria.org>>
>>
>> Signed-off-by: Alexander Shopov <ash@kambanaria.org
> <mailto:ash@kambanaria.org>>
>> Message-Id: <20191019120534.27479-2-ash@kambanaria.org
> <mailto:20191019120534.27479-2-ash@kambanaria.org>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com
> <mailto:pbonzini@redhat.com>>
>> ---
>> =C2=A0po/bg.po | 10 +++++-----
>> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>>
>=20
> How come my "Reviewed-by" is not recorded here? It is not a big deal,
> just curious how it happened.

I had applied it locally before you sent your review.

Paolo


