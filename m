Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FB4A4A68
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:20:18 +0100 (CET)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYTZ-0003Vn-2H
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:20:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEYMT-0000Mq-Gv
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:12:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEYMO-0003T5-O2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=msbqa+FgBRxmZ6++QL5kwOtD4j0ZyKfam986MJlB4b4=; b=c7C0M5rhSdQhHwZWm2H1loVOeP
 SZ2Wvk2cgNdGMzJd3ihkc9GjtlRrWNMixbC1WDm8LFWA1enPGSKjNm+leyW1GUSKCa983HDhYwhk/
 L9ye3buz691KVJBalsrHmKqv5YvJE+WMTjYIpWcdoYPPOI+Qrh2qcLvgOMeerE0Vsd2dw5H/8DaG4
 FOXa0hRzA/Rm9EMNR46MvUyEQHf7RrsVQWBoqy4NbtZIEvlfWlTRwLgFZaI2KlfKIt4RSG1S2l1Jx
 mnQkNZ5Ip4IDIQ8tRjkImFUtOW4mllMPD/fniWDUX+ERU3aWY9ZD7nwldKpEuV6tCJa0H0GzpFfEF
 gpxmpCSpkkXJaOa5Izbt0OoUk9oZ7c6NihjrDdDcvnRHC2tJHsk56HQrSSyxUVyYpV5ZyvIwlMYrs
 4w4GmzeIe1D7Ot7UIDKUaDCFk+U1BI9YOzxVtQznMD+wyCvrff94VPAdJZWX1iudodAiCMxY8EoE+
 0XykMKk4JVD/FpDQpJcx2JrV7ANffDJV1nDX3GW/PUZW9PZsfQu/Gn1zGYDrKAOU3o1hYFNnI3Jzs
 BUW/GTgHJjIJdobhK01XbVMGSMRb9vjyf+jl/ZqOpcZsDxWrumnPxFWg3Pjh3W3/u3HsZPteFXWy5
 luHQYga8gSyJWBbbsm+aAFCEngcBq6i/xJIvJcXDI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Mon, 31 Jan 2022 16:12:45 +0100
Message-ID: <2777753.eeY9lOXx2E@silver>
In-Reply-To: <20220131154408.4b9fab8e@bahia>
References: <20220126171136.672657-1-groug@kaod.org>
 <8838481.laWMekmXc4@silver> <20220131154408.4b9fab8e@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 31. Januar 2022 15:44:46 CET Greg Kurz wrote:
> On Mon, 31 Jan 2022 13:37:23 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 31. Januar 2022 08:35:24 CET Greg Kurz wrote:
> > > > > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > > > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16709b
> > > > > > 100644
> > > > > > --- a/tests/qtest/libqos/virtio-9p.c
> > > > > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > > > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const
> > > > > > char* b)
> > > > > > 
> > > > > >  void virtio_9p_create_local_test_dir(void)
> > > > > >  {
> > > > > >  
> > > > > >      struct stat st;
> > > > > > 
> > > > > > -    char *pwd = g_get_current_dir();
> > > > > > -    char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
> > > > > > +    g_autofree char *pwd = g_get_current_dir();
> > > > > > +    g_autofree char *template = concat_path(pwd,
> > > > > > "qtest-9p-local-XXXXXX");
> > > > > > 
> > > > > >      local_test_path = mkdtemp(template);
> > > > 
> > > > ... mkdtemp() does not allocate a new buffer, it just modifies the
> > > > character array passed, i.e. the address returned by mkdtemp() equals
> > > > the
> > > > address of variable 'template', and when
> > > > virtio_9p_create_local_test_dir() scope is left, the global variable
> > > > 'local_test_path' would then point to freed memory.
> > > 
> > > I hate global variables ;-) and the 'Returned result must be freed'
> > > comment
> > > in 'concat_path()' is slightly misleading in this respect.
> > 
> > About the global variable: sure, I am not happy about it either. What I
> > disliked even more is that virtio_9p_create_local_test_dir() is called
> > from a constructor, but as I described in [1] I did not find a realiable
> > alternative. If somebody comes up with a working and reliable, clean
> > alternative, very much appreciated!
> 
> An alternative might be to create/remove the test directory when
> a virtio-9p device is started/destroyed, and keeping the string
> under the QVirtio9p structure. 

Yeah, I tried that already. Keep in mind it not only has to work sometimes, it 
has to work reliably, always, for everybody and commit history shows that this 
can be more hairy than one might think and observe.

> The most notable effect would be
> to have a new directory for each individual test instead of
> all the lifetime of qos-test, but it doesn't hurt. I'll have a look.

I'd like to avoid just converting one compromise into another one.

If I had to choose between fixing a purely theoretical issue of getting rid of 
a global variable, or introducing a real-life issue in form of numerous new 
test dirs popping up on toplevel, I rather stick to the former. We already 
have enough test dirs popping up on toplevel IMO.

A truly clean solution for this would be the introduction of setup/teardown 
callback pairs in libqos, like it is standard in other test suites. No plans 
on my side for spending coding time on that in near future though. My review 
time for patches on that being assured though.

Best regards,
Christian Schoenebeck



