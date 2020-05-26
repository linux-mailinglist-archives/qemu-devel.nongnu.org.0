Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AD1C84BB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 10:24:38 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWbpc-0004nV-Lm
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 04:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jWbor-0004OI-Vl
 for qemu-devel@nongnu.org; Thu, 07 May 2020 04:23:50 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jWboq-0004jZ-NV
 for qemu-devel@nongnu.org; Thu, 07 May 2020 04:23:49 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MHGTI-1jJSg006fg-00DF21; Thu, 07 May 2020 10:23:32 +0200
Subject: Re: [PATCH] Fix stack corruption when handling PR_GETDEATHSIG
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200506234751.7920-1-steplong@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c7e90e47-f161-10ab-c270-ca9ba56fd9b6@vivier.eu>
Date: Thu, 7 May 2020 10:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506234751.7920-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gUpQm7LHDvZCD2wV2NZxiNPFwwBPiCtFC+9E1bNehwInvbDNwts
 T4ZulDXz29LRRzFgBuby+dlydgi680URxIHQXGzFGlrp+/ctGWucgIM5OWGXU0CrqRads3K
 7KEQ0hOGyOCfC4j+AgpcTm8g++dbOdnydaSSKg5bNgT6Fzvy9woIih9AzFOKdHCrQIFMEBx
 pDhWs8nvycv8+XIsOxZSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KgW20NFpjxw=:JTu14bYyQNKKup5hRb2kGR
 grF+PeDs5G4GbAKzGXsBPoIzc2Jt2s6MuP/053Vmvic8ms4Wxm+j/T93+fJz2V05x2Z+zG0l3
 +jbZULDk1qjTnuahmfCy03dvKO0v9DgYHN1/53b6MiGeRi8ssmJUfgFAXA3v6WJhURB3QFgLf
 yeO2PZ+bOEBtRFO3AQV+snhD55oSAxs+Key4LnVaVqmp0fqX/u1eMaShoJungI9GivlJBgni8
 hekzOYeOjWVPUDL7XQQhr0A2QF7+Ycq1b6oTPUAjuVIW13io431nSvy/a71Hnq+Sy7TaNcl+u
 O/tpMl+t3y4t3ap3zsvltjBI5kDqxVoq5IGFgYxtyd7wuLJhxGhZbRCXGGkCb2utJaEyfaWqU
 tZWcR4a3EMZrn9YkfV3qVc160qN5MdOJckwdhf1Ir3LoWI1o9Ewe9cJnWzDiXVlfPGocfqAAk
 9WpBEtqkj0fMIch9v5arW0H0GU+TF3r0bWpzp79Jpnl8QHbS6wyhdbjMQZH5BIFUDS9ujo6oP
 aLqXE6HefSF4rHaDJLNCdVqMXtPbT98aMG//cl74NWmxrwNbE1WFIV47arnq5ZHTv2NrJlbJc
 5qAbBaV79CmzHhpgglzeXknV/uM0rkkz7K/2FKbejXFWnAkFw3i/euYpnPmy2aa1oKMrlgRY1
 1kcrukChGOIGhGAzFTHLfbaOSag8FmKhoN8k5MlVSlAR1D4O+TDVvWlBm9ByPHbir+XIScq7S
 v/QjdjCJFsnwAEkWdg0N2fpw+Gx17bZCriekz3Ws4ZguSIWA/82lIkUBwiN1IJBRL6lCClD5w
 Qu1JbO1eUWMGxBrTnVYxA741nmzOg+aVd7c20WXxocAYPpx/DkQV1TXuxYfq8BTg0+wKALX
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 04:23:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: riku.voipio@iki.fi, efriedma@quicinc.com, apazos@quicinc.com,
 pzheng@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/05/2020 à 01:47, Stephen Long a écrit :
> From: Ana Pazos <apazos@quicinc.com>
> 
> Signed-off-by: Ana Pazos <apazos@quicinc.com>
> ---
> Submitting this patch on behalf of Ana Pazos. The bug was triggered by
> the following c file on aarch64-linux-user.
> 
>> #include <signal.h>
>> #include <sys/prctl.h>
>>
>> int main() {
>>   int PDeachSig = 0;
>>   if (prctl(PR_GET_PDEATHSIG, &PDeachSig) == 0 && PDeachSig == SIGKILL)
>>     prctl(PR_SET_PDEATHSIG, 0);
>>   return (PDeachSig == SIGKILL);
>> }


Put the example in the description of the patch, it will help to
understand the fix by being kept in the log.

>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 05f03919ff..4eac567f97 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -10253,10 +10253,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          switch (arg1) {
>          case PR_GET_PDEATHSIG:
>          {
> -            int deathsig;
> +            uint32_t deathsig;
>              ret = get_errno(prctl(arg1, &deathsig, arg3, arg4, arg5));
>              if (!is_error(ret) && arg2
> -                && put_user_ual(deathsig, arg2)) {
> +                && put_user_u32(deathsig, arg2)) {
>                  return -TARGET_EFAULT;
>              }
>              return ret;
> 

I think you could keep the "int" and only replace put_user_ual() by
put_user_s32() (to stay in line with the man page that mentions "(int
*)". "int" is always a signed 32bit..

And add your "Signed-off-by".

Thanks,
Laurent

