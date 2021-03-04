Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D032D18E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:05:52 +0100 (CET)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlnk-0008Kl-0f
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHlm7-0007ol-7z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:04:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHlly-000673-Qq
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:04:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so18941365wrc.13
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 03:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3lIKl753loFLprtczW+qIQRngMwOgyHdoVooKAjg1TA=;
 b=GDgXJ/O5OzLy5SAxqaN98Q6vLr/lC/vChvoafo+lQ68hSiRVW8ohHI840UAkyy+6Rw
 QppGqGA801hSZy2Xza7dsnhFv8ujop9f1yenJS6vyH3XfFzZLuqv6OA6U/I7VXOUet3t
 eZ0slOvIGoME4uMFaPdSsgVsIc7QIvf8hjaOKFJE64ogFPglW7rxBp/qJr2rHkIMA50g
 tuwfRThpdStclj5KKB8kjfKrxgQ2KnKngZd114OY28qLZZQEn3jgv6uYI8F6eJmOwob2
 CIhhwAqDh2kOLYxw/CFH3bG++GuPW3DEZF/ZyWxTHhtZUjRW1LeQAqaHtPqihswK/UDk
 yGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3lIKl753loFLprtczW+qIQRngMwOgyHdoVooKAjg1TA=;
 b=ih3RVEg1ljQZk2cu4NQDdpOi0Dclt/6+meLwO+JC/1P7XZbBhe6eYwvLllgP6Cy9Kx
 QYSwBVOwVhpF9ufzKeA4E8OsuBnyTSbygODpuHEFu8BSZvsJBrmvb8Ggx1fAke0htjvU
 M2aCn90sQ9whhn/uPgZ66QDlpProRac9HGRSnruMjNsJ0zLkphNVgVVD7EmeY+sr4vRh
 wLqrhLwkmt5LbcxZ6dm2/DG44G/9Sq823/Fz58LEojlsW2Z5b+7sKfAAMjuDw4WiOvpd
 fubKX4GfHbbnVHi8zZzKJdnjptZrJC7+V6VTwTpd6cX4kW3a9ZqVvWt45uzllSkPMWba
 dEVQ==
X-Gm-Message-State: AOAM530iAfVYl0dpOb4CnvhfuCKbaRmcS0McNBvslcrchRVu2DgcutUn
 NJueK2lG/YHs+d0VQx017msugg==
X-Google-Smtp-Source: ABdhPJyzZOuy1b0pPpDR0rcO6Zyy11amGnIaOvjVWEAxd7btJxuNzJ2bBmMxrEJOxvxPNUTn3WdlyA==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr3552383wrc.122.1614855840909; 
 Thu, 04 Mar 2021 03:04:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p14sm9171006wmc.30.2021.03.04.03.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:04:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1736C1FF7E;
 Thu,  4 Mar 2021 11:03:59 +0000 (GMT)
References: <20210303145011.14547-1-alex.bennee@linaro.org>
 <20210303165554-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Date: Thu, 04 Mar 2021 11:00:08 +0000
In-reply-to: <20210303165554-mutt-send-email-mst@kernel.org>
Message-ID: <87blbzgoyo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Jiang Liu <gerry@linux.alibaba.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Michael S. Tsirkin <mst@redhat.com> writes:

> On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Benn=C3=A9e wrote:
>> Make the language about feature negotiation explicitly clear about the
>> handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
>> avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:
>>=20
>>   https://github.com/rust-vmm/vhost/pull/24
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Jiang Liu <gerry@linux.alibaba.com>
>> Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>
>>=20
>> ---
>> v2
>>   - use Stefan's suggested wording
>>   - Be super explicit in the message descriptions
>> ---
>>  docs/interop/vhost-user.rst | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> index 2918d7c757..7c1fb8c209 100644
>> --- a/docs/interop/vhost-user.rst
>> +++ b/docs/interop/vhost-user.rst
>> @@ -307,6 +307,18 @@ bit was dedicated for this purpose::
>>=20=20
>>    #define VHOST_USER_F_PROTOCOL_FEATURES 30
>>=20=20
>> +Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
>> +bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
>> +<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.h=
tml#x1-4130003>`_.
>> +VIRTIO devices do not advertise this feature bit and therefore VIRTIO
>> +drivers cannot negotiate it.
>> +
>> +This reserved feature bit was reused by the vhost-user protocol to add
>> +vhost-user protocol feature negotiation in a backwards compatible
>> +fashion. Old vhost-user master and slave implementations continue to
>> +work even though they are not aware of vhost-user protocol feature
>> +negotiation.
>> +
>>  Ring states
>>  -----------
>>=20=20
>> @@ -865,7 +877,8 @@ Front-end message types
>>    Get the protocol feature bitmask from the underlying vhost
>>    implementation.  Only legal if feature bit
>>    ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
>> -  ``VHOST_USER_GET_FEATURES``.
>> +  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
>> +  ``VHOST_USER_SET_FEATURES``.
>>=20=20
>>  .. Note::
>>     Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
>> @@ -881,7 +894,8 @@ Front-end message types
>>    Enable protocol features in the underlying vhost implementation.
>>=20=20
>>    Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is prese=
nt in
>> -  ``VHOST_USER_GET_FEATURES``.
>> +  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
>> +  ``VHOST_USER_SET_FEATURES``.
>>=20=20
>>  .. Note::
>>     Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
>
>
> Not really clear what does "It" refer to here.
> Also, are we sure it's ok to send the messages and then send
> VHOST_USER_SET_FEATURES with VHOST_USER_F_PROTOCOL_FEATURES clear?
> Looks more like a violation to me ...

So what behaviour are we looking for here? Should the vhost-user sender
re-apply the VHOST_USER_F_PROTOCOL_FEATURES bit to the features when the
guest does it SET_FEATURES during the negotiation?

We will have already gone through the
VHOST_USER_GET_PROTOCOL_FEATURES/VHOST_USER_SET_PROTOCOL_FEATURES dance
at this point and have started passing messages. Should we stop at the
point we finally process SET_FEATURES?

>
>
> How about: It -> this bit
> does not need to be -> before ... has been
>
> so:
>
>     Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is prese=
nt in
>  -  ``VHOST_USER_GET_FEATURES``, and even before this bit has been
> 	acknowledged by VHOST_USER_SET_FEATURES.

That leaves open to interpretation what happens if SET_FEATURES clears
the bit?

>
>
>
>
>> --=20
>> 2.20.1


--=20
Alex Benn=C3=A9e

