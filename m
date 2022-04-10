Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3125D4FB0E5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 01:51:54 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndhLU-0000RI-Vo
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 19:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ndhKJ-0008A6-24
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 19:50:39 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:41769
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ndhKH-0004Nt-KC
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 19:50:38 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Kc7yy3nr2z8PbN;
 Sun, 10 Apr 2022 19:50:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=oy+ljPKGU
 8B2P6Z8f6hxa+cY89Q=; b=anWA6o1v7lCJtt7oI5/1pjtiJzwYVR6QkWOqqxcRp
 gO7VrcPdy9fcoEsxFk/G1frXu6TWaGTazhlFVvwW4LqcHL6dRy9vvTTAy6bfPxAH
 7c6rbut6cX/UEZH0VzegJV0tgMfz8swh0W3LG5dT3BJmEieXkULA3wKGDKd+8pZ0
 O0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Je/
 CeYY/REe42+OhTKl5dbE1TXLhnCGIku7VeJIWEqKMWDWDw36h89ZTe1v7r6IR/CW
 wGZlGOE3WpA8E49lfQh2/bBtT2oKQ+QqcrPYj5XvP511qdKQ5ZXvNeQBxyNorRpa
 FX30vKTdhHApq3ghvJBpuK/E9Ktz7va9zynC6DZM=
Received: from [IPV6:2001:470:b050:6:100d:74ae:ae8c:ee48] (unknown
 [IPv6:2001:470:b050:6:100d:74ae:ae8c:ee48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Kc7yy2kM9z8PbK;
 Sun, 10 Apr 2022 19:50:34 -0400 (EDT)
Message-ID: <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
Date: Sun, 10 Apr 2022 19:50:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
 <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/10/2022 5:06 AM, Peter Maydell wrote:
> On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
>> On 4/8/2022 12:47 PM, Thomas Huth wrote:
>>> QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
>>> distro that did not have a pre-packaged libslirp has been dismissed.
>>> All other major distros seem to have a libslirp package in their
>>> distribution already - according to repology.org:
>>>
>>>             Fedora 34: 4.4.0
>>>     CentOS 8 (RHEL-8): 4.4.0
>>>         Debian Buster: 4.3.1 (in buster-backports)
>>>    OpenSUSE Leap 15.3: 4.3.1
>>>      Ubuntu LTS 20.04: 4.1.0
>>>         FreeBSD Ports: 4.6.1
>>>         NetBSD pkgsrc: 4.3.1
>>>              Homebrew: 4.6.1
>>>           MSYS2 mingw: 4.6.1
>>>
>>> The only one that still seems to be missing a libslirp package is
>>> OpenBSD - but I assume that they can add it to their ports system
>>> quickly if required.
>> I wish I had seen this earlier as our 7.1 release was just tagged.
>>
>> I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I
>> will
>> see about submitting it in a number of days when the tree opens.
> How awkward would it be for an end-user who's on OpenBSD 7.1 to
> build a QEMU that doesn't have libslirp? (That is, is it easy
> and common for an end user to pull in a port of libslirp that only
> came along in a later OpenBSD, or would they instead have to
> manually compile libslirp themselves from the upstream sources?)
>
> (I'm asking here because if it's painful, then we should perhaps
> defer dropping our submodule copy of libslirp a little longer.)
>
> thanks
> -- PMM

They would have to pull down a -current ports tree and build it. No package
would exist for the release. It is possible, but not "supported". I have 
not looked
at the CI bits to see how difficult that would be.

Our release cycles are 6 months and the next release will be in the middle
of October.

