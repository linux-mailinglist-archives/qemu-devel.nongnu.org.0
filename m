Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BB5FE533
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:24:40 +0200 (CEST)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6d5-0000g2-IJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj6GS-0000Rg-45
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 18:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj6GP-0007gw-4C
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 18:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665698472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iF0bAvMZpKcz6Yp8gJQHUr2yf6LEe5KLr2h0xqDTYlI=;
 b=SLPxVW47AX5kbq827Wl29NlOROwynMSc8Zr4WnYOqtDYYFSv9QK0fc0iYXdj1u2RUHZIxP
 adxTCiC1GnZPIncEHad3kqr9D/UxsKB0J4c/2OayHXLBzVELLsyIoq96/pNMQuR2snt/bC
 U669iaUHdHa/nCyy+llyftC31CqOfmM=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-zxo-__jlPqOq6B8fGFe3FA-1; Thu, 13 Oct 2022 18:01:11 -0400
X-MC-Unique: zxo-__jlPqOq6B8fGFe3FA-1
Received: by mail-vs1-f69.google.com with SMTP id
 63-20020a671542000000b003a65bca366fso823888vsv.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 15:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iF0bAvMZpKcz6Yp8gJQHUr2yf6LEe5KLr2h0xqDTYlI=;
 b=2DjGXy4nSyk82CnJGAlHlwjPTV8ZBTnm2lfO00jx0ZvUR2w/aToX8PXINd1fLcFL1S
 Yv/Jhbrc9xy2jobOiIzSr8MY6RSK/HI31slrXjashaFdFcsBNGWp3+i5Ap06F2hZYL4A
 VLSA1PpXKlOR5gVRrvgNmD2VfaHi5llacCbnaggiK1U5SVutOUYdGKNK0XjpUN60x/fJ
 8VNGDzpsbil+sJJGJ8gNvq2fYSUA6NHkg5yOr0UsSBUD0UoWINqMmV28EAOwbnqmNSvT
 qlpWcEGYInCCUh6tNCaOh0wKHMxgE9rQN0wMgmiosMPwlLvESe17FZ/rUU3B3fbSCXXN
 7Ahg==
X-Gm-Message-State: ACrzQf20Yxte+RrjKZESTjsg/Q3GcWFW3Udkn6P0wraLezd/h9oAsZuS
 nxK397r/VPud43AR45RyaXfGJy6r7zPxWGb/Y57I8Yl32rSyTPZbOr086j9j4+iUaAXyyGTfn4a
 mjNqWPvB/w4jddW1im+wR70rmp2v7+rc=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr1326662vsh.42.1665698470179; 
 Thu, 13 Oct 2022 15:01:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NvWSJOiEFzvCJIy4O2OoyZQ3eF7OT0hx+f2vfvWv0gFBPFYvAMXAvYdwoKZxaOmYfdpr6zdYInqmldh88+v0=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr1326625vsh.42.1665698469250; Thu, 13
 Oct 2022 15:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 14 Oct 2022 00:00:58 +0200
Message-ID: <CABgObfZD__Z=g3rvXxYVLcYb9wtkdQ14=mgMpsKoiVRxFCicUw@mail.gmail.com>
Subject: Re: [RFC v2 00/10] Introduce an extensible static analyzer
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 29, 2022 at 3:01 PM Alberto Faria <afaria@redhat.com> wrote:
> Performance isn't great, but with some more optimization, the analyzer
> should be fast enough to be used iteratively during development, given
> that it avoids reanalyzing unmodified translation units, and that users
> can restrict the set of translation units under consideration. It should
> also be fast enough to run in CI (?).

I took a look again today, and the results are indeed very nice (I
sent a patch series with the code changes from this one).

The performance is not great as you point out. :/  I made a couple
attempts at optimizing it, for example the "actual_visitor" can be
written in a more efficient way like this, to avoid the stack:

    @CFUNCTYPE(c_int, Cursor, Cursor, py_object)
    def actual_visitor(node: Cursor, parent: Cursor, client_data:
Cursor) -> int:

        try:
            node.parent = client_data

            # several clang.cindex methods need Cursor._tu to be set
            node._tu = client_data._tu
            r = visitor(node)
            if r is VisitorResult.RECURSE:
                return 0 \
                    if conf.lib.clang_visitChildren(node,
actual_visitor, node) != 0 \
                    else 1
            else:
                return r.value

        except BaseException as e:
            # Exceptions can't cross into C. Stash it, abort the visitation, and
            # reraise it.
            if exception is None:
                exception = e

            return VisitorResult.BREAK.value

    root.parent = None
    result = conf.lib.clang_visitChildren(root, actual_visitor, root)

    if exception is not None:
        raise exception

    return result == 0

However, it seems like a lost battle. :( Some of the optimizations are
stuff that you should just not have to do, for example only invoking
"x.kind" once (because it's a property not a field). Another issue is
that the bindings are incomplete, for example if you have a ForStmt
you just get a Cursor and you are not able to access individual
expressions. As a result, this for example is wrong in the
return-value-never-used test:

                static int f(void) { return 42; }
                static void g(void) {
                    for (f(); ; ) { } /* should warn, it doesn't */
                }

and I couldn't fix it without breaking "for (; f(); )" because AFAICT
the two are indistinguishable.

On top of this, using libclang directly should make it possible to use
the Matcher API (the same one used by clang-match), instead of writing
everything by hand. It may not be that useful though in practice, but
it's a possibility.

Paolo


