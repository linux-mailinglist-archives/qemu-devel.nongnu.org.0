Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15825EB360
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:43:41 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvt5-0005Lq-Tn
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvnP-0005Ma-9Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:47 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocvnM-0005Yb-Cj
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:37:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8hR1-1oYmvt1jMH-004i6J; Mon, 26 Sep 2022 23:37:40 +0200
Message-ID: <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
Date: Mon, 26 Sep 2022 23:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-m68k@lists.linux-m68k.org,
 qemu-devel@nongnu.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220926113900.1256630-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6DTZTMx+opRdoNlKnbs0jC9+6sR6ArUyXjpDiGrNrOgTMS378PQ
 pX0rpA/RHF9ytqfaqyIj67EmKc8NYMF5gI6TlNpTEUL50DybvSvSSwpeyqRKn3HoC222DqX
 Sf/ZwqS31+covgg+AC0JasYtseY+qhgzMNHEVx/3SvZjpZ5ZDbkK22i9Xst2gwPkNHG4UB8
 qtFXs5PmpBUBf4svh9MRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hR88Fh3fgGg=:kh2mc0tJpJPfFQEkUwu+Bq
 O/4oyAwfYmKdM2FokarPMz46zXiDxNkx2SD425jZbHrZSy3fjhZwBRKPRaXC+fQNBZM8Irgiu
 Mo5XBYb++nNhxU5XYN6r5zXMWiIOVvvCR3pdQOXqQKjBVol6DXkyHrZxkAME9dGQIm1DHEish
 LKfr381eKEFc5VxKIBTNSr7ZUXDorIFve9Va1kAEZofQCHLJNIpDS/i/FWyKkQ98d01qbpI5A
 vtqmBeBgRWyyiXebR3RhnINmAdIu5N+SrN00hoJShHo3+s0pCB0PSxY/NcZaJqw5N4HfPoc6B
 0FVm3VAyqHLEGhlSCQRc1DlOYLcMKcU/IEVbpXx8QXzpNwVUYbQlzmAJGpjQNU5YVmbty7blY
 F0ev0ilrFLvSrwrdfGH6eH5BgSK3cvV/vjPu45dfNsqNjnCC5wNsLA6lJyhtf9p+4nKnH39ZY
 w0zCgc17GGNDMFzzVvjQ9sYGLT/i1fDwwnZbf1HeoZTWuRWxsb+VzKZVfA99uHpTYjiUQvKmz
 Gf55CeLHwjwPVjoKeHpesT2q8uLk4RVd+1lm0sKzLOfVYC8DmdDXCLb6I+HRgIx465ZTGvwyM
 6ErKEknCghAM08kXO6lIuQFYO1/La54MmGaC2wGj8dMKJmO/5mCYgwwSVTtOQmuGw7ACpTu0v
 1EUuMLlSdAHKOT423JodRDTG5VSrTlzWK0UJ0OPt1+piBd7FweAlr9NO16z68my/n720uY0w1
 z3LB5y/+OCWLDr0WuRsDJ8fLdRIuuqneZ8AApTwRkL1RKhURp3aWFzpgtIBu/ulU/kEq0b0BB
 slngb1l
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> padding to fill this out as such.
> 
> Also, break apart the padding additions from the other field length
> additions, so that it's more clear why these magic numbers are being
> added, and comment them too.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/m68k/bootinfo.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 

Applied to my m68k-for-7.2 branch

Thanks,
Laurent



