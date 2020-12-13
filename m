Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D62D910B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 23:58:02 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koaJV-0000t1-Fb
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 17:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koaI3-0000OE-2g; Sun, 13 Dec 2020 17:56:31 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koaI1-0003ex-G4; Sun, 13 Dec 2020 17:56:30 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQNF3-1kSuhS33xJ-00MOaA; Sun, 13 Dec 2020 23:56:23 +0100
Subject: Re: [PATCH v2 2/4] Makefile: Require GNU make 3.82+
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-3-r.bolshakov@yadro.com>
 <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
 <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
 <CAFEAcA_XA1FcQos+m0vv6DVkbaybYwX5ytsM5gMaLAtL0jGGgA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8010190c-6265-2dbb-cb55-25353d9922ec@vivier.eu>
Date: Sun, 13 Dec 2020 23:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XA1FcQos+m0vv6DVkbaybYwX5ytsM5gMaLAtL0jGGgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TsbXwlKAq9P1CNDPLPwOhwl7XWKwYE9is614oOk+famloG0pI7E
 dRjJrBfUYhuJsn/lz2qV/hIjz2MlGXNVOgqjTYSGtBe+ASu6qWT4Z3M/s4upjuTm6vRbdVO
 WjSQWEWP8SdknU7B7XXqTO0WGRAxdi8YyWx5Zy99MvU7BgTuqgqjsRRMnW9C9vZxj2qEc3A
 CdoYUGD0ZmQbNvvsg78SA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BrKI+KQA0aE=:UpY+lM4m5YzoCI/37/9sH8
 k52ZTWF54fhd+8nnLQVaI9Mt8VaWoHLGK1SolTq3iMhZ/6EB9d3ja3IhUPICRascsHhNduPUO
 LdakfdjRIYhJRjpmUvZziDTkOw8by+WH6Day28M24adNiXsk+08PZNLn/XTBTCIn6EB56prjn
 a2/FxV8HuCUBFORFcjo7dEV8wP2tdSPbh3Fsm26pA/yu8zTA7IkbfjOn1OVr0jHUf+acq7zAE
 Yse+vvUAXbiVCb5WvqyDRJCkeiIKIl9opAw8xtRk2AgLWGabt6ZLe2Uw7FxcwTkXJX3bSJhw0
 LJm/qsNNAbpsxcAqusyM3S4exqvMwCeAnuGGpuhiX+F653o3C1lPahFf3h8RswEFs4r927M18
 j9T0BGIUbfFZCTQR75KObROwue+L+j6OAFiD1rZ81fSlimlwVL0ZjroQ4ONfaQ1d8XDz4/Jx+
 lbL4tjTY0g==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/12/2020 à 20:04, Peter Maydell a écrit :
> On Sun, 13 Dec 2020 at 17:22, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 12/10/2020 à 11:47, Thomas Huth a écrit :
>>> On 25/08/2020 22.27, Roman Bolshakov wrote:
>>>> QEMU build fails with cryptic messages if make is too old:
>>>>
>>>>   Makefile.ninja:2655: *** multiple target patterns.  Stop.
>>>>
>>>> To avoid the confusion it's worth to fail the build right away and print
>>>> a friendly error message.
>>>>
>>>> +ifeq ($(filter undefine,$(value .FEATURES)),)
>>>> +$(error Unsupported Make version: $(MAKE_VERSION). \
>>>> +        Please use GNU Make 3.82 or above)
>>>> +endif
>>>> +
>>>>  # Always point to the root of the build tree (needs GNU make).
>>>>  BUILD_DIR=$(CURDIR)
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>>
>>
>> Applied to my trivial-patches branch.
> 
> Commit 09e93326e448ab4 says that the switch to ninja from
> ninjatool removed the requirement for Make 3.82. Is this
> change still required?
>

It seems 09e93326e448ab4 has been committed on 17th of October, so after Thomas' review.
I remove it from my queue.

Thanks,
Laurent


