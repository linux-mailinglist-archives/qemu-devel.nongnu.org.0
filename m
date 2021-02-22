Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED4321890
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:18 +0100 (CET)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBG5-0001On-5R
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEBCd-0007nR-9Q
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:24:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEBCa-0004jR-Hu
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:24:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id a207so14347829wmd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LPnQD5pP/iEURNGtaVBlxBG671gzwlnLFwRdqRRGlF8=;
 b=hV8I9l9wRO4e8B/hjS7qLyCJmr69cPo8+mYtLoGKATXJHiKuqp0Xd1aPi8l8Ffvau9
 jr40LN2y/0lNpkPtVlxjWJcg0zojKFxLKl4+itczIcyWBmfn6WKefIucBtdLIxivbj+Q
 UAIJMJUlK+hibLPfU9jIeBN0zb/H7GYy8NhESA1JeW19Wu6d28DqPQrQP7D6BN3BPh4C
 ukO+Ptx4vxw47U3oBHqR0g6uqzE0Qcgl18Xr7voPujz2llZ0H9weVCJ5ahaFEEAltq5k
 X0M6ENW62rds78p4GlZ0LAJPUSc5jLVN1KxN1UscN1OYkao7CXaOQbizh7a07jwlIzPc
 M9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LPnQD5pP/iEURNGtaVBlxBG671gzwlnLFwRdqRRGlF8=;
 b=UfVRJMzjwBzbb9pPQWheg9NlBZNXRcJPjPF+RN5AhauaJXxToYAgH+6iX/eDkftBk+
 UuJi6erb5zHyTZ3WZ+hhIzymJcWhcdqTkX7uYBa0cJ0fn1pA+emaOe9kajG7k8m35sNY
 2yw/L2+bzMpSL9W5a0P2vzvQJEsiMP9ORQrIIYD8+W4Jh/zQraGz91C0Us+v8VJEjJWo
 B7w8OnKkt0IbKum31F2KesLO41Fu43JP1mpvCKDjGPR4EQl5qs5RS7LmYMv3V7S0jpjS
 1j9tm2LIhNLCBvNluEClqA2yF0lSKScbM4uE3jOe7egbKaDZQ53EkLQVyUvBoABpe0xH
 I2vA==
X-Gm-Message-State: AOAM5309rApwJ/n1dkH4m2sMrYoTNNF/NXUkE9ta1RVG9FV53ByyrBAU
 /6h3qGAjjFAZwYsoaiibrPS/SA==
X-Google-Smtp-Source: ABdhPJyrrJ11xs6fRaCzmptMBvx2kyL0PLmsTCRMakV2CrBQa60Fn0/YwmeFPVhKnoCdtl3cL3K5LA==
X-Received: by 2002:a1c:5a08:: with SMTP id o8mr19947048wmb.60.1614000277905; 
 Mon, 22 Feb 2021 05:24:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm17682155wmg.37.2021.02.22.05.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:24:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 148101FF7E;
 Mon, 22 Feb 2021 13:24:36 +0000 (GMT)
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Date: Mon, 22 Feb 2021 13:21:04 +0000
In-reply-to: <YDOsP1pWUS+hXiBX@work-vm>
Message-ID: <871rd86xrf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dr. David Alan Gilbert <dgilbert@redhat.com> writes:

> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>> Hi,
>>=20
>> I finally got a chance to get down into the guts of vhost-user while
>> attempting to port my original C RPMB daemon to Rust using the
>> vhost-user-backend and related crates. I ended up with this hang during
>> negotiation:
>>=20
>>   startup
>>=20
>>   vhost_user_write req:1 flags:0x1
>>   vhost_user_read_start
>>   vhost_user_read req:1 flags:0x5
>>   vhost_user_backend_init: we got 170000000

GET_FEATURES

>>   vhost_user_write req:15 flags:0x1
>>   vhost_user_read_start
>>   vhost_user_read req:15 flags:0x5
>>   vhost_user_set_protocol_features: 2008
>>   vhost_user_write req:16 flags:0x1
>>   vhost_user_write req:3 flags:0x1
>>   vhost_user_write req:1 flags:0x1
>>   vhost_user_read_start
>>   vhost_user_read req:1 flags:0x5
>>   vhost_user_write req:13 flags:0x1
>>=20
>>   kernel initialises device
>>=20
>>   virtio_rpmb virtio1: init done!
>>   vhost_user_write req:13 flags:0x1
>>   vhost_dev_set_features: 130000000
>>   vhost_user_set_features: 130000000

SET_FEATURES

>>   vhost_user_write req:2 flags:0x1
>>   vhost_user_write req:5 flags:0x9
>>   vhost_user_read_start
>>=20
<snip>
>>=20
>>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATURES
>>    when doing the eventual VHOST_USER_SET_FEATURES reply?
>>=20
>>  - Is vhost.rs being to strict or libvhost-user too lax in interpreting
>>    the negotiated features before processing the ``need_reply`` [Bit 3]
>>    field of the messages?
>
> I think vhost.rs is being correctly strict - but there would be no harm
> in it flagging that you'd hit an inconsistency if it finds a need_reply
> without the feature.

But the feature should have been negotiated. So unless the slave can
assume it is enabled because it asked I think QEMU is in the wrong by
not preserving the feature bits in it's SET_FEATURES reply. We just gets
away with it with libvhostuser being willing to reply anyway.

>
>>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
>>    in the "list of the ones that do" require replies or do they only
>>    reply when REPLY_ACK has been negotiated as the ambiguous "seealso::"
>>    box out seems to imply?
>
> set_mem_table gives a reply when postcopy is enabled (and then qemu
> replies to the reply!) but otherwise doesn't.
> (Note there's an issue opened for .rs to support ADD_MEM_REGION
> since it's a lot better than SET_MEM_TABLE which has a fixed size table
> that's small).

Thanks for the heads up.

>
> Dave
>
>> Currently I have some hacks in:
>>=20
>>   https://github.com/stsquad/vhost/tree/my-hacks
>>=20
>> which gets my daemon booting up to the point we actually need to do a
>> transaction. However I won't submit a PR until I've worked out exactly
>> where the problems are.
>>=20
>> --=20
>> Alex Benn=C3=A9e
>>=20


--=20
Alex Benn=C3=A9e

