Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD23330B0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:14:55 +0100 (CET)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjgs-0003sL-3J
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjTm-0000d1-Da; Tue, 09 Mar 2021 16:01:22 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjTk-0006Yz-Py; Tue, 09 Mar 2021 16:01:22 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTzOe-1lAHJS3geY-00R4wy; Tue, 09 Mar 2021 22:01:13 +0100
Subject: Re: [PATCH] virtio-gpu: Adjust code space style
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 lijiejun <a_lijiejun@163.com>, kraxel@redhat.com
References: <1615292050-108748-1-git-send-email-a_lijiejun@163.com>
 <1808a180-d8ce-fb52-38c5-085ee9d9a26a@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8c9c6c37-27ce-7ded-c3dc-dc2c0991d331@vivier.eu>
Date: Tue, 9 Mar 2021 22:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1808a180-d8ce-fb52-38c5-085ee9d9a26a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IcLRr5Cyfrw0TWmaJ7PXS3Kgi/I50VY8WkwGumefrIqmTBFi9ND
 MKz1X1EchKQn8Ake86Sq0O2NG0MUkzTIxKCY+fXHmMEQho8PYGC5VxXThrPNxAbZb//kp7P
 ytvAkftue1dfabVNlRGaNzBWzWa+U/Ccj8EqFOIYahJKQAUykNGedElGeTV3CON2OKfW+Qr
 LxpyZ/WVGwBsPKBQAeeLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y60mAY6iB7w=:IJCnPRhm2t1HzceW1M4Si1
 R6BRW5e4rL0I9OrFirCxtUHjDvi+minez5z94MDkbGy0cghEaTZcDEQh7TfJIxia21PPwz44m
 OUO2Fpcd6e5KUl1gNeD/mkaXUKZcx26juBZx0ypfKj3k6ZUbTInE4TxaX0P2fqjgkPzZ6sLa8
 LULqtftFybrtUplDGwqJ0/DFhZyqACEhLqv3FdqxNVOMYD4B8UHnhCIWri2xOExfHMhdvtjte
 CJ/fqoSzUCxMNZXxF5rDR7Bvrb5Mf579zsMxQK5wDH8GCoFJYiCJnMGRyL9c+Oal8wJj0ddU4
 9RClR/ld4XANzM44ZvpVr30/R1xGDf8mykXsbjVqqzSfiyRM/MKaISqKGNieYGUO/hkp9+GGs
 WSESFFUT8lWeyb3z8u+AiQlNfuGT9luHJ2/WG6hSTRw8GVw8RWiH+SVhLiSFn4i5EpO0btiAZ
 bOkQXkzH6g==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/03/2021 à 14:32, Philippe Mathieu-Daudé a écrit :
> On 3/9/21 1:14 PM, lijiejun wrote:
>> Fix code style. Operator needs align with eight spaces, and delete line space.
>>
>> Signed-off-by: lijiejun <a_lijiejun@163.com>
>> ---
>>  hw/display/virtio-gpu-3d.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


