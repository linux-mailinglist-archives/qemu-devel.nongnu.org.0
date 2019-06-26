Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E46563FE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 10:06:09 +0200 (CEST)
Received: from localhost ([::1]:37478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg2wT-0004zj-67
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 04:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40331)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg2sB-00030o-VT
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg2s3-0006Qt-F4
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:01:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg2s1-0006Hv-Vm
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:01:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so909610pff.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 01:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GNVjCt/UnOvfzM54OS4u394MdYdibYc6JR2d6IeD4Y0=;
 b=RcbHHlfQdTAKroewONTz11vG1nPbSt/zC/DCJdu/pvrCbSAImndpwuwgCr8jcqsF91
 tFz8bqIQdMON4CxeQHBDUZv13s7hXW09kQc8iz0gkooNm0YquCKOUW/ArNWM4NBCN1IP
 UbzI9KI6xLgxqp5ddvxX8PvT2VBYOdbxBGWXpuuk2YCGIm5cTfM1gHT1ZgaK0fNPjiqq
 86oiwDvyZr6m1cPtmjG8tbIdwUndyzjXwCVzWBHKjCdlpwAl+3m5b6w2Yg/fscJxDZoP
 RBs/w7uaQaA5hO8smiBJKazh4QWm9u8Zy3H3Vz9niheYg0jhr2MKxG6X0AAJBDW3HHw9
 xQtQ==
X-Gm-Message-State: APjAAAUa5SGsXIS4TQ/8NDNt867CsfoHPSDru0za+AMGjGzcQKlMI39k
 FANbRK2q1d5/2eMf703u+EZGdA==
X-Google-Smtp-Source: APXvYqzWvmc5RwFpr2xclUy9ABN40j9WXGJ2TZi2+Zi/U1OQuc3MMc8NfFQoi1Y+58p0juwDBglkBw==
X-Received: by 2002:a63:2bc8:: with SMTP id r191mr1604595pgr.398.1561536076676; 
 Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id g9sm13976523pgq.88.2019.06.26.01.01.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:01:04 PDT (-0700)
In-Reply-To: <CAEUhbmVGdeX7j1ep1vJKhZ8a-4K2j-G40LjBJqDkXOi4WM-B9w@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-8dd07bdd-b2dd-46f7-ab0b-a14fe7cf7506@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-devel] [PATCH] riscv: virt: Correct pci "bus-range"
 encoding
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
Cc: alistair23@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jun 2019 18:47:33 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi,
>
> On Fri, Jun 7, 2019 at 2:46 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Thu, Jun 6, 2019 at 5:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > On Thu, May 30, 2019 at 11:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > Hi Alistair,
>> > >
>> > > On Thu, May 30, 2019 at 11:14 AM Alistair Francis <alistair23@gmail.com> wrote:
>> > > >
>> > > > On Wed, May 29, 2019 at 1:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > > >
>> > > > > The largest pci bus number should be calculated from ECAM size,
>> > > > > instead of its base address.
>> > > > >
>> > > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > > >
>> > > > This seems ok, can you maybe explain what this fixes?
>> > > >
>> > >
>> > > The logic is wrong, as the commit message said. With current wrong
>> > > logic, the largest pci bus number encoded in "bus-ranges" property was
>> > > wrongly set to 0x2ff in this case. Per pci spec, the bus number should
>> > > not exceed 0xff.
>> > >
>> >
>> > Ping?
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Can this go in the 4.1 PR?

This one I didn't miss, it's been in the queue for a bit.  Thanks!

