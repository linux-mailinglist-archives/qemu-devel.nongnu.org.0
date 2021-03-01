Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C536D328727
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:21:58 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmF3-0003OS-QZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lGmAJ-0008Ko-Tg
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:17:05 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lGmAH-0007tI-1t
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:17:03 -0500
Received: by mail-ot1-x32c.google.com with SMTP id e45so17154535ote.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2UOC8ZIkrmYZo8xXuqg5UcEwRItZbzsEtzIFhZwc9GE=;
 b=JbtyBmh80hnYkhIBmVxl1CK76bzUB2h7jyOAT7iNMj1LtFDqOR1Os5llMCsKRsXQOe
 ojywVf23vZEQNkbHXvLJWmmIgEoml15Rv92VkAfvNaN0SWjs3F+XcudvYXhIHu/Oc2ST
 CsXjnH2nDNgXBKr2RvDu1fFEgZILB0nXQcNQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2UOC8ZIkrmYZo8xXuqg5UcEwRItZbzsEtzIFhZwc9GE=;
 b=ebsVCywkuUOXT0nWt0rF0BUe3Kzqim0OJ+j/8EPLc8T45Dmocu10VwXBxP0KcUvBjz
 WJybB2N29/UgbmsWc259qbqid4X1zU/pZMftKvW2pwCk1HlFfjATGvUHVj42z6oCI/63
 arugneS/TLMrukCJfIBQ+cd3Yj/aIN7cTcfkWqUaV6A8EJogiAtb5tt5LhaDHwdU+iCz
 OVtdmHNcuCaBXvuodK+xkmL88xpgWyfM0Dxp4/Jc7pSjAOO6FGzVGjd+lpzIbhpmKt/q
 wbtEE3vmk+KqD++gBPLlnW/+D9XuBdHFier70vucvH/wH3inaz0ZXZquanqXLnRl5Lho
 1eyQ==
X-Gm-Message-State: AOAM530Bxw727G+Q8aksbXIg3MCAcXbmiIDozPMjyBu75utjPRMthESG
 Xn3bmZhiFASfzGGRkM3yqSA+PvPyngMZLeifcJM1Mw==
X-Google-Smtp-Source: ABdhPJzfGkW5kUcRBUCQt3McxbzjVbo6Gcefagzolw32TlzQ5sq14ZWRRjigu5M9SPz8iNxgUe5GGc133WaBEiO+tUI=
X-Received: by 2002:a05:6830:1d41:: with SMTP id
 p1mr14168740oth.126.1614619017966; 
 Mon, 01 Mar 2021 09:16:57 -0800 (PST)
MIME-Version: 1.0
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Mon, 1 Mar 2021 22:46:47 +0530
Message-ID: <CAJGDS+E24RdLWii1GbuxW4pBabpu9wboacMkT+qQ+0VL3-qyQw@mail.gmail.com>
Subject: Some more questions with regards to QEMU clock record and replay
To: qemu-discuss <qemu-discuss@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000038f0205bc7cc9b7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, RCVD_DOTEDU_SHORT=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000038f0205bc7cc9b7
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am really thankful for the wonderful answers in my last post linked below-

https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/msg00131.html

In continuation with the last post, I have a few more questions to ask -

My experiment is still, mostly the same. I record clock values in KVM mode,
and then replay the clock values in TCG mode. However, now I am recording
and replaying all of the clock values (I was only recording/replaying the
host clock previously). However, I do not use the -icount feature.

- Why are clock values being replayed at checkpoints?
- Can we ignore replaying at checkpoints and do a dumb replay as and when
the clock read actually happens?
- Based on the documentation available, I can see that checkpoints are
necessary for thread synchronization. Does this mean, if I do not replay
clock values at checkpoints, the guest kernel scheduler might behave
incorrectly during replay ?

Thank you very much, again.

Best Regards,
Arnab

--000000000000038f0205bc7cc9b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hello all,<br><br></div>I am really th=
ankful for the wonderful answers in my last post linked below-<br><br><a hr=
ef=3D"https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/msg00131.h=
tml">https://lists.nongnu.org/archive/html/qemu-discuss/2021-02/msg00131.ht=
ml</a><br><br></div><div>In continuation with the last post, I have a few m=
ore questions to ask -<br><br></div>My experiment is still, mostly the same=
. I record clock values in KVM mode, and then replay the clock values in TC=
G mode. However, now I am recording and replaying all of the clock values (=
I was only recording/replaying the host clock previously). However, I do no=
t use the -icount feature.<br><br></div></div>- Why are clock values being =
replayed at checkpoints? <br><div>- Can we ignore replaying at checkpoints =
and do a dumb replay as and when the clock read actually happens?</div><div=
>- Based on the documentation available, I can see that checkpoints are nec=
essary for thread synchronization. Does this mean, if I do not replay clock=
 values at checkpoints, the guest kernel scheduler might behave incorrectly=
 during replay ?<br><br></div><div>Thank you very much, again.<br><br></div=
><div>Best Regards,<br></div><div>Arnab<br></div><div><div><br><br><br><br>=
</div></div></div>

--000000000000038f0205bc7cc9b7--

