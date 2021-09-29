Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F541C7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:03:57 +0200 (CEST)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVb7k-0001rL-94
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb4r-000890-DQ; Wed, 29 Sep 2021 11:00:57 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb4m-0004ug-1X; Wed, 29 Sep 2021 11:00:57 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3eI-1mFZ3n3IPG-00LUDT; Wed, 29 Sep 2021 17:00:33 +0200
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210902152243.386118-1-f4bug@amsat.org>
 <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
 <f3e89488-0d05-657a-34f7-060a7250517d@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f9e3c54f-a7cb-a043-f7fd-9d9d0dd61c16@vivier.eu>
Date: Wed, 29 Sep 2021 17:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f3e89488-0d05-657a-34f7-060a7250517d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MNkton+xaTjRDiQ0TFtTeSBNISyX8iL9UuDuvfrqEqu2FvWULwI
 mrmubcHKuVh7dz9Am3j9Mn1Hcc+TBY6vbJIoAJTDJJxt93ESfGmYb/Q+DsAbjJNfB2506WB
 UGj5U6xCT5VjX7lhrwnrHTlXsdxbYYDY1JPa9VsK4NeqQdohCaxTRvMbA0dCybt0tRYvCdt
 ZqH6qGyEWAZm6lZlqMY2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m4bGmsUd0yY=:UZEE5/JKQR4ub4X2Nukcnq
 5cuLegB29KY0QOVdEt+8viIgBI5oLSi99MLHWAMVmADAAuobGKzoLk6+VKtUIKnBmwCVufe7c
 GqWuwd73ZdniOhq43kMa08b3UP1knxZzpDg5Cg/yrBq0mGdkxtnGuZDMM50Myjw/3rNyu609N
 5UgHoELUoLSHbjEW+jIDmvQ9kMleL8YtyqVuQJqwtpk8yMYVRmFiSudStVRc12IBxmwBYGVAP
 kHmonVXu8RxM/81i4NAlIBcSIgC5fhvkA+zQtcydwBlG94eyToiwJseRfHYAObyoBOS2c4PRg
 iYo90MpoYYrYXeoOHy8CuWEKQ0yoYZBmMG2PuSoxfkj3gblduakQ+SS8dSpYD0zJmCX/tzrPt
 CPO7Zi4x9ourIXrZR2xOy056sy8kIjKYBjZcMqS9gN9fh77vo5kc20cHHB9BPff91UjEH2gP/
 36F7Shb1RQRoYN8aI0xaxC4172pnctE0olMJiQyKmg/xc9IeVUIF9HATEdp+/0qCg+nDf65VR
 QeZoe3nTXDYs9AaLMnmcaVyyw/yKQuWSsFX9Gx9uFljRAXAYpg/VuVEpCv4MNqz7vV8iuufnC
 MtMkupDjCYw7th+4W07yulKfFFpTHp4S/c4/Luss6KQn3O4Bfv6OJRc+YLfpmWqCVxSMLbHXY
 gNmXhDpzw1E26Icui0VCQnO8b/CUsJixmkTecrFTpJDzA8evNfx2sSRh8rQXmPfYxKEq5DF6d
 jnlqr5jZBlHOC0z4TXivwF2g3EdgMYLJwNKnYw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/09/2021 à 16:08, Philippe Mathieu-Daudé a écrit :
> On 9/16/21 00:05, Paolo Bonzini wrote:
>> On 02/09/21 17:22, Philippe Mathieu-Daudé wrote:
>>> Instead of including a sysemu-specific header in "cpu.h"
>>> (which is shared with user-mode emulations), include it
>>> locally when required.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thank you, Cc'ing qemu-trivial@ :)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

