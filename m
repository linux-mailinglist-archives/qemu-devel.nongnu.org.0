Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C477B47D88
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 10:49:10 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcnK9-0000qz-52
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 04:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47189)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chouteau@adacore.com>) id 1hcnI8-0000Bb-Sp
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chouteau@adacore.com>) id 1hcnI5-00071h-4Y
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:47:03 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:45276
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chouteau@adacore.com>)
 id 1hcnI4-0006xD-Jb; Mon, 17 Jun 2019 04:47:01 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id BE6E38137C;
 Mon, 17 Jun 2019 10:46:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUhdtC4H-o5Z; Mon, 17 Jun 2019 10:46:56 +0200 (CEST)
Received: from [192.168.0.17] (89-157-139-225.rev.numericable.fr
 [89.157.139.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id ADBD381354;
 Mon, 17 Jun 2019 10:46:55 +0200 (CEST)
To: Palmer Dabbelt <palmer@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <mhng-1958cec5-7d9d-483b-bb14-72e53bbde47f@palmer-si-x1e>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <46a4a99c-2240-dc68-9088-7ec985c26203@adacore.com>
Date: Mon, 17 Jun 2019 10:46:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-1958cec5-7d9d-483b-bb14-72e53bbde47f@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-devel] [PULL 01/29] SiFive RISC-V GPIO Device
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/2019 14:10, Palmer Dabbelt wrote:
> Sorry this took a while to fix, I've just sent a patch to fix the memory leak.

Thank you for taking care of this!

