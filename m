Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3C42ED68
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:17:55 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJLe-0003k4-7t
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbIlf-0002DW-7A
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:40:44 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbIld-0007rn-1C
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:40:42 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBltM-1mRM5K3LnI-00CCft; Fri, 15 Oct 2021 10:40:38 +0200
Subject: Re: [PATCH 8/8] q800: add NMI handler
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <40098631-e3de-b334-43a7-e0e7ff2751c4@vivier.eu>
Date: Fri, 15 Oct 2021 10:40:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cVrtJWaRXEZNU38umDEs2O5yA5ZHYX9HGao1Yz9vegwup9CGMeG
 DVlxd2xmzPpJG4cCtHEMAF1aUJGuw4ngi507reb6OyYLnYCSkgRicNAQvqM8+QE7tEdVf83
 vO46v9ZSmyiUcCUNGIZa5+MOqMTpw1mNGxhMWe8Hgq4WtiJnfaCtHB4Enq97GqSJD8F5HCS
 yUE6iK+n4EEXnfmsFZdAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fS0SsUDOvKI=:eSAAGX64Vwtkd8NR8bdDY9
 9qhxkg5LK1MEaFnnpnWbU9gbuamASGA19Gzoc+Y6/TWw5YjvWFC2g9+iw+U3RYlJWFx8Xd0Dg
 hqnq93f881kwJuRXIBmdQYRVriklOnHK6x6KpHNVHnKnIQCqOyqpKL7DMEosKNYfHfI4soVN6
 MdsqNxnaB9r04+OFeMoEwoN6SeUDkWBiWK0xAqe1P4kUzjbn9Dx6/2offhQsBn4R7n/1HPD2p
 AI3YkhSxtRKBcL5sWEY9PEkdBtaIHSyLJ1FFVfdGyA4MVoQszzWpjW/ajmQFjptthp52zT5N3
 Y4VkD5YSv0+0YT0h9DGV6/6+YCs7BjW5CwjEeBuJIdZju85rRg9t9lXWtNJOWX2vLCGFqKotJ
 lW4IKSmpbuz9yEiIzq6ipZaOM6PPQmFV44IAJZXHMkjikLJxISUm2RvskEBWSWV11sg7hbq7L
 YJdR2NcjwjSYKoq6bIv8rz65uUVc09v+lzkh5WvUA1cf/Tjxxzy7fG6iQ77OMvGFqyV/H9EvB
 SjopOk4Dn1AyKIYp2IMRa/llB1hnUUJjQ62Tj2YwKEXrJYblVBT5sG7dfZ8yIi/T2s50g6+OY
 KZlHniRf2FYGD1MU+HwGHEyBzOqHzOPpnU6L1nqPX7cYhNLk8A8FePk3s/GtOnzjB/uKojWxi
 b6Ds35axW+Bw4ZAPfozM16svF/0X1dh1xA87Q1Ry/pgQH5Bi87sfxbkPJvADKf7QeUkelGKHc
 qzJx7wI2llzYdqK5GuKIVAYFf09UsCdppjgNmQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> This allows the programmer's switch to be triggered via the monitor for debugging
> purposes. Since the CPU level 7 interrupt is level-triggered, use a timer to hold
> the NMI active for 100ms before releasing it again.
> 

I'm wondering if Qemu provides another way to have a level-triggered interrupt in this case.

I' tried to see if keeping the button pressed on a mac kept the IRQ up (as QMP NMI does), but a real
mac is too slow and has to many things to display it was not really conclusive...

Thanks,
Laurent


