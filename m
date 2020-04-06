Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429D19F9E6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 18:12:54 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLUMn-0006Sx-Hy
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 12:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLULS-0005K6-Na
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:11:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLULR-0005P5-PI
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:11:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60883
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLULR-0005Ou-MQ
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586189489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQQbikWrDbdRT/2b9iJ1rlb0p9n42x/FY8kTVsIeAxc=;
 b=VUMdKWI+QbokWo0xdNsNcrC7mKG56eJiwCzSQ0m77HpzbCTZc/uOL40AErkPZHiR6+h4ko
 XQS8HhqEn+0ll4a8nXevneEDYbHRW0lCLOefKEKmpj0PGnSQEdsw0Q7sXuWnkpGFvCOido
 60LlK6y879x1S+gVNYxGE99rZxPhwuM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-R5peRNX7MLKjwNQRw7B-pQ-1; Mon, 06 Apr 2020 12:11:24 -0400
X-MC-Unique: R5peRNX7MLKjwNQRw7B-pQ-1
Received: by mail-wr1-f69.google.com with SMTP id q9so26161wrw.22
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 09:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vLRR0IoudcyHvehlgA9QW7bxkhMaqO30njh+KbIsHU=;
 b=YrMnnbwkscAtxqZT6PCdpj1l3hh8OqGBk36E1IEp9e/y5NJKzSmS6KxaHL+wyU2vif
 ssQB0OZ2g1qVacpXMQXVpS26H8z4JI/ndYRsSXE9Iwh1L3Wm3vkoGUw9fpZ7gXPjpPo0
 upwxy48xw1FRQ8dRFSOTJuj3P0tOsv6Y2ux9ETtU7OSlTTymy9KaB8zE5D2fe9mQPV2+
 ziu3FOOOmDixs0zjtVWti0z6Zba7D9BiMQ450Z0asy6y3KaXp4y9LgMzJGuuPOADRpNC
 N5F0iHlOKyqw0EGUGyLjD4fYuZrmVLWsp7Kw+AVUu5RHzb7+76hU0mBhNtKJMfWz8rSF
 DmGA==
X-Gm-Message-State: AGi0Pub9JaXqzPlhxSZdP7JDpBZHG3ev7dmK198wTDOP6j0hE90dMFwu
 GkxsU0zShKmZmQ1r2a9/fC2TIWKS4a44rr9RPNtge3ZV6HnK0SlDdINB0ZwlKjzIPfUyXWQ1mKF
 90OOCao3ooB6ZaNc=
X-Received: by 2002:a1c:e408:: with SMTP id b8mr138341wmh.68.1586189483359;
 Mon, 06 Apr 2020 09:11:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyp06ImfJogCs7Mbu3sMpp0jyq0TtQxtBYNnCqBsz/8PG2XbqXKUT2heu/jNtVA1xHJ43hEw==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr138326wmh.68.1586189483180;
 Mon, 06 Apr 2020 09:11:23 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id y20sm58256wmi.31.2020.04.06.09.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 09:11:22 -0700 (PDT)
Subject: Re: MemoryRegionOps callback sizes
To: hgedek@gmail.com, qemu-discuss@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>
References: <CAA2XNu=od8w5B1PMjq-nyOfZVXf6QeQGfXP20NQQvuWvdZ7-uQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39fc9886-4d11-e300-0daf-1766faac4497@redhat.com>
Date: Mon, 6 Apr 2020 18:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAA2XNu=od8w5B1PMjq-nyOfZVXf6QeQGfXP20NQQvuWvdZ7-uQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 4/6/20 5:49 PM, hgedek wrote:
> Hello,
>=20
> Im new=C2=A0to qemu and trying to update a project that=C2=A0developed=C2=
=A0before me !=20
> I have a question, thanks for help.
>=20
> Memory allocation is done using MMIO and its created 64 bits bars for=20
> it. And while accessing pages I wish to see 8 bytes at read / write=20
> callbacks but 4 bytes are used.
>=20
> I wish to learn how to edit this ? How can we set MMIO will use 64 bits=
=20
> =3D not 32 bits ?

Is your guest using 64-bit accesses?

If the device only allow 64-bit, it should have:

static const MemoryRegionOps ops =3D {
     .valid.min_access_size =3D 8,
     .valid.max_access_size =3D 8,
     ...
};

>=20
> ( I hope I can explain =3D sorry )
>=20
> Thanks
>=20


