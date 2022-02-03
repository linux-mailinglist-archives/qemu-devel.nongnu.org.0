Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21444A90F7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 00:00:56 +0100 (CET)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFl5y-0000uz-2t
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 18:00:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFkxp-0002Zd-LE
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFkxk-0006br-5U
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643928743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EKeDnbHM2GsSbHTni9FkK5opV3rCcPaKyJvpr5BGP8M=;
 b=bpzEL6W4taAcdklD94+YoDJR1svjSAg4P8mxqzOgVqR+KOivnV3Xe/7cLR4oD1c80GVS4g
 /NqB6C5RE6znx7yESVN+wcGAU5klZF2YCOl9r6cijGaWQdyDefpUiz8/KLvT6E/Likarv+
 mDB8CXyFIczZ79YfwnrUvz/2iTiZMKE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-z2JVUwD9Pm21uaCgePwVew-1; Thu, 03 Feb 2022 17:52:22 -0500
X-MC-Unique: z2JVUwD9Pm21uaCgePwVew-1
Received: by mail-ua1-f72.google.com with SMTP id
 i25-20020ab03759000000b00308e68dcb1fso2425416uat.22
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 14:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EKeDnbHM2GsSbHTni9FkK5opV3rCcPaKyJvpr5BGP8M=;
 b=lYhQ+OmCnCghrzWScO8b8ICERXyeoKkqWPMahkBn4+FFTgrw3Fm2SeX03+5PPRF2wP
 7PBu4X3FxcZ9vvBt+bTwS1y4mUXrD5ONdjQ3B5Y4zhvGp8CCJ8egrwSBXYMb5duNWAj7
 QaPMUMZPBI5KJVzYDaapNLSp6Fl6K7w46T0CuZuVBvjH6FBrkTnrB+ZQEdjN9eQFywsN
 dBTD6OtpUcCmOcRJ+Ej8UstUiVHOSvlGHkCRUEJCjeSVZM43UQU1SHp13GRKQ/ldCHzG
 x2yEUzf0w6vzaDcNVATfmNfQ07zKOfSe03Fl7ZJI90iqbCGrxcE1zJA0q5Ov1lYi6C1E
 I4Ng==
X-Gm-Message-State: AOAM533b2yJ4AboutI2NsYpX6+r13Vm4pg5Vj1gwbsUVxKOiq1X+9l7+
 O6bwRUqrOGKXPciv8te+Y1RNn6Upy7zwQ4ygRQRC40i4/d7OrxvWxkApKYN6JftRamuIPFfeOZD
 RL4h7pDcjoZx6PdZ05K0dY89W2fePzmE=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr8028vso.61.1643928741650;
 Thu, 03 Feb 2022 14:52:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDajrpzZ+BGXDVG7Ucoiqde1BRx2STa1i+xRblBO+fQZDgr48cPK2eOlKU93CLCoLmNVgVPQ6iyL9isjlmpfE=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr8023vso.61.1643928741403;
 Thu, 03 Feb 2022 14:52:21 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <Yfuw1gGPPf8IPzLB@redhat.com>
In-Reply-To: <Yfuw1gGPPf8IPzLB@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Feb 2022 17:52:10 -0500
Message-ID: <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 3, 2022 at 5:40 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, Jan 26, 2022 at 01:58:19PM -0500, John Snow wrote:
> > (1) QAPI types the return of many commands as an empty object. That's
> > literally indeed what happens on the wire, and it makes sense in that
> > if these commands were ever to return anything, it is a "compatible
> > evolution" to include new fields in such an object. In Python, this
> > does not make much sense, though; as this is somewhat hard to
> > annotate:
> >
> > async def stop() -> Literal[{}]: ...
> >
> > The more pythonic signature is:
> >
> > async def stop() -> None: ...
> >
> > I feel like it's spiritually equivalent, but I am aware it is a
> > distinct choice that is being made. It could theoretically interfere
> > with a choice made in QAPI later to explicitly return Null. I don't
> > think we'd do that, but it's still a choice of abstraction that
> > reduces the resolution of distinct return signatures.
>
> As you mention though, bear in mind that a command returning
> nothing today, might return something tomorrow. IOW, we'd be
> going from a empty dict to a non-empty dict. If you use "None"
> then it'd be gonig from None to a non-empty dict.
>
> I think you can argue both of these approaches are backwards
> compatible. The python app is not likely to be looking at
> the return type at all initially - unlike C, errors get
> raised as exceptions, so you don't need to look at return
> type to distinguish succes from failure.
>
> So I'd consider it merely a documentation problem to say
> that a "None" return type might later change to a dict.
> Dunno how you represent that in python type annotations,
> but I presume there's a way.

I don't think type hints offer a temporal dimension to them yet :)

I started writing a much lengthier response, but the subject of
compatibility is really complex and I am not prepared to give a
comprehensive response to some of the issues you raise ... so instead
I will say "Wow, good points!" and I will get back to you on some of
it. A lot of things will only make sense if we are talking about a
very specific type of project, with very specific goals that are
clearly established. I don't really have that ready, here; I am just
experimenting to learn where some of the pain points are, still.

So... I'll get back to you on this.

> We do allow fields to be deleted, which is a *non-compatible*
> evolution, but they MUST have been marked as deprecated for
> 2 cycles first.

Good point.

> I'd say sorting required vs optional arguments is doomed as
> a strategy. Stuff that is mandatory today can be made optional
> tomorrow and I think that's reasonable to want todo as we
> evolve an API design.

Also a good point. Python requires all mandatory arguments precede all
optional ones, so you're probably right that in order to maximize
cross-version compatibility, keyword-only arguments for *all*
arguments both mandatory and optional is the only real way to fly.

I think this might cause problems for Marc-Andre in rust/dbus land,
but it's tractable in Python. I am unclear on the ramifications for
golang. (Victor, Marc-Andre, any input here?)

[...]

> So I think however you express API params in python needs
> to cope with this scenario, which means not sorting
> args based on optional vs required. Effectively need
> to assume that all args are potentially optional on a
> long enough timeframe.

We still have to sort them to fulfill Python grammar requirements, but
if they are *all* keyword-only, then the order the programmer uses to
actually invoke the function isn't important.

> I don't think you have any choice - they must all be keyword
> only if you want protection from future schema changes.

You're right, it's simply more robust.

> It sounds like you need a wrapper type.  This StrOrNull scenario
> is QMP's "alternate" type IIUC, but you're trying to avoid
> expressing the existance fo the "alternate" type in the API

Yes. This is a very clean way to type it, but it is a little more
laborious for the user to have to remember to wrap certain strings in
a special constructor first. Still, this is a good trick that I hadn't
considered. I'll keep it in mind for future experiments.

> I think it is not unreasonable to expose the struct names
> on introspection though, and just accept that it ties our
> hands a little more to avoid renaming structs. I don't
> think we rename frequently enough that this matters.

I feel like I don't have a real stake in this issue yet. Maybe we can
discuss bolstering the introspection data if we decide that we really,
really would like the ability to generate bindings dynamically on the
client side. I'm not sure *I* even want that enough to really push for
this change yet. (Again, I think I need to come forward with something
more concrete than an experiment before I dive too deeply into this
issue. I'll get back to you.)

I wouldn't mind hearing from Markus on what he believes the value of
anonymizing the types names is. My current understanding is: "The type
names aren't necessary to speak QMP, so they aren't necessary to
reveal. We operate on a need-to-know basis, and nobody has needed to
know."

(The most tangible story I can think of is that we don't want clients
to do things like assume they can index the introspection data in a
hashmap and rely on looking up specific type names.)

> A "NORETURN" flag sounds like a reasonable idea.

Markus has gently pointed out that we do have this information in the
schema, but it isn't revealed over introspection data *and* we do not
have introspection for QGA anyway.

We /could/ remove success-response and add a 'NORETURN' feature flag,
modifying the generator to use that flag (instead of
success-response), and then we'd get away with not having to modify
the introspection schema. But we'd still have to add introspection in
general to QGA, which rather sounds like where the bulk of the work is
anyway.

>
> Regards,
> Daniel

Thanks! I've got a lot to think about.

--js


