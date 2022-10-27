Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BA60F08B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:45:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwak-00016f-KP; Thu, 27 Oct 2022 02:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onwZY-0005ki-2V
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:41:05 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onwZV-0003x4-Rq
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:40:59 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUok5-1ofS5s2azR-00Qg8D; Thu, 27 Oct 2022 08:40:53 +0200
Message-ID: <faeecc92-6fa2-6a5e-dc31-353989d168bc@vivier.eu>
Date: Thu, 27 Oct 2022 08:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 0/2] linux-user: handle /proc/self/exe with execve()
 syscall
Content-Language: fr
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20220927124357.688536-1-laurent@vivier.eu>
 <0d4e74bf-c5fd-7572-3e7e-d9165fc89472@msgid.tls.msk.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <0d4e74bf-c5fd-7572-3e7e-d9165fc89472@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3G9ouNkk/0QRShpvQZzgfeH7/woXiDiDODsnzb46rg1wbLy3t1B
 Yc2g4vo+Sc0Jx7XSGrZhNcAHyZGCcQlkolsSddEJnc6YU6RkB6gHT3l4lGuSzQiwHji2E30
 UwPPt1n80yWg14qk2taERe4zXPtMujZn1i4G7KXx+3WceJYJDVHHIe+Taw3K3o7LBEVh9If
 ONxge+R6uONChvnsyQ0SQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R4eG28ZRXH8=:ekLRc7zbQy7kS2gfOk/Z5Z
 nxg1YvcJPwqF1Gsda+ogvrHVYILBHHg7XY9wfnsqz9mLmCh0cThDAFeGyMKoXWupQTrXirvR8
 6cplYAND0sNhU5+aPprBxVz3JDFy2eSQzxlNwNX842EOWpWfwCen6qq8g58b2rz60qaUKrZo5
 fe11vRRa/k4U2RUfHAHNivmspnHb/xApkYi2Vd+0ch6Ai0Y5/VTfTjCNYd+2LdtmN3mmcgyh2
 RUmmPqKOhQEBWx3A2KEWLQ1nwCCRo5+xJ0glUJ/5t2nxmEnIQTRaEHqK6R3HI3yWRNTEkXSHX
 az7aTEHGWlKrvM6nqVOMqlj6hcb2upcJpCSyQBhKz5MWjhEf5w2VWW5O0ylPo7IIvOkKdYITj
 LaMOjwyrijVv4vBsLS5YQpGcK9aW5bWLZQkshCU3kNBZqGFJgd+eXVTpWSBWxAS5mIqnMRe14
 0vkrs6C8a+4Myn6Jq3deUWTJnQpBMxyy1eUGdZkBVmtnhZ2jDRplrGd1Y5XYzuQx+/Aq4YykT
 3MMxq+5kymvEoWpgPtrkBv4TlkCz0E2AWnAFPtk1bDyfqkp6van0V5P8bSzZp8N5TEfl9b/qw
 Dih1rUH005/P7okXDOUpDd96owHBl5vzpZMqm1OknlQwl0bFMviZuLOztwM1GbH/YIfPzRgT6
 qKv4FNy/0yrn2s9wJgCs6OGV6VW5OXFpaLGiTK75OUiVWG8hewMA24OTIEe5zBzSvDoY/aPtU
 kO3rEIlqZInSyWGmAEg9PjAhLLIKXsRiJAraV/rkvCslsDZOamUItZb6RYoDrPRv7DnMbXSO+
 8UweQeW
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/10/2022 à 17:25, Michael Tokarev a écrit :
> 27.09.2022 15:43, Laurent Vivier wrote:
>> Use exec_path to re-execute the binary from /proc/self/exe
>>
>> Fix do_openat() that should not use execfd.
>>
>> v2:
>> - don't use execfd as it can't be closed and is usable by the child
> 
> Why can't it be closed? I mean, how about O_CLOEXEC?

I tried O_CLOEXEC, but it seems the fd is closed before it is needed by execveat() to re-spawn the 
process, so it exits with an error (something like EBADF)

Thanks,
Laurent


