Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA165EDE60
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:03:49 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXfA-0003qO-RZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odULg-0003tO-5t
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odULa-00049D-2u
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664361080;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpiU7iA4VvuQmc/Vpq/6O7MZUhexCspj+qesfVlls7c=;
 b=PI8u96rxFFtprrKXY0/KMUfVLp+kDphWMFCyhIQ2UVCREi67Jt47q72kBvH87pWwSwb3Bj
 9nhkvDA9rl7IeIr1MumrnFkXa1954v30qB2V7NttJGh8fA4R5owlvAq79p5MLrcWEXw6UT
 ZDzuvdC4aNEWJ7mAYhi+Jwxumywx4D0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-x3LZHjjyOUS3R9hvmoP2Uw-1; Wed, 28 Sep 2022 06:31:17 -0400
X-MC-Unique: x3LZHjjyOUS3R9hvmoP2Uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D59D33C0F420;
 Wed, 28 Sep 2022 10:31:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1E2C15BB2;
 Wed, 28 Sep 2022 10:31:15 +0000 (UTC)
Date: Wed, 28 Sep 2022 11:31:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com
Subject: Re: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
Message-ID: <YzQicQM5mGnQwuD8@redhat.com>
References: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
 <YzGmoWQPhR27VWX7@redhat.com> <871qrxnyjo.fsf@pond.sub.org>
 <YzQg3R1yYFopabkQ@rvkaganb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzQg3R1yYFopabkQ@rvkaganb>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 04:24:29PM +0600, Roman Kagan wrote:
> On Tue, Sep 27, 2022 at 08:04:11AM +0200, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > > On Mon, Sep 26, 2022 at 12:59:40PM +0300, Denis Plotnikov wrote:
> > >> Example of result:
> > >> 
> > >>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
> > >> 
> > >>     (QEMU) query-status
> > >>     {"end": {"seconds": 1650367305, "microseconds": 831032},
> > >>      "start": {"seconds": 1650367305, "microseconds": 831012},
> > >>      "return": {"status": "running", "singlestep": false, "running": true}}
> > >> 
> > >> The responce of the qmp command contains the start & end time of
> > >> the qmp command processing.
> > 
> > Seconds and microseconds since when?  The update to qmp-spec.txt should
> > tell.
> > 
> > Why split the time into seconds and microseconds?
> 
> This is exactly how timestamps in QMP events are done, so we thought
> we'd just follow suit

Yes, I think its good to have consistency with the rest of the spec,
despite Markus' point that it could be simplified to one field.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


