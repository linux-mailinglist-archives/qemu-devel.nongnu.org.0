Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C441969A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:45:07 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrsQ-0002yt-MA
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mUroB-00076p-DG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mUrnu-0002xw-OF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZdaWFBemLoYhUQiPIB/ns6VAGufrIe30kvNKT9IhKE=;
 b=fXHTOvEARXGTEB25P51vI1dbL3ejmn8wL+eLS7nZGR/TSzFOQpYtRY9zeH2+ULALVoWnZV
 y8tGpTh1ZoDwK0Tf5ro7VUEZN9vryPy84ISU3b/0bIuyx1BckWXyrYJ5+eLFjiQ/UScaM/
 vdAlDLfehuJ/rUyWkZzBUbXcc0tExrM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-Bcde4qh7Phy3zOFwzZSlwQ-1; Mon, 27 Sep 2021 10:40:21 -0400
X-MC-Unique: Bcde4qh7Phy3zOFwzZSlwQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 z7-20020a63c047000000b0026b13e40309so12986983pgi.19
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZdaWFBemLoYhUQiPIB/ns6VAGufrIe30kvNKT9IhKE=;
 b=o8xxV8VX8R21Ez+q07oPG9u3KBiC2OE31nFQt0ykxw6kQkydpjU+HhTCDH9pmwb+Ww
 XbXQQDdn0+SKZ4jJLwn4wVvg2DJ5m72G+ZWfwAxZQlOBkYhBDvpq6OVVl8sGcNpVtK9G
 mR0hYL2rxAsyz14guhtKTXGlQvZRTycHhD6WuXoGCiQOtgcdcKEY8eXCNhdR2j8DxuAU
 zSeI1O5rO3XVpoynPDA8TP3cmTxdK//39oqFR8dFFY5QDptDPDHmG2j5Ujz67Nr3l/Me
 P+ry2TGRO4/8JgoRReUVvRcexYOjuOe5UBXIj+M8DhHyMPZi7komDTeZL0EuSCZMZwBS
 2V3Q==
X-Gm-Message-State: AOAM532u6v1A2Rv4rZTbmhmSip20yk/ePbTgIjfv0mKns6EgXfvSTm3O
 pKuT/bYAmbkt7wi7aWZFBG6WbDlBqyG445XaCzb1NYBce+fB6z9WM4Gh7sRI+jro8ZOm3bk3z7j
 rIHbpiM4Fyr7gyKM9Lg8L97svmytPNzI=
X-Received: by 2002:a17:90b:14d6:: with SMTP id
 jz22mr282798pjb.203.1632753620775; 
 Mon, 27 Sep 2021 07:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIcNLXlwOsUB20BW8ByTylrPt3DqK9s7s1HQtboGNtKFTEmc0JH6wQ7UxPHVY0WpkdZfS9h4qd3RqUHAOzYtk=
X-Received: by 2002:a17:90b:14d6:: with SMTP id
 jz22mr282761pjb.203.1632753620386; 
 Mon, 27 Sep 2021 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210920204932.94132-1-willianr@redhat.com>
 <20210920204932.94132-5-willianr@redhat.com>
 <fe982e8e-5ead-5be7-48b3-3c962960f21a@redhat.com>
In-Reply-To: <fe982e8e-5ead-5be7-48b3-3c962960f21a@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 27 Sep 2021 11:39:54 -0300
Message-ID: <CAKJDGDa6D04FoSngCK5+vtNACR66fCn2iiBrOMfW_c7N03jp_w@mail.gmail.com>
Subject: Re: [PATCH 4/6] avocado_qemu: tweak ssh connect method
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 11:12 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 9/20/21 22:49, Willian Rampazzo wrote:
> > The current implementation will crash if the connection fails as the
> > `time` module is not imported. This fixes the import problem and tweaks
> > the connection to wait progressively when the connection fails.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index edb9ed7485..c3613f9262 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -13,6 +13,7 @@
> >  import shutil
> >  import sys
> >  import tempfile
> > +import time
> >  import uuid
> >
> >  import avocado
> > @@ -305,8 +306,7 @@ def ssh_connect(self, username, credential, credent=
ial_is_key=3DTrue):
> >                  self.ssh_session.connect()
> >                  return
> >              except:
> > -                time.sleep(4)
>
> 10 * 4 =3D 40
>
> > -                pass
> > +                time.sleep(i)
>
> sum([0..10[) =3D 45
>
> The described tweak. Almost the same, OK.
>

The idea is that, hopefully, the connection will complete in one of
the first tries, so the overall wait time will be less than using a
fixed number. In the worst case, it will wait 5 seconds more than the
original code.

> >          self.fail('ssh connection timeout')
> >
> >      def ssh_command(self, command):
> >
>


