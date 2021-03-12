Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F043338B1A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:09:38 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKffl-0001dq-7g
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lKfc5-0007sr-FS; Fri, 12 Mar 2021 06:05:51 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lKfc3-0000JA-Ol; Fri, 12 Mar 2021 06:05:49 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6EOc-1lMsXc3JrE-006bTu; Fri, 12 Mar 2021 12:05:41 +0100
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210310214504.1183162-1-laurent@vivier.eu>
 <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
 <13bb89f8-7ffd-b22b-d6ee-8b9eb88c9575@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4f488d6d-4c93-1032-b293-42f4b3f4517c@vivier.eu>
Date: Fri, 12 Mar 2021 12:05:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <13bb89f8-7ffd-b22b-d6ee-8b9eb88c9575@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lta737Jlb4CKikhV5f1iXCLV/hng7YKXTJMQ+UU84MMom+FeQXs
 3hQmcT//0qZs6hUpakOOAoKdsMfyIgbEXGldDACWEjkHnKHdgZ3juho1GxjVNXn+0zPA0Cw
 +Xvi7pHnu07t++MEKx9a/o9pGi2cenJGkI0hxOzeH13uKiDhsNKPwPF0ioVq0/P7JWrdd2J
 hi9aWcDBe0k/mfsRhCwNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XhEt58hd0F8=:CkkSzB2RYcwBAiu5DWTcot
 o/dvWk3rKoAbedQ0d2sH3s+oyUvq40YohgGMPnTtLqf7KjFf9Ue4xgVFaEPipBtZGxLXknPsZ
 DG9+JAYHn+gYr82tDWej9N4nz561BtsxR244ZxbzNwb5Zq4u5tUbq4j836kLfgo0SkFD7Z0AO
 BeFK53YFXFcNfhDtFy9+txB+pvA4uHYfPyCE8EVY4JL6SWLYGO+aM9elZqN5TAS/9IAv/yT6c
 /sRZjtUb7BRS3TPlWdPORhAq248/dKBQkQrMqdxrW/4oKvUlV+9+eezFnTk7UnbyVD0wIVr+n
 Qc0IXMLm5EX2vap8Qhk/62aAdO66BG0/UeF6HgdaasugXa/BQpXGvZZOOWm3RXsb+DjUnm65P
 GgixIgjcPrNn5h6Uz1Z0HPwKqsfINe/oi6SWzKixjwbo61fPH96LEPKoUQIW29zzeyMTw6f7e
 ePmQGRzNuQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/03/2021 à 11:15, Philippe Mathieu-Daudé a écrit :
> On 3/10/21 10:52 PM, Laurent Vivier wrote:
>> Peter,
>>
>> my "git publish" has failed at patch 20 with:
>>
>> Requested action aborted
>> Mails per session limit exceeded.
>>
>> I think my email provider has added new limits :(
> 
> With GMail I could pass from the 20/session limit
> to the 1000/day limit adding to ~/.gitconfig:
> 
> [sendemail]
>     smtpServer = smtp.gmail.com
>     smtpBatchSize = 1
>     smtpReloginDelay = 3
> 

Thank you,

I've set smtpBatchSize to 19. We will see what will happen next time...

Thanks,
Laurent

