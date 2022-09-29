Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0905EEE04
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 08:45:24 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnIQ-0005Dp-VT
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 02:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odnAq-0008KA-CV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:37:34 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odnAo-0007EZ-7b
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:37:32 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M277h-1ofhuu19j7-002bbt; Thu, 29 Sep 2022 08:37:25 +0200
Message-ID: <17166083-0941-7644-9bfe-a57203b69fdd@vivier.eu>
Date: Thu, 29 Sep 2022 08:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH qemu v2 1/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-m68k@lists.linux-m68k.org,
 qemu-devel@nongnu.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220926113900.1256630-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OhjtMMm36axRcSmBXt3bsa7U5OdC/7Hk4Bb+hbQeJcqPqhJCbHA
 l7zTZOttMakxj+Ko3z24/7nvIXYaXPWCW+Lsce2kjBt5mgXt8uJP34wjG1l0t9DcaMf2io/
 zjUt3qcZrGcUAC1x5f8oFYRWPpCQQgJnQemjU2oCaAslmCoVIbbvUl78+sHKhYa/riT27sJ
 ADlqgZPdMGeAZ5iQKoxww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:96LjjmdNpAQ=:YhL/wY+N3oEkyxZyUyIOP5
 +49TDXCUvjwO8qBqwZAz3Ova7lLEi0KvrrNNTihK8E2GqGMPkI5rZm6Bomjykymw232mmiOF4
 eoND6Tna3fUEex2KIhx5RtC+rSB9/TgCwzvonIPwQ8yIUkCtvIcZm9wdy/V9vjCScjZXsn2EL
 SEF/JFurl7O+cpWZhZ0aQUZjIq943k/rOKKFGr3qd4iVJqb3skJpIEBsnPWxZ2bKs0um2pu/x
 ij7ijmqLHF0psGD54mAokQEnujQXhryfX/BULIXDJvE04jputVdQDyFq29QgvmTidR9wScwDS
 P6qiNJWLtpxeGpwrZneaUDNn3YbwrDp94CdDyQQamJr1+IlHRh2ggzVe7dOdLeGMErEPynC/i
 GzUHVCU3Qsm4n58BNG+40K38M9FlTmPFRNh6Fl9C0IK7518Ze4rqY/AUCqPVePJl9vGKy4Y0o
 EAbTY1vItm74uwOCBVlWv+B68siA/eSJUMi5ZvW+xJxAhwSKjOmtio5D0gm9p+1qfUcR0AbSA
 cbUInrat+ekGMgV3ZBeLjGXHHzpHYsNhejx1nWk9EcRKwisJS443mkzUdUX6wCDinR6cZYXO/
 mP4Ud+x03gESsToPDYc+ypmT4PhQW5NxtyTvgjLXAXOoam8fJHZnHjVv7qelQP3Al05B/7tF+
 k/P5jhHr1rBvR7F4K1UQhtCWGSYegTOWGYfxK6kKv9gydwY0kbxl/B/tNR0i8r6JbIgxR7LBp
 qgPuUgv3hdpqEejJ0ReplmZKEtO9fZZricq2QrIZ1o3Hy2v16CVd9NsYI9/ppZuVZvHQJYSVx
 tEBF6be
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 26/09/2022 à 13:38, Jason A. Donenfeld a écrit :
> Following a change on the kernel side (see link), pass BI_RNG_SEED
> instead of BI_VIRT_RNG_SEED. This should have no impact on
> compatibility, as there will simply be no effect if it's an old kernel,
> which is how things have always been. We then use this as an opportunity
> to add this to q800, since now we can, which is a nice improvement.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Link: https://lore.kernel.org/lkml/20220923170340.4099226-3-Jason@zx2c4.com/
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   hw/m68k/q800.c                                    | 7 +++++++
>   hw/m68k/virt.c                                    | 2 +-
>   include/standard-headers/asm-m68k/bootinfo-virt.h | 4 +++-
>   include/standard-headers/asm-m68k/bootinfo.h      | 8 +++++++-
>   4 files changed, 18 insertions(+), 3 deletions(-)
> 

Applied to my m68k-for-7.2 branch

Thanks,
Laurent


