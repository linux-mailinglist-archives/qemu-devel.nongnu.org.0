Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC496AEF84
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbyK-0005PO-UX; Tue, 07 Mar 2023 13:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZbyI-0005Ju-GS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:23:34 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZbyH-00057z-1H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:23:34 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSZDt-1q22sT1Z3h-00SuZV; Tue, 07 Mar 2023 19:23:28 +0100
Message-ID: <8335bd90-d498-e869-4810-b38ef507d4f6@vivier.eu>
Date: Tue, 7 Mar 2023 19:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/15] linux-user/sparc: Handle missing traps
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <3902d4eb-9158-19aa-3686-bf04b0f5a85c@vivier.eu>
 <b256f22e-ab10-bc0f-b80c-035f1c9d7cd1@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <b256f22e-ab10-bc0f-b80c-035f1c9d7cd1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yaRHr1BtpYBu3qpmsHtkXt0urLZ98O+kNs1WuE25vaT1/h5nrkg
 w6OVo8zjpJt0uRbEh4WIKqpxcneOpmWl2f4C+GbyJOA6KRO7kggmRnZNz1sEr9EezNpsULn
 RVz80gR7ogusWn58+DveI3TRyj76p7edfEmRut92AwWLo8jmkIOUP1sAo0fjUPvx2TnBYYO
 YGWrUHtUaQ/ORvxnQ+scQ==
UI-OutboundReport: notjunk:1;M01:P0:Jpw+21GDWQw=;AXjLXZjBIEeUSz5y2e3jxGV0KqJ
 su2Uiu8eqbH5yOwf4/V/2EfRwcXtFEkm6ovXNIxTy1joTMA2j6EPQKRyGva92HZ4FEMomYe67
 M0CtFlI+/PhN2aEQ6JnHpQBYhPt8I+2ss12fJcUlhpho5iZuCcLKsrVlyKlCNyk9wNCc+zLgh
 4EVnUiTf/k/VuWWU1ZMGOGX28RVNhkcI8s+cGbq/J2JZOY5X5qWPj+5zD/4Qy3aCTGEbS3kxP
 XRbxmzgtjIfKcaxnCUTeztXn5cauYlggtXuIHGW637bKvzCNi2cmIFGNXMX6NH8HR8VTUSP06
 /MtighgO19dGgP3/YnQkbKFrd/SVA220MCm0WfftsJ8wCr1oOFd2URcuBWiIwerTfprlKvajk
 hHMW7BVW29dj95/mw60DE5BpCBOJT13NUZ1e+Zb7QYpnSxLvKf/Qf3V7codc1trL6bTbfODKr
 yPiZNf/e+Nd/Pd3Yg2uEV7lQ1tktDPNcckK8Z5ySTms9MbeyZczS+nvoD1rGRAmyFWsaQjHZi
 l7kKCir3Q9XBAICwnOXKPwcnOGangs0Tw3dN6JgwsaVhPHg9hPox7aeeNNo92hOA6RrO4B5KL
 J1q+Z/3IBML4iJS7+y/te0JhMsS8kXqNi5xbJnbiJNa4LGGUpbxC9rai1jKgwZ5O6ise2KFwk
 TybKIcv6YShTAcyj2/pGXdM+IIxhszyE9+kCFn2GEA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 07/03/2023 à 18:07, Richard Henderson a écrit :
> On 3/7/23 07:56, Laurent Vivier wrote:
>> Hi Richard,
>>
>> I don't have the time to review your series, do you want I queue it in the linux-user branch and I 
>> keep it if it passes my test suite?
> 
> Yes please.
>

Done, except PATCH 1 that is already merged.

Thanks,
Laurent

