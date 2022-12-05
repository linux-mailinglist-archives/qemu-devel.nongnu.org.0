Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0719642A58
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN1-00016b-Ll; Mon, 05 Dec 2022 09:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@jargonmaster.com>)
 id 1p23J3-0006uu-Ub
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:42:17 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simon@jargonmaster.com>)
 id 1p23Iz-0007Tn-Kv
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:42:17 -0500
Received: by mail-pl1-x630.google.com with SMTP id jl24so9728471plb.8
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 20:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jargonmaster-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nj0L29c423ADVayyDjKh9LMtMtH43WETk4nLeXBByzE=;
 b=KzT0O1YPUtAQlzlDcC80mmrEzm9I597dXwqurLWzDoLXbJn+gnBIeq0M+iHNkO9lQn
 iq8KXOFNDToUk1VGBechUkNLeGcujstORmeVt98ictyrauYL+iGo7obqRxpf9s7GZP5Z
 Ybi7bwWBZ9gQF1CrK8G1GWdRJTjkN5xFizXg04IJUa7CODCZlstCpkKWR130629gDvRI
 TavE5fufktRWDoyI0vekvt1I+jCS6+H1v0NlCI8UienZFcZYVEY1/9JK3iHTHBwFMnQs
 YFx2Tx6o1G3kjzU3DjOy0rOLsXMLIixxFqOsRqjWNSheNLP8K+moUywJ6J6PLuQS5/yy
 6laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nj0L29c423ADVayyDjKh9LMtMtH43WETk4nLeXBByzE=;
 b=5C2rUNiedWE5KATkZ084hcpdccKTPmd1phdMiXUeCzkxqS59SBqg6ebc04jBfjVCIF
 5a6haFFLIg6iSiuXGjF3EMtvFAkFttlpwZDgIUgJRRZAwZTLUvTVL9bmZOSHvJ939SPq
 7XU0bYDDPtFrZlEUH12MkviH/Hv3L17Xm2e7oSyZgXXyitpptuDbSDDtu+N+3apYK3Qg
 K2p8QW0nnIGmMT1qIYc9yyr1kDDs8bv170WvYUAr5wAJ19D0uwofEm4vVC1CYVNb4JfZ
 p3IcUW7tpEe8FGACwqa6q547neikWC4azjxC0X/OkH+bjxDI4UBO6dW65fl2tHaPc5C1
 /NCQ==
X-Gm-Message-State: ANoB5pmUyhfV/ywOXGd/b7AEYIf5UBJ/orcsEwMr7CBX4Ty41jfwNUo5
 xJW3N9PM3tAxdg0seaSXmcppxRXHTVN1rPNTTGARKnp4Yaoo0ZKX
X-Google-Smtp-Source: AA0mqf7EKutKuFHkW47dCGcH+QL63TjbErl9jNj1XWZpQXvG0A6TWrMbaxWb+29d+uhdlJDlwfJ47zaPDcQSJQXbPuM=
X-Received: by 2002:a17:90a:6d62:b0:219:4ee5:ccc9 with SMTP id
 z89-20020a17090a6d6200b002194ee5ccc9mr31486660pjj.63.1670215330999; Sun, 04
 Dec 2022 20:42:10 -0800 (PST)
MIME-Version: 1.0
From: Simon Sharwood <simon@jargonmaster.com>
Date: Mon, 5 Dec 2022 15:41:35 +1100
Message-ID: <CAHW_L2i3WBULFk+Gh2cxqwB-mrvB1iE3NOgFdozaN9hDVuFK1Q@mail.gmail.com>
Subject: Sad to see the advent calendar go
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000080c5d305ef0d4f9b"
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=simon@jargonmaster.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000080c5d305ef0d4f9b
Content-Type: text/plain; charset="UTF-8"

Hi QEMU folk,
Simon Sharwood here, virtualization writer for Theregister.com

Sad to see the advent calendar going ... I was looking forward to the 2022
edition.

I'm totally freelancing in a personal capacity here and not writing a story
... but what order of magnitude of costs are you looking at to keep it
alive?

Simon.

-- 
Simon Sharwood | +61 (0)414 37 37 26 |
24 North Street Marrickville NSW 2204 AUSTRALIA
@ssharwood <https://twitter.com/ssharwood> | Stuff I write for work
<https://www.theregister.com/Author/SSharwood> | Messing about with bikes
<https://www.dhbc.org.au/> | I like micro-loans <https://www.kiva.org/>

--00000000000080c5d305ef0d4f9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi QEMU folk,<div>Simon Sharwood here, virtualization writ=
er for Theregister.com</div><div><br></div><div>Sad to see the advent calen=
dar going ... I was looking forward to the 2022 edition.</div><div><br></di=
v><div>I&#39;m totally freelancing in a personal capacity here and not writ=
ing a story ... but what=C2=A0order of magnitude of costs are you looking a=
t to keep it alive?</div><div><br></div><div>Simon.<br clear=3D"all"><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Simon Sharwood |=C2=A0+61 (0)414 37 3=
7 26 |<br>24 North Street Marrickville NSW 2204 AUSTRALIA<br><div><a href=
=3D"https://twitter.com/ssharwood" target=3D"_blank">@ssharwood</a>=C2=A0|=
=C2=A0<a href=3D"https://www.theregister.com/Author/SSharwood" target=3D"_b=
lank">Stuff I write for work</a>=C2=A0| <a href=3D"https://www.dhbc.org.au/=
" target=3D"_blank">Messing about with bikes</a>=C2=A0| <a href=3D"https://=
www.kiva.org/" target=3D"_blank">I like micro-loans</a></div></div></div></=
div></div>

--00000000000080c5d305ef0d4f9b--

