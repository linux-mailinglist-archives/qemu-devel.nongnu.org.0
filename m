Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD81EE65C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 16:12:34 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgqbg-0001b9-Jt
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 10:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jgqam-00012D-1r
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:11:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20643
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jgqak-0005EM-3I
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591279892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7b30PipvqV+rAgp1aIU72tGJoNESNLFlFjbbXxWJTs=;
 b=jQ5XnLdnuDUEOtXxdfhhA3r0MoWCF2eB8B5mAIEnYwNpnhxQh1f4Db6LGcAzYSPR14P/pb
 r66cy2Q1jkT9JH77c6MSouPNrNDM0ziAN/Mto565uKtrQEQcZ3wT2AtG7j/nkE1jlFRfIX
 DByGAfRbaYQPYPrJw7AZsSXh60cD+iU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-S35GDk0uPbGi17JiGc2mow-1; Thu, 04 Jun 2020 10:11:28 -0400
X-MC-Unique: S35GDk0uPbGi17JiGc2mow-1
Received: by mail-wr1-f72.google.com with SMTP id d6so2485726wrn.1
 for <qemu-devel@nongnu.org>; Thu, 04 Jun 2020 07:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E7b30PipvqV+rAgp1aIU72tGJoNESNLFlFjbbXxWJTs=;
 b=YNnm2iweGIidH6h0tTfZuHK4KC1CMbhwBn2B4GQI90oF0wWDlwOPNN1uHG5uDOindG
 aT4YGYVqsRqte34GKM9N0ZWfGWdhxa/u49vph9vqntJ98ZQ2WkLcOeWuOTTfT6KEE4ez
 lHLKbBaL0EQZ3FDCUU1ZyE6p7yqKng6hwhWt0pXqyi5Q3A2XHW0fYbn8NbLJ2oUxMjcN
 PvKM02B4MXZreUyZ4ZAk+dHA/1y/45LNIirPdrP+/l+rReI9wtYm6yuhzkP+FuQcP0Zw
 CIityS6hAxL8qKiUMxV5JYMRLyVespDs65OImW465+opTHEJflPhBXGKwsCsR7WjCpc5
 FbiQ==
X-Gm-Message-State: AOAM532vYZ26B4m84w1ndOj/NriRo0bKUAYcekumnnzi5eF2v7G9ukPS
 b7Safyl/nCFTvGwOSEXNjfsi7yv0s9PGIYj5KBmhL0BXCaLOvvgd7dPmF3Ys2J9zEwR80Ss3tpC
 i7ScakuQxWVWlk7E=
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr5000325wrt.220.1591279886910; 
 Thu, 04 Jun 2020 07:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx44YUHtLMOokJYaZsxs+0OmwGkLy6LeA0UiWlQTWimQ6cRQFmXgFMhJ78zqjZ4aoMoIqqejQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr5000285wrt.220.1591279886573; 
 Thu, 04 Jun 2020 07:11:26 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 88sm8941915wre.45.2020.06.04.07.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 07:11:25 -0700 (PDT)
Date: Thu, 4 Jun 2020 10:11:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 2/2] pci: ensure configuration access is within bounds
Message-ID: <20200604100800-mutt-send-email-mst@kernel.org>
References: <20200603202251.1199170-1-ppandit@redhat.com>
 <20200603202251.1199170-3-ppandit@redhat.com>
 <alpine.BSF.2.22.395.2006040006520.56892@zero.eik.bme.hu>
 <e1ccdf71-5069-fa95-3c90-de4f875b2706@redhat.com>
 <20200604054043-mutt-send-email-mst@kernel.org>
 <alpine.BSF.2.22.395.2006041335250.54170@zero.eik.bme.hu>
 <20200604073753-mutt-send-email-mst@kernel.org>
 <alpine.BSF.2.22.395.2006041342470.54170@zero.eik.bme.hu>
 <20200604075613-mutt-send-email-mst@kernel.org>
 <alpine.BSF.2.22.395.2006041400540.54170@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2006041400540.54170@zero.eik.bme.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:12:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Yi Ren <c4tren@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ren Ding <rding@gatech.edu>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 04, 2020 at 02:14:46PM +0200, BALATON Zoltan wrote:
> On Thu, 4 Jun 2020, Michael S. Tsirkin wrote:
> > On Thu, Jun 04, 2020 at 01:49:53PM +0200, BALATON Zoltan wrote:
> > > On Thu, 4 Jun 2020, Michael S. Tsirkin wrote:
> > > > On Thu, Jun 04, 2020 at 01:37:13PM +0200, BALATON Zoltan wrote:
> > > > > On Thu, 4 Jun 2020, Michael S. Tsirkin wrote:
> > > > > > On Thu, Jun 04, 2020 at 08:07:52AM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
> > > > > > > On 6/4/20 12:13 AM, BALATON Zoltan wrote:
> > > > > > > > On Thu, 4 Jun 2020, P J P wrote:
> > > > > > > > > From: Prasad J Pandit <pjp@fedoraproject.org>
> > > > > > > > > 
> > > > > > > > > While reading PCI configuration bytes, a guest may send an
> > > > > > > > > address towards the end of the configuration space. It may lead
> > > > > > > > > to an OOB access issue. Assert that 'address + len' is within
> > > > > > > > > PCI configuration space.
> > > > > > > > > 
> > > > > > > > > Suggested-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
> > > > > > > > > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > > > > > > > > ---
> > > > > > > > > hw/pci/pci.c | 2 ++
> > > > > > > > > 1 file changed, 2 insertions(+)
> > > > > > > > > 
> > > > > > > > > Update v2: assert PCI configuration access is within bounds
> > > > > > > > > Ã‚Â -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00711.html
> > > > > > > > > 
> > > > > > > > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > > > > > > > index 70c66965f5..173bec4fd5 100644
> > > > > > > > > --- a/hw/pci/pci.c
> > > > > > > > > +++ b/hw/pci/pci.c
> > > > > > > > > @@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
> > > > > > > > > {
> > > > > > > > > Ã‚Â Ã‚Â Ã‚Â  uint32_t val = 0;
> > > > > > > > > 
> > > > > > > > > +Ã‚Â Ã‚Â Ã‚Â  assert(address + len <= pci_config_size(d));
> > > > > > > > 
> > > > > > > > Does this allow guest now to crash QEMU? I think it was suggested that
> > > > > > > > assert should only be used for cases that can only arise from a
> > > > > > > > programming error and not from values set by the guest. If this is
> > > > > > > > considered to be an error now to call this function with wrong
> > > > > > > > parameters did you check other callers? I've found a few such as:
> > > > > > > > 
> > > > > > > > hw/scsi/esp-pci.c
> > > > > > > > hw/watchdog/wdt_i6300esb.c
> > > > > > > > hw/ide/cmd646.c
> > > > > > > > hw/vfio/pci.c
> > > > > > > > 
> > > > > > > > and maybe others. Would it be better to not crash just log invalid
> > > > > > > > access and either fix up parameters or return some garbage like 0?
> > > > > > > 
> > > > > > > Yes, maybe I was not clear while reviewing v1, we need to audit the
> > > > > > > callers and fix them first, then we can safely add the assert here.
> > > > > > 
> > > > > > We can add assert here regardless of auditing callers. Doing that
> > > > > > will also make fuzzying easier. But the assert is unrelated to CVE imho.
> > > > > 
> > > > > I wonder why isn't the check added to pci_default_read_config() right away?
> > > > > If we have an assert there the overhead is the same and adding the check
> > > > > there would make it unnecessary to patch all callers so it's just one patch
> > > > > instead of a whole series.
> > > > > 
> > > > > Regards,
> > > > > BALATON Zoltan
> > > > 
> > > > We need to return something, and we can't be sure that callers will
> > > > handle returning random stuff correctly. Callers know what
> > > > to do on errors, we don't.
> > > 
> > > This is an invalid case where behaviour will be undefined anyway so
> > > returning anything such as 0 or -1 is probably OK (what do most hardware
> > > return in this case?).
> > 
> > This is an internal detail of the API. It's not about what hardware
> > returns.  Look at the ati as an example.
> 
> Considering that this function implements reading PCI config space its API
> should aligh with what happens on hardware normally. You could make it
> unrelated but that does not make much sense other than causing trouble for
> callers.

What happens on hardware is that there's no way to send to
device a transaction that is out of range: on pci
offset is 8 bit so <= 0xff, and on express 12 bit so <= 4K.

So this handles something that never happens on real hardware
and it happens because of a bug elsewhere in QEMU.
assert seems appropriate.


> > > If callers need better error handling they can do a
> > > check before calling the function but for other (most) callers which will
> > > just return the same random value you would return from
> > > pci_default_read_config() having an assert instead makes it necessary to
> > > modify all of them one by one and doubles the check overhead by
> > > unnecessarily double checking. So I think having a default check and error
> > > handling in pci_default_read_config() would be better so callers who don't
> > > care would work and those few who might care could check before calling or
> > > actually implement their own callback (which I expect they already do as
> > > this is just the default implementation of this callback).
> > 
> > 
> > Basically if you look at the specific example, you will see that it
> > triggers because of a misaligned access which device code never
> > expected. Which memory core should not allow at all.
> > It will likely trigger other bugs, some of them could be
> > security related. assert is a reasonable way to help us catch them in
> > fuzzying.
> 
> The specific example (ati-vga) does expect and should support unaligned
> access.

Then it should set "unaligned = true". It does not seem to do so.

> Not for all regs but for most registers, there's a table in docs
> which says for PCI POS registers (whatever those are) unalligned access is
> supported. This works now, if it should not work witout .impl.unaligned or
> some other value set somewhere that should be patched instead.

Argue with the docs/devel/memory.rst about this please, that's not
what it says.


> 
> Regards,
> BALATON Zoltan


