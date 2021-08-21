Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BD3F3879
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 06:10:37 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHIL1-0006CH-3D
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 00:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHIJq-0005Wk-TM
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHIJn-00014T-Ur
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 00:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629518954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E03o3K1OBEjWNmQBtuk83GBaSGrW/IOxqS6Ly/GgpQA=;
 b=GM4JZ63U2jmsTFZQwanj9FeQ6ov76GGPNHC06kd6Rud7QJJuFS/dVdxzbQz5hXkshoTKbG
 h2fubVwTQlmk6eUqgGCwSlQkAskSKyjrPZmgjdpot88NCexTXZGb09nnFUqxjgXRZrJMIz
 5AT3dj4bLdeWVsn91ZECTWyww/oEYjQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-qvsYszhHNTuZuAvYfc9ldQ-1; Sat, 21 Aug 2021 00:09:12 -0400
X-MC-Unique: qvsYszhHNTuZuAvYfc9ldQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 187-20020a4a01c40000b029028b01802752so5639129oor.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 21:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E03o3K1OBEjWNmQBtuk83GBaSGrW/IOxqS6Ly/GgpQA=;
 b=LIRJJ4lNgm4eRDCIWgs718o7jRzBiO4Hb3mF1NBIpnW4xGFmOdLVfRfHJDuIBPlbjB
 x1XN5wUnb8UVTuRbJrxkV1NdSaxfqSmHrtC3A5uE1n/CHSqEz2leQbBM55hYlgmViDdV
 2VPKUbYdJgitcvkBB0EjTT1JUSgNh/gZpzr9yDhuwoZyt2pWR+eSu0YhEBT0imO+2roC
 NIwk/wjLAtUKNrj818+CEZ0RhetT6m/1inAHGdT07I6C55bYhVJjSv8p/WfGvD9a7CDi
 eennDFjgIvbEdcHMzhNn9TO7AwqoU1TbkFONf6PR228+AJ0i6j2ddKUQzfurisPzZuos
 GFgQ==
X-Gm-Message-State: AOAM532cE70BH09HCC/rPldOl55GL600fAGWEhCiRPjWgp1pl014CfMU
 eH2Wx7CvrW6j593PAtp6oigas8ysf+wNL1uPWRDZIn+IgUcqJlw+HVAU46PFdPMbLInWioT2Qyo
 /NXQnDZ78pbEVfEQe1O4P+eOZyUqVpZE=
X-Received: by 2002:a9d:12af:: with SMTP id g44mr5777071otg.45.1629518951973; 
 Fri, 20 Aug 2021 21:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhxvY0etC5vqCroQeMIqxIOFOmAcBvDbn/Bgwu3RLE08VJ+L9Jw+hrj3rJW9k1Y1ezpYaReBobhwAIiQ8Gjmw=
X-Received: by 2002:a9d:12af:: with SMTP id g44mr5777057otg.45.1629518951797; 
 Fri, 20 Aug 2021 21:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Sat, 21 Aug 2021 00:09:01 -0400
Message-ID: <CAFn=p-aGU-T=vPY+LUHtcc7OVWH_BX880N_ZKN15Pcr5tqTEzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AQMP TUI Draft
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000046e93c05ca09f26d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000046e93c05ca09f26d
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 1:39 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Hello all,
>
> Gitlab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v4
> CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/356024270
>
> Revision since v3:
> 1) Added docstrings
> 2) Minor changes in AQMP TUI Draft
> 3) Switched to constant retry delay in QMP connection manager and other
>    minor changes.
>
> G S Niteesh Babu (7):
>   python: disable pylint errors for aqmp-tui
>   python: Add dependencies for AQMP TUI
>   python/aqmp-tui: Add AQMP TUI draft
>   python: Add entry point for aqmp-tui
>   python: add optional pygments dependency
>   python/aqmp-tui: Add syntax highlighting
>   python/aqmp-tui: Add QMP connection manager
>
>  python/Pipfile.lock          |  20 +
>  python/qemu/aqmp/aqmp_tui.py | 681 +++++++++++++++++++++++++++++++++++
>  python/setup.cfg             |  29 +-
>  3 files changed, 729 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>
> --
> 2.17.1
>
>
Hiya, please specify what your branch is based on when you submit your
patchsets using the Based-On tag.

- It's time to drop patch #1 entirely.
- We can drop the word 'draft' from the commit messages now, let's try to
make this solid.
- If you want to keep the TODO comments in the code, add a pylint
configuration item that allows "todo" but disallows "fixme" and "xxx"
comments.

Detailed review to follow tomorrow, but you can start working on these
items right away. I might also squash patch #7 directly into patch #3, but
haven't looked too closely yet.

(Note that due to an update to pylint that happened just today, check-tox
is going to fail now -- that's fine, it's not your fault. As long as
check-pipenv works, you're in good shape. I'll have a fix in my python
branch tomorrow for these problems.)

--00000000000046e93c05ca09f26d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 1:39 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hello all,<br>
<br>
Gitlab: <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-pr=
ototype-v4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh=
.gs/qemu/-/commits/aqmp-tui-prototype-v4</a><br>
CI: <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/pipelines/356024270" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qemu/-/pip=
elines/356024270</a><br>
<br>
Revision since v3:<br>
1) Added docstrings<br>
2) Minor changes in AQMP TUI Draft<br>
3) Switched to constant retry delay in QMP connection manager and other<br>
=C2=A0 =C2=A0minor changes.<br>
<br>
G S Niteesh Babu (7):<br>
=C2=A0 python: disable pylint errors for aqmp-tui<br>
=C2=A0 python: Add dependencies for AQMP TUI<br>
=C2=A0 python/aqmp-tui: Add AQMP TUI draft<br>
=C2=A0 python: Add entry point for aqmp-tui<br>
=C2=A0 python: add optional pygments dependency<br>
=C2=A0 python/aqmp-tui: Add syntax highlighting<br>
=C2=A0 python/aqmp-tui: Add QMP connection manager<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +<br=
>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 681 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 29 +-<br>
=C2=A03 files changed, 729 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>Hiya, please specify what your branch =
is based on when you submit your patchsets using the Based-On tag.<br><br><=
/div><div>- It&#39;s time to drop patch #1 entirely.<br></div><div>- We can=
 drop the word &#39;draft&#39; from the commit messages now, let&#39;s try =
to make this solid.</div><div>- If you want to keep the TODO comments in th=
e code, add a pylint configuration item that allows &quot;todo&quot; but di=
sallows &quot;fixme&quot; and &quot;xxx&quot; comments.<br><br></div><div>D=
etailed review to follow tomorrow, but you can start working on these items=
 right away. I might also squash patch #7 directly into patch #3, but haven=
&#39;t looked too closely yet.</div><div><br></div><div>(Note that due to a=
n update to pylint that happened just today, check-tox
 is going to fail now -- that&#39;s fine, it&#39;s not your fault. As long =
as=20
check-pipenv works, you&#39;re in good shape. I&#39;ll have a fix in my pyt=
hon branch tomorrow for these problems.)<br></div></div></div>

--00000000000046e93c05ca09f26d--


