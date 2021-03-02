Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE66C32AA3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:22:59 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAbi-0001TE-Np
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9sQ-0008E7-Rm
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:36:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:57532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH9sP-0004y1-9m
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:36:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE8D0AAC5;
 Tue,  2 Mar 2021 18:36:07 +0000 (UTC)
Subject: Re: [RFC v2 04/24] target/arm: move psci.c into tcg/sysemu/
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-5-cfontana@suse.de>
 <CAFEAcA8nGhxj6DF-ayCeJxzaAh1iyw6rJuxFH9DwAteAUsfufQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <09c24e13-2b86-3f0a-805d-2fec8853a30c@suse.de>
Date: Tue, 2 Mar 2021 19:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8nGhxj6DF-ayCeJxzaAh1iyw6rJuxFH9DwAteAUsfufQ@mail.gmail.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 12:54 PM, Peter Maydell wrote:
> On Mon, 1 Mar 2021 at 16:49, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> 
> I note that the not-yet-landed aarch64 support for the hvf accelerator
> is hoping to share the tcg psci implementation...
> 
> -- PMM
> 

Hi Peter,

interesting that HVF does not provide a PSCI interface.

I can change this to keep psci in the main dir, and for now only include it for TCG.

Then when ARM HVF is ready the condition can be changed to include HVF too.

Thanks for the headsup

Ciao,

Claudio




