Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF95459D3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 04:03:25 +0200 (CEST)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzTzg-0003Ub-AY
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 22:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nzTyU-0002ph-5J
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 22:02:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nzTyS-0006KD-Pg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 22:02:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id q18so21644817pln.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=vdtCjITdRuVdmyEs12bMVDJSEpCBUUyZUe4zTaY/eGo=;
 b=OS05Kjp+o/lRdrsvp3aYXq4Txmltrgmn3000UHAkUyoxeKbUmtvtZWiUGUN7ZnWMr4
 fa/T/ow29gXrv/9LTRys1FwMNRvGYVBsUUTt8+GXigZOws2tVjluszn2BREqVnHER1F6
 4Yei9lPIJj1sz6BOW/zX5uqEDfeOGFJM54I8NUIaNTQ8ekMOqsdsf9iSr4xsrpZdKC+g
 d/YrIkve7q5yr6c+nJO3ox09uoG5MhBYpbCf9oAvZGEEL+uv3R8rbTcSjunxftMX85/u
 EPt3CcCnXg/hm5XwedrsiGXJ77eObgZaHfSyNpWbrlOb/Zxc9JKtHZBpWf4Bfx/4yLCL
 pdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vdtCjITdRuVdmyEs12bMVDJSEpCBUUyZUe4zTaY/eGo=;
 b=ya2IwRkd3uXHWl7r3y9zMWf/Ppewg8LpFhNS6xe6HvWmAY61Z+XJnHppvxBmW93eR5
 YHDdNXqtSfGl+qNs/KhyfdlCo4Eygxld7m4c6GEbe+OVZ4y/XWo3R33XhxSF6x/2fcIb
 1ClL022NYE3lRLjOCvcQq9Wk5QbFqd+qp/voLoAq3V9cEw2NjQ2rO1zUcnt+/hFrdXkc
 3MNGg8tDJljw4l+EpiM0iaZvCAbpKnCeD4ICkLfuM4VxfHruhtAZ4/cxHOyRaln9GjTX
 qi/H9yfTZif7youLnMB6dlRQX+Ob++HGKxQ6PKSb1eaPCB7qYluVfdWoMJxBjYV2wSrx
 eBRA==
X-Gm-Message-State: AOAM5319gBsmTTLFcfSQmZ4A+i1DSqdvAvLD1px2qn+9lUE3r3jJTkgf
 1Xdl98PjM5228CE4v8bcI7Lcf+HSe9gBW4tyhasJlcNQlxry
X-Google-Smtp-Source: ABdhPJyw4TKAn89KLh8L/ipFQQZo6dvRMTDXB9usrv3hnq1odBF8/ifPuWzeepoAnZMA+e5x0PHKJuFICFkaqTTdIBY=
X-Received: by 2002:a17:903:2308:b0:167:6bfe:a800 with SMTP id
 d8-20020a170903230800b001676bfea800mr27949805plh.100.1654826526522; Thu, 09
 Jun 2022 19:02:06 -0700 (PDT)
MIME-Version: 1.0
From: Liu Jaloo <liu.jaloo@gmail.com>
Date: Fri, 10 Jun 2022 10:01:55 +0800
Message-ID: <CAOYM0N0sA-H5G0GjED_YHHrHyLJ6vy7+y+jB5-s8J=kAH+eogQ@mail.gmail.com>
Subject: about QOP
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000047445305e10e5379"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=liu.jaloo@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000047445305e10e5379
Content-Type: text/plain; charset="UTF-8"

Dear Paul Brook:
in qemu/tcg/README:
"
...
QOP code generator written by Paul Brook.
...
"

Is there some text about QOP? or basically what QOP stands for?

I can't find out anything about QOP from Google. thanks.

--00000000000047445305e10e5379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Paul Brook:</div><div>in qemu/tcg/README:</div><=
div>&quot;</div><div>...</div><div>QOP code generator written by Paul Brook=
.</div><div>...<br></div><div>&quot;</div><div><br></div><div>Is there some=
 text about QOP? or basically what QOP stands for?</div><div><br></div><div=
>I can&#39;t find out anything about QOP from Google. thanks.</div></div>

--00000000000047445305e10e5379--

