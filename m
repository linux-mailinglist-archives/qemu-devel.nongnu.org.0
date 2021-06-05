Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A039CAB5
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:19:05 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbp2-0005hn-VR
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpboA-0004qS-6Y; Sat, 05 Jun 2021 15:18:10 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbo7-00010k-32; Sat, 05 Jun 2021 15:18:10 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRBac-1m3qsG0t1w-00N6y1; Sat, 05 Jun 2021 21:18:00 +0200
Subject: Re: [PATCH] target/nios2: fix page-fit instruction count
To: Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
 <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
 <aa23def1-fdf1-905c-94fc-954fea420762@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <19ffcdb7-8266-7c67-aef8-e7173d3bd976@vivier.eu>
Date: Sat, 5 Jun 2021 21:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <aa23def1-fdf1-905c-94fc-954fea420762@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7RkHgN7uO0YxxzT34ZsRlWVypIaw4uwq7t6wtxKqVAHOGRgs6ZS
 Mhwli8BnJwGLhmZAtxvXGnqpf61ifmnsjZziRRswowLnPdxJ6XDG2rmm1OVi3lvV4lN4QRJ
 ZvzRALKNQpvMDNaqU2BsYI2ltpix4m4NTz6aeoiJV+7iAi8ENtN2R72k7WM5YDdk/FIZnL8
 CVCGOXxvl268gv5Rl6rTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJPyT16/YrM=:kMuKMnwZ45ANJjy1JaFNuj
 DqTpsPysQmLtPDU7HrmJ1nI9YdfNXsDaxSQ98OuAKEXd4ztvIl1S5PSdXRFhGnwcOtA/5wAMX
 3r4z8w9guI9EhDA1nUPesXwRucLFn1Y/12iirzDAl09RwIFNuRnoetz1GapwHAnI3ZC2ne0RJ
 iygy4lU7J/IfMkC7ynIeX8Q/rcyQECfmJ9K8ecgD1OZEL50rtsiSiD6vO/sQ25MWubu0ZOhL1
 AuegwFNNsxcP80NRwhxlhYB/xMmZY4Q0cAZ6aN1kOl0SAd0a1QnTMn7s9Hrji5rokzK+kUHFH
 AW4xT2jFe8IoVpvHgGWXZ/4N1IWiOB7tIANnExPe81A0fPCWEbIBcpB+O+kR+qrf2O+acfgB9
 UuL192GkfVHCFyVlxl8aW8Bzvo+MLkJA5HFjYGYfXiGUurM5J9+Ff5QIJ+nFf9pvL7wNRCbWq
 EcKS7TamISGIG/AphcFbxhVhu0vgHU7rVv4XsxXRyjBX2k7lzMuXpb/8eXIXPqdCumVYZDCLz
 fc2+4apC8X0sJyp4a0FZGw=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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
Cc: marex@denx.de, pbonzini@redhat.com, crwulff@gmail.com,
 qemu-trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/05/2021 à 16:28, Richard Henderson a écrit :
> Laurent, how about through trivial?

Applied to my trivial-patches branch.

Thanks,
Laurent

> 
> r~
> 
> On 5/24/21 11:40 PM, Pavel Dovgalyuk wrote:
>> ping
>>
>> On 11.05.2021 11:40, Pavel Dovgalyuk wrote:
>>> This patch fixes calculation of number of the instructions
>>> that fit the current page. It prevents creation of the translation
>>> blocks that cross the page boundaries. It is required for deterministic
>>> exception generation in icount mode.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/nios2/translate.c |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
>>> index 9824544eb3..399f22d938 100644
>>> --- a/target/nios2/translate.c
>>> +++ b/target/nios2/translate.c
>>> @@ -829,7 +829,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>>>       /* Set up instruction counts */
>>>       num_insns = 0;
>>>       if (max_insns > 1) {
>>> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & TARGET_PAGE_MASK)) / 4;
>>> +        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
>>>           if (max_insns > page_insns) {
>>>               max_insns = page_insns;
>>>           }
>>>
>>
> 
> 


