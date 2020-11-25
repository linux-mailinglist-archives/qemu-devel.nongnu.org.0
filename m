Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC92C3DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:36:54 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khsAO-0004UQ-KX
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khs90-000402-GR
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khs8y-00052x-1e
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606300522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxjrrcFkctJ8/FnY3+TufWG10LMp/TPL72Oyc64J0FM=;
 b=BJrWPAMuIau+7tFZwFKaBTYUpjyemFyMgfDRlSZ0hTwqpixAIWJbGKCxthSzIsEMWNnqQs
 fLczPFjZbmdvgIIjd8ROKe3ECDOJl+7Vb7QSMw/lt9bx2KB/inhtUYh5UTyDvgvmaCOkr6
 PkvOu87N7JEns8vogIIm+IJLsyeuAOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-Xs01q_emPJOneS5GYAAITg-1; Wed, 25 Nov 2020 05:35:20 -0500
X-MC-Unique: Xs01q_emPJOneS5GYAAITg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB410106B3A3;
 Wed, 25 Nov 2020 10:35:18 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5007C60BE5;
 Wed, 25 Nov 2020 10:35:13 +0000 (UTC)
Date: Wed, 25 Nov 2020 10:35:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Subject: Re: [PATCH v2 1/2] iotests: add another bash sleep command to 247
Message-ID: <20201125103510.GB3222@work-vm>
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
 <7fa343b4-cb87-cb64-956a-87c3a32f75cc@virtuozzo.com>
 <d22cf36e-0133-dfc6-0ae7-95e05a68ce04@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d22cf36e-0133-dfc6-0ae7-95e05a68ce04@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, den@openvz.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Shinkevich (andrey.shinkevich@virtuozzo.com) wrote:
> On 24.11.2020 13:04, Vladimir Sementsov-Ogievskiy wrote:
> > 23.11.2020 18:44, Andrey Shinkevich wrote:
> > > This patch paves the way for the one that follows. The following patch
> > > makes the QMP monitor to read up to 4K from stdin at once. That results
> > > in running the bash 'sleep' command before the _qemu_proc_exec() starts
> > 
> > But how? Before _qemu_proc_exec() starts, qemu monitor is not runnning,
> > and its new behavior can't influence..
> > 
> 
> I am not a bash expert to explain 'how' but this workaround works. It's just
> a test. Maybe other colleagues can say.

> > If bash subshell work in unpredictable way, may be better is refactor test
> > to send commands one by one with help of _send_qemu_cmd. Then sleep will
> > be natively executed between sending commands.
> > 
> 
> Or maybe write a similar test case in Python if Kevin agrees.

 Yeh I don't believe the 'before the _qemu_proc_exec' starts- it's all
happening horribly in parallel with the subshell - the timing is
probably fragile as hell.

THe test needs to wait for output and then quit.

Dave

> > > in subshell. Another 'sleep' command with an unobtrusive 'query-status'
> > > plays as a workaround.
> > > 
> > > Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> > > ---
> > >   tests/qemu-iotests/247     | 2 ++
> > >   tests/qemu-iotests/247.out | 1 +
> > >   2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
> > > index 87e37b3..7d316ec 100755
> > > --- a/tests/qemu-iotests/247
> > > +++ b/tests/qemu-iotests/247
> > > @@ -59,6 +59,8 @@ TEST_IMG="$TEST_IMG.4" _make_test_img $size
> > >   {"execute":"block-commit",
> > >    "arguments":{"device":"format-4", "top-node": "format-2",
> > > "base-node":"format-0", "job-id":"job0"}}
> > >   EOF
> > > +sleep 1
> > > +echo '{"execute":"query-status"}'
> > >   if [ "${VALGRIND_QEMU}" == "y" ]; then
> > >       sleep 10
> > >   else
> > > diff --git a/tests/qemu-iotests/247.out b/tests/qemu-iotests/247.out
> > > index e909e83..13d9547 100644
> > > --- a/tests/qemu-iotests/247.out
> > > +++ b/tests/qemu-iotests/247.out
> > > @@ -17,6 +17,7 @@ QMP_VERSION
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > > "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len":
> > > 134217728, "offset": 134217728, "speed": 0, "type": "commit"}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > > "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id":
> > > "job0"}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > > "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id":
> > > "job0"}}
> > > +{"return": {"status": "running", "singlestep": false, "running": true}}
> > >   {"return": {}}
> > >   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> > > "event": "SHUTDOWN", "data": {"guest": false, "reason":
> > > "host-qmp-quit"}}
> > >   *** done
> > > 
> > 
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


