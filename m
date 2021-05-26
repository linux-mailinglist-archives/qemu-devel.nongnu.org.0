Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB239170A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:06:06 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsIX-0002Wg-2j
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llsHN-0001iY-1O; Wed, 26 May 2021 08:04:53 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1llsHL-000371-F4; Wed, 26 May 2021 08:04:52 -0400
Received: by mail-qv1-xf29.google.com with SMTP id e8so542029qvp.7;
 Wed, 26 May 2021 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3Qh20IA4UbdTEGUZJ2AJEruhQ+ddtaJecfC6TCFp2Pw=;
 b=Po3wvLjqjHVXmwFRyfqv6ITTXHDkn+5tioxzUL5BCc6gEpxChYZqDSVz7WKEq54LBx
 2rrps4xY6fNR3m79La6xkKri9HcdqbEBO5a/AKAj0F7g4nQEJp6J3dioHZOgzLxBR8P5
 5lltO+s0Vy4JCy7GuTQxPbQLkY3UTTM419YjUXNQqly0lgxGaDiA1IwrtPThT3NIdgrL
 s6GS08Nk89sewUpAzGtLw1nafzpu0sIh0HrVy4GQjdvKPJIi0xa5572ZgQknuV+DkDqk
 5yzslsENNH/EECqCuO0vpowbdp5I1BQ8T2Rduf6rW5ESgjv4oEK32gcnhAZHcaWdOuu1
 38ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3Qh20IA4UbdTEGUZJ2AJEruhQ+ddtaJecfC6TCFp2Pw=;
 b=jtxHCSMChjplVbZS73diTNEbZ83ubPtlUtfJEhPcTNzWT3p0hHkbH2pdhxFel0cu4I
 RZXnbQMMldbG+HcqYQMZARyLuE5FkUR6xyN08Cnp2KTSN8M3hyE2z3tEN70hZCPg23cz
 2kFa1fz8HyndFAbOeimEhBz5HkIHYiLCkj/NCTiQ4zSkpmVak8rGeNd7hyW+GSaLjPPe
 z9osx6ujxL+hsBroovD/KtvgaZImLI8YnvAdplqKjdXi9IJP5UzUNZDp27ha64pWoAU7
 VV+/e0zQqRGlCX3xDpWf6K9Ppmib62t3vaXtECko38zHjbejtrBbDf2IPZZ+Dios3kEP
 gl6A==
X-Gm-Message-State: AOAM533HTrpS4EhNcIkobGvzUQ1rlQBpPAiQJ+VrTName4M5+/ljHrcr
 NIGxUCWcrTQf7HObemtj0MQ=
X-Google-Smtp-Source: ABdhPJyHPSGkchWEUx0qanIWKUJQxqSV5eMg4dI+yxMk56kyHVMY6Nq/5CLAXYWBx7onVO9zr+9EUw==
X-Received: by 2002:ad4:5112:: with SMTP id g18mr43236260qvp.26.1622030690278; 
 Wed, 26 May 2021 05:04:50 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e2sm1405753qkm.18.2021.05.26.05.04.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 05:04:49 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH 0/2] vvfat: fix two crashes.
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <YK0jZB86ZGLDTM+J@merkur.fritz.box>
Date: Wed, 26 May 2021 08:04:48 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <066C0E39-302E-4D12-A9D8-C7C1D0C5D91D@gmail.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
 <E8FEBD24-139F-4918-92D9-5183EECCA8FB@gmail.com>
 <482b0f59-addc-2bdf-21b7-53d07265b651@virtuozzo.com>
 <B4968AF6-F208-48F5-B431-0E84CAE8491C@gmail.com>
 <YK0jZB86ZGLDTM+J@merkur.fritz.box>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf29.google.com
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, QEMU devel list <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 25, 2021, at 12:18 PM, Kevin Wolf <kwolf@redhat.com> wrote:
>=20
> Am 24.05.2021 um 18:06 hat Programmingkid geschrieben:
>>>>> qemu-system-ppc -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path of a host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone
>>>>>=20
>> On a related topic would you know if it is possible to use fat32
>> instead of fat16 for host folder sharing? I did try replacing the =
text
>> fat16 with fat32 but it didn't appear to work.
>=20
> I think the correct syntax is fat:32:rw:<path>. But one of the first
> things it does is:
>=20
>    warn_report("FAT32 has not been tested. You are welcome to do =
so!");
>=20
> So probably nobody would be surprised if it broke.
>=20
> Kevin
>=20

Thank you very much for this information.=20


