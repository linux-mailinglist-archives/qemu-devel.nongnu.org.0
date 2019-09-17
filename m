Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F8B4B2B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 11:46:05 +0200 (CEST)
Received: from localhost ([::1]:43367 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAA3g-0004LF-SN
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 05:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iAA2D-0003b0-1J
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 05:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iAA2B-0002eJ-QE
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 05:44:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1iAA2B-0002du-II; Tue, 17 Sep 2019 05:44:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C26053084029;
 Tue, 17 Sep 2019 09:44:30 +0000 (UTC)
Received: from work-vm (ovpn-116-53.ams2.redhat.com [10.36.116.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E9310018FF;
 Tue, 17 Sep 2019 09:44:28 +0000 (UTC)
Date: Tue, 17 Sep 2019 10:44:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Balamuruhan S <bala24@linux.ibm.com>
Message-ID: <20190917094425.GD3370@work-vm>
References: <20190916093445.20507-1-bala24@linux.ibm.com>
 <20190916093445.20507-4-bala24@linux.ibm.com>
 <20190916144709.GD2884@work-vm>
 <20190917084537.GA30607@dhcp-9-120-237-81.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917084537.GA30607@dhcp-9-120-237-81.in.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 17 Sep 2019 09:44:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] tests/acceptance/migration: test to
 migrate will all machine types
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
Cc: ehabkost@redhat.com, groug@kaod.org, qemu-devel@nongnu.org,
 sathnaga@linux.vnet.ibm.com, clg@kaod.org, crosa@redhat.com,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Balamuruhan S (bala24@linux.ibm.com) wrote:
> On Mon, Sep 16, 2019 at 03:50:06PM +0100, Dr. David Alan Gilbert wrote:
> > * Balamuruhan S (bala24@linux.ibm.com) wrote:
> > > add migration test to query machine types supported by qemu binary
> > > and migrate vm will all supported type.
> > > 
> > > Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> > 
> > Depending on the architecture you might find that some machine types
> > aren't migratable while some are.
> 
> Thanks Dave, is there a way to query/check whether a machine type on the
> architecture is migratable or should we try migrating and handle exception
> on failure ?

I don't know a way to detect it; you can add -only-migratable to get
qemu to fai early if a device is declared as being non-migratable; but
that still doesn't say that all the devices have actually been tested
migrating.

Dave


> -- Bala
> > 
> > Dave
> > 
> > > ---
> > >  tests/acceptance/migration.py | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> > > index 0f3553c8f0..74416ccc21 100644
> > > --- a/tests/acceptance/migration.py
> > > +++ b/tests/acceptance/migration.py
> > > @@ -49,3 +49,29 @@ class Migration(Test):
> > >          self.assertEqual(dest_vm.command('query-status')['status'], 'running')
> > >          self.assertEqual(source_vm.command('query-status')['status'],
> > >                           'postmigrate')
> > > +
> > > +
> > > +    def test_migration_with_machine_types(self):
> > > +        migration_port = self._get_free_port()
> > > +        for machine in self.get_machine_types():
> > > +            if 'pseries' in machine:
> > > +                print("migrating with machine type - {}".format(machine))
> > > +                source_vm = self.get_vm('-M', '{},cap-htm=off'.format(machine))
> > > +                dest_uri = 'tcp:localhost:%u' % migration_port
> > > +                dest_vm = self.get_vm('-M', '{},cap-htm=off'.format(machine),
> > > +                                      '-incoming', dest_uri)
> > > +                dest_vm.launch()
> > > +                source_vm.launch()
> > > +                source_vm.qmp('migrate', uri=dest_uri)
> > > +                wait.wait_for(
> > > +                    self.migration_finished,
> > > +                    timeout=self.timeout,
> > > +                    step=0.1,
> > > +                    args=(source_vm,)
> > > +                )
> > > +                self.assertEqual(source_vm.command('query-migrate')['status'],
> > > +                                                   'completed')
> > > +                self.assertEqual(dest_vm.command('query-status')['status'],
> > > +                                                 'running')
> > > +                self.assertEqual(source_vm.command('query-status')['status'],
> > > +                                                   'postmigrate')
> > > -- 
> > > 2.14.5
> > > 
> > > 
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

