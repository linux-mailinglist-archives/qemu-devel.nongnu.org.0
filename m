Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5669C53515D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 17:24:32 +0200 (CEST)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuFLi-0002nj-FI
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 11:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuFHx-00005o-1H
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuFHs-0003tf-ER
 for qemu-devel@nongnu.org; Thu, 26 May 2022 11:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653578430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19ErBqO1IhEPdCawrnoGXlI6PVvd1c1SkxTjLIosSWw=;
 b=MVf26+epA4su63U3dkQru26mvjLo/o7VTNhf45/4qiwpjhAQP+hvIe2oD7pnI3deXSXZhk
 lIMeY9fjTQFhZnE2ElpfakVsd4071/XlYzlaOk4icqWAV23+vJ3PoPMoezeckyXQuQUQGY
 vmJUCCeGYnIkfXEP8hqizXVk09JeJPc=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-qzh-vdiMOsi4M4F5UK-5tg-1; Thu, 26 May 2022 11:20:29 -0400
X-MC-Unique: qzh-vdiMOsi4M4F5UK-5tg-1
Received: by mail-vk1-f197.google.com with SMTP id
 i3-20020a1fea03000000b00356e9f49628so176892vkh.18
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=19ErBqO1IhEPdCawrnoGXlI6PVvd1c1SkxTjLIosSWw=;
 b=QzyhSK7ij8JYl2SPJdT4HBYsafNKvjif4euVPiO0QWsdDLpipYPhGI/oGsVXmJ3PfI
 Sb7jtdIhpz5jJ/nsKWBsxMmsRTNVZi+U5C2itlefD1+VXmyrRCgevVm25XL/XzwDrV6I
 TFSopzvkER3TJw0M/Rv0N9dNbAo3XwSNyV82xOUjwymKrg/9+jONLaKdjvdDOoXwQFvz
 lBTecim+OWuG//H/8E40HQJ++stWR2hURwarrQ5OINHFGnDbbx5yZk4SRNr1u8WXmXpy
 /ZT0flwyRRg+lQdc7ZbbTxe7Wc2p+oKkD1TnyrszxkiB/Z5vo3XxeiwDFm35IwAnO85R
 XvvA==
X-Gm-Message-State: AOAM533kQNfQbKtA11ZebiYG2bp1hwIVVlPXgc+6WMeVgOdt21iJ2ctV
 zOZ1Gq//NCJ5uB/nORhTkmuC3is1cIECjRPg7fATp5fZ1PxhTfm3FkXj3/Ep03lWTPBcsry49l7
 XMB5DxNXgDbZKb9R2OZJDsqs03b/ru+g=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr15759774vsa.38.1653578428673; 
 Thu, 26 May 2022 08:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXGZeiHL0lrs1+xWvJUd4Pb/1DOqPFNEDxPqepIfSQisTeNPz1suBLRr/rJo+CddggfvczYfpWyKdipH0fLo0=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr15759765vsa.38.1653578428508; Thu, 26
 May 2022 08:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220526002512.1585246-1-jsnow@redhat.com>
 <Yo8yMoNjKsjZROQK@redhat.com>
 <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
In-Reply-To: <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 11:20:18 -0400
Message-ID: <CAFn=p-a7k+Dw9OF5qQH8Eizj6CS-5osc8MRVdxQMTSnbBL45_A@mail.gmail.com>
Subject: Re: [PATCH] iotests: fix source directory location
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Thu, May 26, 2022 at 10:21 AM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Thu, May 26, 2022, 3:54 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>
>> On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:
>> > If you invoke the check script from outside of the tests/qemu-iotests
>> > directory, the directories initialized as source_iotests and
>> > build_iotests will be incorrect.
>> >
>> > We can use the location of the source file itself to be more accurate.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> > ---
>> >  tests/qemu-iotests/testenv.py | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py
>> > index a864c74b123..9b0f01e84db 100644
>> > --- a/tests/qemu-iotests/testenv.py
>> > +++ b/tests/qemu-iotests/testenv.py
>> > @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str, a=
iomode: str,
>> >              self.build_iotests =3D os.path.dirname(os.path.abspath(sy=
s.argv[0]))
>> >          else:
>> >              # called from the source tree
>> > -            self.source_iotests =3D os.getcwd()
>> > +            self.source_iotests =3D str(Path(__file__, '..').resolve(=
))
>>
>> Path(__file__).parent
>>
>> >              self.build_iotests =3D self.source_iotests
>> >
>> > -        self.build_root =3D os.path.join(self.build_iotests, '..', '.=
.')
>> > +        self.build_root =3D str(Path(self.build_iotests, '../..').res=
olve())
>>
>> Path(self.build_iotests).parent.parent
>>
>> to be portable
>
>
> With windows? I think Path() is meant to be a fully portable class as-is,=
 but I'll double-check my assumption. I use ".." elsewhere in code already =
checked in, so if it's a problem I ought to fix it everywhere.

Found a Windows box, it works there too. Good enough?

--js


