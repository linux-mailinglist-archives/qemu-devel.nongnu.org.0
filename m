Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763614C1878
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:21:58 +0100 (CET)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuOr-0002iJ-80
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMuLo-00016w-15
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMuLk-0006XI-5K
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645633122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qf56R+o+f5rnj3gy1XufJP+Z7XCSsizyuKebQN0Mroo=;
 b=EDq7oenHza9omQYiHG6DC+J/2Dip0gAwViOpAyzB5jRGK6OmuSywphVoLN4hD4hark9tFu
 AT8F/J2PbTNxE5chMej1Bj29WghBVxUVN6H3XM3LwQSNTOPrNrK9Rox7dq6xjqmptbfQ7t
 FcEsSwncQVEN5DgFO9L52jsTkU59F4o=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-N9Nc79KaMCC5ruGCafBJTQ-1; Wed, 23 Feb 2022 11:18:40 -0500
X-MC-Unique: N9Nc79KaMCC5ruGCafBJTQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 n19-20020ab03b13000000b00342ad041b5fso1716823uaw.13
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qf56R+o+f5rnj3gy1XufJP+Z7XCSsizyuKebQN0Mroo=;
 b=sJzjIyvCgtgFSTREy2k9/oKhrPPkuzTiFYzLfeKoPcbwiE2kNPIEp+y2oZUqCRpcxz
 8DUUmjCarXNF1IvHkPpgdnp9Gk4ONjtZi1T4QKfYD+z+VKopdsaOlDyfeOchkD+PXNBt
 v5QZzopvprOyzcSjjnkrkYl01vQVg34LWldNZqo0VHPMz2+u3XiR0a8irS8srz8UUTF3
 10N5IfsdUVvmjwuk8A9LFtd4fUk+/abZJqyO/z7hT+24OfXVUlILWzJ6OLhbI7tnnPqC
 +S17NaxiH4FSXnymQyanrpQmk+dd7eJbyX3vq77FgXUNamhM6E1h9Y2gqxaZ+YeLb1FJ
 NG4w==
X-Gm-Message-State: AOAM530hGbdu4pXn3qacOkhXY0Ntpp0ZovyzRQASIgWwspsdaMG+vukO
 YTYgfZ/ErMWYu0gZhN1U1D+Lb+dTAaLrLV/Mea9QSoSyfQDqHc+RWTXydUSdCPZrcRVi2wcsQdU
 yMluw5YuBKhkyvXddKL/ou1RSfLlYw4I=
X-Received: by 2002:a67:4382:0:b0:31c:598:b659 with SMTP id
 q124-20020a674382000000b0031c0598b659mr106101vsa.11.1645633118074; 
 Wed, 23 Feb 2022 08:18:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBZljUX6iMEhIlcL5gi6Xt7pb/nPU0rG5a+3uQImxtOX5dXdhgeTmLLV+UuY1sEIC5keAxamr7KcTq2KRMnls=
X-Received: by 2002:a67:4382:0:b0:31c:598:b659 with SMTP id
 q124-20020a674382000000b0031c0598b659mr106091vsa.11.1645633117798; Wed, 23
 Feb 2022 08:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
In-Reply-To: <YhZWcFY1sGSV/OX8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 11:18:26 -0500
Message-ID: <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 10:44 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
> > On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
> > > > On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
> > > > <damien.hedde@greensocs.com> wrote:
> > > > >
> > > > > This option makes qmp_shell exit (with error code 1)
> > > > > as soon as one of the following error occurs:
> > > > > + command parsing error
> > > > > + disconnection
> > > > > + command failure (response is an error)
> > > > >
> > > > > _execute_cmd() method now returns None or the response
> > > > > so that read_exec_command() can do the last check.
> > > > >
> > > > > This is meant to be used in combination with an input file
> > > > > redirection. It allows to store a list of commands
> > > > > into a file and try to run them by qmp_shell and easily
> > > > > see if it failed or not.
> > > > >
> > > > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > > >
> > > > Based on this patch, it looks like you really want something
> > > > scriptable, so I think the qemu-send idea that Dan has suggested mi=
ght
> > > > be the best way to go. Are you still hoping to use the interactive
> > > > "short" QMP command format? That might be a bad idea, given how fla=
ky
> > > > the parsing is -- and how we don't actually have a published standa=
rd
> > > > for that format. We've *never* liked the bad parsing here, so I hav=
e a
> > > > reluctance to use it in more places.
> > > >
> > > > I'm having the naive idea that a script file could be as simple as =
a
> > > > list of QMP commands to send:
> > > >
> > > > [
> > > >     {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
> > > >     ...
> > > > ]
> > >
> > > I'd really recommend against creating a new format for the script
> > > file, especially one needing opening & closing  [] like this, as
> > > that isn't so amenable to dynamic usage/creation. ie you can't
> > > just append an extcra command to an existing file.
> > >
> > > IMHO, the "file" format should be identical to the result of
> > > capturing the socket data off the wire. ie just a concatenation
> > > of QMP commands, with no extra wrapping / change in format.
> > >
> >
> > Eugh. That's just so hard to parse, because there's no off-the-shelf
> > tooling for "load a sequence of JSON documents". Nothing in Python
> > does it. :\
>
> It isn't that hard if you require each JSON doc to be followed by
> a newline.
>
> Feed one line at a time to the JSON parser, until you get a complete
> JSON doc, process that, then re-init the parser and carry on feeding
> it lines until it emits the next JSON doc, and so on.
>

There's two interfaces in Python:

(1) json.load(), which takes a file pointer and either returns a
single, complete JSON document or it raises an Exception. It's not
useful here at all.
(2) json.JSONDecoder().raw_decode(strbuf), which takes a string buffer
and returns a 2-tuple of a JSON Document and the position at which it
stopped decoding.

The second is what we need here, but it does require buffering the
entire file into a string first, and then iteratively calling it. It
feels like working against the grain a little bit. We also can't use
the QAPI parser, as that parser has intentionally removed support for
constructs we don't use in the qapi schema language. Boo. (Not that I
want more non-standard configuration files like that propagating,
either.)

It would be possible to generate a JSON-Schema document to describe a
script file that used a containing list construct, but impossible for
a concatenation of JSON documents. This is one of the reasons I
instinctively shy away from non-standard file formats, they tend to
cut off support for this sort of thing.

Wanting to keep the script easy to append to is legitimate. I'm keen
to hear a bit more about the use case here before I press extremely
hard in any given direction, but those are my impulses here.

--js


