Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD434727C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:24:43 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxsg-0000rp-Al
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1lOxqq-0007nl-Mu
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:22:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1lOxqn-0007PF-MY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:22:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D19BB619FA;
 Wed, 24 Mar 2021 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616570564;
 bh=A0pGJbn75arVdOD9b5IBCTpV/4uLDqxrD6Da79sVFnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4Rq5zuB3Z/Vfseh37K/cZNtdG7CkZTTjV8tzbmwqVjNNCZREy9jMM4hL57gfji30
 9W96veE+jEaie8zu2sgf1c44Mcp8hTlaH/wdq1HNKXnBRhWu8667lhEwcBEVM1ejAL
 C8BNQEfeKQP0mO4Cgy2lM758ALTtzS6UPKd/vd+8=
Date: Wed, 24 Mar 2021 08:22:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Subject: Re: [PATCH v8] drivers/misc: sysgenid: add system generation id driver
Message-ID: <YFrowKgcnozZyxKC@kroah.com>
References: <1615213083-29869-1-git-send-email-acatan@amazon.com>
 <YEY2b1QU5RxozL0r@kroah.com>
 <a61c976f-b362-bb60-50a5-04073360e702@amazon.com>
 <YFnlZQZOasOwxUDn@kroah.com>
 <E6E517FF-A37C-427C-B16F-066A965B8F42@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E6E517FF-A37C-427C-B16F-066A965B8F42@amazon.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=gregkh@linuxfoundation.org; helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "areber@redhat.com" <areber@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "avagin@gmail.com" <avagin@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "mst@redhat.com" <mst@redhat.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Graf \(AWS\), Alexander" <graf@amazon.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 04:10:27PM +0000, Catangiu, Adrian Costin wrote:
> Hi Greg,
> 
> After your previous reply on this thread we started considering to provide this interface and framework/functionality through a userspace service instead of a kernel interface.
> The latest iteration on this evolving patch-set doesn’t have strong reasons for living in the kernel anymore - the only objectively strong advantage would be easier driving of ecosystem integration; but I am not sure that's a good enough reason to create a new kernel interface.
> 
> I am now looking into adding this through Systemd. Either as a pluggable service or maybe even a systemd builtin offering.
> 
> What are your thoughts on it?

Now dropped from my char-misc-testing branch.  If you all decide you
want this as a kernel driver, please resubmit it.

Also next time, you might give me a heads-up that you don't want a patch
merged...

thanks,

greg k-h

