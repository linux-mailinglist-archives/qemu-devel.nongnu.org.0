Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E90748DD70
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:06:49 +0100 (CET)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84Uq-0005oB-4h
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n84Ng-0000RJ-7Y
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:59:24 -0500
Received: from [2001:738:2001:2001::2001] (port=17396 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n84Nd-0007dP-0E
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:59:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8D1807470AB;
 Thu, 13 Jan 2022 18:59:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 74346746FEB; Thu, 13 Jan 2022 18:59:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72986746351;
 Thu, 13 Jan 2022 18:59:13 +0100 (CET)
Date: Thu, 13 Jan 2022 18:59:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: /usr/shared/qemu binaries
In-Reply-To: <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
Message-ID: <f75aa7ab-dbca-fa52-a472-707e64d4457c@eik.bme.hu>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
 <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, Liviu Ionescu <ilg@livius.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022, Paolo Bonzini wrote:
> On 1/12/22 14:56, Peter Maydell wrote:
>> Those are UEFI firmware images which are suitable for using with
>> the arm/aarch64 "virt" board. They're only used if the user specifically
>> asks to use them on the command line (eg with
>> "-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
>> similar).
>
> There must be lots of zeros in there. Maybe we should tell QEMU to unpack 
> firmware .gz or .lzo files?

May be a crazy idea, but could the above command read format=qcov2 files 
that don't need to have the zeros or may be compressed without adding any 
more support to QEMU? (Or any other compressed format already supprted by 
-drive if there are any.)

Regards,
BALATON Zoltan

