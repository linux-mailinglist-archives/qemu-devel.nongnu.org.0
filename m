Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F033237A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:59:18 +0100 (CET)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa57-0001Kn-9o
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJZt1-0005QK-ST
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:54112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJZt0-0006qu-4P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CECFAC8C;
 Tue,  9 Mar 2021 10:46:44 +0000 (UTC)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
 <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
 <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
 <7ff2c1ed-e6ad-4a6f-3552-be5ba90960d7@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8f00cc46-acc1-e948-14ff-9e731be40cae@suse.de>
Date: Tue, 9 Mar 2021 11:46:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7ff2c1ed-e6ad-4a6f-3552-be5ba90960d7@redhat.com>
Content-Type: text/plain; charset=windows-1252
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 11:26 AM, Paolo Bonzini wrote:
> On 09/03/21 09:41, Claudio Fontana wrote:
>> In any case, I agree that just recursing all directories in target/
>> looking for trace.h / traceevents files could be better.
> 
> Using the directory structure to find source files is a bad idea because 
> you don't notice that you haven't "git add"ed a file until it's too late 
> (typically the maintainer notices it for you...).
> 
> We do it for default-configs/targets, but that's an exception and I'd 
> rather not extend it more.
> 
> In fact, Philippe, perhaps you can add the extra tracedirs for hw/ and 
> target/ to the default-config/targets/*.mak file?
> 
> Thanks,
> 
> Paolo
> 

There was also the discussion of improving check-patch to detect missing updates to trace files,
but my attempt to make a reliable patch at the time failed..

Ciao,

Claudio

