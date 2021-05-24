Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2A38F25A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:37:40 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEWI-0002RT-Aw
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llESE-0007hG-Fn; Mon, 24 May 2021 13:33:26 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llERy-00017r-7k; Mon, 24 May 2021 13:33:26 -0400
Received: by mail-qt1-x830.google.com with SMTP id h21so21188004qtu.5;
 Mon, 24 May 2021 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KeXvccl237edCJdtOndQxs+S6/aNQAHvOHfrPBMrp+4=;
 b=q4n4lzu+IgfxDZ9N60ndc+TsX6LhgQgghu2vRwtPiBWwJQIBA0N1c7Z3aQ25Siadck
 LddggNWRbqPXm30GUsPKBIdndqJVMOGu8+lxgI3lyBBqA/eUdxBxN+xyM3U3byOTptGT
 fk5n5zyKc1YUFEcVkkTczkFnFKNA+rh6ew+P4ayXmFNSWRIzqKyqzoDTMEPDgV0M3U5S
 l/wH4a/ZGmyyznxO8Zd6rEBGPZvIIietHHsdK6JQeJknrvLgZO3480N8PtN+mEyb5R72
 qcdn1RnjP2DEyoKt0yWv6PslxersbQxN2BS4rrj8O4jKsKStxXyZlUSliXp40Ps9YpZA
 0M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KeXvccl237edCJdtOndQxs+S6/aNQAHvOHfrPBMrp+4=;
 b=sTyBGY5PLtNdnizZUSRUhpHjaxZ6bAs5qJDMMfio1+TvOheMCxQTdN9azuYhkGu789
 +/B3YHMCfBiS5rjZRu3yo7VOVthUKdVy3efjrKI/AqQdl06+tohWQpPJaUJe2+LeSjZd
 bNP+5QO+lKLU/4uY2kLqDWvKnp7QfZTRgSZCQeLZyjUqZzrkBJC4y2ua36wK9jFieM/m
 r+K27wQVlOOnNfmrFUObvsI6yX0tQuBoFPIncR3iccE5yFNeLeQSnTvjGxW0/u9SiN9S
 lBUQ34EwzJXzpxH/j06NlBVz+5UyOlsvx0/skJKa6MeFoH1OTdILSQBD5ePm1zN0lJyC
 q6vA==
X-Gm-Message-State: AOAM530nvqEwR94SH+OiPmpIHio6zBKK+47lQO3Zlcc92kQrGPbCaMAS
 DUJd2bj2CCTWFbB9A3GF03s=
X-Google-Smtp-Source: ABdhPJwe3tmc9cP3m30+D+uFsUVXriHlGkmQddi/pNqdcFY/DzF8vn8XyxYYRyJwsnW4bEUzCudM8g==
X-Received: by 2002:ac8:7496:: with SMTP id v22mr13054569qtq.159.1621877588973; 
 Mon, 24 May 2021 10:33:08 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e18sm3692469qtm.73.2021.05.24.10.33.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 May 2021 10:33:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <db8e3de8-3b03-2293-fb20-215593cadb8e@virtuozzo.com>
Date: Mon, 24 May 2021 13:33:07 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4B5A5FB-8B80-4C5B-84CF-D24D4015F914@gmail.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
 <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
 <db8e3de8-3b03-2293-fb20-215593cadb8e@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, berto@igalia.com,
 QEMU devel list <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 24, 2021, at 12:56 PM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>=20
> 24.05.2021 19:06, Programmingkid wrote:
>>> On May 24, 2021, at 11:55 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>>>=20
>>> 24.05.2021 18:41, Programmingkid wrote:
>>>>> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>>>>>=20
>>>>> Hi!
>>>>>=20
>>>>> As reported by Programmingkid, command
>>>>>=20
>>>>> qemu-system-ppc -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path of a host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone
>>>>>=20
>>>>> crashes.
>>>>>=20
>>>>> I tested it with qemu-system-x86_64 and it reproduces for me. I =
even
>>>>> kept "<path of a host folder>" as is :).
>>>>>=20
>>>>> So, here are two fixes.
>>>>>=20
>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>  block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix =
crash
>>>>>  block/vvfat: fix vvfat_child_perm crash
>>>>>=20
>>>>> include/block/block.h | 1 +
>>>>> block.c               | 4 ++--
>>>>> block/vvfat.c         | 8 +++-----
>>>>> 3 files changed, 6 insertions(+), 7 deletions(-)
>>>>>=20
>>>>> --=20
>>>>> 2.29.2
>>>> I applied both of your patches to the most recent git commit today =
and they worked. I was able to share files from the host on the guest.
>>>> Thank you.
>>>> Reviewed-by: John Arbuckle <programmingkidx@gmail.com>
>>>=20
>>> Thanks for testing! Didn't you mean "Tested-by: "? Or if you both =
reviewed and tested, having both marks makes sense.
>> Yes, you are right. It should be: Tested-by: John Arbuckle =
<programmingkidx@gmail.com>
>>>=20
>>> Hmm, also, I think "Reported-by" in first patch should be fixed to =
your real name too for consistency.
>> That should be fine but it isn't important.
>> On a related topic would you know if it is possible to use fat32 =
instead of fat16 for host folder sharing? I did try replacing the text =
fat16 with fat32 but it didn't appear to work.
>=20
> No, I don't know..
>=20
> Moreover, my quick look at the code of vvfat, this fixed bug (which is =
obviously not covered by tests), and also status of block/vvfat in =
MAINTAINERS file "Odd Fixes", all this leads to advice "don't use it if =
possible". May be Kevin can add something about it, he is maintainer..
>=20
> Could you use for example NFS or Samba, or sshfs to share folders? Or =
you need exactly to make a host folder available in guest vm as usb =
drive?

I do actually need it for some of my VM's. It makes sharing of folder =
between the host and guest so easy.=20=

