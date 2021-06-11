Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730C3A410C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:14:26 +0200 (CEST)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf7J-0001q8-KE
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lrf5g-0000aL-Oq; Fri, 11 Jun 2021 07:12:44 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43272
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lrf5Z-0006LI-P2; Fri, 11 Jun 2021 07:12:43 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 91776DA06E4;
 Fri, 11 Jun 2021 13:12:30 +0200 (CEST)
Subject: Re: [PATCH] util/oslib-win32: Fix fatal assertion in qemu_try_memalign
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210611105846.347954-1-sw@weilnetz.de>
 <dd332a3f-888e-a238-9ee1-f1651b630fe4@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <a8310616-403b-5f4c-71c9-8163da08d762@weilnetz.de>
Date: Fri, 11 Jun 2021 13:12:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <dd332a3f-888e-a238-9ee1-f1651b630fe4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.06.21 um 13:06 schrieb Philippe Mathieu-Daudé:

> On 6/11/21 12:58 PM, Stefan Weil wrote:
>> The function is called with alignment == 0 which caused an assertion.
>> Use the code from oslib_posix.c to fix that regression (introduced
>> by commit ed6f53f9ca9).
>>
> Oops.
>
> Can we replace '(introduced by commit ed6f53f9ca9)' by:
> Fixes: ed6f53f9ca9 ("util/oslib: Assert qemu_try_memalign() alignment is
> a power of 2")
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Sure, that's fine for me, too. I think the text can be changed without a 
v2 of the patch.

Stefan



