Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D5E25DA1F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 15:40:49 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEBxQ-0004h8-Ny
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 09:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kEBwF-0003JU-1y
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:39:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28160
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kEBwC-0005T9-MG
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:39:34 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-uApeuDFkNrq9kmgQ76EkuQ-1; Fri, 04 Sep 2020 09:39:29 -0400
X-MC-Unique: uApeuDFkNrq9kmgQ76EkuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 382A88B7887;
 Fri,  4 Sep 2020 13:39:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 015C87E40A;
 Fri,  4 Sep 2020 13:39:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8002411329B4; Fri,  4 Sep 2020 15:39:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bruce Rogers <brogers@suse.com>
Subject: Re: [PATCH] meson: install ivshmem-client and ivshmem-server
References: <20200903153524.98168-1-brogers@suse.com>
 <4eba2feb-a9b3-8bb7-6ed7-6b02c79519b1@redhat.com>
 <20200903154906.GA441291@redhat.com>
 <69f279ce-30e8-e83c-718b-021d3e6b264d@redhat.com>
 <87a6y6dmy4.fsf@dusky.pond.sub.org>
 <509826bc-9683-dd1d-fa6a-55fc3fddc57c@redhat.com>
 <87lfhpaofy.fsf@dusky.pond.sub.org>
 <5636584a23452c45d91f535e77374c37aaadcb48.camel@suse.com>
Date: Fri, 04 Sep 2020 15:39:09 +0200
In-Reply-To: <5636584a23452c45d91f535e77374c37aaadcb48.camel@suse.com> (Bruce
 Rogers's message of "Fri, 04 Sep 2020 05:49:28 -0600")
Message-ID: <87tuwd64qq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruce Rogers <brogers@suse.com> writes:

> On Fri, 2020-09-04 at 11:20 +0200, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>> > On 04/09/20 09:24, Markus Armbruster wrote:
>> > > > Ah, via the tools variable in configure.  Nice maze.  I've
>> > > > queued the patch.
>> > > Please don't.
>> > > 
>> > > These programs are examples to help people understand how the
>> > > ivhsmem
>> > > device works.  They might even be useful for debugging.  They are
>> > > *not*
>> > > to be used in production.
>> > 
>> > Oooookay. :)  It needs to be documented in the changelog.
>> 
>> I'll take care of updating <https://wiki.qemu.org/ChangeLog/5.2>;.
>> 
>
> Thanks all for the clarification on this one. It was packaged up simply
> because it got installed, and I never got to looking at the use case
> for these binaries.
>
> I'll remove them from what we package in SUSE's SLE and openSUSE.

Thanks!


