Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7A35DC77
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:26:24 +0200 (CEST)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWGFS-0003oU-3G
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaerber@suse.de>) id 1lWGCt-0002pp-7W
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:23:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:60448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaerber@suse.de>) id 1lWGCr-0003YT-D5
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:23:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A93EB137;
 Tue, 13 Apr 2021 10:23:35 +0000 (UTC)
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
 <YG3SyTLha8a9Itlo@merkur.fritz.box>
 <c388d16d-4230-c828-08e0-d3c684f88106@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <007fd217-c660-1f7d-835a-07a309d24d8c@suse.de>
Date: Tue, 13 Apr 2021 12:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c388d16d-4230-c828-08e0-d3c684f88106@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=afaerber@suse.de;
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, qemu-devel@nongnu.org,
 agraf@csgraf.de, stefanha@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 13.04.21 09:42, Paolo Bonzini wrote:
> On 07/04/21 17:42, Kevin Wolf wrote:
>>> +* Publishing other's private information, such as physical or
>>> electronic
>>> +addresses, without explicit permission
>>
>> Yes, it's pretty clear that I'm not publishing new information about
>> people when I'm keeping them in Cc: when replying to a thread, or even
>> when they posted in another thread on the list recently. It becomes much
>> less clear for adding people who aren't usually part of the QEMU
>> community.
> 
> If you took the email from, say, the Libvirt or kernel mailing lists,
> that would not be considered private.  If somebody has two email
> addresses and you deliberately Cc him on an address that he's only using
> for communications within his family, that would be a problem.

I have to admit I had originally stumbled over this bullet point myself,
reading it as private=personal. So maybe it might help avoid ambiguities
for non-native readers to formulate it as "non-public" instead?

Like, if someone posts to a public mailing list with their private as
opposed to business address in the footer. Then I would consider it
public. I did intentionally use a private email for topics such as PReP.

Or consider the case you get a bug report not copied to the public
mailing lists from someone you don't know. Then I would still expect to
be allowed to attribute a commit via Reported-by/CC to that person, as
it seems in his/her interest to get the bug fixed and be notified,
unless explicitly requested otherwise.

Mistakes can always happen, but I feel it needs to be the responsibility
of the sender, not of the receiver, to ensure that only data is shared
that the project members may use for valid development purposes.

Not sure how to extend that bullet point to make its purpose/scope clearer.

Cheers,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)

