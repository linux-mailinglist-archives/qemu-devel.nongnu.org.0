Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FE2D8267
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:53:55 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrIP-00020F-QM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1knqe0-0006NC-Ph
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:12:08 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:42229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1knqdv-0008Jl-Hd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:12:06 -0500
Received: by mail-ua1-x930.google.com with SMTP id n18so3357602ual.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9+uHv4Wm+iKl9lLbvgWgdhvc6TGd5i1tZxe9mRrn3bY=;
 b=pJxJKP4+0lg46afX28JDwTvcQn/SZLAuRjkUgv6+BYifGpHVZdj9UnbEsjwYhwRfzE
 Q/W6a8kvPZIoBiHRalBRPRQXL8HOpHYmzzV26WZKDpzjrON0B9BDzRKIKzCa5Ug/xhYK
 HX7BrTgEmqXQ4CculxDdS2z58pwJvDMyC3Sx2yr2rWyZYYtwBma60DPWoMSmkwekmYag
 eDQb+5+PMHVyx+Hfc8uMyAxpswUrA6VsMXsy5hBw56aRIc3O4xqRZjPb6oAcFMCNQ4HN
 EiuXiuYKOYk8WmO+U/Eum6o9ucSOgmW4EEnsrtLlUQ05rh1nLDtT3yOv+N+yM23GhrIk
 teoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9+uHv4Wm+iKl9lLbvgWgdhvc6TGd5i1tZxe9mRrn3bY=;
 b=QPIXVrNL9UmqA53jY5rNV6hpQZ9cLVm6UlZqBJyGA9t1mIqzaNfNPf5I9DF8EfD4iM
 oz7wmyRrkedvLJN0K9eq36z1us4MZ0jDljqK3A/p+XltPKXAcytSOjT2Y5+sZFt1XMTn
 3xGYX1KnpxLKtkPZ4219ts9jwjOUm/SlAOi47Q3W2k6F1bgPgBkEluUzrD7GIX8Z59i6
 DXZkDP1EEkua7kPXetJrqAIiqlahq6iFXpVEPI7Kd4Z9h0Z+JsBj4eN0ZqWzDHqASeXa
 ZsdwpvNcNMM2fRC1GbAiJ8JesV8sC4QpDdOV/NHdsBGmGDvkxwd8y9U3g74GQHmZPxu3
 QRUA==
X-Gm-Message-State: AOAM531ddjeVzPeY9WClOWmmz/1p3uv+H67A4lwDVj/Wv43PYHmtSYKo
 o6QH0NOaOQ3X9tiRCy7i7ijZGzuZA4lsk1eWtzl9y7xqMYE/9Q==
X-Google-Smtp-Source: ABdhPJz++UEbeLIh7PgNyEjvZZaZ8V2qXysZc3PhKhv2VDrtx68mgdJH/6GrpUqL1bLpV3nTuUPMAQAvkGh0kj9TZbs=
X-Received: by 2002:ab0:5909:: with SMTP id n9mr14651551uad.3.1607724721609;
 Fri, 11 Dec 2020 14:12:01 -0800 (PST)
MIME-Version: 1.0
From: Doug Evans <dje@google.com>
Date: Fri, 11 Dec 2020 14:11:25 -0800
Message-ID: <CADPb22TD93fvQMsSxukRyNgXAoR+Cqh2gW4HZY2okT4tTztXCw@mail.gmail.com>
Subject: checkpatch.pl block comment detection fail
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ee0e5905b637943c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=dje@google.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ee0e5905b637943c
Content-Type: text/plain; charset="UTF-8"

Hi.

The coding style docs don't specify this as being bad:

foo(/*bar=*/true);

which improves readability at the call site.
It's not a style to be used liberally, but sometimes it's helpful.

Alas checkpatch.pl claims this is a block comment.

Would it be ok if I try to fix checkpatch.pl to treat this as ok?

--000000000000ee0e5905b637943c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi.=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">The coding style doc=
s don&#39;t specify this as being bad:</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">foo(/*bar=3D*/true);</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">which improves readability at the call site.</div><div class=3D"=
gmail_default" style=3D"font-size:small">It&#39;s not a style to be used li=
berally, but sometimes it&#39;s helpful.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Alas <a href=3D"http://checkpatch.pl">checkpatch.pl</a> cla=
ims this is a block comment.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Would it be ok if I try to fix <a href=3D"http://checkpatch.pl">checkpa=
tch.pl</a> to treat this as ok?</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div></div>

--000000000000ee0e5905b637943c--

