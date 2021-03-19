Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73320341A79
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:53:20 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCkp-0007n5-FL
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNCjR-0006iI-SP; Fri, 19 Mar 2021 06:51:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNCjQ-0006tG-3n; Fri, 19 Mar 2021 06:51:53 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mf0Nm-1ludg11qqw-00gWyk; Fri, 19 Mar 2021 11:51:47 +0100
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
 <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
 <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
 <0b3cedb8-f40a-18fd-5030-a596afb9298d@redhat.com>
 <82f6dc3e-18bf-f90a-7e43-5568b319767c@redhat.com>
 <3bcc22b2-eb25-b0a0-f47b-72c747ca6f0a@redhat.com>
 <1a2a91a4-0425-0da9-482b-f46a6e17b6b0@redhat.com>
 <f69095dc-7021-4f3a-ef59-debcf3df2784@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <42717291-e5ac-091b-1272-c997536728aa@vivier.eu>
Date: Fri, 19 Mar 2021 11:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f69095dc-7021-4f3a-ef59-debcf3df2784@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+WhuJhU7YH3/Hykl/VAZA6gJcAsUKMOFOpEwkYdzD3pJ187QUCb
 nZ7/9spo7ii4W3rCuYCWb1TSuZGNrw8NRnhn4HQdE4t/LuX8/WRyMgIhabyAsITfeMtUQtc
 JSKoJ2SowUO/NMny6wesKBDfiToIRJPJYfnLKSY6G56aPW0FSz+4bQE6tx6jTjllCLjD39x
 jlosYkpa/TEtcaW/9/m8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yCkRA1ECx7E=:2YABiAHoAmdc7VvRjK7ekP
 KYMeyLj8RF4RS9SrC+xMdr2ay+ld4OIapr8grHvfgamaT/wTTYQeELRlE7bmRzj0guDkioMWR
 e3Nh0OA7PMLx1+csSn2iok0RwdqgI2tE9Jws6zVf5Z9QX6mK2vAMW14VWAimOVEiUWbF/kyYQ
 zRF+/0pE8vahTSQOF3rDeXl2JVMO4xSZLapOZzvT+SPCkk5TL+t1XM5W7FCJ+6+fSfeY7IMiH
 aG4eugTTdHh6WPrXKjiBjsWSbNNIuTcC8GjOVS8ruzuJZnjdZPIe9zpGOovg0PBS+R5wv7n2n
 nkFqilaD1qntI4cq3M7tFALhQFVHY8GQRwpGttxHBIsv1LmBmeyH0lxtBajwSKw2CyRx0bLR9
 qQZBEj4LonU1aa+QYXJmgad2qidyeHCUM1tuZW8NGe0kzxKtcBnMr9MvEKC/Y
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 10:29, Paolo Bonzini a écrit :
> On 19/03/21 10:20, Max Reitz wrote:
>> On 19.03.21 07:32, Thomas Huth wrote:
>>> On 18/03/2021 18.28, Max Reitz wrote:
>>> [...]
>>>>  From that it follows that I don’t see much use in testing specific devices either.  Say there’s
>>>> a platform that provides both virtio-pci and virtio-mmio, the default (say virtio-pci) is fine
>>>> for the iotests. I see little value in testing virtio-mmio as well.  (Perhaps I’m short-sighted,
>>>> though.)
>>>
>>> That's a fair point. But still, if someone compiled QEMU only with a target that only provided
>>> virtio-mmio, the iotests should not fail when running "make check".
>>> To avoid that we continue playing whack-a-mole here in the future, maybe it would be better to
>>> restrict the iotests to the "main" targets only, e.g. modify check-block.sh so that the tests
>>> only run with x86, aarch64, s390x and ppc64 ?
>>
>> Right, that would certainly be the simplest solution.
> 
> It would also make the patches that Laurent sent this morning unnecessary, and avoid the use of
> aliases in the tests (so that it's clear what is tested).
>

We don't test the virtio frontend, but the blockdev backend, so we don't care what we use here.

Aliases simplify the code...

Thanks,
Laurent

