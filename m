Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E832166B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:23:44 +0100 (CET)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAFb-0007Yn-Qk
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lEADt-0006ih-TC
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:21:57 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:47317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lEADs-0002So-2g
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:21:57 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIdS1-1l1m9l2jIr-00Ecds; Mon, 22 Feb 2021 13:21:36 +0100
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2869185a-df62-4b28-5e73-57a21c72e5ea@vivier.eu>
Date: Mon, 22 Feb 2021 13:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h+rGY52m57m0AtPFQwoYFQ4lAUI2gFQnXGrvh6hUVhIeydkxgRy
 JlXY1pthfh0wnVdeMT7dL0saxsQjQx304nn4UaC5bje/nXlKzmYcNesLzdEhxujMgJjA1wU
 a6AuZhfZx8ttHzyQ+zsmuojDOo5lMzlGqBeJhFQF5CXTjYWG9HGwirJyP1kJ6ZRuxhoYzgw
 VpXHWpW5fBB4CpKEB9Hgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MZYkTiGI1F4=:Mw7ubzTBx24rTSsj9sJAL5
 e7mv10hdVHEfoESj6+PsIm6NjjFCgC0Ii+44IuQPsOLzj4dywT3LW3T8wIaKKICAYtL2UYilt
 rMygP6i+BvJlAwyY1O8HK3STzulW9MkOhdP+Dp0LhzqVfjCtzjrM0QimQBo3Oiugz+Hc6UiVG
 B2A04Nhj/L5K8r1cxv6Vtrk7n9Juq6Fh3nvNHGcYJRTh6DmV6UomQcVvLyNXCdNReb+aA8Cwb
 8IeeJGGD4/QEiRMLPRbdmtl7c8d5vmNcDoz+7JxNFe0P83pHXay6jphg5IxnIl6QYrmCR1Wna
 rIbNATbU05pEaDYpIwydvnm5KCFwfyCehhKapPHwyF63Tt+pT4zVathlL6lJZhnlSPjsv9TOg
 Ea5JMMXWH1XHkc0DICumcI1YVSC1Y3CdpSmBE/gyVQkYbMQ0+u9VFzg+YNArB
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Helge Deller <deller@gmx.de>, Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/02/2021 à 11:58, John Paul Adrian Glaubitz a écrit :
> Hi Laurent!
> 
> On 2/22/21 11:50 AM, Laurent Vivier wrote:
>> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
>> flag.
>>
>> This patch allows to use new flag in AT_FLAGS to detect if
>> preserve-argv0 is configured for this interpreter:
>> argv[0] (the full pathname provided by binfmt-misc) is removed and
>> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
>> 'P'/preserve-arg[0] is set)
> 
> Would this patch finally fix the issue with the perl package in Debian? [1]

I think so. Helge can confirm that I guess.

But you need the kernel support (the one merged by Helge) as described in the patch message.

2347961b11d4 ("binfmt_misc: pass binfmt_misc flags to the interpreter")

> Adrian
> 
>> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=974004
> 

Thanks,
Laurent

