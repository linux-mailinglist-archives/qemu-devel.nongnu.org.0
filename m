Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E8141384
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 22:44:24 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isZPj-0004HV-6Z
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 16:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1isZOX-0003ou-TP
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 16:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1isZOW-00025a-PO
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 16:43:09 -0500
Received: from ma1-aaemail-dr-lapp01.apple.com ([17.171.2.60]:60810)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1isZOW-00024i-K6
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 16:43:08 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp01.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp01.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 00HLg7Ha035957; Fri, 17 Jan 2020 13:43:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : content-type
 : content-transfer-encoding : from : mime-version : subject : date :
 message-id : references : cc : in-reply-to : to; s=20180706;
 bh=qAk5AwzlTzE+JHV25oC42OZE/RTkiA+IAVQNwblvZrg=;
 b=U12qBxNCuQisqRw6z/2qrOw+mdlK2nlay83JnAmWTJn7Avm9ZjjT/SQkXLv5LOJuZu96
 kvAN9fkZp+96glj1ZMz8pvEOiejz3bCgE0GfezWaicmmBd0gpN0b0p5tDAcuyGjxoW4D
 pHS2+XHNROJVYrZcJdj+3BWUvVB+ZXjjMHJ12HOXTE5Mv3MoLPihWFzaB4pQLd8mwa3r
 v9gWQHQ91GWBeeuF5tKSURxk9Ms2nZ3Z/iSkuf6TWFeKr0IyGfY/jTyX7VsrBb7WJ5N9
 +Sv7SCrLNTjSTxuMyBYykXAT9eSTu+VKe9NDiltP0wlobCv3ph1sscXX3A5AiQRSWLYv /Q== 
Received: from ma1-mtap-s03.corp.apple.com (ma1-mtap-s03.corp.apple.com
 [17.40.76.7])
 by ma1-aaemail-dr-lapp01.apple.com with ESMTP id 2xfdw99w9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 17 Jan 2020 13:43:07 -0800
Received: from nwk-mmpp-sz09.apple.com
 (nwk-mmpp-sz09.apple.com [17.128.115.80]) by ma1-mtap-s03.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q49003SLTNR8O10@ma1-mtap-s03.corp.apple.com>; Fri,
 17 Jan 2020 13:43:04 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz09.apple.com by
 nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q4900L00T53N400@nwk-mmpp-sz09.apple.com>; Fri,
 17 Jan 2020 13:43:03 -0800 (PST)
X-Va-A: 
X-Va-T-CD: e453fe7e51fd089f43dd72677d71143c
X-Va-E-CD: 96db56e8de44b13642a708958e9da172
X-Va-R-CD: 6d5c2ad239283543a9f2829d6df51a97
X-Va-CD: 0
X-Va-ID: 76e6b16b-38be-4334-b9dc-227a1655694f
X-V-A: 
X-V-T-CD: e453fe7e51fd089f43dd72677d71143c
X-V-E-CD: 96db56e8de44b13642a708958e9da172
X-V-R-CD: 6d5c2ad239283543a9f2829d6df51a97
X-V-CD: 0
X-V-ID: a19f1189-65f7-476f-96df-6bd1b9e5243e
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2020-01-17_05:,, signatures=0
Received: from [17.234.116.82] (unknown [17.234.116.82])
 by nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q4900CJ6TNQYD60@nwk-mmpp-sz09.apple.com>; Fri,
 17 Jan 2020 13:43:03 -0800 (PST)
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
MIME-version: 1.0 (1.0)
Subject: Re: [PATCH v1] vnc: fix VNC artifacts
Date: Fri, 17 Jan 2020 13:43:02 -0800
Message-id: <C23889A4-CD29-4B95-9D43-DA6FB7C179C0@apple.com>
References: <20200117074530.mt2upbm7y5knyj7j@sirius.home.kraxel.org>
Cc: qemu-devel@nongnu.org
In-reply-to: <20200117074530.mt2upbm7y5knyj7j@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: iPhone Mail (17C54)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-17_05:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.171.2.60
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
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

I=E2=80=99m new to this process, what are the next steps?

Cameron Esfahani
dirty@apple.com

> On Jan 16, 2020, at 11:47 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> =EF=BB=BFOn Thu, Jan 16, 2020 at 07:50:58PM -0800, Cameron Esfahani wrote:=

>> Remove VNC optimization to reencode framebuffer update as raw if it's
>> smaller than the default encoding.  QEMU's implementation was naive and
>> didn't account for the ZLIB z_stream mutating with each compression.  Jus=
t
>> saving and restoring the output buffer offset wasn't sufficient to "rewin=
d"
>> the previous encoding.  Considering that ZRLE is never larger than raw an=
d
>> even though ZLIB can occasionally be fractionally larger than raw, the
>> overhead of implementing this optimization correctly isn't worth it.
>=20
> So just revert de3f7de7f4e257 then ...
>=20
>> In my investigation, ZRLE always compresses better than ZLIB so
>> prioritize ZRLE over ZLIB, even if the client hints that ZLIB is
>> preferred.
>=20
> ... and make this a separate patch?
>=20
> cheers,
>  Gerd
>=20
>=20

