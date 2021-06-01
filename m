Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8547C3979C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:09:15 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8pG-0000kF-Jz
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lo8oF-0007Fn-VV
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lo8oB-00044T-QW
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622570886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0iqhR20ZVHIhUdiSYRlYTAYahdeX4k2sFBt1EZIYTJg=;
 b=N6itJAFlg7RAkIuva8e2rG8982TnFDySBYBuc2ozbtjn6xAzS9GC6O2+om31Y2IoWXYAB7
 4Pz7Sr2+P4vYLIw5pVkY/gZKOWy9ADHVPZBqAyg625G/ESwWCWEVNB5dExVySk9sGLnTO0
 akTQhOCiVk/XxYy6+VNZSneq1Sc3eaE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-OAgIuIIMOjetuxitx64tEA-1; Tue, 01 Jun 2021 14:08:01 -0400
X-MC-Unique: OAgIuIIMOjetuxitx64tEA-1
Received: by mail-ua1-f72.google.com with SMTP id
 5-20020ab000850000b029020fb0e74c2aso8021494uaj.21
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 11:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iqhR20ZVHIhUdiSYRlYTAYahdeX4k2sFBt1EZIYTJg=;
 b=qY3CcmnwZf5L4pIfAM1tNjzU1Z2mnalr12bYYlLWAbxdsSZQXp82PR1h5nnOPdWqhW
 jOBdDBI1Ul3e5sxBM59pgrPf5J7PVpWJXga4Q4Ale/BwV0aWkWkF6g32WjYa9m+Wlzra
 QG3nbgMe4ahuo3vwWSUxJahPdQSSeo7YAsc8daloGOlVuYiWioi5MPdjHN57jEHRzXA4
 UI8A1YhvWLylQK4VKJ0LfwjkiObhozHnLqw/mF/7f9y/L/8/d95ORCAJGSdCHQgmOiCr
 uIViNW5+/dwq+loE5kDXS3yfOyzq8NWkKMQPPhjkliH67aKXKvzDkD7ET1XYKhBQZDE5
 O1uQ==
X-Gm-Message-State: AOAM533+ZQ6UJgE0j+InOmeA3uLRlZbbAOo3qk507u794tCkRCKIBe2H
 7hiAURUjbdzAvccx6C3YyLQHBb5Ppuju2qOrv5dyMonGtg2vb9QCGEnxkj8h9uwKiOhll+/6s6V
 IQ3Oe+IZnW898uEsZn0O/8vw7PnrAaEU=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr16415743uam.5.1622570880939;
 Tue, 01 Jun 2021 11:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwny5j11SCprlxyI5xNmMSSpHX2u/Osu30XOEfN46tryBh+3nP0yZ+H9aqXqIKIonC4tHBgfDbgIMNGRCUe4c0=
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr16415695uam.5.1622570880647;
 Tue, 01 Jun 2021 11:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210528023220.417057-1-jsnow@redhat.com>
 <20210601154546.130870-1-crosa@redhat.com>
 <20210601154546.130870-2-crosa@redhat.com>
 <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
In-Reply-To: <CAKJDGDbK40mcg4n7KMNymAhv=q2R+mbGzT+NC3_OgA3a7mn6_g@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 1 Jun 2021 15:07:34 -0300
Message-ID: <CAKJDGDY00HEtoSzLD01c-oHeWA6n5-Er-s=+mFMQJ7T4frFx3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 1, 2021 at 2:36 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>
> On Tue, Jun 1, 2021 at 12:46 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > The utility function actually accepts a string, and not the raw
> > dictionary response from QMP.  Also, it returns (optionally) an
> > integer, so that must also be accounted for.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/vm/basevm.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> > index 6f4f0fc95e..0f2e436ed3 100644
> > --- a/tests/vm/basevm.py
> > +++ b/tests/vm/basevm.py
> > @@ -227,7 +227,7 @@ def _ssh_do(self, user, cmd, check):
> >                     "-o", "UserKnownHostsFile=" + os.devnull,
> >                     "-o",
> >                     "ConnectTimeout={}".format(self._config["ssh_timeout"]),
> > -                   "-p", self.ssh_port, "-i", self._ssh_tmp_key_file]
> > +                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
> >          # If not in debug mode, set ssh to quiet mode to
> >          # avoid printing the results of commands.
> >          if not self.debug:
> > @@ -305,7 +305,7 @@ def boot(self, img, extra_args=[]):
> >          # Init console so we can start consuming the chars.
> >          self.console_init()
> >          usernet_info = guest.qmp("human-monitor-command",
> > -                                 command_line="info usernet")
> > +                                 command_line="info usernet").get("return")
> >          self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
>
> From here, your file differs from the upstream and your patch does not
> work. I'm trying on commit 52848929b70dcf92a68aedcfd90207be81ba3274.

Talking to Cleber he mentioned he submitted In-reply-to John's PR, but
Gmail did not show it for me.

On top of John's PR
(https://patchew.org/QEMU/20210528023220.417057-1-jsnow@redhat.com/):

Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>
> >          if not self.ssh_port:
> >              raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
> > --
> > 2.25.4
> >


