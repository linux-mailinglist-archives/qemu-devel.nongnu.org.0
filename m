Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C991443C57F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:49:26 +0200 (CEST)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfecf-0005mI-Uo
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfeZt-0003Wg-AS; Wed, 27 Oct 2021 04:46:36 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfeZp-00046R-Oz; Wed, 27 Oct 2021 04:46:32 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIxFi-1mMU3o2NCM-00KNsk; Wed, 27 Oct 2021 10:46:22 +0200
Message-ID: <1ef2bb43-3f8f-aa90-0bb8-288cea6bc911@vivier.eu>
Date: Wed, 27 Oct 2021 10:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210920064048.2729397-1-f4bug@amsat.org>
 <e4da8e9f-7874-0852-792e-645eb7b0d078@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <e4da8e9f-7874-0852-792e-645eb7b0d078@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0peTWl5GYnwjaC1L+e8vrgevxuyZSk9cj3/p2YUDGN8LClcOC0J
 KYTd1qRAbZyv7Kt0HZuUwFlIuE1Jab0AMZFgfdjfaeB7gCItvcjcVo1FrSujZHHkli6eB+7
 LT/qgCtDWEnmq1Z6cyqve4LR0Z2+OHM/+QtbTJBxMr9mIT1GK97m1vLQXb8FiJXCLlbDxit
 Moq96fkLZQHu1Z6M4i9SQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s3ae0TVxprw=:IWmUCK+g8vnQ5EUsmkiz65
 mPiS5rL45vDtpRzRVdjqf8kSXFEh4qZX/g6UfaIDq5EgLiztTIHZp4XJ+Kefjk6lG40p6+Tyq
 0VQlgotY7oL2r4/XhZsdJyukl36wEdPHoKT5EPF6OZwUuc8O0RkEALn5WfAaUfYRAmkRC/6IC
 MXINt8UPNZxEFEXwniasFn5oQSAOlcYjynhU9CUzscOKXlg8ZHWjXQg7zkYuCg1GiFudUzDl7
 pUnM2WXneZ9z9WrJjaCtuzcY9i8LaW+t3DsrlwrPXGpcoUuOcGZqUth9rHLnLcYt8lxkrjekB
 Wh0V3EXy1t7n+PxvyLa22vqlvia+3FIU9+xwesJ4q1R9FxVRHBw38v6KB+5k4qoM7ArJP3hq1
 0noggAUASgLj3UWe/d6EHD//ZdTUDbGlCfSieeOpFHKM+9CBaTrocdi+HVV5iL+THYvRzalNs
 2RwHMwXGl5kNEwf03PCaWyTFyevThtK8JkyBkMRPr514qcOhHevrMfuBDCbawszYL6+CPaCyF
 p64OJV/6LIxFsW/K8Ex/O5DpcrbQ3qXoDuqZbxb2n3CUuCHkcAckqZzChRbGxJebIq2MwzVcd
 31qmFiFVIvtiBLeWIQz00vuZpJvj9B08QGolEqJiDaKoV3hmu71Nnw0A38Fzdm1O4m/xJ7cvw
 50ndKi6fDPmMEIkPfZ3ePAg2CnYwBLeOPjmnF/GgbDnpD3CXYsBFfDfm/3TpHIV4de1U=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/10/2021 à 07:11, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@ (fully reviewed).
> 
> On 9/20/21 08:40, Philippe Mathieu-Daudé wrote:
>> Slowly nuking non-QOM devices: Lasi PS/2's turn.
>>
>> Philippe Mathieu-Daudé (3):
>>    hw/input/lasips2: Fix typos in function names
>>    hw/input/lasips2: Move LASIPS2State declaration to
>>      'hw/input/lasips2.h'
>>    hw/input/lasips2: QOM'ify the Lasi PS/2
>>
>>   include/hw/input/lasips2.h | 31 ++++++++++++++++--
>>   hw/hppa/lasi.c             | 10 +++++-
>>   hw/input/lasips2.c         | 64 +++++++++++++++++++-------------------
>>   3 files changed, 70 insertions(+), 35 deletions(-)
>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

