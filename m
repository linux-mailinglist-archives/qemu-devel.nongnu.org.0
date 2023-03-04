Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E946AAAA3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:06:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTRK-0005Bh-9Y; Sat, 04 Mar 2023 10:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1pYTRJ-0005BR-3Y
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:04:49 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1pYTRH-0004yS-AX
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:04:48 -0500
Received: by mail-lj1-x22e.google.com with SMTP id y14so5255753ljq.4
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677942284;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JvuQF4XasiNIzABLik5IHB8R8rMpXk1ZOT+0CFAbS/c=;
 b=HkrPR8dtv+lsA84/5IupHEkXbirqqgbAg+EmTwQ3lDD4CC2H6AeayEkm/e/VRc2J5D
 2vnxVBtWivtYaUc6vn/SRBaiwyDlEon3oFB2uVvG8QfsS1haqFfx0lcXFCwUcZKanZJL
 nyhbRt3AMy1S6gQ5OsuG88GOJQ0Db/zdolGvFpsjXtWT9nfTCy1M0B7ajUJ84xU8pRx8
 pYiqvUdqYIli7NjMzEQV8QfUKG/W3ckdJ0606V8Q8OAHc1EDG4WoNjzZvTxyG3BeWwUQ
 4k8D+7iw8pFSD4sssCBZDEIqaIWuLeHKsS8Wt3IZqcejBv1m+kCcSGotrBcR75o+jsfc
 Y+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677942284;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JvuQF4XasiNIzABLik5IHB8R8rMpXk1ZOT+0CFAbS/c=;
 b=zOavqh6qSRv9CT+V47rOf5Ubh1sYxj1dkXfqDrjI4zSpBVYBMes72tErDwlLPb49GE
 OIECQCJ3DpfasNKoTd8lOZVFZfWGknDKHEs61Gp9ICvKACOJA5JPZsxKg9nGEe2MADBl
 7ctPlrwo7AADNasWtH5pzQtMLhtYskrwCVqoKpDoC5QpmOHE8kHgWxgbbS4Cima+Y0QB
 pyR9Un2OPayZYdao7VyQBxhPi8WJtsAbzzj8NvlvNNkxxPfndXFG/+PRpjlmAOzxRXh5
 hbl+VUBl4eJsDMyOMrHBdot3xKlqSHfvzyXzPC5EWx3sB6weUd6moj4hloS4A0v5RPk+
 2Zaw==
X-Gm-Message-State: AO0yUKWck5rLsIY2lMr4mZCZTJQXZvmukrav/RYsclhfGNYB0Z2dRAiP
 r26l3o6AlLWZmVhfUNbYpBfDRwbBZGMrNYGtGcpZULNXOL8EVA==
X-Google-Smtp-Source: AK7set+Pu8HZMtM0iblclqcWiGuSFt9rDuU6EIHZuIMPLr6xvG64Tlbj2GndY2qoVUwqGixErzoiuYzSshe3degiVw8=
X-Received: by 2002:a05:651c:1242:b0:290:6f84:541 with SMTP id
 h2-20020a05651c124200b002906f840541mr1544362ljh.8.1677942284397; Sat, 04 Mar
 2023 07:04:44 -0800 (PST)
MIME-Version: 1.0
From: Ayush Singh <ayushdevel1325@gmail.com>
Date: Sat, 4 Mar 2023 20:34:51 +0530
Message-ID: <CA+Yfj7tzaNT6HaHe42cAMR6KtLho-7aQGqnbAqj5ruYjaoPpiw@mail.gmail.com>
Subject: [GSoC 23] RDB Server Proposal Qustions
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Content-Type: multipart/alternative; boundary="000000000000d0ae9905f61461bd"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=ayushdevel1325@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d0ae9905f61461bd
Content-Type: text/plain; charset="UTF-8"

Hello everyone

I was thinking about working on the RDB Server project, and thus just
wanted clarification of IronRDB status. The GSoC Project description [1]
states that IronRDB [2] lacks some server support. So what are the
essential features that IronRDB is missing?

Also, another possibility is using FreeRDB [3] from another language. This
other language itself can also be Rust due to its excellent C FFI. So is it
preferable to improve IronRDB or just use FreeRDB?

Yours Sincerely
Ayush Singh

[1]: https://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server
[2]: https://github.com/Devolutions/IronRDP
[3]: https://www.freerdp.com/

--000000000000d0ae9905f61461bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone</div><div><br></div><div>I was thinkin=
g about working on the RDB Server project, and thus just wanted clarificati=
on of IronRDB status. The GSoC Project description [1] states that IronRDB =
[2] lacks some server support. So what are the essential features that Iron=
RDB is missing?<br></div><div><br></div><div>Also, another possibility is u=
sing FreeRDB [3] from another language. This other language itself can also=
 be Rust due to its excellent C FFI. So is it preferable to improve IronRDB=
 or just use FreeRDB?<br></div><div><br></div><div>Yours Sincerely</div><di=
v>Ayush Singh<br></div><div><br></div><div>[1]: <a href=3D"https://wiki.qem=
u.org/Google_Summer_of_Code_2023#RDP_server">https://wiki.qemu.org/Google_S=
ummer_of_Code_2023#RDP_server</a></div><div>[2]: <a href=3D"https://github.=
com/Devolutions/IronRDP">https://github.com/Devolutions/IronRDP</a></div><d=
iv>[3]: <a href=3D"https://www.freerdp.com/">https://www.freerdp.com/</a></=
div></div>

--000000000000d0ae9905f61461bd--

