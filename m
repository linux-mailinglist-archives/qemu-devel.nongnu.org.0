Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42227588C6E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:51:54 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDqq-0005zb-OZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJDWb-00088j-Gk
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:31:01 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJDWY-0001sP-LI
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:30:56 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-322b5199358so167282087b3.6
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EnEMZUisXgxKUeKdBWNakeH0nco9cqyUMj7sIOSeHts=;
 b=wBjZ4EWoT3IXM2rvQgo/t7iMO7Z6AqfGm1GIQmNIFjGGTHlyeJG7j1I2OSrRNvcZI4
 24k2WM2IKnHBV+ZCeUtBpy9JaD4ym2P6O+Sx6iXEqf2s+MM7dXPgBrJhpqxTlshnWOMT
 /XRRnl44vtKcEGy1+RuPHeeVZJb9bUtlui8lVbF4jDWRWBfRpg9A9wh22QqGgYpyZro9
 6mPOg56X+aQwz5+G9KEi4Ju7IBHwv2yJCyMFsdag7FlqLd4YMjaQmfBhB889xA+9o19G
 YBs3fUN7HMTCdp4gc1AwBypOKpTd50FqXhhWGSbE7h8UTKaX2R5dZPh3u2SRGxGR64Xy
 7m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EnEMZUisXgxKUeKdBWNakeH0nco9cqyUMj7sIOSeHts=;
 b=1lStZzxfcLiP6FCauOCqgEQ5svVDA/FEWhFTTZCUkTe5YoBHK9z8cEEb5pn4DHlIuc
 Bn/pU3lMsF3cjbU8O30Ax3L3goa1lBew4twGhVRNASF05CD2uayqIRbgDWUqT8gy19iR
 /AzXp0o1mOsY8/eUzs9YMJE4/OdmsC3isUspsxM5dfjdepTgtfvnI0qpA3HQCfu9hYi6
 1LLh0/AUoUZFQvK/f95zxHEFBu8bwNHMjsOgtuNkeiKu7g+IXDsmco2dJUPt/Buo6U6+
 mN0xi5AzOG2eezlbAMbZMQr9gse2GYDelxjnK7tUF0mOJzUY/OZ9HJCLkFXPnRkc9xzQ
 55TQ==
X-Gm-Message-State: ACgBeo12VpetNOMwDFnAjYZYaAtZzyU5ETLFolkwdjTuBwm4y/mV9mH+
 q3xQwZLc0F2vMgT4dN0MJL1Ozqmifdk5vp5DtHgclQ==
X-Google-Smtp-Source: AA6agR6Acf24aJyXoKtZHIzM4mHsOgSx8fBe4RDwSTNj0C85t8ZJsrkChHB/cJrEukq03vD9OsUKczAH0kPtBUTlaZM=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr23699810ywd.64.1659529853465; Wed, 03
 Aug 2022 05:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <20220729130040.1428779-3-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-3-afaria@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Aug 2022 13:30:13 +0100
Message-ID: <CAFEAcA83Eaw59H7ha0hScvX1yF8LrJatWqD-hnX0eVy+Ne4EUQ@mail.gmail.com>
Subject: Re: [RFC v2 02/10] Drop unused static function return values
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 29 Jul 2022 at 14:09, Alberto Faria <afaria@redhat.com> wrote:
>
> Make non-void static functions whose return values are ignored by
> all callers return void instead.
>
> These functions were found by static-analyzer.py.
>
> Not all occurrences of this problem were fixed.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>

>  65 files changed, 248 insertions(+), 403 deletions(-)

The problem with a patch like this is that it rolls up into a
single patch changes to the API of many functions in multiple
subsystems across the whole codebase. Some of those changes
might be right; some might be wrong. No single person is going
to be in a position to review the whole lot, and a +248-403
patch email makes it very unwieldy to try to discuss.

If you want to propose some of these I think you need to:
 * split it out so that you're only suggesting changes in
   one subsystem at a time
 * look at the places you are suggesting changes, to see if
   the correct answer is actually "add the missing error
   check in the caller(s)"
 * not change places that are following standard API patterns
   like "return bool and have an Error** argument"

thanks
-- PMM

