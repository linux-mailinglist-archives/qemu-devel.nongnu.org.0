Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0191700C38
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:45:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUwR-0005UP-K3; Fri, 12 May 2023 11:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pxUwP-0005TC-Fu; Fri, 12 May 2023 11:44:21 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pxUwN-0007nJ-MI; Fri, 12 May 2023 11:44:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIdW9-1q15QA00g9-00EaFT; Fri, 12 May 2023 17:43:51 +0200
Message-ID: <829baaf7-a2fb-583f-bba1-4ffee498fb07@vivier.eu>
Date: Fri, 12 May 2023 17:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 1/6] linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Gregor Riepl <onitake@gmail.com>, Zach van Rijn <me@zv.io>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
 <20230330131856.94210-2-philmd@linaro.org>
 <f1df90aa-8c5a-4b37-59c2-d62e3912cef6@vivier.eu>
 <e1685783222965dc89a4b13d25a9bdbc7a9166f7.camel@physik.fu-berlin.de>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <e1685783222965dc89a4b13d25a9bdbc7a9166f7.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xHoYgrsY14sjoYvlbq43hhcuWF+5X2imCcWTHOCPE7fK5glQXV6
 Au4a4LxA6qtMwosiY5vMN+r95fN87xK8zE4l0Op7Ak8+GuMJ8C1XXDAQacavwqc4dUMNMzM
 wXfFcRlTOpuPraNqXzyHtWVDVw+17GF19qjmTY8h76tNxwTI3q42/aet3Qe1CbGQuT0UTCk
 DEDLNPiTW/VidjaqqXukw==
UI-OutboundReport: notjunk:1;M01:P0:GMyFptT2f2E=;eGWh5Y3nKoCFs/7FGOB1YL5Hzvm
 /uajSMkHeLjTkw1IBwe783ZFYeF+W9iEr+7ACnbBwgV2E35uu0uEmKPIDLYsjecqZVIkwPO2L
 UgcPJMRPGbNGo4NRBn2zOmDwgAewR5J/o6rRIFPY66fA3uORvDD7Ws8ZcNUd/XeyaXTGmkkf3
 dSwdCpglU80GaBwP+XQ7C+ejnyt+q9qXQwhkCuZrdP4Fabe9/37eGnmsiZ0yCIP4KsaHy0hn2
 aK223ssClZ8bXV5XWXMEPEP/35aH3iBQOvRUxnKAbFOgIAcRzp8Dnl/PQA0xgtiw5FwhPYZ11
 9CA5HLkB3qqNIghzPi3rA0706xh9F1SDOs4jxsgrCMmp45qr48NIMoAKPCPoMOCpIguoJUGrF
 HTcPMrUhLjjLTIg07nohOyozNbGA4UkPlXF1pKBWDRPtnyjEWvJe+AeE+jRY/RQ7VrkWTcBCj
 PR3gdX+7R6rdgUEi7zLn/GZxVt1r4C1jfc4AEdB//922CowosM3uBHuMlFrswCAGbChlmVZKZ
 HITcxFgLnlPRsIAGk0bPAEjTQvsIJs6y5eDxI2U46jebL9tIHcCJS3RZai7WjKux12/uCAOmj
 3IHdkrf1mQfWWP/rpr4/EUIQ+omvz1xC9cJoFYaRztZ8aoU+O5bcJBurqcm3zwQ516GcVHECt
 GAwrHgT3Wtlcfp7ZMeNy5aiAii3iyEwXU3S09pQ4/g==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 12/05/2023 à 14:08, John Paul Adrian Glaubitz a écrit :
> Hello Laurent!
> 
> On Fri, 2023-05-12 at 13:13 +0200, Laurent Vivier wrote:
>> This patch breaks something with LTP (20230127) test fchown05_16 on sid/sparc64:
>>
>> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
>> fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
>> fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
>> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 702 701
>> fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
>> fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
>> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 704
>> fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
>> fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed
>> fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 705
>>
>> expected result;
>>
>> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
>> fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
>> fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
>> fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
>> fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
>> fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
>> fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed
> 
> Where do these tests reside? I'm not sure I know what LTP is. In any case,
> the patch should be correct as QEMU needs to differentiate between 32-bit
> and 64-bit SPARC.

I agree, it could be a side effect. I didn't check.

https://github.com/linux-test-project/ltp/releases/tag/20230127

Thanks,
Laurent


