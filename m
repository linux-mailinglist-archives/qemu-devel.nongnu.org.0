Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F6229F197
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 17:34:58 +0100 (CET)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYAt6-0008AG-Pu
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 12:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kYArb-0007Lc-Go
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 12:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kYArY-0005yI-4E
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 12:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603989197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eNKSjOB3kDARAwA2I2QP1wRUB8+FZFhtiFn42dRy5ls=;
 b=faOx57Y9OQ4oyb+ZPkZIBiEp93P2z4o2MttUoD/hnx4zWNevbdwQllLv8t31Uf1N7RF7Y1
 vtiWVE108psvffVfk516kDx7zBs/RdH9epK7wvl3ng9hO6YcxMA0/Yfwh9xZL8kTqDW2Vb
 wxkGK2e2/o1QbK6RKCoFz/O4bze74Bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-HTyxAD-XMLiDenJh4VmZJw-1; Thu, 29 Oct 2020 12:33:15 -0400
X-MC-Unique: HTyxAD-XMLiDenJh4VmZJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D77C364084;
 Thu, 29 Oct 2020 16:32:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2ED655778;
 Thu, 29 Oct 2020 16:30:50 +0000 (UTC)
Date: Thu, 29 Oct 2020 16:30:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Migrating to the gitlab issue tracker
Message-ID: <20201029163048.GG27369@redhat.com>
References: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Klaus Jensen <its@irrelevant.dk>, Alberto Garcia <berto@igalia.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Ben Warren <ben@skyportsystems.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Brad Smith <brad@comstyle.com>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Ed Maste <emaste@freebsd.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Coiby Xu <Coiby.Xu@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Anup Patel <anup.patel@wdc.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Su Hang <suhang16@mails.ucas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>, "Denis V. Lunev" <den@openvz.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Chen <chen.zhang@intel.com>,
 Gonglei <arei.gonglei@huawei.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Liu Yuan <namei.unix@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Corey Minyard <minyard@acm.org>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Bin Meng <bin.meng@windriver.com>,
 Peter Xu <peterx@redhat.com>, Colin Xu <colin.xu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Rob Herring <robh@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Jason Dillaman <dillaman@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Sergio Lopez <slp@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cleber Rosa <crosa@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Otubo <otubo@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 "Richard W.M. Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Jiri Slaby <jslaby@suse.cz>, Peter Chubb <peter.chubb@nicta.com.au>,
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>,
 Sven Schnelle <svens@stackframe.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Li-Wen Hsu <lwhsu@freebsd.org>, David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Wen Congyang <wencongyang2@huawei.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 29, 2020 at 12:01:27PM -0400, John Snow wrote:
> If you're in the CC list, it's because you are listed in MAINTAINERS.
> 
> Paolo's QEMU keynote this morning mentioned the possible use of the Gitlab
> issue tracker instead of using Launchpad.
> 
> I'm quite fond of the gitlab issue tracker, I think it works quite well and
> it has pretty good and uncomplicated API access to it in order to customize
> your workflow if you'd really like to.
> 
> In experimenting with my mirror on gitlab though, I was unable to find a way
> to configure it to send issue tracker notifications to the email list. A
> move to gitlab would likely mean, then:
> 
> 1. The cessation of (automatic) issue tracker mails to the list
> 2. The loss of the ability to update the issue tracker by replying to said
> emails
> 3. Anyone listed in MAINTAINERS would be expected to have a gitlab account
> in order to interact with the issue tracker.
> 
> However, once you have a gitlab account, you DO gain the ability to receive
> emails for issues; possibly only those tagged with labels that you cared
> about -- giving a nice filtering mechanism to receive only bugs you care
> about.

The other thing gained by having a gitlab account is that you can
create a fork of QEMU, and push subsystem trees to the fork. This will
run a load of CI jobs enabling subsystem maintainer to catch many build
problems before sending an email PULL to Peter. This will make it more
likely the PULL will get merged first time without problems, and reduce
the load on Peter letting him do more productive stuff than finding build
failures.

I think we should have an expectation that all PULLs have undergone
GitLab CI testing before being emailed to the list.

NB, GitLab CI doesn't cover every platform combo - there is also
Cirrus CI and Travis. Maintainer can optionally setup accounts on
those too, but I don't think we should seek to require that as it
starts to get a bit more conplex to keep everything sane. Just
focusing on GitLab CI for subsystem maintainers would be a big
enough win on its own I expect.

> Gitlab also does support individual accounts updating issues using a
> generated personalized email address, so if the email workflow is crucial to
> you, it is still available.
> 
> I'm for it, or at least for beginning a pilot program where we experiment
> with the idea for interested parties. I wanted to send up a trial balloon to
> see how we were feeling about this.

The other benefit with using GitLab issues instead of Launchpad is
auto-closing based on comments. A commit message can include a line:

  Closes https://gitlab.com/qemu-project/qemu/-/issues/NNN

When that git commit gets merged to git master in a PULL by Peter, the
GitLab issue will be automatically closed, and it will cross-link to
the commit.

This will eliminate the manual actions that our Launchpad Janitor(s) do
today to close old issues that have been fixed, improving the signal/noise
ratio.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


