Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932194D4FEB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:08:09 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMGm-0003UT-7N
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:08:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSMFd-0001XP-B1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:06:57 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=35385
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSMFb-0001uB-An
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:06:56 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id z30so12186748ybi.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iij4P0GFdyUk6m9jeH4aSihE31BwscvbERLIRrODD4Q=;
 b=YnbaxJBa8m4purod8IEt24zwVaX+l8Pof0+4aL2EBelmbdm2XkBr6aFesBxBBtEXYq
 +VxPYtZeGCM3LsedIZXOnSKmoYx9QobbgZ6OnxxdvfFsRnzBqPBJclRr243Ysr9lbhM6
 712g5bCMQ7TDCEoeu2C2X2jyvRwEXNb1IcibX+SeMme10ZqnI53LE5/POjVF0ymXt9Gu
 6zjem0b7Siw4Q2dy3vY/x0Dvb620U6EIOMWkV3+Cay+EjlS6xxfDHRRpRRXJCpPMJglG
 BAOTGoR8eULeTwXnX4TWMBt+zOGgcteGJxgxmeJ0MYfD2vUHGNWzP49zZKAOee2C944Q
 XadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iij4P0GFdyUk6m9jeH4aSihE31BwscvbERLIRrODD4Q=;
 b=gJYXsvLRuXXY8UhitgGqgov8qfeEURzznwuE317h0FNcnB0EYSMj34k7QdBlM7fZSb
 XbU++Re0Kg7c0snxILl8yrDzvrzUabN/EwiUxelel/fPn1sevO1hRHeryqaFbu8NX8aW
 Bjna9fXuOhm3yJ7uuG04qxZeewxa+o8RZ3lUFcE8wUKkqyslBaXoi1U5f8xhPywl6TIl
 fYksGfJpjLN09PuWL6EldldN2rcgMUq88lsQiwXL3zkr28sLJ6FpLQsVCOcfoPt2GuxD
 8ZUyKdYPb2mRUBAZ6BGvOAgalhQW5sxuUCFjT/EKDhwi2r/ygc2LVPcgbtlxt5wpXHg2
 Bzcg==
X-Gm-Message-State: AOAM532sOEI4Z5BwI0x59k/58jAzO4/1Y7GIAk52JFjpjJokYQxRWOK4
 a05rf7IjGfoOsHKUfCjXmxfR+yiTLayYFUxZPEewdA==
X-Google-Smtp-Source: ABdhPJxdvl78+wXeKthwB3uQD8LG+iKK6rNT6vLnbRg3pgWNVuqoMJzsOOzqOEIDaN0/uuXkWw5ZzT0UgKTAgPhoBQo=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr4556121yby.193.1646932014229; Thu, 10
 Mar 2022 09:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20220310023907.2443-1-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 17:06:43 +0000
Message-ID: <CAFEAcA9gqfve-qdYzP_VrA0=fcCXGnNpFbi82y0AWCRKpAz+-A@mail.gmail.com>
Subject: Re: [PULL V2 00/15] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 02:39, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d9ccf33f9479201e5add8db0af68ca9ca8da358b:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-03-09 20:01:17 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to eea40402ecf895ed345f8e8eb07dbb484f4542c5:
>
>   vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-10 10:26:32 +0800)
>
> ----------------------------------------------------------------
>

Lots of 32-bit compile issues: this is 32-bit arm:
https://gitlab.com/qemu-project/qemu/-/jobs/2188500721
i386 the same:
https://gitlab.com/qemu-project/qemu/-/jobs/2188500747
and 32-bit mips:
https://gitlab.com/qemu-project/qemu/-/jobs/2188500753

../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_valid_features':
../hw/virtio/vhost-shadow-virtqueue.c:43:28: error: passing argument 2
of 'set_bit' from incompatible pointer type
[-Werror=incompatible-pointer-types]
set_bit(b, &svq_features);
^~~~~~~~~~~~~
In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,
from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
from ../hw/virtio/vhost-shadow-virtqueue.c:11:
/builds/qemu-project/qemu/include/qemu/bitops.h:36:52: note: expected
'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long
long unsigned int *'}
static inline void set_bit(long nr, unsigned long *addr)
~~~~~~~~~~~~~~~^~~~
../hw/virtio/vhost-shadow-virtqueue.c:50:30: error: passing argument 2
of 'clear_bit' from incompatible pointer type
[-Werror=incompatible-pointer-types]
clear_bit(b, &svq_features);
^~~~~~~~~~~~~
In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,
from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
from ../hw/virtio/vhost-shadow-virtqueue.c:11:
/builds/qemu-project/qemu/include/qemu/bitops.h:62:54: note: expected
'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long
long unsigned int *'}
static inline void clear_bit(long nr, unsigned long *addr)
~~~~~~~~~~~~~~~^~~~
../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_translate_addr':
../hw/virtio/vhost-shadow-virtqueue.c:91:32: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
.translated_addr = (hwaddr)iovec[i].iov_base,
^
../hw/virtio/vhost-shadow-virtqueue.c:109:20: error: cast to pointer
from integer of different size [-Werror=int-to-pointer-cast]
addrs[i] = (void *)(map->iova + off);
^
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
from ../hw/virtio/vhost-shadow-virtqueue.c:10:
../hw/virtio/vhost-shadow-virtqueue.c:111:49: error: incompatible type
for argument 1 of 'int128_add'
if (unlikely(int128_gt(int128_add(needle.translated_addr,
~~~~~~^~~~~~~~~~~~~~~~
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
definition of macro 'unlikely'
#define unlikely(x) __builtin_expect(!!(x), 0)
^
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
from ../hw/virtio/vhost-shadow-virtqueue.c:11:
/builds/qemu-project/qemu/include/qemu/int128.h:313:40: note: expected
'Int128' {aka 'struct Int128'} but argument is of type 'hwaddr' {aka
'long long unsigned int'}
static inline Int128 int128_add(Int128 a, Int128 b)
~~~~~~~^
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
from ../hw/virtio/vhost-shadow-virtqueue.c:10:
../hw/virtio/vhost-shadow-virtqueue.c:112:51: error: incompatible type
for argument 2 of 'int128_add'
iovec[i].iov_len),
~~~~~~~~^~~~~~~~
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
definition of macro 'unlikely'
#define unlikely(x) __builtin_expect(!!(x), 0)
^
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
from ../hw/virtio/vhost-shadow-virtqueue.c:11:
/builds/qemu-project/qemu/include/qemu/int128.h:313:50: note: expected
'Int128' {aka 'struct Int128'} but argument is of type 'size_t' {aka
'const unsigned int'}
static inline Int128 int128_add(Int128 a, Int128 b)
~~~~~~~^
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
from ../hw/virtio/vhost-shadow-virtqueue.c:10:
../hw/virtio/vhost-shadow-virtqueue.c:113:53: error: incompatible type
for argument 2 of 'int128_gt'
map->translated_addr + map->size))) {
~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
definition of macro 'unlikely'
#define unlikely(x) __builtin_expect(!!(x), 0)
^
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
from ../hw/virtio/vhost-shadow-virtqueue.c:11:
/builds/qemu-project/qemu/include/qemu/int128.h:367:47: note: expected
'Int128' {aka 'struct Int128'} but argument is of type 'long long
unsigned int'
static inline bool int128_gt(Int128 a, Int128 b)
~~~~~~~^
../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_vring_write_descs':
../hw/virtio/vhost-shadow-virtqueue.c:143:37: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
descs[i].addr = cpu_to_le64((hwaddr)sg[n]);
^
../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_get_vring_addr':
../hw/virtio/vhost-shadow-virtqueue.c:465:28: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
addr->desc_user_addr = (uint64_t)svq->vring.desc;
^
../hw/virtio/vhost-shadow-virtqueue.c:466:29: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
addr->avail_user_addr = (uint64_t)svq->vring.avail;
^
../hw/virtio/vhost-shadow-virtqueue.c:467:28: error: cast from pointer
to integer of different size [-Werror=pointer-to-int-cast]
addr->used_user_addr = (uint64_t)svq->vring.used;
^
cc1: all warnings being treated as errors


-- PMM

