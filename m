Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBD49CB96
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 10:32:21 +0200 (CEST)
Received: from localhost ([::1]:50866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2AQG-00048Z-6h
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 04:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i2ANi-00034E-OF
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 04:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i2ANh-0003pQ-MO
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 04:29:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52453)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i2ANf-0003n8-6j; Mon, 26 Aug 2019 04:29:39 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXH3Y-1hj0853nBe-00Yf6A; Mon, 26 Aug 2019 10:29:24 +0200
To: Josh Kunz <jkz@google.com>, qemu-devel@nongnu.org
References: <20190816233422.16715-1-jkz@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5b4df64c-40e4-70cd-753e-f52e2b547c18@vivier.eu>
Date: Mon, 26 Aug 2019 10:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816233422.16715-1-jkz@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VmNWjSLjdbGE6vVVKVFt/+0BbXXf1jTv9LArydLn3WsiZJ7ao2V
 j61TLrP0W+yHaa5ThoNS9zz4Yc170S24jXl+YluJXiVVR9ICalI+EsMcf5ohRpWXdW5/W4u
 0IDqPRXlF91wtsJXdKUhUNIy6qpK5i6IbkIRzL7HaxvRZQImhsYATfniaZ7IFFUK5eOg7m8
 /McrByILnBjVRogT5pJJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sFGXFRepLTM=:8IRB5kMtFrTYvjyKOXiblX
 XuaawcdwjxRAr2zZu0u98rQIA4UGB4LpA5LVITLq9hEv8KVq9RIYPVQMscMZSRqKRHi7QpiwG
 +jFl71pLkiXYCnrqLzFff6TLEc0Qen0T3bplKCXNKb3ZOxDbPfGxsKW+3UFFowZ32VXdlId3Q
 O4K+vH1lRnogEK/hkNgaI47IXtGJ1LEEMWxI1oycChah5o5DNogVKUVqZ1tOA6ZhmbVIhgXiv
 WaqeauD3d/KROY7kcAOlQKlgW/uzUv2eQJf0QzYH4AnIkqwDqXsEKS6bb8hPlKMZaM3JWAWvw
 lCEX/k3LukH5zUWZPTFM9cqQ34YdaHC1lSSuJY6S/ne/fh6QLskvvxH2fCzFD1M+9Ci3xeE/n
 AFqbKaTjBgOlww/rijkd8rhLUokhZp3hNDYQWk4bnxVG0pOwaLEPUbAM7CYyvZ1f+bZBhWyew
 qHF56bfxyuOfTMxLtXf+M4XSrMUWAdQx12v0DE4hucsovbSnW3jPkcdWGpdK3jMphA4p5l3Tz
 dDUlcy/cUwiLmRU9yJE7/W+h8jJ2+ExcAv5ChwxemVw3c/apszr1guekQ/YVuACQWRVwLImny
 hDgJG0o+cA4SLbPIBIm8BMqTev3E3+L5zmSyd2sdw56j+r7LaCiAXOE9EvlbUTFotFi0njvif
 l73rr1rQnhPtXmZfa6V+iExT5KGeXUj37JC0aQC07lpAbii03qdhvMZ23XbL64HP+/8++mSQH
 HAYTlCZGsrKlKRHpcLnGiXUD05xHESi1xgVu5Rmm+XXrNuvO7GL6dwn/5FZ81HplqFHEyK08Z
 uDIeSBIktJNrBgzGqqYCLEIgvsRAA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [PATCH] linux-user: Support gdb 'qOffsets' query
 for ELF
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
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/08/2019 à 01:34, Josh Kunz via Qemu-devel a écrit :
> This is needed to support debugging PIE ELF binaries running under QEMU
> user mode. Currently, `code_offset` and `data_offset` remain unset for
> all ELF binaries, so GDB is unable to correctly locate the position of
> the binary's text and data.
> 
> The fields `code_offset`, and `data_offset` were originally added way
> back in 2006 to support debugging of bFMT executables (978efd6aac6),
> and support was just never added for ELF. Since non-PIE binaries are
> loaded at exactly the address specified in the binary, GDB does not need
> to relocate any symbols, so the buggy behavior is not normally observed.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1528239
> Signed-off-by: Josh Kunz <jkz@google.com>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)

As it seems they are text and data segment offsets, why it's not based
on info->start_code and info->start_data?

Thanks,
Laurent

