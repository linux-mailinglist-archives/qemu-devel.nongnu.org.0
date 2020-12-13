Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A096D2D8F10
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:24:00 +0100 (CET)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koV6F-00046D-Pl
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koV5E-0003ZY-MT; Sun, 13 Dec 2020 12:22:56 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:53547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koV5D-0000tp-4o; Sun, 13 Dec 2020 12:22:56 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Xvv-1k6Kbp41fH-010fwb; Sun, 13 Dec 2020 18:22:51 +0100
Subject: Re: [PATCH v2 4/4] configure: Test if $make actually exists
To: Thomas Huth <thuth@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-5-r.bolshakov@yadro.com>
 <6fdd2caf-7362-29db-9484-c1115297f5fa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c843dafe-f8bc-8343-ed64-9bf13fc04cd4@vivier.eu>
Date: Sun, 13 Dec 2020 18:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6fdd2caf-7362-29db-9484-c1115297f5fa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/fUbEHKIHL/po7DmFvDTRx9qURwrkurSSl5s1+3Ssxf03GFRiFV
 qCRuPFp6HOEaOnOBYJ/cR5ruMjjAAf/ugswNrS/jnWPSu48Jlqw+T9Xzjio6S/TDs0JEqa1
 +iVBrtiK7+er6YvkgzZbhdb29VXXaXv+7MgZYB8RsODKdVNL4zTRJjF3VSZd6LXhDZsMMSa
 ZRDjj/w2H4bTDGX+S8a8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0GFHlbVkCk4=:gblOC+Md89hVT5J6Huap9b
 mjjujF0np9KHmVoZzx3elVUhmHDnsrge4sMp87yqilLLJQtyVGbEIUeTqBIVL/QCiqhxlVRla
 c1/j1bVO759ONdjnl8zgqFiNB0d+b8HL7SXfxcSLR+9CBemzzD4aGhV+naIYKDf3R8Qdo9xHC
 hldXcOrmpBttzQUFqM4qCtpNpUn466YogA4RBIB/Ew9/b8Fj5BYMnZ9zCBj70pkddUxmZlFxG
 qduqxHxY8OnCXAs8PVSD5s2FGjrXnwg/fkzTuvRI7sYTAWpNFePPwW/AypdjzLiP2SWrAWQQL
 K3dFNNVn9PPuYD/vrnsRfj3Dd31ilk3qGNwJgDbzlFAo09B2CWqchB3zztfd2q1PoanMKfdSg
 zBjhH0EhUBQxEtgGTTev5sm8InQ88U8kncN7fpsBLU/ZnPIGTyBwqrLpgfJgXAvTnTW0w0shY
 DQkekdZWFg==
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/10/2020 à 11:49, Thomas Huth a écrit :
> On 25/08/2020 22.27, Roman Bolshakov wrote:
>> configure doesn't detect if $make is installed on the build host.
>> This is also helpful for hosts where an alias for make is used, i.e.
>> configure would fail if gmake is not present on macOS.
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> ---
>>  configure | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 664084992b..9230832da2 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2029,6 +2029,10 @@ if test -z "$python"
>>  then
>>      error_exit "Python not found. Use --python=/path/to/python"
>>  fi
>> +if ! has "$make"
>> +then
>> +    error_exit "GNU make ($make) not found"
>> +fi
>>  
>>  # Note that if the Python conditional here evaluates True we will exit
>>  # with status 1 which is a shell 'false' value.
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


