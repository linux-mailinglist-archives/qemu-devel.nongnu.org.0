Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1154D46
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 13:09:17 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfjK8-0006O4-1D
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 07:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47425)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hfjG8-0004IK-Kj
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:05:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hfjG2-0006lD-6C
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:05:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34196)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hfjFy-0006cS-NG
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 07:05:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id k11so17388158wrl.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cye/u2nohJShZoqN91Xmz3JOE2jDHb9k+VRoBl0eJh0=;
 b=XfvhIkcwSRg/hBcfOAVUUX/niDUrtdb26oeqrJtJ0iWmrtq5deWB8nDR4DzgRhfJfP
 xiaoRkStv2Jz1V4jB75orupf7ukv8JtHUd8M8/zBu5tHD9o3eyfdLCBiy4Nsp4jBFEVy
 Hdrav8V046iRP3hh0hXjwnLi4XK+csarCorRHIE5798ElHKMv4+588lerbt0jbdiEpE0
 1lzA4ZHAamX60m3e22L0oMvo9TPFsMbIcK0Q2MZlJkDYwhF09OeyW6NGQ5nGGRkk48aF
 mnQeeA9Fofh+IyamVxK5FMp7WiPrcYLmX0qyjFsC/BPZFvFGTl3RNyAnw35DmlTPTPGF
 remQ==
X-Gm-Message-State: APjAAAVci3Ve6R61OaBrfdPTTI3AhoQg648s3nWyWEBsPBjUG5Rq4qcC
 co6vJ0XyV1OWKa5Hw4xXRPAelw==
X-Google-Smtp-Source: APXvYqzAZb9AfmAmAl6xk1R5kxD9blPztEPsWSwweJeqFAYs3fqW9uHIoUh8iyBtdKbdTctQ27+PrA==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr21264040wrs.1.1561460694427;
 Tue, 25 Jun 2019 04:04:54 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id b2sm18371791wrp.72.2019.06.25.04.04.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 04:04:53 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <156145964700.24.1996610342612780259@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <92a342f1-663e-5e3b-4f2e-78aaa50df867@redhat.com>
Date: Tue, 25 Jun 2019 13:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156145964700.24.1996610342612780259@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH 0/5] tests/acceptance: Add bFLT loader
 linux-user test
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 ehabkost@redhat.com, wainersm@redhat.com, maxime.coquelin@redhat.com,
 alistair.francis@wdc.com, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/19 12:47 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190625101524.13447-1-philmd@redhat.com/
> 
> This series failed build test on s390x host. Please find the details below.
> 
> === TEST SCRIPT END ===
> 
>   CC      qapi/qmp-registry.o
>   CC      qapi/qmp-dispatch.o
> 
> Warning, treated as error:
> /var/tmp/patchew-tester-tmp-63tbziko/src/docs/devel/testing.rst:627:Title underline too short.
>
> The ``avocado_qemu.MachineTest`` base test class

Ah, this warning was not obvious to figure out...

The fix is trivial:

-- >8 --

 The ``avocado_qemu.MachineTest`` base test class
------------------------------------------
+------------------------------------------------

---

