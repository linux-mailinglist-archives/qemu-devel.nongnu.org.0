Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275293341CC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:44:46 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK10v-0005A3-7X
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK109-0004g7-S9
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:43:57 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK107-0003B9-W5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:43:57 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 95565242;
 Wed, 10 Mar 2021 16:43:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5MWVnpiA116; Wed, 10 Mar 2021 16:43:52 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 34311AC;
 Wed, 10 Mar 2021 16:43:51 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lK101-00EIDU-HH; Wed, 10 Mar 2021 16:43:49 +0100
Date: Wed, 10 Mar 2021 16:43:49 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210310154349.cfi5wc4t3t5h5ltp@begin>
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org>
 <20210310150209.nie5fifqi5od3r5u@begin>
 <5139e2b3-447e-2373-71b7-6fb5af020867@redhat.com>
 <YEjmZOoQJv6XRQc3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEjmZOoQJv6XRQc3@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 95565242
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrangé, le mer. 10 mars 2021 15:31:48 +0000, a ecrit:
> On Wed, Mar 10, 2021 at 04:26:46PM +0100, Paolo Bonzini wrote:
> > On 10/03/21 16:02, Samuel Thibault wrote:
> > > > > When trying to remove the -usbdevice option, there were complaints that
> > > > > "-usbdevice braille" is still a very useful shortcut for some people.
> > > > Pointer?  I missed it.
> > > 
> > > For instance
> > > https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00693.html
> > 
> > In one sentence: "Braille is worth a special case because a subset of our
> > user base (blind people) will use it 100% of the time, plus it is not
> > supported by libvirt and hence virt-manager".
> 
> If simplicity of enabling braille support is critical, we could get
> something even simpler than "-usbdevice braille", and just provide
> a bare  "-braille" with no args required as a "do the right thing"
> option ?

That was discussed a bit earlier in the thread:

https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00681.html
https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00686.html
https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00687.html

Just like keyboard/mouse, one would still want to specify whether the
braille device is to be connected through usb or serial, so at least
"-braille usb" and "-braille serial".

Note

https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00689.html

Paolo wrote:
> Adding magic to "-device usb-braille" that creates both a
> front-end and a back-end is completely the opposite of sane...

The thing is: creating one without the other does not make sense.

Samuel

