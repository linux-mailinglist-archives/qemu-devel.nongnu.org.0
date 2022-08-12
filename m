Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813C591379
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:06:46 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXBM-0001H8-Ef
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMWuQ-0008Kz-KJ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 11:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oMWuH-0001xj-VI
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 11:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660319343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgpdaGRKSfFf+4tNJPqkymrn0uY3U+jaiX4graWt41I=;
 b=E4dHJUntg1tFIOpClKhhsHtQHRCqjnyfYQa1WbGombELBOEYzNA3453qIWwBQlMQIb3b47
 9jTKFWKAEGwYeZrAQhEzP+5Qah+fvmgTKBGiu2ib+hxS4/OfIKKeQtv4XZq4bNpDTvAEUz
 cXA6FFgTuOAVsLFPqdLvWRVmghuTNoc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-qbFjOY2uNcST-f6MQZN1RA-1; Fri, 12 Aug 2022 11:49:02 -0400
X-MC-Unique: qbFjOY2uNcST-f6MQZN1RA-1
Received: by mail-il1-f198.google.com with SMTP id
 k15-20020a92c24f000000b002e2f53254d2so804770ilo.15
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=zgpdaGRKSfFf+4tNJPqkymrn0uY3U+jaiX4graWt41I=;
 b=0Eav+lTfjN/oNDOxvI8AA/G9sjopH07l4lglqW5OZ9/D5vErS0sP6RVbLfhuUbgRGf
 rBSvdKNlSuT6/kT4clHbO4JvPN4crkfHId0hVxanuVwkok7noDZoGOKE43BA5QAnEeE2
 InyJaWt3BDdYQUuvMpevafDe5Q2Wx0sXPDmlefEYqWbJ0QuRsr6yt6Ru/tetJaNx1pMN
 rBccSiR7MB82IMaaAVTbKv2IIDL/WZ6xcpTBLqobqvcn+3HX/Y6x8b5ym/XyipiTUY6f
 oZZH//93O2csZi/nWJQl8AIi+WOMHO9BbC1fBsB9zKT1/EXzfJ79k4pRNji34aPdJKix
 neUg==
X-Gm-Message-State: ACgBeo1KRzMPSOeb7qVfin6rRyUOGsF1CEADtYki9+zETphJSneklc/M
 856KVnjwgyhzFJYhgquKKwlb/95hophIY3/WZNeTiZdfSuZT/AEsTOfO+4uax/ccyR+seRTwhzN
 ZUwS7LjT1r+enRD5kqPPFGIT/BIFgZNI=
X-Received: by 2002:a5d:8953:0:b0:67c:aa4c:2b79 with SMTP id
 b19-20020a5d8953000000b0067caa4c2b79mr2031906iot.172.1660319342052; 
 Fri, 12 Aug 2022 08:49:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR62JLfasHZz8jVQ0EIIR0gp2DCnvJMNuBgUaXn/nE11wZ1VpJE8eHiws8Jx/HNrQ/sXpV7Ger4g4dmsbN4xgnA=
X-Received: by 2002:a5d:8953:0:b0:67c:aa4c:2b79 with SMTP id
 b19-20020a5d8953000000b0067caa4c2b79mr2031887iot.172.1660319341843; Fri, 12
 Aug 2022 08:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <CAMxuvazGhtbPUSoM-NiAbTnRnOQ=MEnkMAVyVgOg4zc37HJ1-w@mail.gmail.com>
In-Reply-To: <CAMxuvazGhtbPUSoM-NiAbTnRnOQ=MEnkMAVyVgOg4zc37HJ1-w@mail.gmail.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 12 Aug 2022 16:48:26 +0100
Message-ID: <CAELaAXxeNOkmSkh6t9Q-eL=xJg8kEAY0O1x_PVFhUttSVH=urQ@mail.gmail.com>
Subject: Re: [RFC v2 00/10] Introduce an extensible static analyzer
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 4, 2022 at 12:44 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> Hi
>
> Great work so far! This seems easier to hack than my attempt to use
> clang-tidy to write some qemu checks
> (https://github.com/elmarco/clang-tools-extra)
>
> The code seems quite generic, I wonder if such a tool in python wasn't
> already developed (I couldn't find it easily searching on github).
>
> Why not make it standalone from qemu? Similar to
> https://gitlab.com/qemu-project/python-qemu-qmp, you could have your
> own release management, issue tracker, code formatting, license, CI
> etc. (you should add copyright header in each file, at least that's
> pretty much required in qemu nowadays). You could also have the
> qemu-specific checks there imho (clang-tidy has google & llvm specific
> checks too)

This is an interesting idea. Indeed, the analyzer is essentially a
more easily extensible, Python version of clang-tidy (without the big
built-in library of checks).

I think I'll continue working on it embedded in QEMU for now, mostly
because it depends on some aspects of the build system, and gradually
generalize it to a point where it could be made into a standalone
thing.

> It would be nice to write some docs, in docs/devel/testing.rst and
> some new meson/ninja/make targets to run the checks directly from a
> build tree.

Sounds good, I'll work on it.

> On fc36, I had several dependencies I needed to install manually (imho
> they should have been pulled by python3-clang), but more annoyingly I
> got:
> clang.cindex.LibclangError: libclang.so: cannot open shared object
> file: No such file or directory. To provide a path to libclang use
> Config.set_library_path() or Config.set_library_file().
>
> clang-libs doesn't install libclang.so, I wonder why. I made a link
> manually and it works, but it's probably incorrect. I'll try to open
> issues for the clang packaging.

That's strange. Thanks for looking into this.

Alberto


