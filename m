Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225D410E59
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:24:48 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS8z9-0002bS-GC
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mS8y6-0001vg-Kn
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:23:42 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:26106
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mS8y4-0001Fn-V6
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:23:42 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HCSz11R8qz8PbN;
 Sun, 19 Sep 2021 22:23:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=25Z8mGRLL
 Ia7281bvRzqH2lh/Sw=; b=DsTG75MLKjFcGravJxp9VqejUL9XwhHKGJhISTlRb
 DdVLGGZcLc0jv+teLFcoWJclwkpnSWzU4s57RBxsL6pVI7uHVus/yTqX7R4fI4u7
 IIjOSB42W+Pyhnm4DgIEu0Pwbbqkhui+LwrdBqfV/bNheCVPOFll8K0kWHTPKAKr
 PM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=c7y
 KYc57NIzqHjgWNE6+1gbVMKnkYxP2FLdbak1mpMRF0EbELYNlZuYdi6ZuRq+GLhS
 Szgng0rCaSKBKr8nn8lNwSMNrPV/JXe86rgTbH8eNYA4zorDMiEcAm/3TUJij1DX
 sm93bVBgJ/BATNnu3LszK2abMN8PuLCmyDPagXME=
Received: from [IPV6:2001:470:b050:6:1cfd:a04c:69f1:5335] (unknown
 [IPv6:2001:470:b050:6:1cfd:a04c:69f1:5335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HCSz06zGDz8PbK;
 Sun, 19 Sep 2021 22:23:24 -0400 (EDT)
Message-ID: <17abd023-4477-4636-a87f-ccbdeffdb4b8@comstyle.com>
Date: Sun, 19 Sep 2021 22:23:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, alex.bennee@linaro.org,
 sgarzare@redhat.com
References: <YURYvaOpya498Xx2@yekko>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <YURYvaOpya498Xx2@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/2021 4:58 AM, David Gibson wrote:
> Hi all,
> 
> At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> whether Rust supported all the host/build platforms that qemu does,
> which is obviously vital if we want to make Rust a non-optional
> component of the build.
> 
> I've added the information to our wiki at:
> 	https://wiki.qemu.org/RustInQemu
> 
> TBH, the coverage is not as good as I expected.  Linux, macOS and
> Windows are pretty much ok, with the exception of Linux on Sparc.
> There are a lot of gaps in *BSD support, however.
> 
> I've included some notes on where the information comes from, and some
> uncertainties in there.
> 
> I've made an effort to get the information correct, but double
> checking would be appreciated.
> 
> I haven't yet looked into the packaging situation for the Rust
> toolchain on various platforms and distros, but I still intend to do
> so.

Regarding this entry on the Wiki page..

"I think OpenBSD lacks mips32 support, but the presence of Loongson 
means I'm having trouble pinning that down with certainty"

That is correct. Our loongson port is mips64el. OpenBSD only supports
64-bit MIPS.

OpenBSD currently only provides packages and host tools for aarch64,
amd64, i386 and sparc64.

So for the Wiki armv7, MIPS (64-bit), PPC (32-bit) should be changed
to N/A. The SPARC (64-bit) entry should be changed to yellow.

I'd like to fill in the gaps for arm, mips64, mips64el, powerpc, 
powerpc64, and riscv64.

