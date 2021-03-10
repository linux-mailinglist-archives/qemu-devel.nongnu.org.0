Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184AC3336D6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 08:59:38 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJtkm-0003em-JL
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 02:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJtjH-00034B-CU; Wed, 10 Mar 2021 02:58:03 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJtjD-0001bd-9h; Wed, 10 Mar 2021 02:58:01 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mr8zO-1m81rw1RcU-00oGSO; Wed, 10 Mar 2021 08:57:54 +0100
Subject: Re: [PATCH] docs/system: Document the removal of "compat" property
 for POWER CPUs
To: Greg Kurz <groug@kaod.org>
References: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
 <e7281f1f-27b2-a464-d7bf-bbd2fb116168@vivier.eu>
 <20210310000636.15f20e52@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <28d60fff-1ab7-c71a-6dad-67ff84b5b67a@vivier.eu>
Date: Wed, 10 Mar 2021 08:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310000636.15f20e52@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AUs4w9n0MDY7BNez1wkaBP3sHhZYfo/Ns1NZKebjlSe1inZEPfj
 0nz5H9yHzLXEhR+LwxLrXMjwRuOPMyAdE4W9JpMLIou47IEAJAUxv3mD0ellHaX3RaZio23
 vKiHiv4KygThzqRXErkiWt5ZOk+J+5npBcXjgntYn4wjZme7YoDIsSkVC2H8rcV5g0sPULn
 gx7M2gM8HxUE3/7ZRFWDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DvGdBjSv2WI=:mYymZUbtx5zACF57cTthih
 pm+gy00q4/ivIQbnuRbU1oc73SaoeXOD6VsO0ZJC7O6LvqzB49yfsA9aGwbHYdoWHjmVDvwqQ
 Ylrmvyo0bTNd2SQiXS/V7GR3AlfbU+pY/LVu+elGb2CgtOhCK9qnxQdF+KqEaIXV+Yrq/dTA+
 yYi0b9/ZaazJlrcd8NSLxrtsS2+fY4QSTb2wRMpKpQuQau35upiKVzEXuLGZQ+brIjd1REOoW
 Wg70chP2L2LhCming8a8umedubHGG51FZvMTLZe7hdGQ+cH649vFNCVOjOYYpAbe7JQpcsVyU
 mo6Tm8hTnTxuDlGX7WvahX5HDTaw/oGqBlt6ZZlUOJzFcBsnNZfMiaK/TOpL80wvqOpPsjRM0
 g1kZyEqAXDCEtiZacXcNNJEzoElZ6ZKKM4W2YvzjRfaDtu5xQjQ9hjFiLinx9
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2021 à 00:06, Greg Kurz a écrit :
> On Tue, 9 Mar 2021 21:52:40 +0100
> Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Le 22/02/2021 à 12:28, Greg Kurz a écrit :
>>> This is just an oversight.
>>>
>>> Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server class POWER CPUs")
>>> Cc: groug@kaod.org
>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>> ---
>>>  docs/system/removed-features.rst |    6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
>>> index c8481cafbd5c..04ffa90d48ca 100644
>>> --- a/docs/system/removed-features.rst
>>> +++ b/docs/system/removed-features.rst
>>> @@ -115,6 +115,12 @@ The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
>>>  ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
>>>  via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
>>>  
>>> +``compat`` property of server class POWER CPUs (removed in 6.0)
>>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +The ``max-cpu-compat`` property of the ``pseries`` machine type should be used
>>> +instead.
>>> +
>>>  System emulator machines
>>>  ------------------------
>>>  
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
> 
> I was thinking this was simple enough to go through the trivial tree. :)
> 

It is, but an A-b or R-b from David don't hurt :)

Laurent


