Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BE4E7ADE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:41:29 +0100 (CET)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXrgV-0007hH-KB
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:41:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXrfi-00070O-2m
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXrff-0007GO-DX
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 17:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648244434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m3Rrw3mbvgtVLZxSAI80EcvYj4PCSRDx/o15QUaVa9g=;
 b=PEfnTjFNH2VhO9IM8U9kTZ2wKpAzR2AyjZKKdWtza4BGyrzJ632UnNGhgUaqCJHk65CfZz
 xE48wnf51+COo6R5WQWCJ6UU9dRNDjmy7I0Ok22exrIzgS5MMssO+ZTbuhbQAMFwUZ1wPJ
 pX4tOD+87xIyuGbY/PCNisk5Pv/BpHc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-o6Vo36KiPbqFgAEMIBSWUQ-1; Fri, 25 Mar 2022 17:40:32 -0400
X-MC-Unique: o6Vo36KiPbqFgAEMIBSWUQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 j16-20020ab01850000000b003517f6bb1easo2392728uag.10
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 14:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3Rrw3mbvgtVLZxSAI80EcvYj4PCSRDx/o15QUaVa9g=;
 b=41diFH47rqQSovwq79g9gbSP+B/B68qHrzM1Jb2OxyLoCRiwMnUSFTvPPkVwv7y658
 FdUq9fKIoS+Em6IZUPfIZcw8ci0gkBAPLvr5Z9yzV89AJ2cDKjL2glcexpUVXj56QEdm
 t8K8lMKX55jvjs115sluWbtZuvbYvLIqHZxTg/u6tbbjkZVeGXmpArFIrHMW720KgCWR
 otDNUFylIA19+1XpDMyPupWO7/mk5UulaK16KI7Sh6Y9tqcF5JGZ3n/Q57ei9yykHWRE
 rxLIhA65/JxhfbB4Y70PaLqccLh+WO65bLNmN2jx6hwuRobEjicFNuBJyDd2HjJp67Gu
 V6/A==
X-Gm-Message-State: AOAM5339APLptWQZz3l0JxQzB4rqcF9dGNSce+oGp4gG9r92A7aEcJBk
 Qo+DxqHyjEK2lCbShNbDIxBvfZCpoUchA4lMnBO0+udaQHK9949Hj+/KDyxRFxmjDEd3jnGvpmy
 mI4OHlzbcncDKPNtrFahMvWKid8Cz8WY=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr6271871vse.61.1648244432285; 
 Fri, 25 Mar 2022 14:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE1oWeWn0b0jbWbrK4BSYogR0sAZRgK2M4pFHU0v76e1oPmWIDNi0N5ll/bQj9ifVvazrDfw7ex39+uLmDvsE=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr6271865vse.61.1648244432023; Fri, 25
 Mar 2022 14:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-3-victortoso@redhat.com>
 <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
 <CAFn=p-bMTFpikwR5JMQWCP1rPSnn55JPpfy-QuREO91MD6jKmg@mail.gmail.com>
 <87o81unqxx.fsf@pond.sub.org> <20220325205925.7nevlaxooltv7ly7@tapioca>
In-Reply-To: <20220325205925.7nevlaxooltv7ly7@tapioca>
From: John Snow <jsnow@redhat.com>
Date: Fri, 25 Mar 2022 17:40:21 -0400
Message-ID: <CAFn=p-YkMMy4fCW7E5BqgjJwqdndwayPdcGWrF8+3cTya2d-cQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 4:59 PM Victor Toso <victortoso@redhat.com> wrote:
>
> Hi,
>
> On Fri, Mar 25, 2022 at 01:43:06PM +0100, Markus Armbruster wrote:
> > John Snow <jsnow@redhat.com> writes:
> >
> > > On Thu, Mar 24, 2022 at 3:15 PM John Snow <jsnow@redhat.com> wrote:
> > >>
> > >>
> > >>
> > >> On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
> > >>>
> > >>> Fatal is not optional.
> > >>>
> > >>> Signed-off-by: Victor Toso <victortoso@redhat.com>
> > >>> ---
> > >>>  qapi/block-core.json | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/qapi/block-core.json b/qapi/block-core.json
> > >>> index e89f2dfb5b..585a9e020e 100644
> > >>> --- a/qapi/block-core.json
> > >>> +++ b/qapi/block-core.json
> > >>> @@ -5008,7 +5008,7 @@
> > >>>  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
> > >>>  #      "data": { "device": "ide0-hd0", "node-name": "node0",
> > >>>  #                "msg": "Prevented active L1 table overwrite", "offset": 196608,
> > >>> -#                "size": 65536 },
> > >>> +#                "size": 65536, "fatal": false },
> > >>>  #      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
> > >>>  #
> > >>>  # Since: 1.7
> > >>> --
> > >>> 2.35.1
> > >>
> > >>
> > >> Is this the correct fatality setting for this particular case? Default is implied to be true.
> > >
> > > (1) We don't seem to actually emit this particular message anymore. I
> > > don't think it exists in the tree.
> >
> > I doubt we ever emitted it.
>
> Out of curiosity, shouldn't we deprecate it then?
>

He means: we probably never emitted that specific error message. The
*event* is in use, see iotest 060.

> > > (2) The only fatal=False messages I can see is
> > > "Cannot free unaligned cluster %#llx"
> > >
> > > (Try grepping for qcow2_signal_corruption)
> > >
> > > so maybe we should pick a new example that might really exist. iotest
> > > 060 seems to test this, so that can be used as a guide.
> >
> > Yes, please.
>
> I'll be changing it on v2


