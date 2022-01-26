Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C349C4B4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:46:30 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCd0a-0008GG-Nv
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcsp-0006g3-Ou
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:38:28 -0500
Received: from [2001:41c9:1:41f::167] (port=34130
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcsn-0001zo-RT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:38:23 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nCcsB-0008n5-O6; Wed, 26 Jan 2022 07:37:47 +0000
Message-ID: <39e42888-b296-fd15-25bf-7a16f85c4aef@ilande.co.uk>
Date: Wed, 26 Jan 2022 07:38:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org> <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
 <87ee4xdjjp.fsf@linaro.org> <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 19:33, Philippe Mathieu-Daudé via wrote:

> On 1/24/22 20:16, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 1/24/22 11:55, Alex Bennée wrote:
>>>>
>>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>>
>>>>> This is my last respin on this series which is fully reviewed.
>>>>>
>>>> <snip>
>>>>
>>>> Just to note the "b4" application of this broke the From addresses. If
>>>> you see the lore copy:
>>>>
>>>>    https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat.org/
>>>>
>>>> all your From's are via qemu-devel. Have you changed anything about your
>>>> submission process?
>>>
>>> No. Maybe the list changed something again? Similar problem occurred
>>> 18 months ago IIRC. Not sure what I can do, the domain misses SPF/DKIM:
>>> https://toolbox.googleapps.com/apps/checkmx/check?domain=amsat.org
>>
>> I thought so but others in the archives are fine. I take it you can't ask
>> the owners of amsat.org to expand the SPF setting or use the MX server
>> indicated to send emails?
>>
>> Otherwise it might be worth either getting your own gmail or domain for
>> posting.
> 
> =)
> 
> I'm seeing the same with Mark's email: Mark Cave-Ayland via
> <openbios-bounces@openbios.org> maybe Google is running a global SMTP purge?
> 
> Similar SPF/DKIM errors:
> https://toolbox.googleapps.com/apps/checkmx/check?domain=ilande.co.uk

Is there something that needs to be changed in my email setup? My email isn't managed 
by GMail so I'm lacking a bit of context here.


ATB,

Mark.

