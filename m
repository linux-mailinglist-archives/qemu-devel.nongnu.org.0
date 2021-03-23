Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C39345E6E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:47:08 +0100 (CET)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgQy-0003YX-Jf
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOgOg-0002cq-93; Tue, 23 Mar 2021 08:44:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:60422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOgOc-0006yP-H8; Tue, 23 Mar 2021 08:44:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D662AD6D;
 Tue, 23 Mar 2021 12:44:28 +0000 (UTC)
Subject: Re: "make check" broken with everything but tools disabled
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
 <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
 <deaed0b0-6f4d-9d1c-239b-98e4f7bdd496@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <3ecd36c9-7fcd-3f9e-7c11-d5366c9f70a5@suse.de>
Date: Tue, 23 Mar 2021 13:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <deaed0b0-6f4d-9d1c-239b-98e4f7bdd496@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:03 AM, Paolo Bonzini wrote:
> On 18/03/21 10:16, Claudio Fontana wrote:
>> my experience with the new build system (meson-based), is that I have to do:
>>
>> make
>>
>> first, and then
>>
>> make check
>>
>> later, or bugs start happening
> 
> This shouldn't be needed.
> 
> Paolo
> 

I am pretty sure it didn't work in some cases, maybe with check-tcg only.. will keep an eye on this.

Ciao,

Claudio

