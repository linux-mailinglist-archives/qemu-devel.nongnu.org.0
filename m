Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7245D1F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 14:45:17 +0200 (CEST)
Received: from localhost ([::1]:51192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hblZy-0001SM-Hx
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 08:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59197)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hblVz-0008R0-UG
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 08:41:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hblVv-0000HV-Ty
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 08:41:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hblVv-0008Un-LV
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 08:41:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so2363836wrl.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 05:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v32XlUrSkGaRG+KWAql5XIaDQDY5t68oilTV9PkhIMQ=;
 b=s4deBXYsYaSil47YGJl/i/UaM4F3Q6Z9nbYZORF1ZACdwSTk4hJp4haQWNVunDXM1d
 7iTwR+VgI+H0/6JdjsXYZQuPvx80FMHcsctKiXMxO3x63t6dSftkBpXeboBIRwNdd55k
 /pTR/U9LPvBj6z4DbidakakxX8UDX/kpmY/M9y5tMJwkkDLyreyPDh1luJ5Qzy5nIoVX
 qLheKTGIOqbh5EDEru4xKGFj0fYwWn3k/SbZnLUnBwPsD/AnpOLgXdK8I5eZrH6NfX0P
 7fWbf7hMVmKNCJqec/qpgGQ1PoZWVVkUJW4i7d6nEPJVsiWyj0HxocabE6hLrzGLCE8p
 MHiQ==
X-Gm-Message-State: APjAAAUGF6rxXV2Ew1v+DuT5uY3wq5YVhFqJoJYAFMxJjidbkFuroRaA
 pKI4Qaxs8Wd2oTKPbhMTwFA7yg==
X-Google-Smtp-Source: APXvYqw/RPs9lfslppQadAyqXkQLZg9/bAEQ6Xa4TibO7DqTz+TB6nOCaTLBSnMEpsdfB/KXItGGSQ==
X-Received: by 2002:a5d:52c7:: with SMTP id r7mr63187811wrv.110.1560516040637; 
 Fri, 14 Jun 2019 05:40:40 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id x4sm4052729wrd.46.2019.06.14.05.40.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:40:40 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, Kevin Wolf <kwolf@redhat.com>
References: <20190605213654.9785-1-ptoscano@redhat.com>
 <a8797829-a5c6-24a3-647f-14872bc2f951@redhat.com>
 <c4376dbb-d755-f05f-fb93-ed212bf30bb0@weilnetz.de>
 <20190614094252.GD6042@dhcp-200-226.str.redhat.com>
 <60460e9f-2254-7b76-3418-7c495aec3822@redhat.com>
 <97e6ec51-a9e6-cff8-3c56-9299450aad2f@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5d9ce892-8927-b41f-1a76-fe6f6d0a5af3@redhat.com>
Date: Fri, 14 Jun 2019 14:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <97e6ec51-a9e6-cff8-3c56-9299450aad2f@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v6] ssh: switch from libssh2 to libssh
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, rjones@redhat.com, mreitz@redhat.com,
 Pino Toscano <ptoscano@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 2:29 PM, Stefan Weil wrote:
> On 14.06.19 12:13, Philippe Mathieu-Daudé wrote:
>> I agree with Kevin. The only user of the 'ssh' block driver that I am
>> aware of is the virt-v2v tool:
>>
>> http://libguestfs.org/virt-v2v.1.html#convert-from-esxi-hypervisor-over-ssh-to-local-libvirt
>>
>> Stefan, do you think someone would use it on a Windows host?
> 
> 
> I simply don't know. Typically people contact me if something does not
> work. Rarely they send an e-mail to say what they do and that everything
> is fine.
> 
> If QEMU for Windows builds without libssl, I'll build binaries without

"libssh" ;)

> it, add that information to the release notes and wait what happens.
> 
> So no objection from my side.

Glad to hear, thanks!

Pino: Can you improve the commit message to explain that QEMU only uses
libssh for the 'ssh block driver'? Maybe you (or Kevin/Max) can also add
a 1 line description of what is a 'block driver', so reviewer are not
worried that a feature might be removed.

Thanks!

Phil.

