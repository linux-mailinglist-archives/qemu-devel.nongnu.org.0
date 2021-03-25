Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671263491D3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:25:54 +0100 (CET)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPP3h-0004J5-ET
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPP1m-0003TX-FA
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:23:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPP1k-0004D8-Lm
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:23:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id z2so2078793wrl.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=91xgZOgUPpV97E/PKBwKW9UDwCC6cu7uPkRTCKtFjr8=;
 b=nSHifbRx4xEcljNzNUTTSJFEgPJrJgfacOQRq8/WaVh4RHqqBPxvap0nsRCHXDhiw3
 7uPU6ZAg6/+1w2nHIiJ78bLr7/+tZ7sbtenr6GqfeujZw/eHkVd92zl5btnvIXnInxWW
 PJXF4A/POusVSTYnods0my53dec6hWsXYVXOknlOnPDBsQmhXcSya5Br63v+yjso9v1f
 gEiswJpnHbkb8mEhYQdT9pZBUtappSgNqi/81hVBHo1bb3szmWDK0iFD/XUIxmav7PxK
 hHuPCx3/6eKv5y6uM/U78IyPNw5eejwNOGXfHGyB85Rzi/gtUrF4uGIxzbI91H9WD36m
 q/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=91xgZOgUPpV97E/PKBwKW9UDwCC6cu7uPkRTCKtFjr8=;
 b=gVn/0Fcd2Yp1DcGoQE1pGdl3yenPJJ0dq0G+blCC5AWFWh4jKqhs9EKt/4ujTbfP7N
 PT1gmNx61QLSF78pjuA01BbCakY4aNCrPdpQJnXQc69zc+crVo3B/J9mKdNrCsiNesxw
 Qo/zsgj3cmmpXQLj+z7ByOQu/NizhdQOack+QW4Jcxo9onwlFiRTOEWR3Us9lmuVZhK5
 Tqy9Y4tNDxeBs1FFyLIRq37OsfC7g9+DMep7+DTisFYWM00spINXtEfilBItv2jGzH8R
 KoxmbNX8tMPlqL89AimLPeGi4+/L/OfOiMVZssgjLdTvVx6tYmE+ssTzYa9oj590xrLd
 cLiw==
X-Gm-Message-State: AOAM532GdtSAog29ptb4s1AG3dPWltvq194Yqrkl/2qRuafna3T8+xUj
 V45pmFXAoSMYQePmnNjE0llCjQ==
X-Google-Smtp-Source: ABdhPJxuKMiyYYqIgvAwzZ6YSXhFx2GvNBG6Y7EVymgxiL4onJBhIFmXApRhkkaoNgvgNahEpbNloQ==
X-Received: by 2002:a5d:65d1:: with SMTP id e17mr7208109wrw.333.1616675030440; 
 Thu, 25 Mar 2021 05:23:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm7356385wrn.97.2021.03.25.05.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:23:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 884731FF7E;
 Thu, 25 Mar 2021 12:23:48 +0000 (GMT)
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <290a8771-7273-a898-a826-c97df6eefb1b@intel.com>
 <20210325052227.fm3i25xphhu26amu@vireshk-i7>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Date: Thu, 25 Mar 2021 12:22:47 +0000
In-reply-to: <20210325052227.fm3i25xphhu26amu@vireshk-i7>
Message-ID: <87tuozh163.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 25-03-21, 13:09, Jie Deng wrote:
>>=20
>> On 2021/3/24 15:33, Viresh Kumar wrote:
>> > +
>> > +/* Definitions from virtio-i2c specifications */
>> > +#define VHOST_USER_I2C_MAX_QUEUES       1
>> > +
>> > +/* Status */
>> > +#define VIRTIO_I2C_MSG_OK               0
>> > +#define VIRTIO_I2C_MSG_ERR              1
>> > +
>> > +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the req=
uests */
>> > +#define VIRTIO_I2C_FLAGS_FAIL_NEXT      0x00000001
>> > +
>> > +/**
>> > + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
>> > + * @addr: the controlled device's address
>> > + * @padding: used to pad to full dword
>> > + * @flags: used for feature extensibility
>> > + */
>> > +struct virtio_i2c_out_hdr {
>> > +    uint16_t addr;
>> > +    uint16_t padding;
>> > +    uint32_t flags;
>> > +} __attribute__((packed));
>>=20
>>=20
>> __le16,=C2=A0 __le32 ?
>
> Maybe, but I didn't do them because of this:
>
> docs/devel/style.rst:
>
> "Don't use Linux kernel internal types like u32, __u32 or __le32."
>=20=20
>> > +
>> > +/**
>> > + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
>> > + * @status: the processing result from the backend
>> > + */
>> > +struct virtio_i2c_in_hdr {
>> > +    uint8_t status;
>> > +} __attribute__((packed));
>> > +
>>=20
>> I understand these definitions can be removed once the frontend driver is
>> merged by the Linux ?
>
> Yes, we would be required to somehow include the uapi header that
> kernel is adding and then this won't be required.

What I often do is include a temporary patch in my series that includes
the updated uapi headers from my Linux branch and mark it as not for
merge until the uapi headers make it into a released tree.

>=20=20
>> > +/* vhost-user-i2c definitions */
>> > +
>> > +#ifndef container_of
>> > +#define container_of(ptr, type, member) ({                      \
>> > +        const typeof(((type *) 0)->member) *__mptr =3D (ptr);     \
>> > +        (type *) ((char *) __mptr - offsetof(type, member));})
>> > +#endif
>>=20
>>=20
>> This seems to be a general interface.=C2=A0 I see there is a definition =
in
>> qemu/compiler.h.
>>=20
>> Can we reuse it ?
>
> Damn. My bad (maybe not). I picked this part from the RPMB patchset
> that Alex sent and didn't bother looking for it.
>
> Though on the other hand, we are looking to make this file independent
> of qemu so it can be used by other hypervisors without any (or much)
> modifications, and maybe so it was done so.
>
> Alex ?


--=20
Alex Benn=C3=A9e

