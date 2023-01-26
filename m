Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2167CF4E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3rV-000109-Tf; Thu, 26 Jan 2023 10:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3rT-0000zt-TY
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:08:23 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3rS-0003LA-7O
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:08:23 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0qmr-1oR9IE3xSv-00wnmP; Thu, 26 Jan 2023 16:08:20 +0100
Message-ID: <aefa9392-1731-0223-d1a6-42a6b0c35a9b@vivier.eu>
Date: Thu, 26 Jan 2023 16:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Add strace output for clock_getres_time64()
 and futex_time64()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230115113517.25143-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230115113517.25143-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mXRFX9QKCTvjbye1+iBS/DmeWbAcR1CkLchE+Qyv8gudUMjJZDb
 OM295Q33lvJNgrOfmsJg2oVEVBaYeUKY98q3IMSEmzl410gg2pWyzeQiOkIC2Y6S8i4siNI
 IiR41LJ39aX94KMnXCYlu+4bKk8ewRqQOYXjZWYJFH95Z5jas0MH2gj8MdQ7/d8qwx6YNAu
 ZIIsGTOgTysnaKgffbnQg==
UI-OutboundReport: notjunk:1;M01:P0:QSR235MnGfw=;Sv4q+2xJ8AJuA2lajUm/puDe9DT
 9BR/2mr1nNslC8uCqNg5wdttzP8HUmw6ZJ7W90QS1je4j/QcpGzAFh/w0Ws7q+r5R0nWUfQ9Q
 WplU9xAZEJCJGNnSPRwaw11Nun1hmW+3R6m86qqLY8mkxLYwQ9qYTH8ENQavxpYLBgdnI5Jeg
 rvFYQh5FzlUgP+kbgJHW8/G3acEQBJikxPmXeUbCUsJxFpYmW6vF5thxZ6SwI21c0sYMO2s1i
 pg8ZH3E9xDKAlPKCAWSXkEFe7TLUzeyRYygFHBq8rQ2aTMekPy1St+AhFDAVDwBpFY5W+a1gB
 WWGym74v4gytO5MDPPFAbtWSv1VNb+ZQH0MZs81HytEStp+YpyRrUerOFZSfNYyHu9uNcQy5/
 1tjxNBb6cavwJVY1PtDGT/bBe3mpU6M1jzKMAdkoL/dq8/1nOYt5ryWZl8FTmfkVlkJD9fFaI
 W4VwKY/s0JeCQ5uaUNzQfYY1CqlrQXRuet5Zbz8mIV3rqU5ByZE3y2DDMfCkdu1Ljqxquesa+
 YxysGm2WIPHyxk/IADW4IRt8Mw2VAiszdF9UaBfA8UByDDvQh9ceOybH+P5DHd6EwNKvXAVlt
 6HkuTxqumqI3QYKqRmvgCDQLHcBYkKCjyt48OM4ZlDEAI0qGfNabU/YpJ5422WArASwwCuNaJ
 W+DjXdbGhboXnw5y6U+2G9rmG83ouMVEBm+tZ5k8Hg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

Le 15/01/2023 à 12:35, Helge Deller a écrit :
> Add the two syscalls to strace output to avoid "Unknown syscall" message.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 6 ++++++
>   1 file changed, 6 insertions(+)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>


