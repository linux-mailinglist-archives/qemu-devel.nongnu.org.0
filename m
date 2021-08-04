Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1AE3E07C6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:45:00 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLsx-0005E3-0v
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBLqM-0003h1-GZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBLqH-0003ss-9Y
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628102531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Y+jlD81yQIloAjR9RtuqXQQtkMT5soydMZsEPXwyAQ=;
 b=gIw63EI7PxvxDdBdnOSEfa+0vHLBs+WcSeRTGJmFuk4AzMRT38x8TlBN59bMcjakHeCu5e
 KgQ5M3cKXyB4aQr1O4YiGLpIOpqR6EBle4t8Q/vSxFcX64CfWnJUwO6HhKGBmRYY8nSQDC
 nqTwpeu/2S17I7pZuVXmjcTwqHkWzLY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-xILOcf77MImqoadpgZmkFg-1; Wed, 04 Aug 2021 14:42:09 -0400
X-MC-Unique: xILOcf77MImqoadpgZmkFg-1
Received: by mail-oo1-f70.google.com with SMTP id
 r10-20020a4ae50a0000b02902621047077eso1116978oot.3
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 11:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Y+jlD81yQIloAjR9RtuqXQQtkMT5soydMZsEPXwyAQ=;
 b=Sdh/OC/gpKPg3vffA9E10bQaZRCQu140XP4+dZijfkU2IIlQnjjzm4+ipxsdRB1/xb
 LUCkrLdjV2qMtxYfsQnfc0sHys+/CYLz8MKLfGSF0/+ab6FivfmIERsoINzQvvo1ZPFs
 6UyJBkEfqRVoVqtVMf8yMl3gq09KPAHVqf+8rQQu2IQZ472R4NACEkHIjh+56cGl/6VM
 LvhinJO5vDjFA9S4yn8FjB56yGxJ9FL2+bNbJzgVVXYOLThSjTWzyGCBw38vrcmr5Hws
 LXSYeMZKxli6eNX7rPvujuZ1mcJmg8ZZsU0JBIzfk85ThiZxSjtHd6QapSTjnV2sQkLt
 9PIw==
X-Gm-Message-State: AOAM532yhYjVfZMAV/0j3KU/7db1p+JRv5CIWCpIps6TeGQW2O7CSfxN
 CBqdA//r6ygDWXm1D6vZbONDbsSDDGFoce8JzMjddGfbr+jN/htO372XyJiKvCTHlhn+Q39y2Pj
 S3WLvJFPdoPS636MMltIImrDs1VhhySQ=
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr631670oig.52.1628102528294; 
 Wed, 04 Aug 2021 11:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMpX+5f4215C5QtaWobNzQHWpHjQOo9xlYmNFGO91Q3rreP4frfuxn/XZ3G9ZbSvakTsrkbS2PbRSYKJxvxRs=
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr631659oig.52.1628102528100; 
 Wed, 04 Aug 2021 11:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-26-jsnow@redhat.com>
In-Reply-To: <20210803182941.504537-26-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Aug 2021 14:41:57 -0400
Message-ID: <CAFn=p-Y5g+fLC4xumyE6iN67Vr67_jo0r2bcaoxYK+yM1EiMSw@mail.gmail.com>
Subject: Re: [PATCH v3 25/25] python/aqmp: add AsyncProtocol unit tests
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d87f8505c8c028e6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d87f8505c8c028e6
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 2:31 PM John Snow <jsnow@redhat.com> wrote:

> This tests most of protocol.py -- From a hacked up Coverage.py run, it's
> at about 86%. There's a few error cases that aren't very well tested
> yet, they're hard to induce artificially so far. I'm working on it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/tests/null_proto.py |  70 +++++
>  python/tests/protocol.py   | 535 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 605 insertions(+)
>  create mode 100644 python/tests/null_proto.py
>  create mode 100644 python/tests/protocol.py
>
> diff --git a/python/tests/null_proto.py b/python/tests/null_proto.py
> new file mode 100644
> index 00000000000..c8cedea5942
> --- /dev/null
> +++ b/python/tests/null_proto.py
>

Whoops, forgot to delete this file after inlining it into the other test.

--js

--000000000000d87f8505c8c028e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 2:31 PM John Snow =
&lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">This tests most of =
protocol.py -- From a hacked up Coverage.py run, it&#39;s<br>
at about 86%. There&#39;s a few error cases that aren&#39;t very well teste=
d<br>
yet, they&#39;re hard to induce artificially so far. I&#39;m working on it.=
<br>
<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
---<br>
=C2=A0python/tests/null_proto.py |=C2=A0 70 +++++<br>
=C2=A0python/tests/protocol.py=C2=A0 =C2=A0| 535 ++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A02 files changed, 605 insertions(+)<br>
=C2=A0create mode 100644 python/tests/null_proto.py<br>
=C2=A0create mode 100644 python/tests/protocol.py<br>
<br>
diff --git a/python/tests/null_proto.py b/python/tests/null_proto.py<br>
new file mode 100644<br>
index 00000000000..c8cedea5942<br>
--- /dev/null<br>
+++ b/python/tests/null_proto.py<br></blockquote><div><br></div><div>Whoops=
, forgot to delete this file after inlining it into the other test.</div><d=
iv><br></div><div>--js<br></div><div>=C2=A0</div></div></div>

--000000000000d87f8505c8c028e6--


