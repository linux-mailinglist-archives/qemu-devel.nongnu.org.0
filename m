Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C067AE0D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKc9r-0002Ag-FX; Wed, 25 Jan 2023 04:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKc9l-00023j-0w
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:33:25 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKc9j-0006nq-GJ
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:33:24 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQuwR-1p0Rli1lm3-00NyoH; Wed, 25 Jan 2023 10:33:17 +0100
Message-ID: <5ec7f95c-df5c-c8f8-1542-ad4aa5befbf9@vivier.eu>
Date: Wed, 25 Jan 2023 10:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 3/5] linux-user/strace: Add output for execveat()
 syscall
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221104173632.1052-1-philmd@linaro.org>
 <20221104173632.1052-4-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221104173632.1052-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AquPQYlcchs1HCuwEVtmN1mJiwA6/N1B90LaTUC23sdCVzisLA0
 D24wxJaU4j+aM2WKBizwZOGHaCtOEo04HJTc4kE99gd0Anqf0/HBVXNTJZCavOO82Q/tPvu
 pp7Dyuma9F+n2HgCn36I4URJOX7PVDBc4uPmV40HQ1bCzk7P6Dv7RVX4vgM/kFAtQwUrwId
 WBs2/KQLyEsrhxmCKArkQ==
UI-OutboundReport: notjunk:1;M01:P0:6/EK3wrepVc=;dtq9psauZ4IHPSWFDCm3ce0jK2f
 ZlltlS1cFh7xtaULy5qfIABS2pmblZ798daFRXduMTzzLVrr+3sFjiG+Kz9kc0Y1cUMFhd8KF
 0GvpNCYEzdZqiEu+zdCKvv8hwBgc6Q6ZbsYcXJI5rSoAsuJCOkxXSWKpYuj4ZJtu4njKfPwHC
 aHi0bEOmKgnfiNDZZinxEFmNUByMJRfc0dBeMIUeMn+sbV3oplZhCaCCPsMj6upXYc8TeaGMS
 wlCcsffVWNFdkLIBMqkcosETfW3VPEhJa5axJqiSsWkQyYRy+C9c9H59Ti0Ojxm5Ul5PlhvRW
 rb024y6VHtUbQNxIcj4i1qzIWUUTw6PTMZlzv5knpE9AZB1MWxQeism73bLTy6QVUtJNH9oiT
 8j5eRKSMxG6sQjyYkPjUiZyOTwLEM2rGoTLekQzHrAdr02Eyoa+3Xod8F6wpvV528HRXtvPzp
 jA7dQdroPw1DeEXTr53lprXybffwt2r64MKhIWUhP+YixNSXqV1esaTvbNk7toAfl3Kmz8tpM
 tuIZ4+r7Uv5+PHEiiwQBnbm38B7vTJUwVTJyiESpO7yU+X05jNGB8ektEaBRP4rvu1FjrJFvk
 zTqN6pCctTIS2a7ajAKsEnxpsy9gD7oFrJArZDIR0GRHWkO0O1j/RqKjytvavnQlEmcOS4uEE
 w3EA75j1I8qMMZJKD3wmu+uTWSW/BraCTjnlHbrEoQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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

Le 04/11/2022 à 18:36, Philippe Mathieu-Daudé a écrit :
> From: Drew DeVault <sir@cmpwn.com>
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
> Suggested-by: Helge Deller <deller@gmx.de>
> [PMD: Split of bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/strace.c    | 23 +++++++++++++++++++++++
>   linux-user/strace.list |  2 +-
>   2 files changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


