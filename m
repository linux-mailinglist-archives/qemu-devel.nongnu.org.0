Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EB5101BF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:20:37 +0200 (CEST)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMzU-0004FU-Qn
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1njMy8-0003MB-15; Tue, 26 Apr 2022 11:19:12 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:53160
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1njMy6-0007iJ-1H; Tue, 26 Apr 2022 11:19:11 -0400
Received: from [134.155.36.188] (dhcp188.bib.uni-mannheim.de [134.155.36.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6E378DA0EFD;
 Tue, 26 Apr 2022 17:19:07 +0200 (CEST)
Message-ID: <1531213e-b869-d760-2f84-89b9fd4f7467@weilnetz.de>
Date: Tue, 26 Apr 2022 17:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] Fix 'writeable' typos
From: Stefan Weil <sw@weilnetz.de>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
 <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
 <2eb3f904-1b0c-d5bf-18f4-064f8b663cf6@weilnetz.de>
In-Reply-To: <2eb3f904-1b0c-d5bf-18f4-064f8b663cf6@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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

Am 26.04.22 um 17:15 schrieb Stefan Weil:
> Am 26.04.22 um 17:04 schrieb Peter Maydell:
>> On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org> 
>> wrote:
>>>
>>> We have about 25 instances of the typo/variant spelling 'writeable',
>>> and over 500 of the more common 'writable'.  Standardize on the
>>> latter.

> You missed the one and only "Writeable". :-)
> 
> It's trivial to fix that, too, so maybe qemu-trivial can do that
> without a v2.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

... and I nearly missed several WRITEABLE.
Maybe those can be fixed later.

Stefan


