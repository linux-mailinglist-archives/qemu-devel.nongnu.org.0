Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DF6D7F06
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:17:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3wL-0004rs-KH; Wed, 05 Apr 2023 10:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk3wJ-0004rC-0M; Wed, 05 Apr 2023 10:16:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk3wG-0001Ku-7p; Wed, 05 Apr 2023 10:16:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F2A144000E;
 Wed,  5 Apr 2023 17:16:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 02687DD;
 Wed,  5 Apr 2023 17:16:34 +0300 (MSK)
Message-ID: <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
Date: Wed, 5 Apr 2023 17:16:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: QEMU stable 7.2.1
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230405135818.52ggpbvumybryvr7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.355,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

05.04.2023 16:58, Michael Roth wrote:
> On Wed, Apr 05, 2023 at 02:54:47PM +0300, Michael Tokarev wrote:
>> So let it be, with a delay of about a week.
>>
>> Since no one from the qemu team replied to my final-release steps, I'm
>> making it available on my site instead:
>>
>>    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz
>>    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz.sig - signed with my GPG key
>>    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.diff - whole difference from 7.2.0.
>>
>> The tag (v7.2.1) is in the main qemu repository.
> 
> Hi Michael,
> 
> Thanks for handling this release!
> 
> Somehow I missed your final steps email, but for future releases I would
> recommend going ahead and tagging your release (also signed with your GPG
> key) in your local tree once you've got everything ready, and then sending
> me an email to directly so I can push that to gitlab and then handle
> creating the tarball and publish it with my GPG key. That's basically what
> we do for the normal QEMU releases as well.
> 
> Then once you get your accounts set up by gitlab/qemu.org admins you can
> handle the tag-pushing/tarball-uploading on your end. Would be good to
> have someone else involved with that process so we have some redundancy
> just in case.

Thank you for the reply!

I'm not sure I follow you here. I already pushed v7.2.1 tag and stable-7.2
branch to gitlab/qemu. The branch has been there for quite some time.

Should I avoid tagging/pushing for the future or is it okay to do that?

For the tarballs, it's definitely better to follow the established practice,
I published the generated tarball on my site just as a last-resort, so that
it ends up *somewhere*. It should be prepared the same way as other releases
has been made, including the .bz2 version.

If that's okay with you, feel free to re-create the tarball from v7.2.1
tag, and compress the tarball with whatever compressors usually used by
the qemu team.  It's the way to go.

Thanks,

/mjt

