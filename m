Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FBB341BFD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:11:18 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDyH-00050K-Gf
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDwT-000454-Dy; Fri, 19 Mar 2021 08:09:25 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNDwJ-0000kD-B3; Fri, 19 Mar 2021 08:09:25 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyNoa-1lbRRQ3zGW-00yjjE; Fri, 19 Mar 2021 13:09:09 +0100
Subject: Re: [PATCH 2/4] iotests: Revert "iotests: use -ccw on s390x for 040, 
 139, and 182"
To: Cornelia Huck <cohuck@redhat.com>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-3-laurent@vivier.eu>
 <20210319124339.6acd05d8.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2c100509-6136-9340-d812-c320e41bdc00@vivier.eu>
Date: Fri, 19 Mar 2021 13:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319124339.6acd05d8.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LpKsfgybnA269TlII+7hvvX1txrx94JwIIhvzFAHaRPv4DiEj2Y
 PLoxvvkgu6jhQjfBIZJvNUoyeQrLtqPNkCVoH7N3sTr72eyBJw3ipXw8s98a4IO1rP8n4Al
 MgUzFlxMewMNK6RJoufMXhGStd/DhOONlWkP7WOSR3FQ8SaSsvvA0Q2bKtJSKaVALA5k5gk
 BOdofD/9htM19Q7Z9nitA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZtQzojlEFGA=:eVMLviOBSCEYG5gqDd+Kkn
 kcKKMfZ9/rP9pGelt2A6JL3+vcaShFtF7442MXOMhQOYk6xC94nM6GDPvoH1d1YMBkh6PtvjN
 JdnUxKw5btiJ0ohmqNDq6tPdK0HzFtiwsVrFqgMWOljlXd3sUoUpalWle6XP3C6d/G/C0hJc0
 5peDwq0yxEWCpLSO1hPxTh2DOGCRr61t0yQumIWL9mVxAG5M92kOlLPufhyURwVcp7iS429G3
 uCBnQ31Et9pjcoUCwuRMqGE4BJoFERB7xT6IRYAgAjTokvCukbT3/32k3M5aA4ZGa5FjGVcz/
 kmDCkQE5KsR12xXI3UsE0g2bCDLadZ4vwYfPH9YfaGH1Dur1R8xTGHBP1wDJcmWcLay9ASuvB
 glntDhsLiD6XllwrGJNBYxzORdZu33aEhOwlKXraW9na3CPcEjlj8CsQyqTzQJW1QsBen5dwy
 k0if3OuhbQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 12:43, Cornelia Huck a écrit :
> On Thu, 18 Mar 2021 23:39:05 +0100
> Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Commit f1d5516ab583 introduces a test in some iotests to check if
>> the machine is a s390-ssw-virtio and to select virtio-*-ccw rather
> 
> s/ssw/ccw/
> 
>> than virtio-*-pci.
>>
>> We don't need that because QEMU already provides aliases to use the correct
>> virtio interface according to the machine type.
> 
> Maybe add a comment that this also enables virtio-mmio?

ok

>>
>> This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
>> instead.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> cc: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  blockdev.c                    |  6 +-----
> 
> Hm, that also tweaks how -drive behaves, IIUC. Intended, I think; but
> worth a note as well?
> 

You're right. I think it needs a separate patch, in fact.

Thanks,
Laurent


