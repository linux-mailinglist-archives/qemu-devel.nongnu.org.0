Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E4673597
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISFZ-0002AB-Cc; Thu, 19 Jan 2023 05:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1pISEl-00026K-Qb
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:33:46 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1pISEh-0002fp-NP
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:33:38 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A75C9DA0838;
 Thu, 19 Jan 2023 11:33:31 +0100 (CET)
Message-ID: <77e378b5-09a1-c80f-e2c0-c010f26b2a44@weilnetz.de>
Date: Thu, 19 Jan 2023 11:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
 <Y8kXhd2EcRU2QxVC@redhat.com>
Subject: Re: Announcement of aborting HAXM maintenance
In-Reply-To: <Y8kXhd2EcRU2QxVC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <stefan.weil@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 19.01.23 um 11:12 schrieb Daniel P. Berrangé:
> On Thu, Jan 19, 2023 at 03:56:04AM +0000, Wang, Wenchao wrote:
>> Hi, Philippe,
>>
>> Intel decided to abort the development of HAXM and the maintenance
>> of its QEMU part. Should we submit a patch to mark the Guest CPU
>> Cores (HAXM) status as Orphan and remove the maintainers from the
>> corresponding list? Meanwhile, should the code enabling HAX in QEMU
>> once committed by the community be retained?
> 
> If you no longer intend to work on QEMU bits related to HAXM, then
> yes, you should send a patch for the MAINTAINERS file to remove you
> name and mark it as "Orphan" status.
> 
> We would not normally delete code from QEMU, merely because it has
> been orphaned. If it is still known to work then we would retain
> it indefinitely, unless some compelling reason arises to drop it.
> This gives time for any potential users to adjust their plans,
> and/or opportunity for other interested people to take over the
> maintenance role.

HAXM will not only be no longer maintained in QEMU, but also the 
necessary framework for macOS and Windows will be retired. See 
https://github.com/intel/haxm#status on their GitHub page. As stated 
there, macOS provides HVF which can be used instead of HAXM, and Windows 
users can use WHPX. Both HVF and WHPX are supported by QEMU. As far as I 
know HAXM could only provide a limited RAM size (2 GiB?). Maybe it still 
has more deficits. And unmaintained HAXM drivers for macOS and Windows 
might be a security risk, too. It is also not clear whether the last 
downloads of those drivers will be available in the future.

Therefore I'd prefer to remove the whole HAXM code in QEMU soon, even in 
a minor update for this special case.

Stefan


