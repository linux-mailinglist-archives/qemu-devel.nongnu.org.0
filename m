Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1122A6B8F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 18:22:54 +0100 (CET)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaMUn-0000NL-77
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 12:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kaMTd-0007yI-Sj
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kaMTb-0007Zp-JJ
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604510498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5kdAygNR4yRYrQLtGtrp1pTGGGSSQIiHlXmg3ujW2w=;
 b=ENcz5WIcGpQ3KmQigSakNKQ1wM2LrPsJahR3naLnS3DAL1f6VZkfesM+LhZuCyhOuIhjmo
 h1SYzRlQyRm4svcbFbxpqNslSFmhS5NPSWO7TYFoi062OaOYRNQMpHj9c70Cdg9R7eROvy
 qTP2c1MecvQ0DXrsjKjbl18MUnMdJYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-4ecToZ2iPdKqYcp5LTktag-1; Wed, 04 Nov 2020 12:21:24 -0500
X-MC-Unique: 4ecToZ2iPdKqYcp5LTktag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485A01882FB1;
 Wed,  4 Nov 2020 17:21:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4947F5577D;
 Wed,  4 Nov 2020 17:19:55 +0000 (UTC)
Date: Wed, 4 Nov 2020 17:19:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: Migrating to the gitlab issue tracker
Message-ID: <20201104171952.GO565323@redhat.com>
References: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
 <20201030091636.GD307361@stefanha-x1.localdomain>
 <62284d4e-ccd6-08b4-6cd4-0a5795488996@redhat.com>
 <20201102142645.GE138796@redhat.com>
 <76a87809-0e2a-1410-7809-69e0271686d0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <76a87809-0e2a-1410-7809-69e0271686d0@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Klaus Jensen <its@irrelevant.dk>, Alberto Garcia <berto@igalia.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Ben Warren <ben@skyportsystems.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Brad Smith <brad@comstyle.com>,
 Laurent Vivier <lvivier@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Ed Maste <emaste@freebsd.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Coiby Xu <Coiby.Xu@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup.patel@wdc.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Su Hang <suhang16@mails.ucas.ac.cn>,
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
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
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

On Wed, Nov 04, 2020 at 06:03:26PM +0100, Laszlo Ersek wrote:
> On 11/02/20 15:26, Daniel P. Berrangé wrote:
> > On Mon, Nov 02, 2020 at 02:57:49PM +0100, Laszlo Ersek wrote:
> >> On 10/30/20 10:16, Stefan Hajnoczi wrote:
> >>> On Thu, Oct 29, 2020 at 12:01:27PM -0400, John Snow wrote:
> >>>> In experimenting with my mirror on gitlab though, I was unable to find a way
> >>>> to configure it to send issue tracker notifications to the email list. A
> >>>> move to gitlab would likely mean, then:
> >>>>
> >>>> 1. The cessation of (automatic) issue tracker mails to the list
> >>>
> >>> A bot could do this.
> >>
> >> I think a "bug traffic" mailing list (possibly but not necessarily
> >> separate from the main qemu development list) is important.
> > 
> > What benefit is there to a bug traffic mailing list, as opposed to people
> > subscribing to direct bug notifications ? In both case people who are
> > interested in watching bugs can get the same content in their inboxes.
> 
> People never subscribed to a particular bug can retroactively learn --
> when it turns into an interest for them -- about actions on the bug,
> over time. Bug tracker web UIs do not always present such a view. (IOW
> it's not interchangeable with retroactively opening the ticket and
> reading through it.)

I can't say I've ever come aross a situation where I cared about a bug
and found information missing in the web UI that I then found in the
mailing list archives. 

> Additionally, mailing list archives can be imported locally, for
> indexing / searching, etc. Nothing beats a local search engine that has
> access to years of bug traffic. Google may come somewhat close; bug
> trackers' own search functionalities are hopeless in comparison (IME).

If you subscribe to the project directly you get local archives which
can be indexed & searched too if that's important.

This just sounds like fairly niche requirements for which directly
subscribing to the project issue tracker will satisfy 99% of the time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


