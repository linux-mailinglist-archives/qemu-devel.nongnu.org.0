Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C184C1613
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:03:33 +0100 (CET)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMtAy-0004be-Dw
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMt9C-0003dO-Ar
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMt8u-0002Ag-Cm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645628480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da2fO6Fqgf/GTIc/nnVeZuFJU9TerpSF4TSOlYDM6E4=;
 b=hGCCE5prCIai/jXu7l94ytSdIya7VVOmxM21QoAlKyUD7c42LHYNcqa267XYHNu/p+xdLd
 Ry95ZSX+VOBX2WcLVl1QQX0ADjCQ94HxI9g3W7hPB4EJchlbDr4aCqOmmGxQaGSy2y2pUq
 IaYQmfR1XIO2PXVkhQJzML7hoj2axc8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-_gSyOFcvO2usVmhislW4MA-1; Wed, 23 Feb 2022 10:01:17 -0500
X-MC-Unique: _gSyOFcvO2usVmhislW4MA-1
Received: by mail-vk1-f200.google.com with SMTP id
 i127-20020a1f5485000000b0032c6189ea3eso2792016vkb.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 07:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=da2fO6Fqgf/GTIc/nnVeZuFJU9TerpSF4TSOlYDM6E4=;
 b=hDEEiyCcowkchkOLTJuJgbgp5G8Z3EZHHd1OjDCdsNYwwlsZn7IuFLwspwMrmwNFTk
 CNI1pE6FJ6FT4WGUVQWPPHx5+l3k86hUJ5bRmQAfJZkFndbYOArmJDKvB6SLeMrxUUM8
 AZinm44QN8JwwgAHiWUhghqrlquspcYBoSW6aqQLstYToybEbmJoabDNCnnvaKJ/Br9S
 zYp+1Z2uRPx77nYoeIvI0p7WBAAWyd86DI7UhRiVHe8fS9vMSsSvahdrG1Er2BDLIFqA
 N7T3ZWfuWRKAOk778rQIgvP24fdjfQ+32JC3jNAd+RwrCdimmN3YPjBVW15C5STkQpeA
 p2Tw==
X-Gm-Message-State: AOAM533ng+gOeWpcSj/5LOwrbrQKeoW37NlPB1inDjtMcWqohAUnjDpv
 vxUFVG2zrw5jNdcLh9dbQnxxmiQJVqG0BKYK2TPqQq6f0UBecoCf5B5fuO2lkx19FdD8UnGWrVQ
 KbyHHyZ7aK6nsJCi28T5u4HpVL1jLxOU=
X-Received: by 2002:a67:fc13:0:b0:31c:5602:12f with SMTP id
 o19-20020a67fc13000000b0031c5602012fmr6277942vsq.38.1645628477046; 
 Wed, 23 Feb 2022 07:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0OjSM7xsUMxOP2tU7cJ4KdH24EtqJ/JCSXjmNHA/BsaqKff9aK6y2epn7ay9jCrjlu7eyuts7k0OThY3/rwU=
X-Received: by 2002:a67:fc13:0:b0:31c:5602:12f with SMTP id
 o19-20020a67fc13000000b0031c5602012fmr6277927vsq.38.1645628476807; Wed, 23
 Feb 2022 07:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
 <YhSrD/gmlMkumkah@redhat.com>
 <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
 <YhS7nE+6++YN4exZ@redhat.com>
 <eb1d52ef-d358-57bd-1468-cff84ace8d20@greensocs.com>
 <YhYW562k1IBTlHag@redhat.com>
In-Reply-To: <YhYW562k1IBTlHag@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 10:01:05 -0500
Message-ID: <CAFn=p-aQhj4xgPq9fkz5f34vWdJQraPsXY33Qw1KmebdMFsDog@mail.gmail.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
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
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 6:13 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Feb 23, 2022 at 10:57:29AM +0100, Damien Hedde wrote:
> >
> >
> > On 2/22/22 11:31, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Feb 22, 2022 at 10:38:09AM +0100, Damien Hedde wrote:
> > > >
> > > >
> > > > Here I just wanted to propose a simple way to just send a
> > > > bunch of commands from a source file and stop if something unexpect=
ed
> > > > happens.
> > > > Only goal is to be able to share a file on the ml and allow people =
to
> > > > reproduce easily.
> > > > We can already redirect the input, but it is almost impossible to s=
ee
> > > > if something failed.
> > >
> > > Yes, I see what you mean. So the problem with using 'socat' or simila=
r
> > > is that we fill the input with commands and response appear asynchron=
ously,
> > > so we can't match them up easily. This is actually a problem seen in =
the
> > > block I/O tests which just send QMP stuff in a batch.
> > >
> > > While you could do this by invoking socat once for each command, that
> > > gets silly with the repeated QMP handshake for each command.
> > >
> > > The thing about using qmp-shell is that it does a bunch of extra stuf=
f
> > > targetted at humans on top, and history tells us it isn't a good idea
> > > to mix stuff for humans and machines in the same tool/interface.
> > >
> > > How about instead creating a separate 'qmp-send' command that is not
> > > much more than a "QMP-aware socat".  By which I mean, it just reads
> > > raw QMP commands from stdin, sends each one to the server, but
> > > crucially waits for a reply after sending each, and stops on first
> > > error reponse.
> >
> > By 'qmp-send' command, you mean another script in scripts/qmp ?
> > Yes
>
> Yep.
>
> > If we go for another script, I would rather do one with wrap
> > feature (like your series) to start qemu as well.
>
> Sure, that would certainly make sense.  I actually wanted to add
> the wrap feature directly into the existing qmp-shell, but it was
> not viable while maintaining back compat. With a new qmp-send
> command you can easily make "wrap mode" supported from the start.
>

I'm also wary of adding scriptable interfaces to qmp-shell, but I can
see them having some value.

I'm not against the ability to add some kind of "load commands from
file" interactive command to qmp-shell, for instance. (/LOAD or /PLAY
or something?) ... but then we need to worry about what the format of
the file is and how exactly that scripting language works. It's a
design minefield.

I can also see the use in having qmp-shell autoplay a script file at
startup and then resume interactive function (Saves you some typing!),
but that opens the door to people using it as a script in and of
itself and coming to rely on it, which I really would not like to see.
A standalone qemu-send that supports launching QEMU (with args) and
taking a script file from the CLI sounds great, though.

There's still some design questions I have, though: What features do
you need out of the script file? What syntax do you intend to use?
Does it need event waits? How complex do they need to be? I'm fine
with something simple, but I can see cases where we might begin to
want slightly more power out of it. I see good utility for test
reproductions shared on the ML and in bug trackers, though.

--js


