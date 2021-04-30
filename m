Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79636FF48
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:13:35 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWhq-0001QP-6u
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWQa-0002n4-3s; Fri, 30 Apr 2021 12:55:44 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWQW-0001iL-Pd; Fri, 30 Apr 2021 12:55:43 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9M1q-1lXAlu11rY-015JvK; Fri, 30 Apr 2021 18:55:26 +0200
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unnecessary semicolons
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
 <b68140b5-d2bc-8019-6ded-d7b2abe02926@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <183f643c-fad2-b0d4-5d8d-b2d2b2e04209@vivier.eu>
Date: Fri, 30 Apr 2021 18:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b68140b5-d2bc-8019-6ded-d7b2abe02926@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HFQWk9NArUH7IpgKgGNDDXBLgF3edmXak1nGnegUB7f4r9DKtrg
 xDbNhKAmG73Ln0Ewgn4SUYeu+MRbfbZPu6mrXicdgWuxE/OSKZSd2UuIXlpgHI2OmuCgbkh
 Ih2Bgj0YINjR9agJidGJ4auU9g21ZDx1ja9GohdtHOxDtn+oZFTG6IU36fTlbmkVMxS937A
 6bXsqw9Qe9Oq4aIsnnyNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uVmaj18Wdgg=:OA9aIOqm2HGhgdjjbu1QX3
 i2XxItYEP3D5j8GNqJjngsHtliu0tZQPNS1vE4POA8lp+uFc4BDVLRuqR0DqDArCCyjBSFqfP
 JbfZ1lEoXcRxO0SrYhZ05Z8WRLZbLvwKivs4s0GhOEkgmFn7g41qmUkkPUXyAu3ZNyHxVBVUs
 xmLgoU+I5QblvRIJ+YOmIlMw41YnNuza0CHU8ezPV9wG7+K1O9LffVrVke77cWfV8GXwhHDm5
 aSuJiMVEocrzklcDLmlYcRrtUI2Gqo8l9L5piBIXSOJLrV2cbXY6oZoVWgLz84Nla/ofCWvCz
 d+C9T1VdsvXr2LtbHcTBVEUWq6uzK8BV2WvObeY23LMJaNgn5JfiC8weIop1u9Nh0zm7s2bIK
 6BrOtZwfPgfMeyjNlhet+lsWsi4OPVKMTB5PdC3cHE8vZqqbw/IOFbQygwva/GtoOU6S9Fz6P
 73ggcrY6fsdt532Hsbk59UjTw/4lYSbVmLUeCuMNzInRLgy+bIMJ6BGsbjMRBjPLpTjRV9S6o
 1qjXy/sWvrFHDr9F511Fe8=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2021 à 10:43, Philippe Mathieu-Daudé a écrit :
> On 3/15/21 5:55 AM, Taylor Simpson wrote:
>> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
>>
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>> ---
>>  target/hexagon/gen_tcg.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
>> index e044dea..a30048e 100644
>> --- a/target/hexagon/gen_tcg.h
>> +++ b/target/hexagon/gen_tcg.h
>> @@ -83,9 +83,9 @@
>>  #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
>>  #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
>>  #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
>> -#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
>> +#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
>>  #define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
>> -#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
>> +#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
>>  #define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
>>  #define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
>>  #define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
>>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


