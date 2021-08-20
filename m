Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C53F31AA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:42:48 +0200 (CEST)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7bT-0008UK-D6
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7Zf-0007ga-PQ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7Zd-0003KD-VP
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629477652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xh+ntQxj9IUrDNj9obPqtNPU9qBbzyC2tKWdfFVxLo=;
 b=IOsKt7bnM6Ua6d8CgDxcnThWTFWOJ2bozJR/betcXVgGoKHLizi2jcYFMjbdt+26m4uZDb
 NjCrybcTAVqf735APk0FRlW5NK6o7TkEFEDBSh6yE86CBctU1ncpairZxm9qh0eESvf05w
 V4IWNapNownaUQ9AbL8wHwNVNSG5Rpg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-dFWuzbdJO22dh4dpbF5WLg-1; Fri, 20 Aug 2021 12:40:51 -0400
X-MC-Unique: dFWuzbdJO22dh4dpbF5WLg-1
Received: by mail-ed1-f72.google.com with SMTP id
 t8-20020aa7db08000000b003c0e65039baso486246eds.4
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xh+ntQxj9IUrDNj9obPqtNPU9qBbzyC2tKWdfFVxLo=;
 b=CU5Rnl6uFG1O8001gwNKgvmqb6S14Ed1N9Ujx/PWU/TCRAtZEr43aDxxvTKzWYceMi
 LXW1qFIfFxJoUHTH+HkcTro4gAQf7bLbDMS39k4h1s2++nhEo9zidCAvEqTEl4k3D8Bs
 jUQp2Ct1q2/hCSOPeltxQyaYU5276NsmAJST72dibfI56FoUqHxWVldVdRiMKJpvYfZ/
 xSPGHmA5PjQFhtKWJXJNqnbkRg8AczxGCgW4RaieBdXxkzLZBZUG+dWnDjtQ0K+ZM5Vg
 M5eeGINNDlY24g0sS9vV2D/ZY204EZxsDcmVoIS1/WaRKR45SNamyj7OfyQ2n3KAOCzc
 tMXw==
X-Gm-Message-State: AOAM533Mfqx6F44RPH8f3zptpa9//CbVsHm3Ex8LYiG2NsIIQN8SR2v7
 +jea2bqCRS/EHsuC/r1JJ2bEUMYC60vO1E2ySZFcCPd4FrGnmAxyqljZjuSMlGsgw1drsjkfv3R
 +nH8m2H/vPHjFj3Y=
X-Received: by 2002:a17:907:76a1:: with SMTP id
 jw1mr22570853ejc.238.1629477649804; 
 Fri, 20 Aug 2021 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysW1CNXI4yrXf1KV7zaaazWQzFaidzYfdk21vXIa39GOU9HPgIl92HYkwdsDBWhTLOtTZS9w==
X-Received: by 2002:a17:907:76a1:: with SMTP id
 jw1mr22570828ejc.238.1629477649660; 
 Fri, 20 Aug 2021 09:40:49 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cn16sm3847148edb.9.2021.08.20.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:40:49 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:40:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation
 failure error message
Message-ID: <20210820184048.4a5294c4@redhat.com>
In-Reply-To: <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 18:00:26 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 8/20/21 5:53 PM, David Hildenbrand wrote:
> > On 20.08.21 17:52, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >> When Linux refuses to overcommit a seriously wild allocation we get:
> >>
> >> =C2=A0=C2=A0 $ qemu-system-i386 -m 40000000
> >> =C2=A0=C2=A0 qemu-system-i386: cannot set up guest memory 'pc.ram': Ca=
nnot
> >> allocate memory
> >>
> >> Slighly improve the error message, displaying the memory size
> >> requested (in case the user didn't expect unspecified memory size
> >> unit is in MiB):
> >>
> >> =C2=A0=C2=A0 $ qemu-system-i386 -m 40000000
> >> =C2=A0=C2=A0 qemu-system-i386: Cannot set up 38.1 TiB of guest memory =
'pc.ram':
> >> Cannot allocate memory
> >>
> >> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >> =C2=A0 softmmu/physmem.c | 4 +++-
> >> =C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 2e18947598e..2f300a9e79b 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -1982,8 +1982,10 @@ static void ram_block_add(RAMBlock *new_block,
> >> Error **errp)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> >> &new_block->mr->align,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 shared, noreserve);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (!new_block->host) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 g_autofree char *size_s =3D
> >> size_to_str(new_block->max_length);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg_errno(errp, errno,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cannot set up guest memor=
y '%s'",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Cannot set up %s of guest=
 memory
> >> '%s'",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_s,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_=
name(new_block->mr));
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_mutex_unlock_ramlist();
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> =20
> >=20
> > IIRC, ram blocks might not necessarily be used for guest memory ... or
> > is my memory wrong? =20
>=20
> No clue, this error message was already here.

it's not only guest RAM, adding size here is marginal improvement,
(it won't help much since it's not exact match to CLI which may use suffixe=
s for sizes)

>=20
> No problem to change s/guest/block/ although.
>=20


