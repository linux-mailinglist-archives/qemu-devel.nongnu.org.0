Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2CAE572
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 10:24:31 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7bRu-00056I-N3
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 04:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i7bQl-0004YA-7F
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i7bQk-0005Fm-2Y
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:23:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:38841)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i7bQj-0005FL-OZ; Tue, 10 Sep 2019 04:23:17 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJFpj-1hrInP2cqh-00Kdd1; Tue, 10 Sep 2019 10:23:08 +0200
To: Josh Kunz <jkz@google.com>, qemu-devel@nongnu.org
References: <20190816233422.16715-1-jkz@google.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0286498e-bb23-914a-39e2-66701f0b5885@vivier.eu>
Date: Tue, 10 Sep 2019 10:23:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816233422.16715-1-jkz@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uqucYJ5hqcCMH28w9wQvZ9Fqhg4amLWQe9fbxeGhY6Nev30B4Hq
 /Rae2nbAl9r7LDCNZzMe//7LClVWnD6bKjuxkhKiWCoG2mERIwJvbGA/+03mJRGxuOPloPG
 eFtv2W+cT684g5iNThhDTJfZemskN3UUSBGMKM6TxhB09ND+tEsFO5UXFGTv4kynClPIpId
 drteFj0aNUXfJ+0Mbmr/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6r343B1eIuo=:AXNX+k5NXI2szYJxS6v0BF
 J+OBylO03IqjZCCDiUAX79CXf0rEu96Yj0/A6O14qC/qMRYSMQIy4k9Gs4SK8DBxAgtGDZjSY
 pTliUbEcyT1q8QZWBb8uLYv32s/EkG//JORF+mOxZPuZsSkmTTAPx8WxNxz96XHlkp1HKdNN5
 0/f0XKO3pAjdJhey+vhXxv+5xgmsE9A/jjVQvWJQZFrPUex5igjx2hM5iCKXOr2TWuirS34gG
 IwbAkD214EVYC7QbA4TOBnEzR1cBuUBqjFj9WH6ubLTKAyJMmxh4mu/50xITLz/Yg0/SJGsFo
 dClhvEFRU3GpwUMkJRqjk0mrDCYtz6t3X1LxMnKe3JGlkUgVW9mrQAKlXIGa/Xbsj3pqkN1E+
 +kC3R/QVFVpoGAP/Q+bHkYHZ1BSczx+0q/FdkCI374kJ7HggIRf7sKDZlDOmB4Qd4pk4ZnL8X
 bnjLBKooH1Sm5rEDt7AA3qUgWAofBFBU1n6RJTtgvyLCg3UiIEoiImtrkRiMFCaI9jzQ4cywK
 GzZWhO7UfTRHVIIONYykVw3oavj0X0oadEUXE1NyznegCOdfm+jaRGKKcSn/hQwIk2nfd2cK+
 6+PqtRoaCBIbRd5ym4MYSxZ9nlnfKQprIBmCuZ3/cKu5M/2ZLikfRxaWt263Y/c/cKj3zOyp+
 2Qcbe6ITCXMnSJ/1jksooXgSZUdg/aagcUZIkmDQWGUy/vM/LSdYQ4uBdz1418Cyj5D5aZ0vL
 8ZhSf8KZ3pZJU/wMFGkzAxSjE9UOMOPJiD85lmgMbOOu+rXapWLSLNL6pUJoo8ZfbpQk+5o1o
 3G0HXc+cptso9pPFphCghQdQbTtcw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
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
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 3365e192eb..ceac035208 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2380,6 +2380,8 @@ static void load_elf_image(const char *image_name, int image_fd,
>      }
>  
>      info->load_bias = load_bias;
> +    info->code_offset = load_bias;
> +    info->data_offset = load_bias;
>      info->load_addr = load_addr;
>      info->entry = ehdr->e_entry + load_bias;
>      info->start_code = -1;
> 

Applied to my linux-user branch.

Thanks,
Laurent

