Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51660D0B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:35:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLmX-0003hn-1B; Tue, 25 Oct 2022 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1onLmV-0003hS-0h
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:23:55 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1onLmS-0005Cv-RX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:23:54 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4MxbLv4BVMz8PbN;
 Tue, 25 Oct 2022 11:23:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=from:to:cc
 :date:message-id:in-reply-to:references:subject:mime-version
 :content-type; s=default; bh=uNoVZ061HZmjvCEUJRcLHHOrbkY=; b=kyN
 6LDmwO+jD2Q8uxISb785o4bBW3C7f0WNGOUzLzZ+Yl6jR3zjTjGOqQNNfuQmivyv
 GfGEBD/pExTWFrYgxthPy32D2GTG7kK8QdK9wE8fDMrUbsN3LFjSb4yoP9zBOm1J
 kAwZEHiB5kVRFS9EtDKGNXiEqnMcFg5ULo25RrbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=from:to:cc
 :date:message-id:in-reply-to:references:subject:mime-version
 :content-type; q=dns; s=default; b=BmFigRjFKLrCu1WpRqLo6TJ9uO8Ry
 w54vLKXA1O5oxIojkEU+MSDtbKeHnPy9LRjCQtq/twCmkrzielW29Kek80CU39lk
 HnjxjbsqIa7yf9T6qG0AH4rFPnJEilLBQL9Zuajd5EFGxbVOnCeYMnMEisQplEPE
 6Lds2Nz4HsRm44=
Received: from [192.168.100.93]
 (ipagstaticip-fb0cb5d9-e423-dda2-c442-adc5999de965.sdsl.bell.ca
 [76.65.209.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4MxbLv31Ppz8PbK;
 Tue, 25 Oct 2022 11:23:51 -0400 (EDT)
From: Brad Smith <brad@comstyle.com>
To: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 "Li-Wen Hsu" <lwhsu@freebsd.org>, "Alex Benn_e" <alex.bennee@linaro.org>,
 "Philippe Mathieu-Daud_" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
CC: <qemu-devel@nongnu.org>
Date: Tue, 25 Oct 2022 11:23:49 -0400
Message-ID: <1840fbe1f88.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
In-Reply-To: <791d0182-e6ae-4db3-96f0-8b69cb33d06c@redhat.com>
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <Y1f6dxjvD01DtXyG@humpty.home.comstyle.com>
 <791d0182-e6ae-4db3-96f0-8b69cb33d06c@redhat.com>
User-Agent: AquaMail/1.39.1 (build: 103901207)
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="1840fbe21c64cdc27f34619f77"
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--1840fbe21c64cdc27f34619f77
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you.

On October 25, 2022 11:10:49 a.m. Thomas Huth <thuth@redhat.com> wrote:

> On 25/10/2022 17.02, Brad Smith wrote:
>> tests: Add sndio to the FreeBSD CI containers / VM
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>> ---
>
> Thanks, queued to my testing-next branch:
>
>  https://gitlab.com/thuth/qemu/-/commits/testing-next
>
>  Thomas


Sent with Aqua Mail for Android
https://www.aqua-mail.com

--1840fbe21c64cdc27f34619f77
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">Thank you.</span></div><=
div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On October 25, 2022 11:10:49 a.m. Thomas Huth &lt;thuth@r=
edhat.com&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On 25/10/2022 17.02, Brad Smith wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">tests: Add sndio to the FreeBSD CI containers / VM</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Brad Smith &lt;brad@comstyle.com&gt;</div>
<div dir=3D"auto">---</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks, queued to my testing-next branch:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; https://gitlab.com/thuth/qemu/-/commits/testing-ne=
xt</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; Thomas</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div>
<div style=3D"color: black;">
<p style=3D"margin: 0 0 1em 0; color: black; font-family: sans-serif;">Sent=
 with <a href=3D"https://play.google.com/store/apps/details?id=3Dorg.kman.A=
quaMail">Aqua Mail for Android</a><br>
<a href=3D"https://www.aqua-mail.com">https://www.aqua-mail.com</a></p>
</div>
</body>
</html>

--1840fbe21c64cdc27f34619f77--


