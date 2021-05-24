Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BF38F0E2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:07:59 +0200 (CEST)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llD7W-0003y8-7h
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llD5n-0002ez-O4; Mon, 24 May 2021 12:06:12 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llD5i-0008AN-U5; Mon, 24 May 2021 12:06:11 -0400
Received: by mail-qk1-x734.google.com with SMTP id j189so6661323qkf.2;
 Mon, 24 May 2021 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=I/uLfdRvOohM5ynPC+piMzUM2uArlPdM33i4m7fBwwc=;
 b=ZI8NvEED+mnGW0aEc3fz4OECJAn4FMQOtwpyr/tOhWDnmqlhYWyEgj6z+Hyqn58dca
 KocUwLQOnWhTn5AH7x2CZ0NzXXqWUUrJCT5ag3ldVnCxmr3wlntd0RPb2yRFFd5jOSl3
 MKXdxEylR+TpAgbfxKExAv+kjLEdgD+zvIumG9NcfS6uIeY50l+E3/dsSUwGUdREne7o
 qmwwMQ/jSuR3oGES3nD2layj1WdD/MPss9uOuiGdw0rXotAGFtKbM/lqadZXnhj3Zxma
 uKkgVZF726OOjgHxLbDD0Str1PVBsXMFYSh/H1Na5IAmQ5483gUjS+BrUHO1djQDDrpx
 AK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=I/uLfdRvOohM5ynPC+piMzUM2uArlPdM33i4m7fBwwc=;
 b=ReByRRoA/3VTMDFENw/NC/abaV1G9Lmd5pfD++EG/ewZs5LavnJmpkS3o7iBswnggA
 TvapEiW6lBxto7uIhEh/1OP2Sc58a15u7WLkPvS0JTwZO/1Iqa4EB81NlrmZhrZPzIct
 +cJLGZ171hyWBY67xTCmICCF8186wr498z+7rw2SQtLx8YVmk3WEom7lcdTcLlJGy983
 KItYjnZttzm8SmTk0PhY3yWXuNdttRUji0MHfDGWwSwYn44m/Y0bcm9UFl23LJyucVXi
 cOi/FMoII0Qrm3ln21G1FVm4fRiN2AR08tK2Ky3OOdFV5ZxVrQfi5uzKJtWca0xyd44o
 2uPA==
X-Gm-Message-State: AOAM531bxQ93yGuJGDYCYCnGiFgqE0+wFtHUHGrnHSpPeekzG1LeSan6
 Os6B3GhKHKKkddkDWbA0lbw=
X-Google-Smtp-Source: ABdhPJzfrDpgbJ9UZmpElL6KIkDcexlcPhcC/nhgGU2U9N0AY1qUJg8uxMbNBIsESgduCi/UwlxI9A==
X-Received: by 2002:a05:620a:a48:: with SMTP id
 j8mr29566500qka.135.1621872365353; 
 Mon, 24 May 2021 09:06:05 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e12sm10910781qtj.81.2021.05.24.09.06.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 May 2021 09:06:05 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
Date: Mon, 24 May 2021 12:06:03 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x734.google.com
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
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 24, 2021, at 11:55 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>=20
> 24.05.2021 18:41, Programmingkid wrote:
>>> On May 24, 2021, at 6:12 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>>>=20
>>> Hi!
>>>=20
>>> As reported by Programmingkid, command
>>>=20
>>> qemu-system-ppc -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path of a host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone
>>>=20
>>> crashes.
>>>=20
>>> I tested it with qemu-system-x86_64 and it reproduces for me. I even
>>> kept "<path of a host folder>" as is :).
>>>=20
>>> So, here are two fixes.
>>>=20
>>> Vladimir Sementsov-Ogievskiy (2):
>>>  block/vvfat: child_vvfat_qcow: add .get_parent_aio_context, fix =
crash
>>>  block/vvfat: fix vvfat_child_perm crash
>>>=20
>>> include/block/block.h | 1 +
>>> block.c               | 4 ++--
>>> block/vvfat.c         | 8 +++-----
>>> 3 files changed, 6 insertions(+), 7 deletions(-)
>>>=20
>>> --=20
>>> 2.29.2
>> I applied both of your patches to the most recent git commit today =
and they worked. I was able to share files from the host on the guest.
>> Thank you.
>> Reviewed-by: John Arbuckle <programmingkidx@gmail.com>
>=20
> Thanks for testing! Didn't you mean "Tested-by: "? Or if you both =
reviewed and tested, having both marks makes sense.

Yes, you are right. It should be: Tested-by: John Arbuckle =
<programmingkidx@gmail.com>

>=20
> Hmm, also, I think "Reported-by" in first patch should be fixed to =
your real name too for consistency.

That should be fine but it isn't important.

On a related topic would you know if it is possible to use fat32 instead =
of fat16 for host folder sharing? I did try replacing the text fat16 =
with fat32 but it didn't appear to work.=

