Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339730F32D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:31:48 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dnX-0003z6-5a
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>)
 id 1l7dlq-0003El-Uu; Thu, 04 Feb 2021 07:30:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:57342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>)
 id 1l7dlp-0001eW-6h; Thu, 04 Feb 2021 07:30:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA04AAC97;
 Thu,  4 Feb 2021 12:29:58 +0000 (UTC)
Date: Thu, 4 Feb 2021 13:29:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/12] qga: Rename config key 'blacklist' as 'denylist'
Message-ID: <20210204122957.GC6564@kitsune.suse.cz>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-3-philmd@redhat.com>
 <20210204094545.GB6564@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204094545.GB6564@kitsune.suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
Received-SPF: pass client-ip=195.135.220.15; envelope-from=msuchanek@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 10:45:45AM +0100, Michal Suchánek wrote:
> Hello,
> 
> On Tue, Feb 02, 2021 at 09:58:14PM +0100, Philippe Mathieu-Daudé wrote:
> > Follow the inclusive terminology from the "Conscious Language in your
> > Open Source Projects" guidelines [*] and replace the word "blacklist"
> > appropriately.
> > 
> > [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  docs/interop/qemu-ga.rst   |  2 +-
> >  qga/main.c                 | 15 +++++++++++----
> >  tests/test-qga.c           |  8 ++++----
> >  tests/data/test-qga-config |  2 +-
> >  4 files changed, 17 insertions(+), 10 deletions(-)
> > 
> > diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> > index 3063357bb5d..9a590bf95cb 100644
> > --- a/docs/interop/qemu-ga.rst
> > +++ b/docs/interop/qemu-ga.rst
> > @@ -125,7 +125,7 @@ pidfile        string
> >  fsfreeze-hook  string
> >  statedir       string
> >  verbose        boolean
> > -blacklist      string list
> > +denylist       string list
> >  =============  ===========
> 
> this changes the config option but not the commandline option creating
> disconnect between commanndline and config:
> 
> docs/interop/qemu-ga.rst:.. option:: -b, --blacklist=LIST
> docs/interop/qemu-ga.rst:blacklist      string list

Now I see it's addressed in patch 3 but with the patches arriving out of
order I have missed that. Maybe merging these two might make more sense.

Thanks

Michal

