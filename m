Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C6310C9D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:42:03 +0100 (CET)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82J7-0008TD-9L
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l82HZ-0007LW-4m
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l82HV-0000iu-0Z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612536020;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OY8ZHnb6wSHVmB8q5ewzSqnDYzyuyLwVXxT5xPYHYrY=;
 b=OOYzDISz7nAgY16n2Vpz3qbbEh2J1SydaFFRvCMv54JAb7FHiDS3vKeuheeOylkf90kxcR
 iFDTjHwG+DOPCSPjEUdRuPKOLRZicKuc1E+9NA3Y3RW6G/1bmGGle4Luj01LQ/l4N4lR7c
 V1HPhmlkxXWBJo13r3VAiwyc7EYiwWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-XKQXY_NVNL-SyVP-vU05LQ-1; Fri, 05 Feb 2021 09:40:18 -0500
X-MC-Unique: XKQXY_NVNL-SyVP-vU05LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686D28710E3;
 Fri,  5 Feb 2021 14:40:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEA3D10016F5;
 Fri,  5 Feb 2021 14:40:15 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:40:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/3] utils: Deprecate inexact fractional suffix sizes
Message-ID: <20210205144012.GR908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-4-eblake@redhat.com>
 <20210205111036.GE908621@redhat.com>
 <c257a78a-1cc4-9d29-ac2c-fb4b5d68e469@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c257a78a-1cc4-9d29-ac2c-fb4b5d68e469@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 tao3.xu@intel.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 08:28:31AM -0600, Eric Blake wrote:
> On 2/5/21 5:10 AM, Daniel P. Berrangé wrote:
> > On Thu, Feb 04, 2021 at 01:07:08PM -0600, Eric Blake wrote:
> >> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
> >> happen to truncate it to 1126.  Our use of fractional sizes is
> >> intended for convenience, but when a user specifies a fraction that is
> >> not a clean translation to binary, truncating/rounding behind their
> >> backs can cause confusion.  Better is to deprecate inexact values,
> >> which still leaves '1.5k' as valid, but alerts the user to spell out
> >> their values as a precise byte number in cases where they are
> >> currently being rounded.
> > 
> > I don't think we should be deprecating this, as I think it makes
> > it very user hostile.  Users who require exact answers, won't be
> > using fractional syntax in the first place. IOW, by using fractional
> > syntax you've decided that approximation is acceptable. Given that,
> > I should not have to worry about whether or not the fraction I'm
> > using is exact or truncated. It is horrible usability to say that
> > "1.1k" is invalid, while "1.5k" is valid - both are valid from my
> > POV as a user of this.
> > 
> > 
> > 
> >> Note that values like '0.1G' in the testsuite need adjustment as a
> >> result.
> >>
> >> Sadly, since qemu_strtosz() does not have an Err** parameter, we
> >> pollute to stderr.
> > 
> > This is only an warning, so setting an Err ** would not be appropriate
> > right now.
> > 
> > None the less we should add an Err **, because many of the callers
> > want an Err ** object populated, or use error_report().
> 
> That is more effort.  What's the consensus - is it important enough that
> I should spend that effort getting rid of technical debt by adding
> versions of qemu_strto* that take Err** at this point in time?

To be clear, I'm not requesting that you make it use Err** right now.

I just raise it as an idea for future technical debt removal.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


