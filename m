Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0A963E9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 17:15:46 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i05rN-0000qF-Gv
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 11:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i05qP-0000PH-3p
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i05qO-0007fL-01
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49160)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i05qN-0007eh-OY
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 11:14:43 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC106C047B6E
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 15:14:42 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id h3so7189666wrw.7
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 08:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fd/2n21nVkxUxmmW8ie2dhjNS+F/De59CJBc4HRAo7s=;
 b=WRtN1tgW0yJ3dS7VOb8qkWPXvRjTJZN9Jmn7QKvK1blYKYG5U+G9Ca81FO2y3h0DZ3
 OptO0ZtL7lJApyoz6fTkDMrS1k3CYtdBJ2PwI4WFYlcygs9C6rx3OhMiU4TvjOBRChfB
 uvq22eku+WaUwjIAYCFiL5WBlCfy2+IwppsqiDTfK8pUZTji/rkI1bD8dMJnEkEJzrkW
 jur2YmvJBH/VdVZ4kHLuJP1WvrpbBwGHo6z3pmo3lGn82k/LzXgNXD2J2IWJ5pejncPd
 5Bd5QQ3oldQxo1aP54+2l5ukRinzsK7M0jZ9F+SHWdbi4UHEGkQX8fpV+jx/SFMF+pvb
 dXqA==
X-Gm-Message-State: APjAAAVI3gvQxEHnYj+M+pr783OsrEOyWzpTJRekkQAN7q5iYQVC9gl0
 8eQpzr+OO5ISfr5hXz6QWx0gQUZNv6drGl8Eccb9LgoqjSb3mgioA0Q88bB3IAPZEFhluW7Ku9h
 TzgYOU1yKY7QU3SE=
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr34700203wrx.122.1566314081422; 
 Tue, 20 Aug 2019 08:14:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG73tOzNKUrIMd7tolwVlxkD4mmOV5Djt2+nXK7vxUGpIkAezmX0IYZ8+aYSQpjUrybFAy8A==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr34700184wrx.122.1566314081261; 
 Tue, 20 Aug 2019 08:14:41 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id k124sm562328wmk.47.2019.08.20.08.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2019 08:14:40 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <alpine.BSF.2.21.9999.1811292101280.5887@zero.eik.bme.hu>
 <alpine.BSF.2.21.9999.1901151926320.72972@zero.eik.bme.hu>
 <e72fd744-3440-a684-38c4-75d6d604cddb@redhat.com>
 <alpine.BSF.2.21.9999.1908201648370.56910@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9b099b2c-07d6-9733-fe90-2c2a974efc44@redhat.com>
Date: Tue, 20 Aug 2019 17:14:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.9999.1908201648370.56910@zero.eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Booting Raspbian on RPi emulation
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
Cc: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Zoltan,

On 8/20/19 4:50 PM, BALATON Zoltan wrote:
> On Tue, 15 Jan 2019, Philippe Mathieu-Daud=E9 wrote:
>> On 1/15/19 7:29 PM, BALATON Zoltan wrote:
>>> On Thu, 29 Nov 2018, BALATON Zoltan wrote:
>>>> Then I've tried the same with the pll patches posted by Philippe
>>>> Mathieu-Daud=E9 here:
>>>>
>>>> http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg00191.htm=
l
>>>>
>>>> on top of v3.1.0-rc3 which helped to get rid of the cprman warnings
>>>
>>> Will these patches be merged eventually? These seem to at least get r=
id
>>> of some annoying warnings in Linux boot dmesg.
>>
>> I'll respin this series addressing Peter's comments.
>>
>> Thanks for reminding me ;)
>>
>> Phil.
>=20
> While you're at raspi patches maybe I remind you again of the above :-)
> I think I haven't seen these being merged yet but correct me if I'm wro=
ng.

You are correct :)

I did address the issue reported by Peter regarding the CPRMAN block.

Guenter tried the series and reported issue with the A2W block (he did
implement it, basically to return 0x10001 for a pair of registers, but I
hadn't implemented it).

Now I have a basic A2W implemented, but I can't reproduce the error
Guenter reported, so I was waiting for more spare time to invest on
this. Anyhow meanwhile I can post my work as RFC.

Regards,

Phil.

