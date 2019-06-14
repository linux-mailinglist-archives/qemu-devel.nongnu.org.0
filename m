Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26645A65
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 12:28:32 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbjRf-0000UU-NA
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbjO8-0005Ln-Vg
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 06:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbjDD-0003HY-9V
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 06:13:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbjDD-0003GI-3c
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 06:13:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so1891851wrm.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 03:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Th74BMY9iCIEC/zAgYLLPkUV8RKEDnr830BiO5kXvD8=;
 b=HeVdiCJqjYvlc/6Kc/GlpGRn2hcor4DXkSZl//XEa33i+iKZSqT4g8AegG38MQ+hZy
 7gf8orHnfsgSQHgKjcOireiUNr2fafdl3CzZ/5S9yiPwVrfU8rGcht5hp098oDjqgB16
 qHqZE6X4nXbCWYz2u1+qHn3k3KCB4w4TfIk4QgkTU7b/YbPN+J9+wQ0L13Nly1DP6wj0
 e9fPxb6dMf75Pj3ChzKA3UQDRKUcjDT7NwRxhH5+Z/jcGxxZL2peo9vNYFpmJ0jFzlhR
 9l8rP4/IvnXMp9x8lpSROZ0C9uzbrtCYDipBH8s34n8u0pwYw+XSfK+VWE343UbOOS7V
 mvHg==
X-Gm-Message-State: APjAAAUW0RxGAhg/D6uhBGZXdAjbYqUQM+PfvhvkIHkwBpKxX5bywMcC
 eE53vImHYW5Zf3LClj1ijLxQPA==
X-Google-Smtp-Source: APXvYqxYy/1IXbLKQyVA99N9SbducxWM5KucjGQkCC0yuqZaCbrM7Mz13cARNNSulvDXxbVVs7dTgw==
X-Received: by 2002:adf:efcb:: with SMTP id i11mr13601868wrp.188.1560507212144; 
 Fri, 14 Jun 2019 03:13:32 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id d10sm2672161wrh.91.2019.06.14.03.13.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 03:13:31 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20190605213654.9785-1-ptoscano@redhat.com>
 <a8797829-a5c6-24a3-647f-14872bc2f951@redhat.com>
 <c4376dbb-d755-f05f-fb93-ed212bf30bb0@weilnetz.de>
 <20190614094252.GD6042@dhcp-200-226.str.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <60460e9f-2254-7b76-3418-7c495aec3822@redhat.com>
Date: Fri, 14 Jun 2019 12:13:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614094252.GD6042@dhcp-200-226.str.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
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

On 6/14/19 11:42 AM, Kevin Wolf wrote:
> Am 13.06.2019 um 21:41 hat Stefan Weil geschrieben:
>> On 12.06.19 15:27, Philippe Mathieu-Daudé wrote:
>>> Cc'ing Alex (Docker, Travis) and Stefan (MinGW)
>> [...]
>>> Note, libssh is not available on MinGW.
>>
>> Nor is it available for Mingw64:

Yes, by "MinGW" I mean both 32/64 implementations.

>>
>> https://cygwin.com/cgi-bin2/package-grep.cgi?grep=mingw64-x86_64-libssh&arch=x86_64
>>
>> That makes building for Windows more difficult because there is an
>> additional dependency which must be built from source.
> 
> How many people do actually use the ssh block driver on Windows, though?
> Isn't just building QEMU without it a quite reasonable option, too?
> 
> I wouldn't consider this a strong argument why we should keep using an
> obsolete library.

I agree with Kevin. The only user of the 'ssh' block driver that I am
aware of is the virt-v2v tool:

http://libguestfs.org/virt-v2v.1.html#convert-from-esxi-hypervisor-over-ssh-to-local-libvirt

Stefan, do you think someone would use it on a Windows host?

Thanks,

Phil.

