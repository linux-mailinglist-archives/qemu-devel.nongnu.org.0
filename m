Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396B3AFFF9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:11:15 +0200 (CEST)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcR8-0002yy-KO
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvcPC-0000Sg-Cj
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lvcP9-00037N-Dj
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624352949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6vNp6HvL6RI7lOjzM0oSjf+zXQnMi8op30WVz28vPg=;
 b=BVohyIzMGrJPUG2/Y3mBvTbyRwX1sdC3AQ2Jmt4904zdPYoW1BIfDSmCX83N9BshF7nbwQ
 thPmZZgVTWTfJ83bi5QFTsKAsuyiQI+WacBX2o5lX7fvl9Psx/mkVR7peODqFZyv4RR1vA
 hImVd9w/VWTmanUYWRC8ax4yk5e5UvI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-GJH9C_HzNxyEKME9r_xeIw-1; Tue, 22 Jun 2021 05:09:07 -0400
X-MC-Unique: GJH9C_HzNxyEKME9r_xeIw-1
Received: by mail-ej1-f71.google.com with SMTP id
 w22-20020a17090652d6b029048a3391d9f6so1171935ejn.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 02:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=r6vNp6HvL6RI7lOjzM0oSjf+zXQnMi8op30WVz28vPg=;
 b=RuCIA1s6kDWs8vF4b0Oy5drm/ueKHI6mWVI8QnO0VD7FchGCAilB32+538XSktNfpv
 h0eOOCWYum4Vvo/SWOsJNJjBmPz8DH72BF8PpyokufjLA8N82BH570zinn4cPZHbhLVy
 e+5BSNE8/AUgcALsLFi6+1WP1tMJVqMBzfMMr+cMAPYn0OzPRx7EY+IloHjhpcOsCiqG
 uSRAUaeA0Yr0gvoQE0YebhDbhPfUTvJQ003BLcN1b93Ooc4c2Wa8Xel+b1Rj/7hZmmBZ
 qCLmMLc6uhUEJo50UtJQGcmGsTyRKid8Sdxj/UX6wSZuqgWl93f4g8ZBU4+winV6nkpy
 mDIA==
X-Gm-Message-State: AOAM533jVSbl38G3BHsFD6czKTmad/kPVUTwr5J1Zc5aA3n7+ipSla0l
 bYibrRwGyIaI/iBJWx2OQvcHzp1mHZ74Gex7s9lFacuym2HaP/9BCbw4ocPBRbVTKKxNOrcJUQk
 lgEYD01vOyzA2fgk=
X-Received: by 2002:a17:906:616:: with SMTP id
 s22mr2887795ejb.210.1624352946696; 
 Tue, 22 Jun 2021 02:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6+KSQ2YjqHO8wSWZC5EeZkFfVSqS1JSGh1pel3YrVYY1jRdJSKVU5EWI8QQ0rggdbZFA9fQ==
X-Received: by 2002:a17:906:616:: with SMTP id
 s22mr2887772ejb.210.1624352946452; 
 Tue, 22 Jun 2021 02:09:06 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id n13sm11742639edx.30.2021.06.22.02.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 02:09:05 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 4C0E818071E; Tue, 22 Jun 2021 11:09:05 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
In-Reply-To: <YNGe3iiZ103ps36n@redhat.com>
References: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
 <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
 <9157bf00-299f-993d-dd16-62f13e017a3f@redhat.com> <87o8byqpao.fsf@toke.dk>
 <YNGe3iiZ103ps36n@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 22 Jun 2021 11:09:05 +0200
Message-ID: <87im26qn9q.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Jun 22, 2021 at 10:25:19AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Jason Wang <jasowang@redhat.com> writes:
>>=20
>> > =E5=9C=A8 2021/6/22 =E4=B8=8A=E5=8D=8811:29, Yuri Benditovich =E5=86=
=99=E9=81=93:
>> >> On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wro=
te:
>> >>>
>> >>> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =E5=
=86=99=E9=81=93:
>> >>>> Hi Jason,
>> >>>> I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,  Ubu=
ntu,
>> >>>> and Debian - no need permissions to update BPF maps.
>> >>>
>> >>> How about RHEL :) ?
>> >> If I'm not mistaken, the RHEL releases do not use modern kernels yet
>> >> (for BPF we need 5.8+).
>> >> So this will be (probably) relevant for RHEL 9. Please correct me if =
I'm wrong.
>> >
>> > Adding Toke for more ideas on this.
>>=20
>> Ignore the kernel version number; we backport all of BPF to RHEL,
>> basically. RHEL8.4 is up to upstream kernel 5.10, feature-wise.
>>=20
>> However, we completely disable unprivileged BPF on RHEL kernels. Also,
>> there's upstream commit:
>> 08389d888287 ("bpf: Add kconfig knob for disabling unpriv bpf by default=
")
>>=20
>> which adds a new value of '2' to the unprivileged_bpf_disable sysctl. I
>> believe this may end up being the default on Fedora as well.
>>=20
>> So any design relying on unprivileged BPF is likely to break; I'd
>> suggest you look into how you can get this to work with CAP_BPF :)
>
> QEMU will never have any capabilities. Any resources that required
> privileges have to be opened by a separate privileged helper, and the
> open FD then passed across to the QEMU process. This relies on the
> capabilities checks only being performed at time of initial opening,
> and *not* on operations performed on the already open FD.

That won't work for regular map updates either, unfortunately: you still
have to perform a bpf() syscall to update an element, and that is a
privileged operation.

You may be able to get around this by using an array map type and
mmap()'ing the map contents, but I'm not sure how well that will work
across process boundaries.

If it doesn't, I only see two possibilities: populate the map
ahead-of-time and leave it in place, or keep the privileged helper
process around to perform map updates on behalf of QEMU...

-Toke


