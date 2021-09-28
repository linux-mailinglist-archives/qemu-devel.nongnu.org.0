Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24F41AE10
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:46:04 +0200 (CEST)
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBYg-0004R3-Fp
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mVBRN-0007wu-8R
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mVBRJ-0000F9-38
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632829103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4MqSJCoWLiCg/h8l2EqcKSgdVBpe8dOCtRyo35H0LU=;
 b=iImSTn4/H7BQn7XuijwTLkmPj2v48cOSRjkKhFpu9vs0Tce+m0ybIC48gZLCZp+MVxYmM9
 lWS2RJy/omuoUpGp6BCYk+21R11vL2mlFq6k6z3QhscyU2KNeM++q1pOGt3gKeN42pE4xA
 nPB07Qfr8ycOWwsxXccqnGIvqN1lzok=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-qeFjjT-_P4O-bgdnlSldQA-1; Tue, 28 Sep 2021 07:38:21 -0400
X-MC-Unique: qeFjjT-_P4O-bgdnlSldQA-1
Received: by mail-pf1-f198.google.com with SMTP id
 z24-20020aa79f98000000b004463f2f0277so14362380pfr.23
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4MqSJCoWLiCg/h8l2EqcKSgdVBpe8dOCtRyo35H0LU=;
 b=mJ/aqY3almDmPhVS98D3Wc1oK14TzapAwdWmVJ0eoNDqU7Bfa5a5jc3fhoFecyiySW
 p7OR2RKwjkiewUYV0LoWbmZiZEUaTFA8J1cXCMciWWXgYNvrvCPsW7a/zCs3SE+wGzez
 NOfNItHuMZus8l7SnNwFos33HqiwtRdGvpYqtfwNlgcWddYl2xsw5iiNzoruoFNqHHJg
 F7TTijZyKzuEotkZM43fTUbEMBf6zeqhHs5T1Gg6kzSXOsihMpX7Anx2nnWgTF+X5uFr
 FdOizAoY0WaeoGC9mq+fB82+3IICCbiX3+VyvmFTLTF/7sc2u832W/mKQSGkQv50vuDj
 1TRA==
X-Gm-Message-State: AOAM533GzMB3GgpOzkpNo4G5RR0HxNmDy6703ILVdvzjUSbhS1zldHkq
 gA9RgbrTUnavVRX6uapL/I/k/bwcgGbxCw+iXIgDY19Ky5fDkvbL+X3dmKhC3USxqTSyr08dKi2
 5i/+JVpp6qi6eHNIXCmZGBpmP7HtYwFg=
X-Received: by 2002:a17:902:8bc1:b0:13d:e884:125a with SMTP id
 r1-20020a1709028bc100b0013de884125amr4632383plo.38.1632829100546; 
 Tue, 28 Sep 2021 04:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC4XpjruG5k1J7OLO4GU5awa9UEoCD4hMu0ByMRjWbsj9YdfcpxF2ctas3lucu36LqZB3bEdCWJPO0TL2YIy4=
X-Received: by 2002:a17:902:8bc1:b0:13d:e884:125a with SMTP id
 r1-20020a1709028bc100b0013de884125amr4632360plo.38.1632829100189; Tue, 28 Sep
 2021 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
In-Reply-To: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 28 Sep 2021 15:38:08 +0400
Message-ID: <CAMxuvawXF71DKHvUmW38Ot0BM2z+Mki7MEpDoQmQUmc5fc9D7g@mail.gmail.com>
Subject: Re: QAPI sync meeting
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007f02ad05cd0ca60b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f02ad05cd0ca60b
Content-Type: text/plain; charset="UTF-8"

Hi!

On Mon, Sep 27, 2021 at 8:55 PM John Snow <jsnow@redhat.com> wrote:

> Hiya,
>
> I'd like to propose that at least the three of us arrange a time to have a
> meeting where we discuss our plans and ideas for QAPI going forward,
> including rust, python, and golang extensions to the QAPI generator, what
> we hope to accomplish with those projects, and so on.
>
> What I am hoping to get out of this for myself is a high-level overview of
> people's plans for QAPI and to produce some notes on those plans so that I
> can have a reference that we've all acknowledged as roughly accurate to be
> able to keep the community's design goals for QAPI in mind as I continue my
> own development. Ultimately, I'd like some kind of rough draft of a "QAPI
> roadmap".
>
> I know there was a rust meetup during KVM Forum, but I was unable to
> attend due to the timing. I'd like to expand the focus a little more
> broadly to QAPI in general and discuss our "personal" roadmaps, goals,
> queued work, etc so that we can collaboratively formulate a broader vision
> of our work.
>
> I'm posting to qemu-devel in case anyone else has an interest in this area
> and would like to eavesdrop or share opinions, but we should probably come
> up with an agenda first. So:
>
> Proposed agenda:
>
> Current projects, wishlists, and goals for QAPI:
> - Markus (~10 min)
> - Marc-Andre (~10 min) (Rust, dbus, etc?)
>

The QAPI Rust binding RFC series aims to provide the QAPI types to Rust
with to/from C translations. This is just one brick allowing QEMU to have
some parts written in Rust: all other internal/subsystem binding pieces
remain to be done. I don't have other plans for QAPI at this point.

D-Bus (from the early qapi/rust series) was an experiment, showing that
QAPI/QMP can be exposed via "serde" with almost no effort. (it could most
likely be over other protocols, such as JSON, in full-Rust implementation).
We can imagine sharing canonical QAPI IDLs for daemons/helpers written in
different languages.

However, the biggest hurdle when binding QAPI to D-Bus or many programming
languages (c, python, go and rust foremost) is that it is not a
machine/ABI-friendly IDL. QAPI doesn't impose orderdering of fields or
arguments, and it is not versioned. I believe this is detrimental, because
bindings have to be written and maintained by hand in various languages,
with various flavours (some may add abstractions, some may version the
schema themself, some may use plain dictionaries everywhere etc). The small
flexibility advantage doesn't outweigh the cost. Imho, some of the pains of
QAPI/QMP is that it's not so easy to interact with, either from a human
point of view (who likes speaking JSON?) or a machine point of view (I
don't have good bindings to use from my language of choice). If we provided
(and generated) idiomatic client bindings, we would most likely have a few
rules to not break them, and end up versionizing the schema (version the
commands, version arguments etc, various options are possible). The wire
format becomes a detail, and JSON can keep its own flexibility wrt fields
ordering etc.

- jsnow (~10 min) (Python, golang, etc)
>
>
I am certainly interested to learn your updated plans.


> Formulating short-term and long-term roadmaps:
> - Open discussion, ~30 min
> - Collaboratively produce a summary doc (etherpad?) outlining major work
> to be done, separated into near and long terms
> - Upload this summary to the QEMU wiki and mail it back out to qemu-devel
> - We probably won't exactly finish this bit, but we can resume on the
> mailing list afterwards perfectly well.
>
> (Feel free to propose anything different for the meeting, this is just a
> jumping off point for discussion.)
>
> Proposed time:
>
> - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work
> particularly well for me at the moment.
>

That could work for me.

- bluejeans and google meeting both work well for me. Open to alternatives.
>
>
> Thanks,
> --js
>

--0000000000007f02ad05cd0ca60b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi!<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 27, 2021 at 8:55 PM Jo=
hn Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>Hiya,</div><div><br></div><div>I&#39;d like to propose that at l=
east the three of us arrange a time to have a meeting where we discuss our =
plans and ideas for QAPI going forward, including rust, python, and golang =
extensions to the QAPI generator, what we hope to accomplish with those pro=
jects, and so on.<br><br></div><div>What I am hoping to get out of this for=
 myself is a high-level overview of people&#39;s plans for QAPI and to prod=
uce some notes on those plans so that I can have a reference that we&#39;ve=
 all acknowledged as roughly accurate to be able to keep the community&#39;=
s design goals for QAPI in mind as I continue my own development. Ultimatel=
y, I&#39;d like some kind of rough draft of a &quot;QAPI roadmap&quot;.<br>=
</div><div><br></div><div>I know there was a rust meetup during KVM Forum, =
but I was unable to attend due to the timing. I&#39;d like to expand the fo=
cus a little more broadly to QAPI in general and discuss our &quot;personal=
&quot; roadmaps, goals, queued work, etc so that we can collaboratively for=
mulate a broader vision of our work.<br></div><div><br></div><div>I&#39;m p=
osting to qemu-devel in case anyone else has an interest in this area and w=
ould like to eavesdrop or share opinions, but we should probably come up wi=
th an agenda first. So:<br><br></div><div>Proposed agenda:<br></div><div><b=
r></div><div>Current projects, wishlists, and goals for QAPI:</div><div>- M=
arkus (~10 min)<br></div><div>- Marc-Andre (~10 min) (Rust, dbus, etc?)<br>=
</div></div></blockquote><div><br></div><div>The QAPI Rust binding RFC seri=
es aims to provide the QAPI types to Rust with to/from C translations. This=
 is just one brick allowing QEMU to have some parts written in Rust: all ot=
her internal/subsystem binding pieces remain to be done. I don&#39;t have o=
ther plans for QAPI at this point.<br><br>D-Bus (from the early qapi/rust s=
eries) was an experiment, showing that QAPI/QMP can be exposed via &quot;se=
rde&quot; with almost no effort. (it could most likely be over other protoc=
ols, such as JSON, in full-Rust implementation). We can imagine sharing can=
onical QAPI IDLs for daemons/helpers written in different languages.<br><br=
>However, the biggest hurdle when binding QAPI to D-Bus or many programming=
 languages (c, python, go and rust foremost) is that it is not a machine/AB=
I-friendly IDL. QAPI doesn&#39;t impose orderdering of fields or arguments,=
 and it is not versioned. I believe this is detrimental, because bindings h=
ave to be written and maintained by hand in various languages, with various=
 flavours (some may add abstractions, some may version the schema themself,=
 some may use plain dictionaries everywhere etc). The small flexibility adv=
antage doesn&#39;t outweigh the cost. Imho, some of the pains of QAPI/QMP i=
s that it&#39;s not so easy to interact with, either from a human point of =
view (who likes speaking JSON?) or a machine point of view (I don&#39;t hav=
e good bindings to use from my language of choice). If we provided (and gen=
erated) idiomatic client bindings, we would most likely have a few rules to=
 not break them, and end up versionizing the schema (version the commands, =
version arguments etc, various options are possible). The wire format becom=
es a detail, and JSON can keep its own flexibility wrt fields ordering etc.=
</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div></div><div>- jsnow (~10 min) (Python, golang, etc)<br></=
div><div><br></div></div></blockquote><div><br></div><div>I am certainly in=
terested to learn your updated plans.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>For=
mulating short-term and long-term roadmaps:</div><div>- Open discussion, ~3=
0 min<br>- Collaboratively produce a summary doc (etherpad?) outlining majo=
r work to be done, separated into near and long terms<br></div><div>- Uploa=
d this summary to the QEMU wiki and mail it back out to qemu-devel<br></div=
><div>- We probably won&#39;t exactly finish this bit, but we can resume on=
 the mailing list afterwards perfectly well.<br></div><br><div>(Feel free t=
o propose anything different for the meeting, this is just a jumping off po=
int for discussion.)<br><br></div><div>Proposed time:</div><div><br></div><=
div>- Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work p=
articularly well for me at the moment.<br></div></div></blockquote><div><br=
></div><div>That could work for me.</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>- bluejea=
ns and google meeting both work well for me. Open to alternatives.<br><br><=
/div><div><br></div><div>Thanks,<br></div><div>--js<br></div></div>
</blockquote></div></div>

--0000000000007f02ad05cd0ca60b--


