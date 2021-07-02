Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCB3BA391
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:18:27 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMo6-0005vK-3H
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lzMl9-0004Rq-Vb
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lzMkz-00082j-5F
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625246110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=n1TSEnD0NGYavLASkyG3YWNvyjaz1T47D74aqmH/hyw=;
 b=cd35BMFKaPfG9KBo3ZfL542zBFxB2m5I11ktKtnLyUL+p8Xh9C5tmmZBNHOivorwcEEuHf
 F0kYpG61hYhxrwYmfMDvtjH4KRZfz2Z/1+j6LBTzcQpzj2jhT8V/yrZa0M0F8FyaZcf/8F
 IYZjdPsuhpzYwAZMoakDvgJfgIOTw20=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-E8baiZYpPamyyH0lBE84dQ-1; Fri, 02 Jul 2021 13:15:08 -0400
X-MC-Unique: E8baiZYpPamyyH0lBE84dQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 d196-20020aca4fcd0000b029023e5c96e030so5959849oib.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 10:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=n1TSEnD0NGYavLASkyG3YWNvyjaz1T47D74aqmH/hyw=;
 b=CDs1SPDomyYQrwb63hfcKvpXIna7LhW2t0s8TPSEzo+H4w5LgybOsLTBpUX3MhgIdE
 d7Iy58ck3D/HMQ9BO8CL4pFBcj6LJ3raAbqkX/2mirCZV/4HNI3l7Jdw811NzP2qruOy
 RtIBxt89mAoNriC/hxlhbC7Q+fxjDCPOKBpkTIyZ3yfSRB/joQq+etXEturl6ctk9OHT
 QnRdjVt6sdept85BDtiLvU+PpgHNwo4FXYs9uMyyL122BiB8kRHxHIhoP21EQ8k6G1JX
 Squ+uYpPmdWHShEcuVyBaGoetc1CqHCwTpm/mOffaiTLilAek2Ttczc6DsPjYgcIWANF
 ZSKg==
X-Gm-Message-State: AOAM532CN6TE7SNTrxY9PS5fw0vuR8zPYGQUoQCzskhWubgyJbrWymO1
 q9wr1vqHuAReFN1Vf5fPxI/ZRGubasldXrwOrBkNV4I796QuyuqYQSfkbKk34mRKVBQ9Q3aDDJ8
 E0oO1ksKBrtWtReeFKiT45IawQ3v5AOE=
X-Received: by 2002:a05:6830:1c2d:: with SMTP id
 f13mr287329ote.323.1625246107694; 
 Fri, 02 Jul 2021 10:15:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywHGCvx4+3qMWs+bV8wJrH0DYU7PCsbOLNarK6sEMCT1K2oc2Wbw4ZkZosVCZKgkeDgZ70hbobONc1PXtGCyY=
X-Received: by 2002:a05:6830:1c2d:: with SMTP id
 f13mr287318ote.323.1625246107487; 
 Fri, 02 Jul 2021 10:15:07 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 2 Jul 2021 13:14:56 -0400
Message-ID: <CAFn=p-YDG2BUpt7nm1K78tFMF8dajpYoLvGbK0poHA72rgAPHg@mail.gmail.com>
Subject: Esoteric QMP specification questions of dubious importance
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e8e27e05c62718c6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8e27e05c62718c6
Content-Type: text/plain; charset="UTF-8"

I'm writing a "fake" QMP server for the purposes of creating unit tests for
the python QMP library. In doing so, I am left with some esoteric questions:


(1) qemu-spec.txt, section 2.4.2, "error":

The format of an "error response" is:

> { "error": { "class": json-string, "desc": json-string }, "id":
json-value }

For the purposes of naming internal types in the QMP library, does the
"error" object value have a canonical type name? It's not defined in QAPI
that I can see.


(2) qemu-spec.txt, section 2.2 "Server Greeting":

The greeting message format is:

> { "QMP": { "version": json-object, "capabilities": json-array } }
>
> Where,
>
> - The "version" member contains the Server's version information (the
format
>  is the same of the query-version command)

The layout of the "version" object is not specified in the spec itself,
though it does ask you to refer to the query-version command.
Hypothetically, is an alternate implementation of QMP in a binary that is
*not* QEMU allowed to change the layout of the "version" object (so long as
it matched whatever format it had for a "query-version" command, also not
mandated by the spec), or must it *always* conform to this precise layout?

(qapi/control.json):

> { 'struct': 'VersionInfo',
>    'data': {'qemu': 'VersionTriple', 'package': 'str'} }

If so, what should such a hypothetical client that is *not* QEMU do here?
What version does it report for the "qemu" VersionTriple member? Can I
report 0.0.0?


(3) Does the qmp-spec technically mandate any commands being available?

I believe that qmp_capabilities is definitively a requirement of the spec,
but what about query-commands, query-version, or quit? Are they technically
requirements of the QMP spec, or just requirements of QEMU?


Weird questions, I know.
--js

--000000000000e8e27e05c62718c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m writing a &quot;fake&quot; QMP server for the=
 purposes of creating unit tests for the python QMP library. In doing so, I=
 am left with some esoteric questions:<br></div><div><br></div><div><br></d=
iv><div>(1) qemu-spec.txt, section 2.4.2, &quot;error&quot;:</div><div><br>=
</div><div> The format of an &quot;error response&quot; is:</div><div><br><=
/div><div>&gt; { &quot;error&quot;: { &quot;class&quot;: json-string, &quot=
;desc&quot;: json-string }, &quot;id&quot;: json-value }</div><div><br></di=
v><div>For the purposes of naming internal types in the QMP library, does t=
he &quot;error&quot; object value have a canonical type name? It&#39;s not =
defined in QAPI that I can see.</div><div><br></div><div><br></div><div>(2)=
 qemu-spec.txt, section 2.2 &quot;Server Greeting&quot;:</div><div><br></di=
v><div>The greeting message format is:</div><div><br></div><div>&gt; { &quo=
t;QMP&quot;: { &quot;version&quot;: json-object, &quot;capabilities&quot;: =
json-array } }</div><div>&gt;</div><div>&gt; Where,</div><div>&gt;<br></div=
><div>&gt; - The &quot;version&quot; member contains the Server&#39;s versi=
on information (the format<br>&gt;=C2=A0 is the same of the query-version c=
ommand)</div><div><br></div><div>The layout of the &quot;version&quot; obje=
ct is not specified in the spec itself, though it does ask you to refer to =
the query-version command. Hypothetically, is an alternate implementation o=
f QMP in a binary that is *not* QEMU allowed to change the layout of the &q=
uot;version&quot; object (so long as it matched whatever format it had for =
a &quot;query-version&quot; command, also not mandated by the spec), or mus=
t it *always* conform to this precise layout?<br></div><div><br></div><div>=
(qapi/control.json):</div><div><br>&gt; { &#39;struct&#39;: &#39;VersionInf=
o&#39;,<br>&gt; =C2=A0=C2=A0 &#39;data&#39;: {&#39;qemu&#39;: &#39;VersionT=
riple&#39;, &#39;package&#39;: &#39;str&#39;} }</div><div><br></div><div>If=
 so, what should such a hypothetical client that is *not* QEMU do here? Wha=
t version does it report for the &quot;qemu&quot; VersionTriple member? Can=
 I report 0.0.0?<br></div><div><br></div><div><br></div><div>(3) Does the q=
mp-spec technically mandate any commands being available?</div><div><br></d=
iv><div>I believe that qmp_capabilities is definitively a requirement of th=
e spec, but what about query-commands, query-version, or quit? Are they tec=
hnically requirements of the QMP spec, or just requirements of QEMU?</div><=
div><br></div><div><br></div><div>Weird questions, I know.</div><div>--js<b=
r></div></div>

--000000000000e8e27e05c62718c6--


