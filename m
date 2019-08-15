Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FE8E320
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 05:21:14 +0200 (CEST)
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy6K9-00072E-Ns
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 23:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hy6JF-0006Zk-IH
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 23:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hy6JE-0000c6-E8
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 23:20:17 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:57881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1hy6JE-0000Qa-9d
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 23:20:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1565839210; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=TGRmOencxkNJKKjbOhlM38uvH+S9TS7YhpbtNU8KsUo=;
 b=yd2Jr8BWuKppqWGTSyWrouYESODd1vE8tYb+euIXTmtWrbmaY1ZlbBVo7yGFvVdS4pfwG638
 qG3o6qWgxDD+lY2WAfsRz4pdRsH9Ze9oDeTZcNCaFfufrRcVQ4dNRPCBITdiKfzsm4efzhcb
 8bxkudlpvJP4CMiNFzyItPd5T7b4DblXVY0jGiYu0/I/q6wluhaMGcAw7f1tZYl54+3AxsC9
 EdCOIL4WW5jREvA2tPtEM08+p6lgFMQbnE75kt6WhLeNec9i7obQjoyR+YqGH7joeFUuKVJZ
 xUykIBJ7Xz5Q0preZxlRDKv0AUbRwuTEa8GMTpOJaK6SHOywTOa0kQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mxa.mailgun.org with ESMTP id 5d54cf67.7fe250f0ebf0-smtp-out-n03;
 Thu, 15 Aug 2019 03:20:07 -0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x3so774345lfc.0;
 Wed, 14 Aug 2019 20:20:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVCtMJQQkq3/AH3mkEHtel47ZsJLAVwAocSiQWWlt7n6kQtJeSX
 24AQhmtkXNocmlBqTbRrZRwCEk/uKQM7e/PGmEE=
X-Google-Smtp-Source: APXvYqwZFRkstBb1VAzkVdfbew4AawzIrkKGElCn1QcxgEZMyab1OvQT+XWlX75BvdTIVpeT4SIceHRbymph9yAtN7Q=
X-Received: by 2002:a19:6f09:: with SMTP id k9mr1318809lfc.102.1565839205247; 
 Wed, 14 Aug 2019 20:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190701154617.22908-1-jonathan@fintelia.io>
 <CAKmqyKOsMO7SvvDfiqhywxb=oaqo=NDjw==reVpU9sLh+3dGuw@mail.gmail.com>
 <CAEUhbmXBnu_Fet99AjQj6XZ10m045N8kY7d8VNy28ktmFBsrQQ@mail.gmail.com>
 <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
In-Reply-To: <CANnJOVGXcTkH2_2cRqAv0CnZx4xHQ_npEjW-au-FPxe_cU0=5Q@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Wed, 14 Aug 2019 23:19:39 -0400
X-Gmail-Original-Message-ID: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
Message-ID: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
To: "open list:RISC-V" <qemu-riscv@nongnu.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2] target/riscv: Hardwire mcounter.TM and
 upper bits of [m|s]counteren
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping! What is the status of this patch?

On Wed, Jul 3, 2019 at 2:02 PM Jonathan Behrens <jonathan@fintelia.io>
wrote:

> Bin, that proposal proved to be somewhat more controversial than I was
> expecting, since it was different than how currently available hardware
> worked. This option seemed much more likely to be accepted in the short
> term.
>
> Jonathan
>
> On Mon, Jul 1, 2019 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>> On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis <alistair23@gmail.com>
>> wrote:
>> >
>> > On Mon, Jul 1, 2019 at 8:56 AM <jonathan@fintelia.io> wrote:
>> > >
>> > > From: Jonathan Behrens <jonathan@fintelia.io>
>> > >
>> > > QEMU currently always triggers an illegal instruction exception when
>> > > code attempts to read the time CSR. This is valid behavor, but only if
>> > > the TM bit in mcounteren is hardwired to zero. This change also
>> > > corrects mcounteren and scounteren CSRs to be 32-bits on both 32-bit
>> > > and 64-bit targets.
>> > >
>> > > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
>> >
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>>
>> I am a little bit lost here. I think we agreed to allow directly read
>> to time CSR when mcounteren.TM is set, no?
>>
>> Regards,
>> Bin
>>
>
