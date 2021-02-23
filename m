Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77903228CC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:25:16 +0100 (CET)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUsV-00036R-Kd
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuj97@gmail.com>) id 1lEUqh-00026u-5U
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:23:23 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liuj97@gmail.com>) id 1lEUqe-0001OH-Vt
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:23:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id s23so1584765pji.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 02:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1BLZRK31LTEN+tvRToSnK2HnZ6iSKyV1O0RejdEZOpA=;
 b=Kn4Oh0tVmQpNgFvaVxb/LRGcJYKTsmK+Nb+e2pLKR4rKsVHp7/Db4C9XYg7JXuPQ9H
 u7afRNuVdVsaxrFYipAF8lrF8FrO4el7QFAIj8EZFp2e3lw43+36Lcb/zp/rDBYbqm3p
 eKXbV4xLSWhQxPlBWNQ/fWKNTvTLlQhyqNW3rzpMpbIHmJFAeCUp1CGjpgIqo4tTp7KW
 sAFh5rPi2bm8Gh81Zv8U1n53jbgkIdp5klfjMTuuZrYb0COloKqF4LX+WcWn+ddQXkP6
 pgXHAzaymhQG+brW2jjRXq5EBz633KReZlqJn+y8WN0JgCcnyA7U5roD5HdpXgSYpAeX
 Uu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1BLZRK31LTEN+tvRToSnK2HnZ6iSKyV1O0RejdEZOpA=;
 b=uBX+UM8nUqGKmb/K4HVdLxCof1x3OEszFcRh+Uit5dhSs1l1wThdX4lL0zVMgxitbM
 DpDcVusEEhZpW6AveWUUkrWJmxSSvDMbWnbDI8Z0u1NU0KD9LCiBUYK4UBUvze0pDwHj
 63cDoiTipaybp2s+dff3Tx30vihsgj+mU/apJzS0s+tUYhcaLskE6FlOXWDktVDNlfB2
 E5eaDtfb1nEcNp99J+AivvYlEjU2TCX6aaLKfmF++UfN3ujxdMUFvcc06MfXNhzBLbeq
 /e/6kRnGVqM5otzj+fSng5IcXLeVeUADOwG6ixSLCflY5q+okBxDB8MSy5QRoDxhQJ9+
 hBuQ==
X-Gm-Message-State: AOAM5325YSdQZ4D2edEu5Zcy9Yec33gX2PLqK1/1rvD/oGdfV+k5h4c7
 CVdra5FmZRcbt1cn6kJVDZM=
X-Google-Smtp-Source: ABdhPJxVg2evK4ifLe3bQoT7r+HnyOxRwcbYrCtn2OXJvIbQzTFtlXRjwZEfIthURDRhs9AG2E/wCQ==
X-Received: by 2002:a17:902:d647:b029:e0:8ee:d8ac with SMTP id
 y7-20020a170902d647b02900e008eed8acmr1913364plh.4.1614075798773; 
 Tue, 23 Feb 2021 02:23:18 -0800 (PST)
Received: from [30.240.113.216] ([205.204.117.108])
 by smtp.gmail.com with ESMTPSA id y1sm3739641pjr.3.2021.02.23.02.23.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Feb 2021 02:23:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [Rust-VMM] vhost reply_ack negotiation (a.k.a differences in
 vhost-user behaviour with libvhost-user and vhost-user-backend.rs)
From: Jiang Liu <liuj97@gmail.com>
In-Reply-To: <YDOxOv4w3J68b+uo@work-vm>
Date: Tue, 23 Feb 2021 18:23:08 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2467EF1-ECBA-4A9F-BD6C-C0DE59DADB3E@gmail.com>
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
 <871rd86xrf.fsf@linaro.org> <YDOxOv4w3J68b+uo@work-vm>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=liuj97@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just found this thread in my email junk box:(
I do have found some bugs in the vhost_rs crate, related to handle the =
need_reply flag.
But that bug only affects virtio-fs fs_map operations.
Please refer to:
https://github.com/rust-vmm/vhost/pull/19
=
https://github.com/rust-vmm/vhost/pull/19/commits/a2c5a4f50e45ae1ab78622dd=
a9a3f861bd43a17e

Thanks,
Gerry

> On Feb 22, 2021, at 9:27 PM, Dr. David Alan Gilbert =
<dgilbert@redhat.com> wrote:
>=20
> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>>=20
>> Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
>>=20
>>> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>>>> Hi,
>>>>=20
>>>> I finally got a chance to get down into the guts of vhost-user =
while
>>>> attempting to port my original C RPMB daemon to Rust using the
>>>> vhost-user-backend and related crates. I ended up with this hang =
during
>>>> negotiation:
>>>>=20
>>>> startup
>>>>=20
>>>> vhost_user_write req:1 flags:0x1
>>>> vhost_user_read_start
>>>> vhost_user_read req:1 flags:0x5
>>>> vhost_user_backend_init: we got 170000000
>>=20
>> GET_FEATURES
>>=20
>>>> vhost_user_write req:15 flags:0x1
>>>> vhost_user_read_start
>>>> vhost_user_read req:15 flags:0x5
>>>> vhost_user_set_protocol_features: 2008
>>>> vhost_user_write req:16 flags:0x1
>>>> vhost_user_write req:3 flags:0x1
>>>> vhost_user_write req:1 flags:0x1
>>>> vhost_user_read_start
>>>> vhost_user_read req:1 flags:0x5
>>>> vhost_user_write req:13 flags:0x1
>>>>=20
>>>> kernel initialises device
>>>>=20
>>>> virtio_rpmb virtio1: init done!
>>>> vhost_user_write req:13 flags:0x1
>>>> vhost_dev_set_features: 130000000
>>>> vhost_user_set_features: 130000000
>>=20
>> SET_FEATURES
>>=20
>>>> vhost_user_write req:2 flags:0x1
>>>> vhost_user_write req:5 flags:0x9
>>>> vhost_user_read_start
>>>>=20
>> <snip>
>>>>=20
>>>> - Should QEMU have preserved =
VhostUserVirtioFeatures::PROTOCOL_FEATURES
>>>>  when doing the eventual VHOST_USER_SET_FEATURES reply?
>>>>=20
>>>> - Is vhost.rs being to strict or libvhost-user too lax in =
interpreting
>>>>  the negotiated features before processing the ``need_reply`` [Bit =
3]
>>>>  field of the messages?
>>>=20
>>> I think vhost.rs is being correctly strict - but there would be no =
harm
>>> in it flagging that you'd hit an inconsistency if it finds a =
need_reply
>>> without the feature.
>>=20
>> But the feature should have been negotiated. So unless the slave can
>> assume it is enabled because it asked I think QEMU is in the wrong by
>> not preserving the feature bits in it's SET_FEATURES reply. We just =
gets
>> away with it with libvhostuser being willing to reply anyway.
>=20
> Oh I wasn't trying to reply to that bit; I can never remember how the
> vhost/virtio feature bit negotiation works...
>=20
> Dave
>=20
>>>=20
>>>> - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD =
included
>>>>  in the "list of the ones that do" require replies or do they only
>>>>  reply when REPLY_ACK has been negotiated as the ambiguous =
"seealso::"
>>>>  box out seems to imply?
>>>=20
>>> set_mem_table gives a reply when postcopy is enabled (and then qemu
>>> replies to the reply!) but otherwise doesn't.
>>> (Note there's an issue opened for .rs to support ADD_MEM_REGION
>>> since it's a lot better than SET_MEM_TABLE which has a fixed size =
table
>>> that's small).
>>=20
>> Thanks for the heads up.
>>=20
>>>=20
>>> Dave
>>>=20
>>>> Currently I have some hacks in:
>>>>=20
>>>> https://github.com/stsquad/vhost/tree/my-hacks
>>>>=20
>>>> which gets my daemon booting up to the point we actually need to do =
a
>>>> transaction. However I won't submit a PR until I've worked out =
exactly
>>>> where the problems are.
>>>>=20
>>>> --=20
>>>> Alex Benn=C3=A9e
>>>>=20
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>>=20
> --=20
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
>=20
> _______________________________________________
> Rust-vmm mailing list
> Rust-vmm@lists.opendev.org
> http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm


