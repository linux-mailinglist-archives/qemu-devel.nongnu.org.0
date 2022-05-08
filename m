Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5651EE03
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 16:26:06 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnhrJ-0004Gh-6h
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 10:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnhpJ-0003Nn-53
 for qemu-devel@nongnu.org; Sun, 08 May 2022 10:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnhpG-0002pD-Aw
 for qemu-devel@nongnu.org; Sun, 08 May 2022 10:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652019837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNx04GETZuqF6U1OZ14pdSJTXp18G88Rak8VON6NDVI=;
 b=JPrQS98i+nW6iNmGN3RpPJ++QTJLeOddLqBn4EeqsC/t7LteOroTD5tSUakNCjp92ebJ04
 gGebJSiEIKt5IMOfCwMQSyiVQPcDEChW+U08thnKQ7KOQ+AsJUx/oj/R/AKD3/HICqFuZ5
 y2vQNeeDR2Tkcee3J3rTrSiAFWe00cc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-8GE0gN66OKW2cCrBlzgRwg-1; Sun, 08 May 2022 10:23:55 -0400
X-MC-Unique: 8GE0gN66OKW2cCrBlzgRwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so3256028wmh.9
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 07:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=VNx04GETZuqF6U1OZ14pdSJTXp18G88Rak8VON6NDVI=;
 b=TRlUdHcoKtiJGzKfgjrvMy9kLaCA9vkHGP46HiVSQBhboH065ADcE96m/SKMJAn1/d
 k4SVMtBourYGTkz76bkVWdZ1zu2FXyt5ZMB1AWt8bjnTjdkg9nLisnYPXvkvnL/DYHw6
 3Jkh8rn3x+ES3UVn7eFrVfaokZA5Vvp8Wz1cdpNeu4hVjomUsoDGXabavkzkdVKgN8nk
 DBe/bZQDsoq/Jf8elH+bOHv3qmizh4Ov3/UIM+GAfMqeT4bPG4bMdSAeowyrTH3mNf1H
 cd6AHvdkXpqEZq14lFYD18Bpx6+Rryhnc6M1LHSX7g8D2QSS16xy9okxGmykr3QlAARG
 8p4A==
X-Gm-Message-State: AOAM533cWdanJc8PGMJZw+sFQfxc5M3t3liaHFt0vgpRCvNBT67wlp2h
 u0jghJjwwzSzPLW7swNRluaPx6gyOrsjPytevbQOgOt1xKBzhinWv51D2Gs4sTStA4Jq3+qPPwv
 ldwmkkHEy4Q4JWlo=
X-Received: by 2002:a05:6000:1acd:b0:20c:726a:3840 with SMTP id
 i13-20020a0560001acd00b0020c726a3840mr10032174wry.507.1652019834363; 
 Sun, 08 May 2022 07:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSfIg5CJ3B0CsItenLgiCB4dETOT3jHe0y6ZMPyMRokwAhCUsqNPCQJaJsyYXP5wNBaRW+vw==
X-Received: by 2002:a05:6000:1acd:b0:20c:726a:3840 with SMTP id
 i13-20020a0560001acd00b0020c726a3840mr10032154wry.507.1652019834062; 
 Sun, 08 May 2022 07:23:54 -0700 (PDT)
Received: from [127.0.0.1] (93-43-160-190.ip92.fastwebnet.it. [93.43.160.190])
 by smtp.gmail.com with ESMTPSA id
 bg9-20020a05600c3c8900b00394755b4479sm9227781wmb.21.2022.05.08.07.23.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 May 2022 07:23:53 -0700 (PDT)
Date: Sun, 08 May 2022 16:23:44 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
CC: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
In-Reply-To: <YnPz5NMDZkeKaaV+@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
 <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
 <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
 <CAFn=p-Zfonw462fKT=TBKCRLbZ2xPUwsK-SeRJhgfxYwNRJEsg@mail.gmail.com>
 <ca23e571-354e-1251-412d-5cae1741aa61@redhat.com>
 <YnPz5NMDZkeKaaV+@redhat.com>
Message-ID: <6A22A553-7E10-4044-962A-8A09A7BE7BF2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

If we want to provide an installable rpm in Fedora then yes; but we can lea=
ve distribution to pypi and use a bundled copy in the virtual environment t=
hat is used to run tests=2E

Paolo

Il 5 maggio 2022 17:57:24 CEST, "Daniel P=2E Berrang=C3=A9" <berrange@redh=
at=2Ecom> ha scritto:
>On Thu, May 05, 2022 at 05:50:00PM +0200, Paolo Bonzini wrote:
>> On 5/5/22 16:13, John Snow wrote:
>> >=20
>> >     I would rather keep python/qemu/qmp as a submodule for a longer t=
ime,
>> >     and still go through a virtual environment that installs it toget=
her
>> >     with its pip dependencies=2E
>> >=20
>> >=20
>> > A small headache relating fixes to both locations, but if you'd like =
to
>> > see it to prove that the installation mechanism works in general, the=
n
>> > OK=2E I'm willing to deal with the pain until the next release to let=
 us
>> > go through a testing cycle=2E Reluctantly=2E Maybe=2E
>> >=20
>> > I'm assuming you mean as a subpackage and not a [git] submodule=2E If=
 you
>> > do mean git, then =2E=2E=2E uh=2E That might be messy=2E
>>=20
>> Yeah, I meant a git submodule in qemu=2Egit=2E=2E=2E  It would also be =
the easiest
>> way to build a subpackage in Fedora, since it would be part of the QEMU
>> tarballs=2E
>
>When qemu=2Eqmp is uploaded to PyPi, then Fedora packaging guidelines on
>unbundling will expect us to create a dedicated python-qemu=2Eqmp src=2Er=
pm,
>and use that, not anything QEMU might bundle=2E
>
>With regards,
>Daniel


