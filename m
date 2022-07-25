Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAE5803BD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:04:31 +0200 (CEST)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2RS-0001Xv-4B
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oG2PO-0000AH-UC
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:02:22 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oG2PN-0003ru-Ab
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:02:22 -0400
Received: by mail-qv1-xf34.google.com with SMTP id f9so9014677qvr.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PGijcCLwq52bdeg1Z47ZjBwgizewYqL4Dl1wIaxHLrM=;
 b=K1Bpm+JAAE079oECLKpLMjAALo3pMa6PtBpMADAPe263WOWbVzZ0WYNMN4YsFgBUL3
 K9zKy1VDgnf8KFhdOmYyK+slq4bo9OwVJkwz3yX3SsfwpZC4BdueVM9lKtGpmrqAlLnZ
 0EhmKO4K5F3rpc3gz725wIJNzhtk3ZhGBL6KV/9oPSPEETi7xgYGtpoPHPGAc2l04CB7
 g1FFnSUp8bl9vLzGt5R2ObL7paPlSwwK75JI/mOmr99u6uVb3LiHzTbojJ9LIoHIZaNh
 A1Jya8fSvk7RZ8S3IzTzP6dOquKxXzLb75yphcleDEIIqAfJtRnqmRr/EXcbqCI+oJON
 /SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PGijcCLwq52bdeg1Z47ZjBwgizewYqL4Dl1wIaxHLrM=;
 b=sBK9X8kOchzSx5DXf32dccsrTxIy1XtKFrpjSAIj/aX3nlfCKXW/4UFqOF3dgo21jQ
 Xf2eN7j5a6UXKfz6VBQ3eZks3i2JF2FmoLvCxNaOyz51dV9szjmIYpuzOOjxyVgOzZbE
 9Nzn0nYHEHoi/gWyj9+knBjkNl/qees+rXbJViWGH3NF8CC+VSS9LpzSswFicNl9UvOo
 AbbFy4EtthYAbL9F03p5vElnFbFukFUFbQqYcp1KkbQcrPEDMtpqY7TOPxdPzewh0ggu
 laFVZOvkxfclhu/Gsdn0ppESj63b6RgJWZLVH0ejfGeBlk4ik1R4WbHrkWaemzZyP9mN
 chxA==
X-Gm-Message-State: AJIora/acTlfoGgo1Ca7uLz7Z/1xEme2Py+1915cV5xm7ASsio0Z8hq3
 kjyUOtodNOJffQNAhO+5Khh6PQ==
X-Google-Smtp-Source: AGRyM1v6GDBdcOtxFSSabeyAhqYON0hvyopenMIdhQF/GOe4PhXodoR2bokvoIYZzgEpwNvV6T6CBQ==
X-Received: by 2002:a05:6214:1c4f:b0:473:7909:85e2 with SMTP id
 if15-20020a0562141c4f00b00473790985e2mr11852531qvb.69.1658772139957; 
 Mon, 25 Jul 2022 11:02:19 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 u24-20020a05622a199800b0031ec44aa37bsm8097135qtc.93.2022.07.25.11.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:02:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 25 Jul 2022 11:02:20 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, berrange@redhat.com, imammedo@redhat.com, 
 jsnow@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <20220716112943-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1567316665-1658772142=:87138"
Received-SPF: none client-ip=2607:f8b0:4864:20::f34;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1567316665-1658772142=:87138
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:

> On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> >
> >
> > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> >     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> >     1"?
> >     > > And if the directory exists I would fetch and checkout.
> >     >
> >     > There are two reasons I can think of why I do not like this idea:
> >     >
> >     > (a) a git clone of a whole directory would download all versions of the
> >     > binary whereas we want only a specific version.
> >
> >     You mention shallow clone yourself, and I used --depth 1 above.
> >
> >     > Downloading a single file
> >     > by shallow cloning or creating a git archive is overkill IMHO when a wget
> >     > style retrieval works just fine.
> >
> >     However, it does not provide for versioning, tagging etc so you have
> >     to implement your own schema.
> >
> >
> > Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> > I think all we need to do is maintain the same versioning logic and maintain
> > binaries of different  versions. Do we really need the power of git/version
> > control here? Dunno.
>
> Well we need some schema. Given we are not using official bits releases
> I don't think we can reuse theirs.

OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
the binaries in some other repo first. Everything else hinges on that. We
can fix the rest of the bits later incrementally.

>
> >
> >
> >
> >
> >     > (b) we may later move the binary archives to a ftp server or a google
> >     > drive. git/version control mechanisms are not the best place to store
> >     > binary blobs IMHO. In this case also, wget also works.
> >
> >     surely neither ftp nor google drive are reasonable dependencies
> >     for a free software project. But qemu does maintain an http server
> >     already so that't a plus.
> >
> >
> >
> >     I am not insisting on git, but I do not like it that security,
> >     mirroring, caching, versioning all have to be hand rolled and then
> >     figured out by users and maintainers. Who frankly have other things to
> >     do besides learning yet another boutique configuration language.
> >
> >
> > Yeah we do not want to reinvent the wheel all over again. 
> >
> >
> >
> >
> >     And I worry that after a while we come up with a new organization schema
> >     for the files, old ones are moved around and nothing relying on the URL
> >     works.  git is kind of good in that it enforces the idea that history is
> >     immutable.
> >
> >
> > Ah I see your point here.
> >
> >
> >
> >
> >     If not vanilla git can we find another utility we can reuse?
> >
> >     git lfs? It seems to be supported by both github and gitlab though
> >     bizarrely github has bandwidth limits on git lfs but apparently not on
> >     vanilla git. Hosting on qemu.org will require maintaining a server
> >     there though.
> >
> >
> >
> >     All that said maybe we should just run with it as it is, just so we get
> >     *something* in the door, and then worry about getting the storage side
> >     straight before making this test a requirement for all acpi developers.
> >
> >
> >
> >
> >
>
>
--2088271309-1567316665-1658772142=:87138--

