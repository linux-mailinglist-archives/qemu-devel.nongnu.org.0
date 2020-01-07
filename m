Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA71132875
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:07:50 +0100 (CET)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopWP-0004R9-Du
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iopLA-0001C0-8T
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iopL9-0003wr-1Q
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:56:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38667
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iopL8-0003wa-UW
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578405370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrWqu9GBqMZixmL4RACyDAhAI7ES5+5rpa8/IzsFY4I=;
 b=iWseT2hTdgQgR1jPT92B3Rzp8S0hvwhpeJfW0PYNAFzstF/HTSbIyhGFVDAqfRbNGFt61c
 2W3mM2NWEXe4iWoEnl7rG8ab7wciRa++giuloPmzewqSEcgwEWOsLflkdvcdW/JlyyyEqw
 YmqrgxkjX6rAlmgfXUSX+WcgxQrlKYk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-28nYnWr_Mjqcl9DsQrBgdQ-1; Tue, 07 Jan 2020 08:56:09 -0500
Received: by mail-wm1-f72.google.com with SMTP id g26so1965579wmk.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 05:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hc1yJfEjNyr3441XE8a76KFJd1zcXLNbt/2mctO4szA=;
 b=JxVrsdWHcGbM3PgOgRiS6sRAVoWCXYwgQm3FfhqPhCobunx61oQ4l/SV4p8nb0S8Oy
 OEcgPiQ9t4++5Okl1DBFvtaObzdNIHYXtjBDYdIsCwdzPKCIcUfSbkh02U6pZxQ1xCua
 UcqgyA2JC1iAilcELj0Ikk4jq8gGajCAvTjBvQ0Xr0ulJInUS5LUUaPUn/slhVqJJMty
 Fx1Erh4GnVw6TliIV3wVwL2Z5w0h2j9IStb9dIQOBm4l0jHXIOeAYXZS2PfD16YprW/L
 t6yf+OLwZiCLRBdhMzX2fd6PLxwUXW5BK3dah1VS+a2cf+JN1MMs8Mb26d0OTTn7wiYW
 P1kg==
X-Gm-Message-State: APjAAAVTt53ixTOVjXDyLuvyWfJAuC0QPvwPl2zIryoxQAv74uT6nz1z
 Xq9m/XNx2StCzbLdb0zEWEKK/qpDTeSiy2QBc5GBYi68H8IJKg1DKqAzFt0dR+wNqFp5NcklaUw
 fvClgOeiU2dLsDUA=
X-Received: by 2002:adf:8041:: with SMTP id 59mr104998909wrk.257.1578405368085; 
 Tue, 07 Jan 2020 05:56:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqysAZUfznQGIIyJscWPtR/xweEQ/jLH2AeBHSfLnJXcblrHEqKRprIap04bfuOGuMkWQndA2A==
X-Received: by 2002:adf:8041:: with SMTP id 59mr104998889wrk.257.1578405367937; 
 Tue, 07 Jan 2020 05:56:07 -0800 (PST)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id e16sm75504566wrs.73.2020.01.07.05.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 05:56:07 -0800 (PST)
Subject: Re: [PATCH v9 14/15] hw/i386: Introduce the microvm machine type
To: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org
References: <20191015112346.45554-1-slp@redhat.com>
 <20191015112346.45554-15-slp@redhat.com>
 <6276a8e7-2928-6e33-64a1-3ae01a30a718@redhat.com>
 <a5863b05-4021-df51-d84f-1bb070fa6137@redhat.com>
 <8eec451f-3ee3-b111-2c03-3c29ade661a6@redhat.com>
 <21e2508a-764f-1db9-9c53-dc9eb43d7f68@redhat.com>
 <c9733853-9202-504e-c823-b4441322d3fb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e62c826-4a5f-4ac5-86ed-077bbad31667@redhat.com>
Date: Tue, 7 Jan 2020 14:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c9733853-9202-504e-c823-b4441322d3fb@redhat.com>
Content-Language: en-US
X-MC-Unique: 28nYnWr_Mjqcl9DsQrBgdQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ehabkost@redhat.com, mst@redhat.com, kraxel@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 imammedo@redhat.com, rth@twiddle.net, lersek@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/20 2:35 PM, Paolo Bonzini wrote:
> On 24/12/19 01:09, Philippe Mathieu-Daud=C3=A9 wrote:
>> We have CONFIG_SERIAL_ISA declared in "config-devices.h" so we could
>> also use:
>>
>> -- >8 --
>> --- a/hw/i386/microvm.c
>> +++ b/hw/i386/microvm.c
>> @@ -153,9 +153,11 @@ static void
>> microvm_devices_init(MicrovmMachineState *mms)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 microvm_set_rtc(mms, r=
tc_state);
>>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> +#ifdef CONFIG_SERIAL_ISA
>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (mms->isa_serial) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 serial_hds_isa_init(is=
a_bus, 0, 1);
>>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>> +#endif
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (bios_name =3D=3D NULL) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bios_name =3D MICROVM_=
BIOS_FILENAME;
>> ---
>>
>> The binary links too, and the difference with the other hunk is now the
>> device is not listed in 'qemu-system-x86_64 -M microvm -device help'.
>> However I guess understand we prefer to avoid that kind of ifdef'ry.
>=20
> The ifdef'ery is okay in board code, but in this case I think it would
> be even better to have a stub for serial_hds_isa_init that gives the
> right error (via Error*, and then you can call it with &error_fatal
> etc.).  So for now I included your patch that changes it to "select"
> from the other series.

Clever! I'll wait Marc-Andr=C3=A9 SerialState cleanup gets in and will do a=
s=20
suggested.

Thanks,

Phil.


