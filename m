Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B74ED785
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:05:50 +0200 (CEST)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrgb-0001kB-5j
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:05:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>)
 id 1nZraO-0005DZ-Om; Thu, 31 Mar 2022 05:59:26 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>)
 id 1nZraL-0002Mu-OE; Thu, 31 Mar 2022 05:59:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D163A210FC;
 Thu, 31 Mar 2022 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648720757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3cvqVl6xpEAHjFWt0yGN0x/0tQtV2vgPDtbLJJjqg4=;
 b=ebUx6XSRJxgAcn2AuB6BhfbEwtkpStwkfoxw97akMBOoeWVpExQ2RqcKo9DSxTbqNZnVPi
 U3Ok7rgzSVN0gYUeYgp/M3K7geWUu2/96oibM9+XOV8oCpPdCb4qSNzzvnTf6zZiMQFumX
 CHsolaIypeheJGJPuTfSQupDApVKZWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648720757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3cvqVl6xpEAHjFWt0yGN0x/0tQtV2vgPDtbLJJjqg4=;
 b=xd4hvMFT8uHveiiMRpHIIuhHD31XwlZEhFS3V4vZJKn+/+Y6NL3cWNfpCnj1UEdx8UZOxP
 TuxFG1InMQqNBTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88D85132DC;
 Thu, 31 Mar 2022 09:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b77cH3V7RWIvSgAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 31 Mar 2022 09:59:17 +0000
Message-ID: <2abd809f-9cfa-1e01-00bb-46b91810e4bb@suse.de>
Date: Thu, 31 Mar 2022 11:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
 <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
 <54616427-1784-d12b-1a54-131796b56c07@linux.ibm.com>
 <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
From: Li Zhang <lizhang@suse.de>
In-Reply-To: <d6d24f79-24bd-46ac-6332-a066410e0217@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 09:44, Christian Borntraeger wrote:
> 
> 
> Am 21.02.22 um 11:27 schrieb Christian Borntraeger:
>>
>> Am 10.02.22 um 18:44 schrieb Vladimir Sementsov-Ogievskiy:
>>> 10.02.2022 20:13, Thomas Huth wrote:
>>>> On 10/02/2022 15.51, Christian Borntraeger wrote:
>>>>>
>>>>>
>>>>> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>>>>>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I do see spurious failures of 161 in our CI, but only when I use
>>>>>>> make check with parallelism (-j).
>>>>>>> I have not yet figured out which other testcase could interfere
>>>>>>>
>>>>>>> @@ -34,6 +34,8 @@
>>>>>>>   *** Commit and then change an option on the backing file
>>>>>>>
>>>>>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>>>>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
> 
> FWIW, qemu_lock_fd_test returns -11 (EAGAIN)
> and raw_check_lock_bytes spits this error.
>

I also run into this issue on S390 when running test cases.
I think it will report this "write" lock error if different processes 
are using the same image.

> 
> Is this just some overload situation that we do not recover because we 
> do not handle EAGAIN any special.
> 



