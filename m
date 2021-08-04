Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43A3E02E0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:13:55 +0200 (CEST)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHec-0004LU-SR
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBHdh-0003ff-DB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:12:57 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:34135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBHdf-0001Lb-QC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:12:57 -0400
Received: from [192.168.100.1] ([82.142.6.46]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mofx1-1mvbwW0Z4r-00p5sY; Wed, 04 Aug 2021 16:12:49 +0200
Subject: Re: [PATCH] linux-user/elfload: byteswap i386 registers when dumping
 core
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210803172013.148446-1-iii@linux.ibm.com>
 <CAFEAcA8J1odq1mcg4mKD--EbNj2d01JwqP8DnK-_c6Oz2y157A@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d5893e1d-8219-f00e-e860-bea57a4420b8@vivier.eu>
Date: Wed, 4 Aug 2021 16:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8J1odq1mcg4mKD--EbNj2d01JwqP8DnK-_c6Oz2y157A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3LYC9wljIiRHpETzL4+Z5cmcV7kFIXzkb8btIzRGskz4yfpocY8
 IGFwH5c8D9+88yiZladB6ske6ll8Ozr4pY3nfbo4YT0wzomCIKGnwfw5cKiE88F5n9545Xu
 rZ31C5/enX3tDC7z83anCLPYxFIXN4x4n8WA2wyOMfauw+fdLbdgzPwYFxIoojW9uCmBcmI
 zORq99ZBKS6/m5HjkfA+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dQPFUws2BH4=:t8CNIgwzU6F5mWOuYrFqe1
 FcxuCd51ygWD2W7YpD+484D6BOwSUEpeyqvbJXdR1L90bzj85nMnHPZLXN336o3FHN6+xtknF
 oVaf+ZdHVhz5G2mpsWgXk8Fc6yJlhezGITQhLxvuoQfnSpAhkFj0P7Y9tJhLAjB0OVnl3UIDE
 /oPzhaB+cpG6IkAK5V9RbeSp2XeTMTQN0Ifv702e1eUJ+x7CaKRj6+jyJO/+xQQXNG8CEu5t2
 d0zjNttB43jctk4Ehsqq0PCn6c8kR0nO2AwPWRcfZfbRI1OV/DEfzXROKDufy/14dnRNLV0pX
 wFMsAdrrmt1U7b4dGokPELzzdKS2J9CcUVS5od0v1XsyZue/7VlvQAp3WvAwHPdO/4QDFSjB9
 gppdOcXx7yoAtiv75p7mrKndcMuXNzZG03QCbTI0e6PC6J0upqjcmUPu93euigHh50/yn1/2U
 7pW57U/93cgNiZrE5LjVASbTX3LTdy9KYkCm7WFJKkoz/6yev4aEmEndmXJOs2UloGKcE2Fwq
 AiDRTSHErxerRPDCrxXo7r3SL3HMtRro1wK5OJyu5hK+vbjk9vqxaORmhX7FHLScfmPfxZK4K
 lC2WfhnJaHxvhaQXSzb68x+9LOCeaPm5tHLDL4M/XDV/otv0wt5s8Q1jbUr+rtjHh31KHkk7I
 28N2A2W+a4+j0dxQ4KC7kFKH0THw22p/HT7DjWQhHd7l1Szeb8P04NuE9ZW/mnus5HWCXcChS
 sj8xgYjqZd2YfWMDBnQBzCktrKZu4iBMhEetvCE54ROXSdQNF0lbWrw7RbycrvbR9uwqDzdnH
 9XnsSot02AH1JjFVgMpn1/dChh/4FVGBlrOxk7+/E/llPQ2eHtmxKfnzoU10zwE/hDpWRL3
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/08/2021 à 20:34, Peter Maydell a écrit :
> On Tue, 3 Aug 2021 at 18:21, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>>
>> Core dumps from emulating x86_64 on big-endian hosts contain incorrect
>> register values.
>>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> 
> Looks like these two were the only two guest arch versions of this
> function that were missing the tswapreg calls...
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Do we want this in 6.1?

Thanks,
Laurent

