Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C9A7AB3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 07:24:58 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5Nmr-000789-6S
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 01:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i5Nln-0006ch-AB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 01:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i5Nlm-0004sx-9G
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 01:23:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55875)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1i5Nlj-0004od-QK; Wed, 04 Sep 2019 01:23:48 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MHXWL-1i0lCx0eVF-00DZNH; Wed, 04 Sep 2019 07:23:26 +0200
To: Josh Kunz <jkz@google.com>
References: <20190816233422.16715-1-jkz@google.com>
 <5b4df64c-40e4-70cd-753e-f52e2b547c18@vivier.eu>
 <CADgy-2tzD0FVXbKtadSL1JuMWW_TEzFP2ZD0hzA4PUnxh1Xz0g@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6301d7f2-d0b2-d7a5-3bb2-e33c4ca518fd@vivier.eu>
Date: Wed, 4 Sep 2019 07:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADgy-2tzD0FVXbKtadSL1JuMWW_TEzFP2ZD0hzA4PUnxh1Xz0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G3BDuDVzXfsvUcY1OjuFH3vp3EaPswyV2+OIdC3KHkp/OqkQKAx
 4FAY4gNArO4q0fgGnylvkGZMJiAOMKKal8RRuuOIRGlvGDbYmISkENzgoVd0+HTurA3kEO2
 ema6tfWokBE5PacYk6TE4D0BFLxvI9bBL0gIp+vbUTDAnbHoR9KQeSjjJDH+/wid6QmS/TA
 RCRmi426kFLd9GQ+C5zUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Gmg+OrdODk=:0qW7CkIfDLCTtmyGmajIOL
 XX19A2QlJfqWgLQGqriXJFKtZN2OkrCiUoYxHCDdQn/rUFBKiXDdpT6AUAVHN4iSRxhdZyf3m
 A888Ad15euu/EgBhgXvd8bQpxfoJz7fE514XWca+e8zRxkJkjnjVfSZIkTo6I/oHze54dRhcQ
 3HZcLdTPYFyHVdqVb2YYDAH1BmVDBf65isZBQ9rj4ymZzz91N9MJI2GUkIasUI9u8Umcj/5ZF
 ydsyhMmCFPa0xunPGA3KQR70kZstiwjZnfiaKXHqpU6MfGnZQ+dXQXVy82ld2pEHtCVlUgi3G
 In+TwWGA8v3PqTTNHyfLvvhfJqpBTZBO2uJPvwBDmFpEIKM0bwpfeAXsn34JfPE3i79g0Su9o
 5TXr7KdsBf4RwBNbU7BQ1ouFQmq9b4zIAkPrH1afOYGdaSyFR34S5+3aLZA7+LVpq1cO6Bg/1
 Rg4hYdckS5yAExYXrBedg2eKtl3GJLcwJePvDf1tPIk7oA+b+2ObLbM7RHS4UKtAYQZ+G5kaF
 hUbs5xcfqwJWEUJbu+S0dl6Il5t8izmJ9lpdEu9UnEV+dUjoz2TYg5HTQ54hFou8k9Qj32Vfx
 +Z2oRrtzBseq2LhQy90q4OU/DW5hBdnuJne0B2HS3p5oQxWddkKp+RGN8z0oHRW61DwuCzPS5
 9mFOXvFia5eEweoym45KrC98ZCIlviH+GK59TDIC6sW1p6LEidUb6JBxYcwxY8591fGMwuhCV
 plRhkdnaT4Q1pwn6IqKid0R9e+VQIPwlc6QYCsviPb0DLaYVWlVAupffsip1xdahZH6KA1z1p
 xhSCBtLa96DQs62xqEb2RaFWcFS8W7JAXm1JK0k0eLvbRkCx+k=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
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
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2019 à 21:19, Josh Kunz a écrit :
> The `Data` and `Code` flags in `qOffsets` are actually section offsets
> rather than segment offsets. GDB relocates the symbols in those sections
> relative to their location in the binary. So we have to use `load_bias`.
> 
> See here for a more detailed
> description: https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#General-Query-Packets
> 

Thank you for the details.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

