Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C402631FDD3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:26:46 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9YD-0004RU-RT
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD9WV-0003j7-2W
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:24:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:58762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD9WT-0001EP-Fa
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:24:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58833B115;
 Fri, 19 Feb 2021 17:24:54 +0000 (UTC)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
 <a9f6fbf7-fb29-eca6-44f0-91381e8b3084@redhat.com>
 <ad889877-fc1c-9346-3cc5-4d177295f076@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1b63451f-3188-2edb-63ea-03fe0abb3bbf@suse.de>
Date: Fri, 19 Feb 2021 18:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad889877-fc1c-9346-3cc5-4d177295f076@redhat.com>
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 5:04 PM, Paolo Bonzini wrote:
> On 19/02/21 14:30, Thomas Huth wrote:
>>> But how could tests see this?
>>
>> The test are generic, not target-specific code, so they can not see 
>> things like NEED_CPU_H, of course.
>>
>> But CONFIG_TCG seems to be defined in config-host.h, so you should be 
>> able to use that define, shouldn't you?
> 
> Yes, CONFIG_TCG is defined in config_hsot just for that reason:
> 
> tcg_arch = config_host['ARCH']
> if not get_option('tcg').disabled()
>    ...
>    accelerators += 'CONFIG_TCG'
>    config_host += { 'CONFIG_TCG': 'y' }
> endif
> 
> It's ugly, but I kept it that way when moving accelerator configuration 
> to Meson.
> 
> Paolo
> 

understood, thanks a lot for this important piece of the puzzle!

Ciao,

Claudio

