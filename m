Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD364E4378
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:57:10 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgse-0006ZM-Rs
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:57:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWgpo-0003D7-Ri
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:54:14 -0400
Received: from [2a00:1450:4864:20::433] (port=38869
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWgpl-0002aE-Of
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:54:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id t11so24063048wrm.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TYtdxLNeYJap3QJ4Wny8UCGWdk+higk5HBPVkswUc5c=;
 b=S2Srvi++etbZxYutG3ZsWe1IHGh+4y+xZBh0ytjPwDz6jXcGu8NtmZzDhKqO6pV0Uw
 iEFwBd04zBBA0xWoqx7kja27vh7u0n7oI3jLESOz6rpAL8zzo/1m2SXlaCImRWB+WOtl
 784ptKIkmPc6WG2czs+LLDn3ysrMoxNQFrpg5uWGbMijRmSLsYChlRygT5+69OOLQAoI
 2vKMV7a6plAVKFZyWjAyWqmnGl+ucuO3ikyQ15ydW6Fk5OO/FebwRtVtfq5xWbjoSQKQ
 8hL3wFs4bNWvP96PCcmhzkeDK3K2fgfcntgspvwAUzFWiIo0LnHCblOg0xdZwgonPjHv
 zTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TYtdxLNeYJap3QJ4Wny8UCGWdk+higk5HBPVkswUc5c=;
 b=vk2eOiVUg7YcvT6pFWB0Az5XbPpFoZBB1J7YiFXM0dGodGhsJcMiFgnsBws3PVdLUZ
 mCjvLyXe2OQIhwo+tE/7ybxRgBDQYrAkPjJ3Pc6IzEjfmocEkPe6RMsEy7Mpq5Ywci48
 ovIcRLJ9cQ1/IN23WiRbi0n5mUwc3AgRYj2mMHIbhTbDUv2+uO1UlFN+jgkmaB52mqil
 EkSG8kjWU7X5yPh6juqMJBKGxCsBzVQiyRinxHPvTCW7pWhXDk1E3oaNy6GZgUoy/Aal
 zZi/C4oOBTDZdGNnKk7iUohRhF5082VXZhjsptG6IhQh1B4lSioR8pJXOywDCXn/YBlv
 6B4Q==
X-Gm-Message-State: AOAM533NhYKcMs+2XxA5RHWUTJ57seBDzprVA9RKMuO66cA1UdrwLiYi
 yg+6dMQS+cFMhewd7R0Pbuwy+i80sSx8lw==
X-Google-Smtp-Source: ABdhPJwqWLiBA58QOw1QugpdaflU/TXPuckUkQ31Uh0jsbA3SED/dpBMo2t19owjNF90s3RfGfeH6w==
X-Received: by 2002:a05:6000:f:b0:203:d97a:947 with SMTP id
 h15-20020a056000000f00b00203d97a0947mr22937787wrx.654.1647964446874; 
 Tue, 22 Mar 2022 08:54:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm2156213wml.10.2022.03.22.08.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:54:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B422D1FFB7;
 Tue, 22 Mar 2022 15:54:04 +0000 (GMT)
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220322094901-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH  v1 00/13] various virtio docs, fixes and tweaks
Date: Tue, 22 Mar 2022 15:50:28 +0000
In-reply-to: <20220322094901-mutt-send-email-mst@kernel.org>
Message-ID: <87v8w656g3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 qemu-devel@nongnu.org, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Mar 21, 2022 at 03:30:24PM +0000, Alex Benn=C3=A9e wrote:
>> Hi,
>>=20
>> This series is a sub-set of patches while I was trying to re-rev my
>> virtio-rpmb patches. It attempts to address a few things:
>>=20
>>   - improve documentation for virtio/vhost/vhost-user
>>   - document some of the API
>>   - a hacky fix for F_CONFIG handling
>>   - putting VhostUserState on a diet, make VhostUserHostNotifier dynamic
>
> So I think this is best deferred until after the release,
> more of a cleanup than a bugfix.

Sorry I should have made it clearer - I wasn't intending this for 7.0
but I also didn't want it bound up with the rpmb changes which will take
longer to land.

>
> I will tag this series, but please do remind me after the release
> to help make sure it does not get lost.
>
>
>> In particular I've been trying to better understand how vhost-user
>> interactions are meant to work and why there are two different methods
>> for instantiating them. If my supposition is correct perhaps a number
>> of devices that don't have in-kernel vhost equivalents could be converte=
d?
>
> Hope I understand your question.  Well we started off with saying
> vhost-user is just a backend, so should not affect the frontend device.
> This is clean and makes migration work e.g. you can migrate between
> different backends, but it makes adding features more work.

This is covered in the doc patch, specifically:

  vhost_ops vs TYPE_VHOST_USER_BACKEND

>> While working onthe VhostUserHostNotifier changes I found it quite
>> hard to trigger the code. Is this rarely used code or just requires
>> backends we don't see in the testing?
>
> Which function are you asking about exactly?

  vhost_user_slave_handle_vring_host_notifier

which is the only place where a mapping is set up AFAICT.

>
>> Alex Benn=C3=A9e (10):
>>   hw/virtio: move virtio-pci.h into shared include space
>>   virtio-pci: add notification trace points
>>   hw/virtio: add vhost_user_[read|write] trace points
>>   vhost-user.rst: add clarifying language about protocol negotiation
>>   libvhost-user: expose vu_request_to_string
>>   docs/devel: start documenting writing VirtIO devices
>>   include/hw: start documenting the vhost API
>>   contrib/vhost-user-blk: fix 32 bit build and enable
>>   hw/virtio/vhost-user: don't suppress F_CONFIG when supported
>>   virtio/vhost-user: dynamically assign VhostUserHostNotifiers
>>=20
>> Paolo Bonzini (3):
>>   docs: vhost-user: clean up request/reply description
>>   docs: vhost-user: rewrite section on ring state machine
>>   docs: vhost-user: replace master/slave with front-end/back-end
>>=20
>>  docs/devel/index-internals.rst            |   1 +
>>  docs/devel/virtio-backends.rst            | 214 +++++++++
>>  docs/interop/vhost-user-gpu.rst           |  10 +-
>>  docs/interop/vhost-user.rst               | 555 ++++++++++++----------
>>  meson.build                               |   2 +-
>>  include/hw/virtio/vhost-user.h            |  43 +-
>>  include/hw/virtio/vhost.h                 | 132 ++++-
>>  {hw =3D> include/hw}/virtio/virtio-pci.h    |   0
>>  subprojects/libvhost-user/libvhost-user.h |   9 +
>>  contrib/vhost-user-blk/vhost-user-blk.c   |   6 +-
>>  hw/scsi/vhost-user-scsi.c                 |   1 +
>>  hw/virtio/vhost-scsi-pci.c                |   2 +-
>>  hw/virtio/vhost-user-blk-pci.c            |   2 +-
>>  hw/virtio/vhost-user-fs-pci.c             |   2 +-
>>  hw/virtio/vhost-user-i2c-pci.c            |   2 +-
>>  hw/virtio/vhost-user-input-pci.c          |   2 +-
>>  hw/virtio/vhost-user-rng-pci.c            |   2 +-
>>  hw/virtio/vhost-user-scsi-pci.c           |   2 +-
>>  hw/virtio/vhost-user-vsock-pci.c          |   2 +-
>>  hw/virtio/vhost-user.c                    | 133 ++++--
>>  hw/virtio/vhost-vsock-pci.c               |   2 +-
>>  hw/virtio/virtio-9p-pci.c                 |   2 +-
>>  hw/virtio/virtio-balloon-pci.c            |   2 +-
>>  hw/virtio/virtio-blk-pci.c                |   2 +-
>>  hw/virtio/virtio-input-host-pci.c         |   2 +-
>>  hw/virtio/virtio-input-pci.c              |   2 +-
>>  hw/virtio/virtio-iommu-pci.c              |   2 +-
>>  hw/virtio/virtio-net-pci.c                |   2 +-
>>  hw/virtio/virtio-pci.c                    |   5 +-
>>  hw/virtio/virtio-rng-pci.c                |   2 +-
>>  hw/virtio/virtio-scsi-pci.c               |   2 +-
>>  hw/virtio/virtio-serial-pci.c             |   2 +-
>>  subprojects/libvhost-user/libvhost-user.c |   2 +-
>>  contrib/vhost-user-blk/meson.build        |   3 +-
>>  hw/virtio/trace-events                    |  10 +-
>>  35 files changed, 831 insertions(+), 333 deletions(-)
>>  create mode 100644 docs/devel/virtio-backends.rst
>>  rename {hw =3D> include/hw}/virtio/virtio-pci.h (100%)
>>=20
>> --=20
>> 2.30.2


--=20
Alex Benn=C3=A9e

