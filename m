Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29017F6A7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 12:48:11 +0100 (CET)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBdMo-0007Bh-A3
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 07:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBdKv-0005Vm-GH
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBdKt-0006O9-Cu
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:46:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57419
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBdKp-0006L8-Qn
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583840766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGqiBJ0CZ5WpkyFas6I7eUP/AIVUqtGGfpTG+U12qXY=;
 b=HETtd8yGJQN+tCoJqgajtcxU1fdxOhx/pj9FDoYvPgHmTMgaNi8UNucEtJnBfDr31D5umE
 SunXUAzzzwiUssZuBHCRxo8nTA1yh/qk2ov0/RzDAQ6bWmnmvUhB+ArwXFSA7rnSQ/FCEC
 kpNpRx91+6O/a1m3E3zvmQjsgcbTwWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Sc4CF4rQPUqcyMlVXzSYDQ-1; Tue, 10 Mar 2020 07:46:05 -0400
X-MC-Unique: Sc4CF4rQPUqcyMlVXzSYDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2CCA108442C;
 Tue, 10 Mar 2020 11:46:02 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74EEA10013A1;
 Tue, 10 Mar 2020 11:45:49 +0000 (UTC)
Date: Tue, 10 Mar 2020 12:45:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200310114548.GA6926@linux.fritz.box>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
> Le 09/03/2020 =E0 20:30, Philippe Mathieu-Daud=E9 a =E9crit=A0:
> > On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
> >> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> >>> The following changes since commit
> >>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
> >>>
> >>> =A0=A0 Merge remote-tracking branch 'remotes/mst/tags/for_upstream' i=
nto
> >>> staging (2020-03-09 10:32:53 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>> =A0=A0 git://github.com/vivier/qemu.git tags/trivial-branch-pull-requ=
est
> >>>
> >>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636=
bb:
> >>>
> >>> =A0=A0 monitor/hmp-cmds: Remove redundant statement in
> >>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
> >>
> >>
> >> Could you avoid CC everyone involved on the whole PULL req?
> >> I was involved in a patch or two and don't really need to see
> >> the whole series. Just the cover and the relevant patches
> >> would be enough - if I do want it there's always lore.
> >=20
> > I suppose Laurent used git-publish, which has this limitation.
> >=20
>=20
> Yes, I use git publish and CC are automatically added.
>=20
> Philippe, you told me some time ago you have a patch to fix this
> behaviour and only CC people on a patch base. Is it available?

Actually, I don't think it's even necessary to CC anyone at all (except
the relevant lists) for pull requests. These patches were already
reviewed.

Kevin


