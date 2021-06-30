Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D893B7BFB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:07:14 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyQZF-0008NB-3N
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lyQXe-0006B6-Oc
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:05:34 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:22101
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lyQXc-0000VK-Dq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:05:34 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4GF5nB4gDBz8PbN;
 Tue, 29 Jun 2021 23:05:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=XEwgGK9u4
 weYUja1Bk9x60E0UKk=; b=MaK8eV0HskO0fDbSz/vDJ52jpusnvpLD3kYHEDOxb
 ixLhF4V3MD8gCFHuraejRrliOFKwgh3rj19WDTL4RdpLGnuj/hECPkAl3oUSwYh/
 txPznMCn9P6YhJAB1FRJv4EldsjawsfYRaANtgxpCbSWeUqW+mXBw+9oQuLXvV8X
 bc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=WtG
 9VjtmGmL+77eeW+8shTTiyXrhWEY4SGyDnLHpUiyLT3SyCm9jEA8HC/ZPGXm6P8V
 3fyMhiJM9V1/pVnBaj7SwqdxQ09DaE7+QQ9xYnptoA/irwPn+Pdf8VJ+bWjokEW1
 w7hvi6laDe9ZuOSXFD7sQu16r6Sb4jBen44IEI0w=
Received: from [IPV6:2001:470:b050:6:c431:eb5a:d46:c0fa] (unknown
 [IPv6:2001:470:b050:6:c431:eb5a:d46:c0fa])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4GF5nB3jPCz8PbK;
 Tue, 29 Jun 2021 23:05:18 -0400 (EDT)
Message-ID: <7d4f930f-2c27-7ed8-b918-c9b9225b6c03@comstyle.com>
Date: Tue, 29 Jun 2021 23:05:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?unknown-8bit?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
 <20210603071913.adshtxhd5bhqmutn@sirius.home.kraxel.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20210603071913.adshtxhd5bhqmutn@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping.

On 6/3/2021 3:19 AM, Gerd Hoffmann wrote:
> On Wed, Jun 02, 2021 at 01:21:49PM -0400, Brad Smith wrote:
>> tests/vm: update NetBSD to 9.2
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
>

