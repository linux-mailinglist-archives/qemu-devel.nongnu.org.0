Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB89231C0C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 11:23:32 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0iJ9-0002jg-KP
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 05:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1k0iIL-0002Ed-79
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:22:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1k0iII-0000gf-T4
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596014556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOGNzWEGFDX7VQydGC6tQEanWMpctP51/yUF0SzWAVk=;
 b=fCBWWPZAMrzm+o5jKG3HKtmkvHLfs/H1wMLRToGDlKNBiXNvlAIjjByVvCdGeaMsnzsZ04
 Jw60g2JKH3EOnMv5mQihyV6nb1GXn1I+Yd6j5t53fDPluL6QYEkZHUsrW3heDkhxulrcHK
 IK63cOSP/+6OtqI+2AcX8eStKuC5jQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-zd8VcadTPvySFzKbylORIg-1; Wed, 29 Jul 2020 05:22:33 -0400
X-MC-Unique: zd8VcadTPvySFzKbylORIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43AFCE91D
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 09:22:32 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-112-157.ams2.redhat.com
 [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 156D85D9E8;
 Wed, 29 Jul 2020 09:22:31 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id 7D4D93E047D; Wed, 29 Jul 2020 11:22:30 +0200 (CEST)
Date: Wed, 29 Jul 2020 11:22:30 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH for-5.1?] qapi/block-core.json: Remove stale description
 of 'blockdev-add'
Message-ID: <20200729092230.4strlnuas34o54vg@paraplu>
References: <20200728143202.616687-1-kchamart@redhat.com>
 <f285cbb4-5b40-eb38-785c-0f6ff8631321@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f285cbb4-5b40-eb38-785c-0f6ff8631321@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.74; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 03:32:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 28, 2020 at 09:50:39AM -0500, Eric Blake wrote:
> On 7/28/20 9:32 AM, Kashyap Chamarthy wrote:

[...]

> > [1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-07/msg00071.html
> >      -- equivalent to "-drive if=ide,id=disk0....."
> > 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > Identified-by: Kevin Wolf <kwolf@redhat.com>
> 
> This would be our first use of this unusual tag name; more typical is
> Suggested-by or Reported-by.

Yes, I agree, using predictable tags is better; so 'Suggested-by' is
good.

(We perhaps don't have as many 'unusual tags' as the kernel does :-) —
https://lwn.net/Articles/503829/)

> Is it worth a 'Fixes: be4b67bc7d' line?

Sure, including the provenance is always useful for later `git`
sleuthing.

[...]

> > -# Creates a new block device. If the @id option is given at the top level, a
> > -# BlockBackend will be created; otherwise, @node-name is mandatory at the top
> > -# level and no BlockBackend will be created.
> > +# Creates a new block device.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks; shall I spin a v2?  (I agree with both your suggestions above.)

> As a doc fix, it is safe for 5.1, but given the timing of -rc2 today, it's
> also okay if it slips into 5.2.

Yeah, 5.1 or 5.2, both are fine by me.

[...]

-- 
/kashyap


