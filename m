Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9336FF5C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:18:21 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWmS-0005jq-PE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWSF-0004pZ-KT; Fri, 30 Apr 2021 12:57:27 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:59799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWSD-0001w1-Uo; Fri, 30 Apr 2021 12:57:27 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGi2e-1lqDYy0g6M-00DoAt; Fri, 30 Apr 2021 18:57:18 +0200
Subject: Re: [PATCH] Hexagon (target/hexagon) fix typo in comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
 <3ee6512a-62be-72ff-2b29-12285f0168e0@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <356d87a4-2b81-0dea-ea3d-c0758064e279@vivier.eu>
Date: Fri, 30 Apr 2021 18:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3ee6512a-62be-72ff-2b29-12285f0168e0@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OR11rA5ROrBeEPIJCpuYVnNpdoB08IZL26+dL62fs1ucGToAVNI
 Y3bnR0JvKTKObBEbeIU2Ahj0zfBtxSt1g8acZsTaJSap/HWyuYuCLWKLg5HhDqNra4pv9Y9
 RjO7yfhbhxbA2Z0KVq5edwmSArFxcHh5YLL3raB4dK/9HP0NUjLADr9CiVB7We1IaVUz/KO
 iDYlyiNbnzejQ+xh2ynxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JhzY7dwDrAE=:qV3aaOhbcL7FO/WTxvKneH
 HLBDvlJ+mSDc7g5uM9QuJRCAKVYu6qd5E5NyusamncO4/hduhz/sDdK4LatdgKAQSoUjLsxWM
 U+5jd+oLZsA7rmextSrWd4/xfPdY/XykJfRo3ArXVTvAvdMa93qxAhtOvn/aEQZvbJ34g2LLf
 LEbcasUiEnjTzmVySy/wG2ntuNcY0Dtn0tKVw+DG963b+t9AcmO33DDdiMSK1vJQeT/V2bxbM
 Mz6+0hPxSYZ/fxI2CcZ1lNcP/iDcjIOaZJkObe29uCifRKCJSK6bacaqMB/15FlyTQwKy+Aty
 FXPgR/d9eqaVXmy7vZYuaeqBHhILFRAOh9dkFGDAmBdHJLDDpQZ68IkjnoaqZlIcufonFjjX2
 nJPOE93OcQ3585I3MzHiWz8S5h4TueYW2yE7Z4gG2QPQOydPVZ55IY3a3R+HCm3JZxLa6Sx+b
 t0BeiyNAad76eWQoUlYEPJzYRfeObfKm7QDqrvkhafjretlUAA7z9BPOAwrBKViSYO/q82oJx
 iibkTvgO5nXZeVZ4nsUj4E=
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
> On 3/15/21 5:55 AM, Taylor Simpson wrote:
>> Signed-of-by: Taylor Simpson <tsimpson@quicinc.com>
> 
> 'git-commit -s' flag add the S-o-b line automatically ;)
> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> ---
>>  target/hexagon/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
>> index 9f19007..7361a07 100644
>> --- a/target/hexagon/op_helper.c
>> +++ b/target/hexagon/op_helper.c
>> @@ -297,7 +297,7 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
>>  }
>>  
>>  /*
>> - * Hexagon FP operations return ~0 insteat of NaN
>> + * Hexagon FP operations return ~0 instead of NaN
>>   * The hex_check_sfnan/hex_check_dfnan functions perform this check
>>   */
>>  static float32 hex_check_sfnan(float32 x)
>>
> 
> 

Applied to my trivial-patches branch (with the fixed S-o-b)

Thanks,
Laurent


