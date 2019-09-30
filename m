Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F44C2983
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 00:28:38 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF49l-0003n3-5Y
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 18:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iF48p-0003F8-0G
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 18:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iF48n-0003F3-0n
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 18:27:37 -0400
Received: from linux.microsoft.com ([13.77.154.182]:60084)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>)
 id 1iF48j-0003DO-LE; Mon, 30 Sep 2019 18:27:33 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 17FA82010688;
 Mon, 30 Sep 2019 15:27:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 17FA82010688
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 qemu-devel@nongnu.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
 <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
 <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <88878b22-803f-41fc-9df2-2c6eb551b98d@linux.microsoft.com>
Date: Mon, 30 Sep 2019 15:27:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
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

On 9/27/19 2:15 AM, Philippe Mathieu-Daud=C3=A9 wrote:

> Cc'ing Ard too
>>
>> https://salsa.debian.org/debian/atf-allwinner/commit/b6b671c4ac4bd5595=
306863225bb3bece1e6135c
>>
>>
>> Current limitations:
>> * Only cold boot is supported
>> * No build instructions for QEMU_EFI.fd and rootfs-arm64.cpio.gz
>> * No instructions for how to load a BL32 (Secure Payload)
>>
>> So looks like only cold boot is supported (no kexec support)
>> Is this correct?

Just wanted to check again -

Does ATF and QEMU (for ARM64) support cold boot only and does not have=20
support for kexec?

thanks,
  -lakshmi

