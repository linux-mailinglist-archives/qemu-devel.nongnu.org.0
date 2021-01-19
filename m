Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6C2FB8A9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:31:32 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s2d-0000lW-Tn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1ryY-0006bV-A5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1ryW-0002pF-AI
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611066435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iog92KzPp/Sx+ZBs1Eicec3ijHe9imECogg5jp6Ap/s=;
 b=gs/RpaKPGhaEUhG9OoBM4iDOc6Kldye3x//zDdpRZNKKUFzM4KJiOk0l6+H5pjRu0ILN5M
 6wA2OAfdP5PMbmbwaeMlvRd/8MnQGBdG/krMfKM3qvQ0xIud2sKPK5XmMfFvc3KWSIaaYD
 0WOs9TVkkyU7YSXUqhoYwRjYfk0/ZAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Ciaq8KYFONGULIl5RGgnaQ-1; Tue, 19 Jan 2021 09:27:13 -0500
X-MC-Unique: Ciaq8KYFONGULIl5RGgnaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3915B8030A8;
 Tue, 19 Jan 2021 14:27:12 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FDF60C0F;
 Tue, 19 Jan 2021 14:27:03 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:27:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 05/30] Makefile: wrap ctags in quiet-command calls
Message-ID: <20210119142700.GG2335568@redhat.com>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-6-alex.bennee@linaro.org>
 <CAP+75-XSyx2yCpz5uvx2ZofCGY=9pQ88ffSDRSXVjJk48qXNFw@mail.gmail.com>
 <87h7ndutwx.fsf@linaro.org>
 <147a0893-c584-0a0a-7dde-c24888c3b7ce@redhat.com>
MIME-Version: 1.0
In-Reply-To: <147a0893-c584-0a0a-7dde-c24888c3b7ce@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 03:24:56PM +0100, Philippe Mathieu-Daudé wrote:
> +Daniel
> 
> On 1/19/21 11:00 AM, Alex Bennée wrote:
> > Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> >> On Fri, Jan 15, 2021 at 2:08 PM Alex Bennée <alex.bennee@linaro.org> wrote:
> >>>
> >>> For prettier output.
> >>>
> >>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> >>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >>> Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>
> >>>
> >>> diff --git a/Makefile b/Makefile
> >>> index 0c509a7704..bbab640b31 100644
> >>> --- a/Makefile
> >>> +++ b/Makefile
> >>> @@ -250,8 +250,13 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name
> >>>
> >>>  .PHONY: ctags
> >>>  ctags:
> >>> -       rm -f "$(SRC_PATH)/"tags
> >>> -       $(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
> >>> +       $(call quiet-command,                   \
> >>> +               rm -f "$(SRC_PATH)/"tags,       \
> >>> +               "CTAGS", "Remove old tags")
> >>> +       $(call quiet-command, \
> >>> +               $(find-src-path) -exec ctags            \
> >>> +               -f "$(SRC_PATH)/"tags --append {} +,    \
> >>> +               "CTAGS", "Re-index $(SRC_PATH)")
> >>>
> >>>  .PHONY: gtags
> >>>  gtags:
> >>> --
> >>> 2.20.1
> >>>
> >>
> >> Build now fails if ctags is not installed:
> >>
> >> $ if test -n "$MAKE_CHECK_ARGS"; then make -j"$JOBS" $MAKE_CHECK_ARGS ; fi
> >> CTAGS Remove old tags
> >> CTAGS Re-index /builds/philmd/qemu
> >> find: 'ctags': No such file or directory
> >> find: 'ctags': No such file or directory
> >> find: 'ctags': No such file or directory
> >> make: *** [Makefile:254: ctags] Error 1
> >> make: *** Waiting for unfinished jobs....
> > 
> > Wait what, how? Have you got ctags in your MAKE_CHECK_ARGS? How did it
> > not fail before?
> > 
> > I suppose we could add checks for all the tooling in meson but it seems
> > a little overkill for a developer convenience.  
> 
> I figured out I was still using the Docker images generated after
> testing Daniel's 'start using libvirt-ci's "lcitool" for dockerfiles'
> series:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772839.html
> 
> Daniel, lcitool's ansible/vars/projects/qemu.yml apparently has
> a strong dependency on ctags.

Huh ?  It doesn't mention ctags at all.  If it is present, it is only as
a side-effect of a dependancy from some other package we genuinely do need.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


