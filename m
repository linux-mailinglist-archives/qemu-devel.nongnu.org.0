Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1E3FA733
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 20:47:01 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK3Lt-0005uA-Jf
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 14:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1mK3JZ-0004ub-Oo
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 14:44:26 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1mK3JY-0008Vd-68
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 14:44:25 -0400
Received: by mail-ej1-x62e.google.com with SMTP id h9so21362142ejs.4
 for <qemu-devel@nongnu.org>; Sat, 28 Aug 2021 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qGIPZvzuqXKsaZ0DC3sKCIMNnn1x9XAOzQt3BbF/LRE=;
 b=dU1WA6s7p8SGdsAO6tcdOCSZasjXmn1pMPI/Oijtn0l0Xw3RZgqnkXydzQCJi4KMrx
 fr/3UePbjf7/JL76A8EdYtylH49pw1REF2Wwmsj0RgFUcQYAqhds7y++7O0pYgO8gSaC
 Zac02Xhdu+yn7oNl/AEJLZR3mU29Je5JVPdMKS5Xiv8pBpFt2AMMpT4nfVMa10cRjICO
 E2Dm/9z8AMAQYLI9RCPb539wanVHWOIO9i4LapvUXAxAE4KxDLjY7SMst7QuTcUcA6Vw
 Y2bwf6di3DQxbxld/QO3ocnA2d+pPESCnH+P3PazwqS+RXBrp94YhT6LaQI55QG4rcde
 eRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qGIPZvzuqXKsaZ0DC3sKCIMNnn1x9XAOzQt3BbF/LRE=;
 b=C3m/thFYu+WW0k4a3yJzkiZPOfNjPTfQUIyAFWQAeA6OBfRmKUTq1kGVoDW3xijh3Y
 3bnZ9+FylXmY+/2CORo/nnmf3Oz7cz3lRxS2g1aeSHmP9D6vNFhenPaHMLZ065Y6fqJj
 MmqdjA6kBVRES/73MQ7DRzG49Zp8evNrTrFmgmK1gAIfZps/k4Ing8Vv4oQ7zmoV7Maf
 YX6zuXgJIwM3W4WHtr0X+8KsNsCzcEKw/gVnEh/jmGDDP2ACdnoCyehU6cFjDW+MEOjM
 MIQK+gM2XzUcMXdruPDCns3ZWrbos0jbO1O7OdtBBY0JnOCaFK1/PLMeL/v1gfKymUHF
 xyvA==
X-Gm-Message-State: AOAM531v9eLRTvzwxoMXdCNdcWs9Gk7+6a6RDkvCHokFDcu+f8Ziccni
 b1qkxsanvm/0HG+Ew4hIbXMAmcuq4MbMjc0YGGeF8CD6
X-Google-Smtp-Source: ABdhPJx2pdYt624wRc5APGRQrkZzqi3NMw8FM0ttMg6nk37jnYnVWu6i2b7EMlfnZg1CZDNFVX7ZqDi4b5j4GO8Ggpg=
X-Received: by 2002:a17:906:704e:: with SMTP id
 r14mr16770845ejj.293.1630176261876; 
 Sat, 28 Aug 2021 11:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:58c9:0:0:0:0 with HTTP; Sat, 28 Aug 2021 11:44:21
 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Sat, 28 Aug 2021 21:44:21 +0300
Message-ID: <CA+rFky7sOGWZW5wVcmJCeE-CWBZ-WK=3h5=oOKv9VzfDwhmiBA@mail.gmail.com>
Subject: vgabios with voodoo3 suppirt for Bochs
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000002b1a005caa2fd3c"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=randrianasulu@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000002b1a005caa2fd3c
Content-Type: text/plain; charset="UTF-8"

Hello and sorry for possible interruption.

I was browsing various projects and found Bochs 2.7 was released on August,
1 2021 [0] together with vgabios 0.8a

http://www.nongnu.org/vgabios/

"2021-06-03 vruppert Version 0.8a of the LGPL'd VGABios with Voodoo Banshee
for Bochs and Cirrus support for Bochs and Qemu is available now. This
version will be included in the next Bochs release."

not really usable in qemu directly (at least voodoo3 part?) but might be
interesting for someone looking into gpu suppirt in qemu - supported or
future vga cards...

[0] https://svn.code.sf.net/p/bochs/code/tags/REL_2_7_FINAL/bochs/CHANGES

--00000000000002b1a005caa2fd3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello and sorry for possible interruption.<div><br></div><div>I was browsin=
g various projects and found Bochs 2.7 was released on August, 1 2021 [0] t=
ogether with vgabios 0.8a</div><div><br></div><div><a href=3D"http://www.no=
ngnu.org/vgabios/">http://www.nongnu.org/vgabios/</a></div><div><br></div><=
div>&quot;2021-06-03	vruppert  	Version 0.8a of the LGPL&#39;d VGABios with=
 Voodoo Banshee for Bochs and Cirrus support for Bochs and Qemu is availabl=
e now. This version will be included in the next Bochs release.&quot;=C2=A0=
</div><div><br></div><div>not really usable in qemu directly (at least vood=
oo3 part?) but might be interesting for someone looking into gpu suppirt in=
 qemu - supported or future vga cards...=C2=A0</div><div><br></div><div>[0]=
 <a href=3D"https://svn.code.sf.net/p/bochs/code/tags/REL_2_7_FINAL/bochs/C=
HANGES">https://svn.code.sf.net/p/bochs/code/tags/REL_2_7_FINAL/bochs/CHANG=
ES</a></div><div><br></div><div><br></div><div><br></div>

--00000000000002b1a005caa2fd3c--

