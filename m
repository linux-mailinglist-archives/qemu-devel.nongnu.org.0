Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2D16F054
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 21:43:37 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6h3I-00081V-CI
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 15:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j6h1p-0007BT-1v
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j6h1l-0005GX-LC
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:42:03 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:37457)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j6h1l-0005Bv-Bu
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 15:42:01 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3UhO-1j7FB73qDa-000e8d; Tue, 25 Feb 2020 21:36:56 +0100
Subject: Re: [PATCH v3 0/5] linux-user: Implement x86_64 vsyscalls
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200213032223.14643-1-richard.henderson@linaro.org>
 <01077c2a-e90f-5a91-6e41-2f08e3978789@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bf0b00e1-b7f8-5095-53eb-9feb03d86e34@vivier.eu>
Date: Tue, 25 Feb 2020 21:36:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <01077c2a-e90f-5a91-6e41-2f08e3978789@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iwTzM5u4xN79zT3M1VGZ9CWA7IDDcAuMurdeo8+mlaJsEavrjcx
 T71rJP1rrKp0tvZuB56Ve6Izxq2ypJG9mJR5131vN9eu3K1bsyU0i+dwJSZkfFHFIFKFu9V
 gcTs56+AhwTi9hi5iR8hfas2WT/SzQydI0l6oZ4BxzEeEScv8Ll78SE9xkk3gQ9U8U5tRmo
 LJyFjVNdj1QbYzyYUGqWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NSMjOlJdxiw=:GyrLTGJyWEQuvCwYedSk79
 iwyl+zIemhFFnms+SwxISygZ7taJoxU48ZqIzNzJsdYQOsocfDkLid5WrpkiH/e2zAnTo0MFI
 7Xmsdb9tuIIctzwQTz2I6Z+TbWfUDc0z+CD+EwHli21pE42wUgwyB3eP7b8RExN1apG1S3X9K
 92KYIGGu1+rqylarCrtIRJ2qUmPR8TYdF0UxOaw7wdFUzxMnS3grBFwuQeOgyBfbJ1TBxP8dR
 jMWWImHxli0dPbGfwtPwGhZFCD8KL8rhm6Qllg69UXndYYbE5uJY+5g0dOb08yPgqWWF4OB/r
 SP6flSzE0s0c1lC3xF7AarWrOHF0AtShjaudPele6D/VEvVBQFXRkRHyNX8p2CZI+b7dKi9Ju
 lZUxoWi1qnv7r+IfmBAIHREkKUsKG5LkLZgWHkfY638CpNyIGq1C2BqGMh4ojBsNb0LOSChsS
 sStUQXC2SXBYFGDPMshRhys4So7xnGUq1opkGQKWNMe0V9MOBo7iohbya+Fs9BPpSuDw1g8Se
 Gz/rp/PVJoy7+aL7QyKCbv2Zx87pgGaY9Mw6joXBu3PBjkQPnItszAdyLgkrhnuZIpgWL9yBU
 2T4a8hn00XRp6BJXJGgO+KK6Bx6Cu9hFwEPMTcVRnpXxUCnj4kfTxow3iJ/FRrxevAaLK3FR1
 oG4tvOVgCkK5Ws5lRSbX8OXBWWtg+NFLsdCKFZ+a7jC/cnpIZ0LKRrqD3piAGaibgTJ6OmfCF
 /Zl/Lymqc/SPey6f8/pc+UlLkZ+o7Sta/H/qAScwL9rUYuL/282d8Bn/ImZE2JIIiAtLmpG5q
 JXrpFtjOidpWb8ryU2EoV+IFrLfoMOvGtzD0sbQF/5pTRNXNNpuFaEobGbIEXI9xSxeo3Y5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/02/2020 à 20:59, Richard Henderson a écrit :
> On 2/12/20 7:22 PM, Richard Henderson wrote:
>> Changes for v3:
>>
>>   * Add TARGET_VSYSCALL_PAGE define.
>>   * Move the sigsegv goto around.
>>
>> v2: https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg03474.html
>> v1: https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02841.html
> 
> Ping?

Applied to my linux-user branch.
I've removed the trailing whitespace reported by checkpatch.pl

Thanks,
Laurent

