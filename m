Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76613CD0B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 20:26:44 +0100 (CET)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iroJP-0001ct-DI
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 14:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iro7Y-0001hJ-1w
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iro7W-0004Wo-Si
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:14:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iro7W-0004WH-P1
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579115666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTTLMLIvukkldS+fu/A59m1PCasZJjH2HbPuugTQUZw=;
 b=B1g3TXwa2wl9DydR/trE8XqQD4T2Twy8xblU5L8lU62JskG5kxoO45KM0UVXJjL0cP9fdw
 p+y0sbePTWweSX1tDPqCZ8WIkqRbLJtHA9Hj2xbrFie6bWtT9W4jP6KiRzC/1od5jfnIoD
 3An89904pJyA+VK3ffZZlXNfpJoo2ks=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-y9JC0InZM3q9V9gMSCNoEw-1; Wed, 15 Jan 2020 14:14:24 -0500
Received: by mail-wm1-f71.google.com with SMTP id t4so294394wmf.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 11:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tyq3pBuF6TOo7kMQJPTlqteZYvGOewaYnB/341dfiYA=;
 b=m+lZogLn+ZES6KBBc65d+1K1wsj9vLSJgF/iJrRSCCHVturTdX0c9g8STordMVvmL4
 RtQ1jkjLi6cjWbsZ98HUIa8nKSSWjAKFVynGtPaIqhFfBri+X/DV7H3xB9gHvLefKOtT
 3zmNOzSXfG7fWhMIU//z2r35MdrDFBnaAmFW5vhjhJkWjAt9y6JbiiKXFuJHZvv6MXQG
 wjQCs2MEDQy+Uo80egjQTuibNZgXA1Dt1QCw4AbFuU4N02L6SHccqNf2xQZU3ESDQRPX
 eIBTt/qTZI5bVPWUxe1oQ21rjFgarkJlK+OwQCAU9jsW2R3bmRvw9On7rWPbbKdrXe0M
 pw+g==
X-Gm-Message-State: APjAAAWTS1kFxRozzhx3B63RjPAm5wOSUMr5IhuIiaAkQTkkGbz1NTyr
 INIHNJrpzpdUbvUA1YGK0aMbU4yTD98EM4rwWe74FtlvQ+n+LNJO60V057iDWftSKYsAE7RY6D6
 1BQlyfmGE7/00oWE=
X-Received: by 2002:a5d:458d:: with SMTP id p13mr34050726wrq.314.1579115663269; 
 Wed, 15 Jan 2020 11:14:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqz26r7stOkOGWBOWASzSeuVzUDIJcThqs7qm12tZxCRwgFZWR3szzXMEg1zurIcpT9DxcyL6g==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr34050711wrq.314.1579115663013; 
 Wed, 15 Jan 2020 11:14:23 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
 ([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
 by smtp.gmail.com with ESMTPSA id h2sm27051333wrt.45.2020.01.15.11.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 11:14:22 -0800 (PST)
Subject: Re: [PATCH v2 41/86] hw/hppa/machine: Correctly check the firmware is
 in PDC range
To: BALATON Zoltan <balaton@eik.bme.hu>, Igor Mammedov <imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-42-git-send-email-imammedo@redhat.com>
 <alpine.BSF.2.21.99999.352.2001151914440.24151@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <caded923-2daa-9ec2-8129-fb76a744042f@redhat.com>
Date: Wed, 15 Jan 2020 20:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.99999.352.2001151914440.24151@zero.eik.bme.hu>
Content-Language: en-US
X-MC-Unique: y9JC0InZM3q9V9gMSCNoEw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/20 7:15 PM, BALATON Zoltan wrote:
> On Wed, 15 Jan 2020, Igor Mammedov wrote:
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> The firmware has to reside in the PDC range. If the Elf file
>> expects to load it below FIRMWARE_START, it is incorrect,
>> regardless the RAM size.
>>
>> Acked-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>> hw/hppa/machine.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
>> index 5d0de26..6775d87 100644
>> --- a/hw/hppa/machine.c
>> +++ b/hw/hppa/machine.c
>> @@ -155,7 +155,7 @@ static void machine_hppa_init(MachineState *machine)
>> =C2=A0=C2=A0=C2=A0 qemu_log_mask(CPU_LOG_PAGE, "Firmware loaded at 0x%08=
" PRIx64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-0x%08" PRIx64 ", entry at 0x%08" PRIx64 ".=
\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware_low, firmware_high, firmware_entry)=
;
>> -=C2=A0=C2=A0=C2=A0 if (firmware_low < ram_size || firmware_high >=3D FI=
RMWARE_END) {
>> +=C2=A0=C2=A0=C2=A0 if (firmware_low < FIRMWARE_START || firmware_high >=
=3D=20
>> FIRMWARE_END) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("Firmware overla=
ps with memory or IO space");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(1);
>=20
> Should this also be EXIT_FAILURE like in other places when you're=20
> changing the line nearby?

I didn't changed this line, this seems unrelated to the patch purpose.


