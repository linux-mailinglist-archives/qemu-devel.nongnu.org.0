Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6F365A6C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:45:44 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqhD-0000T1-Um
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYqbv-0005NL-9d; Tue, 20 Apr 2021 09:40:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:42486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYqbt-0000p3-JV; Tue, 20 Apr 2021 09:40:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8E04B2E5;
 Tue, 20 Apr 2021 13:40:11 +0000 (UTC)
Subject: Re: [RFC v2 05/13] target/s390x: start moving TCG-only code to tcg/
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-6-cfontana@suse.de>
 <c1f21ce1-84a1-abb9-0564-28f90f4a756a@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ac88d505-d802-3533-fcc0-05da9e6c258b@suse.de>
Date: Tue, 20 Apr 2021 15:40:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c1f21ce1-84a1-abb9-0564-28f90f4a756a@redhat.com>
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 3:16 PM, David Hildenbrand wrote:
> On 20.04.21 12:36, Claudio Fontana wrote:
>> move everything related to translate, as well as HELPER code in tcg/
>>
>> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
>>
> 
> How hard would it be to split that up as well?
> 
>> The internal.h file is renamed to s390x-internal.h, because of the
>> risk of collision with other files with the same name.
> 
> Can we move that change into a separate patch, so all we're left with 
> are effective renames?
> 
> 

I think it works as long as we do the s390x-internal.h rename first,
and then the rest, otherwise the intermediate commit could break.

Will work on it, thanks,

Claudio



