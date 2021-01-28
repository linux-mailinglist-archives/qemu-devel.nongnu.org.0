Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAC307356
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:02:36 +0100 (CET)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l548J-0007vi-Io
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l546R-0007OO-2k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:00:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:42268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l546P-0004X2-9B
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:00:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 127EEACF5;
 Thu, 28 Jan 2021 10:00:33 +0000 (UTC)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <1abd21ac-271d-3e26-b086-ea238be66bd2@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <396d6597-10ff-8080-bf0d-a5dd0bbd726d@suse.de>
Date: Thu, 28 Jan 2021 11:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1abd21ac-271d-3e26-b086-ea238be66bd2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 10:50 AM, Paolo Bonzini wrote:
> On 28/01/21 10:45, Claudio Fontana wrote:
>> Hi,
>>
>> is it just me, or is the CI sometimes failing with timeout?
>>
>> One nice feature that cirrus and travis have is the ability to relaunch one specific test,
>> do you know if there is some way to do it in gitlab too?
>>
>> I could not find it..
>>
>> Fedora:
>> https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
>>
>> CentOS:
>> https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
>>
>>
> 
> There's a retry button in the top right corner.
> 
> Paolo
> 

Doh! I was not logged in properly, so I didn't see it.

Thanks!

Ciao,

Claudio


