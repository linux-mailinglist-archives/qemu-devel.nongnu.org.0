Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F10BE838
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 00:22:57 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDFgT-0004ii-1o
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 18:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDFeC-00049U-SO
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 18:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDFe3-0000tJ-S9
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 18:20:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56824)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDFe3-0000rT-Hk
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 18:20:23 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8157E5AFE3
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 22:20:22 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v18so126194wro.16
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 15:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AUrJ9yxICkjbN96jkaEKLV8mIS5hDryN21dV+uBqKTw=;
 b=cH08cjWgN56Dyia/M6cHEwLgsMove0ePZQMZrEHD4eaN6AoYjqwyiwqABhc3+/CCVJ
 2cHZuL6U1gcdg+B3uinxe9Ql69COHh2V14iYJMlAxKa+2kYY8Fk75EtE8wKxUoDaJipG
 JJjVMC3jkpjkr9boEN2txkPBilwdUmXLQ79Wvg+HOGQkiXEHPd8QgyyZJAqENa+SJzKk
 8NvC+HuPLBO78iKn6sO3Bzwpx6aaJZfoSIK1n7iruNMCtrE3KgMinjzYvG5qTlfgl29/
 d0m3b3ZfEoJm+9YUKKY3/CztwyNXG2L3WwB7SJBqN+xpu3ix3/MJ2UTmIjNsHgMMCaA1
 +rdg==
X-Gm-Message-State: APjAAAXPH4WYiZvLjJ2dgvtrx+R6pvHYj89ylFkGwz7JnkBso2cnt2wX
 dN1vd3HJz8nrBBkMMEcqtaLSKWRJo9zTz91VnI7987/Y/MMbVyaDFjmWiAMgaETDbHBKSB94dUb
 WYYm5vuvHUjmoodk=
X-Received: by 2002:a05:600c:40f:: with SMTP id
 q15mr295010wmb.23.1569450021280; 
 Wed, 25 Sep 2019 15:20:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1iaW7IIo0rm0pPYJwP7RrrgwjJc5A9/zG10iGt9C5taDG1+arGOXV5C/abTmhulRIn81W/w==
X-Received: by 2002:a05:600c:40f:: with SMTP id
 q15mr294995wmb.23.1569450021111; 
 Wed, 25 Sep 2019 15:20:21 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id 79sm925027wmb.7.2019.09.25.15.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2019 15:20:20 -0700 (PDT)
Subject: Re: [PATCH v3 21/33] tests/tcg: add simple record/replay smoke test
 for aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-22-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <27600587-35fb-e2e7-72c2-95e8dbeb8f9f@redhat.com>
Date: Thu, 26 Sep 2019 00:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, jsnow@redhat.com,
 f4bug@amsat.org, Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/19 11:00 PM, Alex Benn=C3=A9e wrote:
> This adds two new tests that re-use the memory test to check basic
> record replay functionality is still working. We have to define our
> own runners rather than using the default pattern as we want to change
> the test name but re-use the memory binary.
>=20
> We declare the test binaries as PHONY as they don't rely exist.
>=20
> [AJB: A better test would output some sort of timer value or other
> otherwise variable value so we could compare the record and replay
> outputs and ensure they match]
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarc=
h64/Makefile.softmmu-target
> index 4c4aaf61dd3..b4b39579634 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -32,3 +32,24 @@ memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
> =20
>  # Running
>  QEMU_OPTS+=3D-M virt -cpu max -display none -semihosting-config enable=
=3Don,target=3Dnative,chardev=3Doutput -kernel
> +
> +# Simple Record/Replay Test
> +.PHONY: memory-record
> +run-memory-record: memory-record memory
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
> +		  -icount shift=3D5$(COMMA)rr=3Drecord$(COMMA)rrfile=3Drecord.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +.PHONY: memory-replay
> +run-memory-replay: memory-replay run-memory-record
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
> +		  -icount shift=3D5$(COMMA)rr=3Dreplay$(COMMA)rrfile=3Drecord.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +TESTS+=3Dmemory-record memory-replay
>=20

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

