Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC029102D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 08:33:15 +0200 (CEST)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTfmE-0004yh-E0
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 02:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@1wt.eu>) id 1kTeuR-0008RM-GL
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 01:37:39 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:43835 helo=1wt.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <w@1wt.eu>)
 id 1kTeuP-0004tC-Dm
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 01:37:38 -0400
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 09H5bCCa014109;
 Sat, 17 Oct 2020 07:37:12 +0200
Date: Sat, 17 Oct 2020 07:37:12 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
Message-ID: <20201017053712.GA14105@1wt.eu>
References: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
 <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
 <20201017033606.GA14014@1wt.eu>
 <CAG48ez0x2S9XuCrANAQbXNi8Jjwm822-fnQSmr-Zr07JgrEs1g@mail.gmail.com>
 <6CC3DB03-27BA-4F5E-8ADA-BE605D83A85C@amazon.com>
 <CAG48ez1ZtvjOs2CEq8-EMosPCd_o7WQ3Mz_+1mDe7OrH2arxFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez1ZtvjOs2CEq8-EMosPCd_o7WQ3Mz_+1mDe7OrH2arxFA@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Received-SPF: pass client-ip=62.212.114.60; envelope-from=w@1wt.eu; helo=1wt.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 01:37:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 17 Oct 2020 02:27:20 -0400
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
Cc: Jason Donenfeld <Jason@zx2c4.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 "Weiss, Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Pavel Machek <pavel@ucw.cz>, Colm MacCarthaigh <colmmacc@amazon.com>,
 Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Biggers <ebiggers@kernel.org>, "Singh, Balbir" <sblbir@amazon.com>,
 bonzini@gnu.org, "Graf \(AWS\), Alexander" <graf@amazon.de>, oridgar@gmail.com,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 Andy Lutomirski <luto@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 17, 2020 at 07:01:31AM +0200, Jann Horn wrote:
> Microsoft's documentation
> (http://go.microsoft.com/fwlink/?LinkId=260709) says that the VM
> Generation ID that we get after a fork "is a 128-bit,
> cryptographically random integer value". If multiple people use the
> same image, it guarantees that each use of the image gets its own,
> fresh ID:

No. It cannot be more unique than the source that feeds that cryptographic
transformation. All it guarantees is that the entropy source is protected
from being guessed based on the output. Applying cryptography on a simple
counter provides apparently random numbers that will be unique for a long
period for the same source, but as soon as you duplicate that code between
users and they start from the same counter they'll get the same IDs.

This is why I think that using a counter is better if you really need something
unique. Randoms only reduce predictability which helps avoiding collisions.
And I'm saying this as someone who had on his external gateway the same SSH
host key as 89 other hosts on the net, each of them using randoms to provide
a universally unique one...

Willy

