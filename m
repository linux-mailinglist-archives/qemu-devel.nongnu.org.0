Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7735ADF67
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 08:10:36 +0200 (CEST)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVRn8-0006rp-Ts
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 02:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVRka-0005T8-Qp
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:07:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVRkX-0005Wl-6r
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662444472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0sI9v5mkvbO6QUd1uB21zWRCqC/OHNzb70BGBuzQdug=;
 b=OGPidHpdxkn0zHcQnwTuLqUpUB+XJ2vVJuaI3URpm3AyR3/pCxekCrENJQfEZx9tNgRsSm
 bAp/XeHJmFx26yFsFEsRmI7cHNUloJ0lEOzdZnwpqWYArTgqa0dclse8iqQO0GapffFser
 dZ/rygK7E2bRhZo9Su9Tuu5Th+zNxnU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-ZoZCNcE-MFS2femREBw-7g-1; Tue, 06 Sep 2022 02:07:50 -0400
X-MC-Unique: ZoZCNcE-MFS2femREBw-7g-1
Received: by mail-lj1-f198.google.com with SMTP id
 m1-20020a2eb6c1000000b00261e5aa37feso3402742ljo.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 23:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0sI9v5mkvbO6QUd1uB21zWRCqC/OHNzb70BGBuzQdug=;
 b=zJiOlPHp+r+Wu7GgvbS+LOnMorWLE3OaC5dNXb3fIZ1uPJl5vOlHBWprI1yLpbe6j8
 c4O6d+Htcrn6Dr3/ZH82CgrJ+QzQcY0EEGVLIK1bWsp7OlhKUbf5/4aVAXBnYa7lPeGP
 fS4noYPvPzFGf12a8XmGvaFw3Z6Yb+IXe4zyo28sYoJSov2zo65i6U0AGcPRz8mQ/a2M
 p44+9n5gVYEPEpUEhk4hKyHGO1QN4fJtCssUVc/4kvJXIxqEZahtO6FYk1rAGhbng2qY
 Ki0N1ExqkYYdM+uTsHpvfyw+5Xm/vtoEyQFoVUT3l+Nyt2j339cKy9x6xVavEd8Xl9sT
 HKrA==
X-Gm-Message-State: ACgBeo0shoBR2rTivUkuZkwDD4o7gCQjutkTBlfiwrpv/ITi1KaXT1+q
 OTWCvHnlStE06C0gXv/77wOplculAOTZcgZMeehf7n1/EC1TE1olvbbgBr8Ts45yTeLiNMvH8Lg
 3ywbE2sVuWC2EHgSIkSy5IfG8nJsiZ+k=
X-Received: by 2002:a05:6512:1189:b0:494:b306:c16 with SMTP id
 g9-20020a056512118900b00494b3060c16mr4698717lfr.452.1662444469121; 
 Mon, 05 Sep 2022 23:07:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41EhlyEARAftA5CPS0Tlx3fh65Q/4RvwoDanMvHW+3bq1zoNi5QJEvb17jatSjI0DxONaG0N9zyC/9hTpEcn0=
X-Received: by 2002:a05:6512:1189:b0:494:b306:c16 with SMTP id
 g9-20020a056512118900b00494b3060c16mr4698712lfr.452.1662444468875; Mon, 05
 Sep 2022 23:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220905111038.33324-1-pbonzini@redhat.com>
 <87pmg96qq8.fsf@pond.sub.org>
In-Reply-To: <87pmg96qq8.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 6 Sep 2022 08:07:37 +0200
Message-ID: <CABgObfb6=25gNZZMG+07xvQeQ2Y3uDyD_LqF4azwTpqLWQoO-A@mail.gmail.com>
Subject: Re: [PATCH] tests: unit: add NULL-pointer check
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000006c9fc05e7fc0418"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000006c9fc05e7fc0418
Content-Type: text/plain; charset="UTF-8"

Il mar 6 set 2022, 07:01 Markus Armbruster <armbru@redhat.com> ha scritto:

> Next, permit me a few words on writing tests.  For me, a unit test fails
> by crashing.  Crashing with a nice message is optional.  The more likely
> the failure, the more useful is niceness.  Complete niceness is
> impossible --- if we could predict all crashes, we wouldn't need tests.
> Trying to push niceness can be overly verbose.  Thus, judgement calls,
> and matters of taste.
>

I agree; however, *relying* on a crash for correctness of the test is not
great. Part of the test here is checking that an empty qdict_crumple
returns a dictionary and not, say, a list. The newly-added assertion avoids
that two wrongs end up making a right: if qobject_check_type somehow failed
to identify the dictionary and returned (QDict *) obj, qdict_size would not
crash.

Unlikely as it is, it's nicer to spell out the postconditions that the test
is checking.

Paolo



> Wanting to mollify Coverity is a valid argument.
>
>

--00000000000006c9fc05e7fc0418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 6 set 2022, 07:01 Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Next, permit me a few words on writing tes=
ts.=C2=A0 For me, a unit test fails<br>
by crashing.=C2=A0 Crashing with a nice message is optional.=C2=A0 The more=
 likely<br>
the failure, the more useful is niceness.=C2=A0 Complete niceness is<br>
impossible --- if we could predict all crashes, we wouldn&#39;t need tests.=
<br>
Trying to push niceness can be overly verbose.=C2=A0 Thus, judgement calls,=
<br>
and matters of taste.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I agree; however, *relying* on a crash for correctness=
 of the test is not great. Part of the test here is checking that an empty =
qdict_crumple returns a dictionary and not, say, a list. The newly-added as=
sertion avoids that two wrongs end up making a right: if qobject_check_type=
 somehow failed to identify the dictionary and returned (QDict *) obj, qdic=
t_size would not crash.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Unlikely as it is, it&#39;s nicer to spell out the postconditions that the =
test is checking.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Wanting to mollify Coverity is a valid argument.<br>
<br>
</blockquote></div></div></div>

--00000000000006c9fc05e7fc0418--


