Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A0CE923
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 18:26:46 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHVqP-0007o5-7G
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 12:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iHVhi-0006og-TN
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:17:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iHVhh-0004cv-JY
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:17:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iHVhZ-0004Y4-1W; Mon, 07 Oct 2019 12:17:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0AA0D307D976;
 Mon,  7 Oct 2019 16:17:34 +0000 (UTC)
Received: from gondolin (ovpn-116-231.ams2.redhat.com [10.36.116.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F013F5D6A3;
 Mon,  7 Oct 2019 16:16:57 +0000 (UTC)
Date: Mon, 7 Oct 2019 18:16:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 06/31] python: add commit-per-subsystem.py
Message-ID: <20191007181651.2fd72fbf.cohuck@redhat.com>
In-Reply-To: <cc355055-871d-9fb8-6f2d-f75d5cd40a3b@virtuozzo.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-7-vsementsov@virtuozzo.com>
 <20191007175514.19360a2b.cohuck@redhat.com>
 <cc355055-871d-9fb8-6f2d-f75d5cd40a3b@virtuozzo.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 07 Oct 2019 16:17:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "integration@gluster.org" <integration@gluster.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Oct 2019 16:10:02 +0000
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 07.10.2019 18:55, Cornelia Huck wrote:
> > On Tue,  1 Oct 2019 18:52:54 +0300
> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> >> +def git_add(pattern):
> >> +    subprocess.run(['git', 'add', pattern])
> >> +
> >> +
> >> +def git_commit(msg):
> >> +    subprocess.run(['git', 'commit', '-m', msg], capture_output=True)
> >> +
> >> +
> >> +maintainers = sys.argv[1]
> >> +message = sys.argv[2].strip()
> >> +
> >> +subsystem = None
> >> +
> >> +shortnames = {
> >> +    'Block layer core': 'block',
> >> +    'ARM cores': 'arm',
> >> +    'Network Block Device (NBD)': 'nbd',
> >> +    'Command line option argument parsing': 'cmdline',
> >> +    'Character device backends': 'chardev',
> >> +    'S390 general architecture support': 's390'
> >> +}
> >> +
> >> +
> >> +def commit():
> >> +    if subsystem:
> >> +        msg = subsystem
> >> +        if msg in shortnames:
> >> +            msg = shortnames[msg]
> >> +        msg += ': ' + message
> >> +        git_commit(msg)
> >> +
> >> +
> >> +with open(maintainers) as f:
> >> +    for line in f:
> >> +        line = line.rstrip()
> >> +        if not line:
> >> +            continue
> >> +        if len(line) >= 2 and line[1] == ':':
> >> +            if line[0] == 'F' and line[3:] not in ['*', '*/']:
> >> +                git_add(line[3:])
> >> +        else:
> >> +            # new subsystem start
> >> +            commit()
> >> +
> >> +            subsystem = line
> >> +
> >> +commit()  
> > 
> > Hm... I'm not sure about the purpose of this script (and my python is
> > rather weak)... is this supposed to collect all changes covered by a
> > subsystem F: pattern into one patch?  
> 
> Yes
> 
> > If so, what happens to files
> > covered by multiple sections?
> >   
> 
> Hmm, they just go to the first of these sections, mentioned in MAINTAINERS.
> Is it bad I don't know, but I tried to automate it somehow. Anyway, I myself
> can't have better idea about how to organize patches to the subsystems which
> I don't know.
> 

Yeah, that is a problem I don't have a solution for, either.

But the script should probably get at least a comment about its
intended purpose and limitations? We don't really want people to start
using it blindly.

