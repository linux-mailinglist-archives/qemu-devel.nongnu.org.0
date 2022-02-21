Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B54BDB4B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:32:16 +0100 (CET)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCXn-00021g-5p
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:32:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCPG-0007Xn-SC; Mon, 21 Feb 2022 12:23:26 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCPC-0007d2-Ir; Mon, 21 Feb 2022 12:23:25 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7JrG-1nL70q3s1U-007jTw; Mon, 21 Feb 2022 18:23:17 +0100
Message-ID: <2cff027b-408d-5d9f-acb8-320242f77bd7@vivier.eu>
Date: Mon, 21 Feb 2022 18:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/nvram: use at24 macro
Content-Language: fr
To: Paolo Bonzini <pbonzini@redhat.com>, Patrick Venture
 <venture@google.com>, philmd@redhat.com
References: <20220119214329.2557049-1-venture@google.com>
 <b043c11d-a007-6579-180f-4dd8f0bcae5d@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <b043c11d-a007-6579-180f-4dd8f0bcae5d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lBZmj4O8EDifppxdb2Umv8P50JgCpW4K6iS53ZfA6HVUqIphILq
 T6Lxfw7rk4ag+kzyMtESLOXYm2EB2N7j7SDpBPYzAL9vDab0qXwLabjGjA/Jo4N6pZfoEdt
 9R7Oy4NGflTM6ooKamQdrXrfvpMdbUtp00xG0C15pei4gW1gm+4mWV9QK1vBj2mn4KdTECB
 sgdMH0bWcoXNXFRD0uvew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kz+fCI0Vmmg=:BVj13kLa1kgl4wEjGCg3Ud
 kDKyiyfP9UTGHzxmEusAWtdN35kEf4+IaAP86bE1LgAKKdAQTP+mzXVAUXQi5yi2ylWiBQoSp
 a8ML0js4TVlT4U29KRsUKsmcx6BPN9TWeU88m50VP2gpnJkoA11CF/Enu13w119STesHNFeJ0
 TounOR8jx3EmcyFolRxtsZeF9xbGP2MKGC7tSRt+mLsL2e1Ge5vIelKQLBPCnfQcvnCwSXPvE
 1UpgVyl4j7b7DKATMOOMtlGLt2MICqDgcYrjKCjeg9GH0MNM4qM0hQRfv9Yj8cyQF/7BDcL3l
 8ylOHaEmMoLfdIcEPSwltZ2E52Z3XGCEqxk6wbV5k/GlbPmiHqp5qhZNBqLJf+w9zbMn59NV6
 09tcSVuBDWoes71L+olUUs6FaWxubcCt0v9ji8QzrUduUdvOb52cHV7aCPafD/mHkBafUHufy
 E7lRbvP3x5V0hmc5MSIJwldXZUJ7BYMEE6MXVyte3dAfkRbuMQljuziXqtEloBM/Am+gt1pU/
 0TjDSM4aWUpQKRNYovKiTF4PQr51aVaNmo0PNnXvFRLSzk/ooJGXCg9AdHcEem/gcqb2ssMbr
 0P2sPipS2d8D4R7dta+/Ewu8wAG4lbGUNnuzN/kXYZ9FutcmB/sfs4VccjQV0IHRK5GGgZBo6
 IAH5v1mZ+2VWHPzV0yeBidLjIOra9crJq36Rp9TY1/Rwqms64BtsfOC5ZMzCTGRh5Ug0=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/01/2022 à 10:20, Paolo Bonzini a écrit :
> On 1/19/22 22:43, Patrick Venture wrote:
>> Use the macro for going from I2CSlave to EEPROMState.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>   hw/nvram/eeprom_at24c.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
>> index af6f5dbb99..da435500ba 100644
>> --- a/hw/nvram/eeprom_at24c.c
>> +++ b/hw/nvram/eeprom_at24c.c
>> @@ -54,7 +54,7 @@ struct EEPROMState {
>>   static
>>   int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>>   {
>> -    EEPROMState *ee = container_of(s, EEPROMState, parent_obj);
>> +    EEPROMState *ee = AT24C_EE(s);
>>       switch (event) {
>>       case I2C_START_SEND:
> 
> Cc: qemu-trivial@nongnu.org
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


