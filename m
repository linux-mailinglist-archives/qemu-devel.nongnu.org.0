Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC15953A2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:23:34 +0200 (CEST)
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqvG-0004TD-0k
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNqpS-0001J7-UO
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNqpR-00023W-7j
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660634252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NlYQWc+6aBw1qwGE9zxDoYsLr+macgpG/AeCk641Rw=;
 b=OYzYXUf1vsgVaNe208EkvG+kAla+TXjZ/Z/koTdh0cAoCQipLZCKNW/G8dDRAaKx983RlH
 W2ZOl6Bpz7j6pI3K5sSkPPEBq+5chM7tV0FaAoBchB1ms+tdXmeaemDWPwuY94EZqHr+ZV
 M+Z3yn39gf+pRn4DyoPVgms6w0vPWJI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-jsMDxqy1NoqYzWdLi1KgJw-1; Tue, 16 Aug 2022 03:17:30 -0400
X-MC-Unique: jsMDxqy1NoqYzWdLi1KgJw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-11c1fdd025cso5723fac.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 00:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=9NlYQWc+6aBw1qwGE9zxDoYsLr+macgpG/AeCk641Rw=;
 b=n+3nOmO850ctq+EagnzGOphYaZv9mYsTZuE7mcU/sr+II137irPD5M+KAS/jKcB8bs
 /XgF3aGRM7Fc2yYIRoPRjxwE8auwasFvYT5k6j4wZda6yxeAet9EVXew6JeDZ8u/vfp4
 db7xqVAwB/ja6EqMrviV2GtUhoRKvHhd4mO3s7C+6wwmcFm097Ythfq5guVnh8/oRXYn
 wkeTTNJBQ31lhqceSz/h5jWDu0P9kh+yTmP2hSxN2dGE/CeZJFgnR0NFrE5bj8d8jf4t
 RF/KLBotvofjCfwLzhnV6OozsCbQzKEfmxb+tKmQmCZ9yVQKZ1IUo0jFagFLIgfnk8/g
 JloA==
X-Gm-Message-State: ACgBeo2h70LueYbj6EKLFuZjQnrlIvRA4irJZCy31cjENhGU2c+/Tp9e
 fPl2n68WTvDmHK6LPJMXEpydvL0a0cYtxJcP2YUaonirB+1z+SMLpyr1cly2ozIaIeZQVxy1Srw
 KhCrdhaFFiOPuDOJ+wlKe6gArxjIbIUk=
X-Received: by 2002:a05:6830:2645:b0:638:99a4:e483 with SMTP id
 f5-20020a056830264500b0063899a4e483mr3722702otu.38.1660634250278; 
 Tue, 16 Aug 2022 00:17:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dSwjOmu6TOPXETS8+YQW7VuTxfhlUCtpD4IMoID4EXpwCKHWFhai1KGRFW9EAWX5yZpzZOhtiEDfa4kjtpMs=
X-Received: by 2002:a05:6830:2645:b0:638:99a4:e483 with SMTP id
 f5-20020a056830264500b0063899a4e483mr3722659otu.38.1660634250051; Tue, 16 Aug
 2022 00:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <CAMxuvazGhtbPUSoM-NiAbTnRnOQ=MEnkMAVyVgOg4zc37HJ1-w@mail.gmail.com>
 <CAELaAXxeNOkmSkh6t9Q-eL=xJg8kEAY0O1x_PVFhUttSVH=urQ@mail.gmail.com>
In-Reply-To: <CAELaAXxeNOkmSkh6t9Q-eL=xJg8kEAY0O1x_PVFhUttSVH=urQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 16 Aug 2022 11:17:19 +0400
Message-ID: <CAMxuvayCrw4VrB4HZweAJNMzarBpbXe-dG+wsisjjhqLVeJXJw@mail.gmail.com>
Subject: Re: [RFC v2 00/10] Introduce an extensible static analyzer
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Hannes Reinecke <hare@suse.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Peter Lieven <pl@kamp.de>,
 kvm@vger.kernel.org, 
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Weil <sw@weilnetz.de>, 
 Klaus Jensen <its@irrelevant.dk>, Laurent Vivier <lvivier@redhat.com>, 
 Alberto Garcia <berto@igalia.com>, Michael Roth <michael.roth@amd.com>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Aug 12, 2022 at 7:49 PM Alberto Faria <afaria@redhat.com> wrote:
>
> On Thu, Aug 4, 2022 at 12:44 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> > On fc36, I had several dependencies I needed to install manually (imho
> > they should have been pulled by python3-clang), but more annoyingly I
> > got:
> > clang.cindex.LibclangError: libclang.so: cannot open shared object
> > file: No such file or directory. To provide a path to libclang use
> > Config.set_library_path() or Config.set_library_file().
> >
> > clang-libs doesn't install libclang.so, I wonder why. I made a link
> > manually and it works, but it's probably incorrect. I'll try to open
> > issues for the clang packaging.
>
> That's strange. Thanks for looking into this.

No that's normal, I just got confused. clang-devel provides it.

However, I opened https://bugzilla.redhat.com/show_bug.cgi?id=3D2115362
"python3-clang depends on libclang.so"


