Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDCE5101B7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:18:24 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMxK-0000Tm-Vp
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1njMuA-0005bc-Rd; Tue, 26 Apr 2022 11:15:07 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:53128
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1njMu8-0006y8-Nz; Tue, 26 Apr 2022 11:15:06 -0400
Received: from [134.155.36.188] (dhcp188.bib.uni-mannheim.de [134.155.36.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 68A13DA0EFD;
 Tue, 26 Apr 2022 17:15:01 +0200 (CEST)
Message-ID: <2eb3f904-1b0c-d5bf-18f4-064f8b663cf6@weilnetz.de>
Date: Tue, 26 Apr 2022 17:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] Fix 'writeable' typos
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
 <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
From: Stefan Weil <stefan.weil@weilnetz.de>
In-Reply-To: <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.04.22 um 17:04 schrieb Peter Maydell:
> On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> We have about 25 instances of the typo/variant spelling 'writeable',
>> and over 500 of the more common 'writable'.  Standardize on the
>> latter.
>>
>> Change produced with:
>>
>>   sed -i -e 's/writeable/writable/g' $(git grep -l writeable)
>>
>> and then hand-undoing the instance in linux-headers/linux/kvm.h.
>>
>> All these changes are in comments or documentation, except for the
>> two local variables in accel/hvf/hvf-accel-ops.c and
>> accel/kvm/kvm-all.c.
>>
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Ping for this to go via qemu-trivial now 7.0 has been released
> (patch has been reviewed).
> 
> thanks
> -- PMM

You missed the one and only "Writeable". :-)

It's trivial to fix that, too, so maybe qemu-trivial can do that
without a v2.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


