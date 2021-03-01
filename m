Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29C327DB8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:57:42 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhBF-0002nB-H9
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGh9e-0001S6-Mc
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:56:02 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGh9b-0000W6-Mq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:56:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e10so15596850wro.12
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6I8RvMx6NvzhNQeTvBVvkjiamPIcmoH3hu9b0ro6O8Q=;
 b=RuHS4gpNiO9hVxBkK2Ee1i/6cuU34OH8etYvM/CyGdPxCfm5+3lMWtiLxvPXXC6+AN
 P5vsLTsztoT3qrtfKCOVgEMcUUBnlq/+XNcFFm+64p7pEgcuju4TGOYGgQgOC6VDjEOl
 9V0R5JXiXmLZVxaB1K2bBV52q/E6hmFdeFdXJevPDay9AaObHAxSgw2xSuxiNTAk+2tD
 AyXEQRycz+ac1JHx5PTAgIDR4veoDkZ3eGoSPxi8kD8jBmgBg/LB16emf/TcjiFoNqT+
 Y4tp3ufdFf1rAGn6JWenmmfvKN+EY5+ljTNmZcGKT9vXleUvtZjqJTZ1W5PA1IhQknRg
 OjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6I8RvMx6NvzhNQeTvBVvkjiamPIcmoH3hu9b0ro6O8Q=;
 b=llGXqlIxVn+hZ/YrRZ2Paa/otMcltQ0CDOWu0dgdpJFo/YI2eg0FFGoZxp0y6mZYVO
 ZR5n9S18uXnmvVZQUx9QmJfSDo86kkGi3koTFYAM43DcQAPyW7V+jTq5VZd1iwGBw+LN
 sHb8WI+kD5f4DxXm1EhMPMpwd15Y6U97HTb9kkX6ezPVH9n4G7YyzuYzaeEB/PwuC167
 6djV3YK1clb11oSGcvsR48Y8tLCm3uiSBOQ8pICgrcYMIuFkJQyul2iLoWH4dr2g/PPH
 wErAtjwDbao5J0ky1Do9znRRWFTGh7z8JXo/ZfIv/8jSk09zl+wcqTM+i8n+BYB/xhJ9
 9QyA==
X-Gm-Message-State: AOAM5315bO1yZV0i1UHP4ODo0LkVne3jUgdTI6Ubs0iih4cVjyxbZv92
 FtPyW+53Kab93MvhAo82OU0Qeg==
X-Google-Smtp-Source: ABdhPJzFks7+0MB6pgVVagjaYDzqI018WXXOAU/2R2XjwQ+cg2tijZD3oDFmv/UyWzyCME60lLrUDA==
X-Received: by 2002:adf:a703:: with SMTP id c3mr16162617wrd.379.1614599758016; 
 Mon, 01 Mar 2021 03:55:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p18sm15635581wro.18.2021.03.01.03.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:55:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71C901FF7E;
 Mon,  1 Mar 2021 11:55:56 +0000 (GMT)
References: <20210226111619.21178-1-alex.bennee@linaro.org>
 <YDzKhnQa+LS01yTN@stefanha-x1.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-dev] [VHOST USER SPEC PATCH] vhost-user.rst: add
 clarifying language about protocol negotiation
Date: Mon, 01 Mar 2021 11:38:47 +0000
In-reply-to: <YDzKhnQa+LS01yTN@stefanha-x1.localdomain>
Message-ID: <87czwjjdf7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S.
 Tsirkin" <mst@redhat.com>, viresh.kumar@linaro.org, qemu-devel@nongnu.org,
 rust-vmm@lists.opendev.org, Jiang Liu <gerry@linux.alibaba.com>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, Feb 26, 2021 at 11:16:19AM +0000, Alex Benn=C3=A9e wrote:
>> In practice the protocol negotiation between vhost master and slave
>> occurs before the final feature negotiation between backend and
>> frontend. This has lead to an inconsistency between the rust-vmm vhost
>> implementation and the libvhost-user library in their approaches to
>> checking if all the requirements for REPLY_ACK processing were met.
>> As this is purely a function of the protocol negotiation and not of
>> interest to the frontend lets make the language clearer about the
>> requirements for a successfully negotiated protocol feature.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Jiang Liu <gerry@linux.alibaba.com>
>> ---
>>  docs/interop/vhost-user.rst | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> I had difficulty understanding this change and its purpose. I think it's
> emphasizing what the spec already says: VHOST_USER_SET_PROTOCOL_FEATURES
> can be sent after VHOST_USER_F_PROTOCOL_FEATURES was reported by
> VHOST_USER_GET_FEATURES.

Well and also the protocol feature is considered negotiated after that
sequence and doesn't require the feature bit to also be negotiated. I
think I read the spec properly when I submitted:

  https://github.com/rust-vmm/vhost/pull/24

however it was implied rather than explicit. I was hoping to make that
clearer but obviously I've failed with this iteration.

> BTW Paolo has just sent a patch here to use the terms "frontend" and
> "backend" with different meanings from how you are using them:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg08347.html

Yeah we have mixed up terminology - the relationship between QEMU and a
vhost-user daemon is separate from the relationship between a VirtIO
device driver (in the guest) and the device implementation (as done by
the combination of QEMU and the vhost-user daemon).

I wish we had clearer terminology sections throughout both specs.

>
>> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> index d6085f7045..3ac221a8c7 100644
>> --- a/docs/interop/vhost-user.rst
>> +++ b/docs/interop/vhost-user.rst
>> @@ -301,12 +301,22 @@ If *slave* detects some error such as incompatible=
 features, it may also
>>  close the connection. This should only happen in exceptional circumstan=
ces.
>>=20=20
>>  Any protocol extensions are gated by protocol feature bits, which
>> -allows full backwards compatibility on both master and slave.  As
>> -older slaves don't support negotiating protocol features, a feature
>> +allows full backwards compatibility on both master and slave. As older
>> +slaves don't support negotiating protocol features, a device feature
>>  bit was dedicated for this purpose::
>>=20=20
>>    #define VHOST_USER_F_PROTOCOL_FEATURES 30
>>=20=20
>> +However as the protocol negotiation something that only occurs between
>
> Missing "is". Shortening the sentence fixes that without losing clarity:
> s/something that/negotiation/
>
>> +parts of the backend implementation it is permissible to for the master
>
> "vhost-user device backend" is often used to refer to the slave (to
> avoid saying the word "slave") but "backend" is being used in a
> different sense here. That is confusing.
>
>> +to mask the feature bit from the guest.
>
> I think this sentence effectively says "the master MAY mask the
> VHOST_USER_F_PROTOCOL_FEATURES bit from the VIRTIO feature bits". That
> is not really accurate since VIRTIO devices do not advertise this
> feature bit and so it can never be negotiated through the VIRTIO feature
> negotiation process.
>
> How about referring to the details from the VIRTIO 1.1 specification
> instead. Something like this:
>
>   Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
>   bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
>   <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.h=
tml#x1-4130003>`_.
>   VIRTIO devices do not advertise this feature bit and therefore VIRTIO
>   drivers cannot negotiate it.
>
>   This reserved feature bit was reused by the vhost-user protocol to add
>   vhost-user protocol feature negotiation in a backwards compatible
>   fashion. Old vhost-user master and slave implementations continue to
>   work even though they are not aware of vhost-user protocol feature
>   negotiation.

OK - so does that mean that feature bit will remain UNUSED for ever
more?

What about other feature bits? Is it permissible for the
master/requester/vhost-user front-end/QEMU to filter any other feature
bits the slave/vhost-user backend/daemon may offer from being read by
the guest driver when it reads the feature bits?

>
>> As noted for the
>> +``VHOST_USER_GET_PROTOCOL_FEATURES`` and
>> +``VHOST_USER_SET_PROTOCOL_FEATURES`` messages this occurs before a
>> +final ``VHOST_USER_SET_FEATURES`` comes from the guest.
>
> I couldn't find any place where vhost-user.rst states that
> VHOST_USER_SET_PROTOCOL_FEATURES has to come before
> VHOST_USER_SET_FEATURES?
>
> The only order I found was:
>
> 1. VHOST_USER_GET_FEATURES to determine whether protocol features are
>    supported.
> 2. VHOST_USER_GET_PROTOCOL_FEATURES to fetch available protocol feature b=
its.
> 3. VHOST_USER_SET_PROTOCOL_FEATURES to set protocol feature bits.
> 4. Using functionality that depends on enabled protocol feature bits.
>
> Is the purpose of this sentence to add a new requirement to the spec
> that "VHOST_USER_SET_PROTOCOL_FEATURES MUST be sent before
> VHOST_USER_SET_FEATURES"?

No I don't want to add a new sequence requirement. But if SET_FEATURES
doesn't acknowledge the VHOST_USER_F_PROTOCOL_FEATURES bit should that
stop the processing of
VHOST_USER_GET_PROTOCOL_FEATURES/VHOST_USER_SET_PROTOCOL_FEATURES
messages? AFAICT SET_FEATURES should be irrelevant to the negotiation of
the PROTOCOL_FEATURES right?

>> So the
>> +enabling of protocol features need only require the advertising of the
>> +feature by the slave and the successful get/set protocol features
>> +sequence.
>
> "the feature" =3D=3D VHOST_USER_F_PROTOCOL_FEATURES?

yes.

>
> Stefan


--=20
Alex Benn=C3=A9e

