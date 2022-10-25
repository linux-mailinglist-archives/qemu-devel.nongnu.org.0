Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E160C17A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:00:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9CG-0006vJ-4p; Mon, 24 Oct 2022 21:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9CB-0006uQ-3Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:57:35 -0400
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on9C8-0000dy-8u
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666663046;
 bh=x41EEiJ145g+A29apEYcYOxb8rD74pxvFGIuiESQ+b0=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=RiFd8JyrFQJf3NCHADxaSeNdKhqg8Os1WrSjwco2nbkd1JujNUuWVdz9GFhJ6R3r9
 yuSDCxc7NrrdFASSziYVarU4pMPaNL/j+B1DnlQuzhKtSWoUmv+C9CX1ZZaouDPwKI
 ogbWadQl9LFL8KTu6/UOjB06/IJpNkMsPJxPjpHE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.30]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1pLejN1bjH-00aCx1; Tue, 25
 Oct 2022 03:57:26 +0200
Message-ID: <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
Date: Tue, 25 Oct 2022 03:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
 <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5owh04l3Fp+PaFUReR0WbYSxxeve2R1PtWp0YwCdavj6h13M/ge
 8lhKtuGIQbKokQSc4qkICfeONPFh1BiwK7i07gHkk3OwPrwMpl3Er2Gy5kfIgwyUrLcCkaC
 FXcHW5v+TCJ0NVKE3ywxLEiSd19PAJpfgqWm0oduX1V0VQflbjeq6nlL1X543OaqHSDtuLG
 goUEt98+lPo64z+SfYYZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZddAKAc+dCM=:apj9aPD0mrUS7Xu9ulotRt
 Z/gKOlvPNJ1DcvOChQs4xSXfo7zMJ5/jdDPRN4sN7pP0vNR9ImkAr+kMymElf2wgY3w4nMOXs
 Ee93mv895dSTW6/AA/SHTQEUhHzDrU4WoHCdIFsqP48hdLQhsqsmDhwIrkdTbakHMIQodXspt
 PT/5yuDI9796aeyCkJzIJ8nhmhbwA0VC+uxe3y472bWLGXKi5VqJ8nWAyL7IBjJSB+GjH8dJD
 YX4SSQucROHrAqpkn3uDnmbM3fIrfJiOk4OG09hKW7FSJO5++v7Zyl6djycSFyrIoqPALlGD7
 jUo0guvNNxhEubC2DKhBYFFgYcf1xwPb9eGH6X1CMD+MZTctJOypP7/1Tk4jGMXEjFJ5+jNZC
 bkFas8ZUswD+0FGYn7GIQ64T4bJo9XV/sx/5JaH4gvo39LtOgkTPUVy//NJOoN1H6zCJ61qSj
 dWCwt5zJnRTolZz1tPQykoUCg+Hpe8Nab8+v/HvpfFHQac1qULlAmYNzphZ1VoD2vg82jtvXR
 oHT1CD6nTDwPvx/7L/JSUork8Eg48pMZe+AYym6PwHTGe64JctE6WNT0iwtgoZI3DbSrXEvWF
 4oC74lbVFthLATDmYKmuodPMxrSPjekXnM66hzGsYHhnbhQkms1uoBiIbk87KEoqVjX9ztnEC
 TkbHJAnTeDE4qcTl0cLRuqbaANF1UYTsA55XmHaxZk+F2GfslgaBUYJvcZj2XF1wqI48f2cKW
 5Kxa05HLdokhgqEVMFI9//8Ux7Pmq3tWmH7CU8XvVFrPNbiR5y6B6Y7hROwX5fQDtoezScNUC
 xuMM0RfkMttd5glOh95p3bbGpIKZErAJj6m04+gWcZIogaRJaBiKZ9bvYPl6eKeMk5W7otDqo
 f/Y0mqWWdINBw/C0A6gqt4vE5hovv91Ds3jAroBMC2hw2zMehxVDLJxjcfzDuNLk+lRJjRhbp
 i+SVx2k+T/Sru7XZYZ8oLc5HDgP1MubxuYl6xIvmfwmCotewKtAWdCuWh6d6gX02k1dds5wtQ
 Pc88+u+STFrNQQhMyu8mQp4NS99+oEsNlpxkfew7F0Tc5ma1rpW1WkvfgplYEIRk5IE66oZBz
 ufxl0g5Byn8FJT3kcptg0Nq/t0CFsyUNyVGeetwgzeyooPYMYl0A1yQdcp+morP9Ubu7TDwX4
 IvhSzWrkDPKgEQ1QgQchWTE0rmmvhcCeSOUctZzXO24BK0nGlbp8RZ+niz1GTeVerC+jyezvQ
 D/MKCXGT0Y4207qafnO/6aIG6/86UHi4yuyUjWNdKToeIIQKRsnoIJc34QB+y+BMP5JpgmyLG
 XaGw/bV12Pg8r8lFUssiNzHTTV6FrPcdNkSxzKfJMlePhS4cQddcQjks9N9JKY2fA8pr7zD7M
 EwxM6MWnEOf8MD6fTRqskW5ntr9MKqwXHFyLynsS0cQq5rIL6JFfwtJuqjZeaLrUFM/LVl/b3
 ZnUszPVvDFwVz7SI1oakCRsPWkUAPu0AkksjurgAxc24XbACgm1G7keghfn8bmen6pBCuVrar
 ++tKYZlvBDwHSkQA6CHKUM8IGoD5yLEO4OZw9K95nZqaI
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 00:35, Richard Henderson wrote:
> On 10/25/22 06:18, Helge Deller wrote:
>> When the emulation stops with a hard exception it's very useful for
>> debugging purposes to dump the current guest memory layout (for an
>> example see /proc/self/maps) beside the CPU registers.
>>
>> The open_self_maps() function provides such a memory dump, but since
>> it's located in the syscall.c file, various changes (add #includes, mak=
e
>> this function externally visible, ...) are needed to be able to call it
>> from the existing EXCP_DUMP() macro.
>
> /proc/self/maps has all of the qemu mappings in it as well.

I'm not quite sure on how to understand your comments above.
Just comments or NAK to the patch?

*Main* feature of this patch is that output like /proc/self/maps
ends up on stdout and in the log file (if qemu log was enabled)
at all, before the program exits and /proc/self/maps is gone.
Quite useful for bug reports from other users too...

> The page_dump() function provides exclusively the guest mappings.

Which is usually sufficient in this case, and has the advantage that it
shows the guest-stack and -heap areas.

Helge

