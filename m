Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DB2D8429
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 04:37:31 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knvir-00023I-S2
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 22:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonwxqian@gmail.com>)
 id 1knvgo-0001I4-5X
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 22:35:22 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leonwxqian@gmail.com>)
 id 1knvgm-0005zV-NA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 22:35:21 -0500
Received: by mail-pl1-x630.google.com with SMTP id p6so5624564plr.7
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 19:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:subject:date:from:to:cc;
 bh=CyCN2WyUzFI5OqLggn6DlLc8EOZAEoOyQVHMY+s1Ny8=;
 b=gRxYAwVOsa7kczwu33YY+e6EpElXNolauiGK+DaimimBfWvvo4vZcbTctixCY9FRIP
 dtCyWGsm/bZAA2CO2qKmztNy3WTaOE8gJG/0bE6nMG50XHN0LqfhSoqXFYVlMO2cQtAi
 +LGsb8OTCJy9I4x3pnFQL9UCUFJf7x4OmaXgFcN30M0/OKevGTrHEjJxhr7nK3SeeffB
 4XaScanjyPH7EDa7db+4i6zC1bulASR6R3gcDhisRPPSydDUUmnauAPqqIN1JU1cm2Pm
 b+HWEffyTPxY6L6uqkd62um11R40ciqo75AIbVE/3LcxDcIR7atRWj6+ygh3aMmxzHKC
 W0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:subject:date:from:to:cc;
 bh=CyCN2WyUzFI5OqLggn6DlLc8EOZAEoOyQVHMY+s1Ny8=;
 b=L9Tg6eOGlhVPQYyokcyMxlo6JE0Bfg6O6SmHiepYjKosEaKm2sslvVR2G2qxKanFqX
 UdpNs7qzzQkf+2t4K5oEjeCzK9qi7DwsFE5TdBTIv7QYyqj/bMOxftxNLVcRe9Rt7B7K
 uMJoGq/XuZYtV3c9EeJHhC306ZP/9j2izZjF8I8co4Z8cQ9XjlhmeVHb6o1zPDEIOWsp
 S46U83VQslLdhc4Lw50SWB9+FxM/ozC8b2B0AnK9tUeNNAbIdM6V/Ymur6vWviDxlCFQ
 Y4HfduPSZRCdFtvFWMWGcDMN7WXekok3ktf5Ocgag0Y56DbAAzNddBPV46huXP6tpE7m
 1s1Q==
X-Gm-Message-State: AOAM530ZiHRseOGmiHjPvdi2yb92MjPpRbihNT83X5MocjewZFk6PRbE
 u2NjzAdg1Ddjdd+G3wENZLk=
X-Google-Smtp-Source: ABdhPJyPbRThDjwgeffRFayeQJPcnLlfXhoWlCZX3UBk3dJf9CKpadW39hm1BZWjm2rfseHdphLfCA==
X-Received: by 2002:a17:90a:f412:: with SMTP id
 ch18mr16131217pjb.69.1607744119208; 
 Fri, 11 Dec 2020 19:35:19 -0800 (PST)
Received: from localhost ([203.205.219.183])
 by smtp.gmail.com with ESMTPSA id t9sm8690867pjo.53.2020.12.11.19.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 19:35:18 -0800 (PST)
Message-ID: <5fd43a76.1c69fb81.b85b1.0daa@mx.google.com>
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
Date: Sat, 12 Dec 2020 11:35:11 +0800 (GMT+08:00)
From: =?UTF-8?B?bGVvbnd4cWlhbkBnbWFpbC5jb20=?=<leonwxqian@gmail.com>
To: =?UTF-8?B?UCBKIFA=?=<ppandit@redhat.com>,
 =?UTF-8?B?UGFvbG8gQm9uemluaQ==?=<pbonzini@redhat.com>
Content-Type: multipart/alternative; 
 boundary="----=_Part_0_266055108.1607744113187"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=leonwxqian@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_EXCESS_BASE64=0.001, FROM_MISSP_FREEMAIL=1.424, HTML_MESSAGE=0.001,
 MIME_BASE64_TEXT=1.741, MIME_HTML_MOSTLY=0.1, MPART_ALT_DIFF=0.79,
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
Cc: =?UTF-8?B?UGV0ZXIgTWF5ZGVsbA==?= <peter.maydell@linaro.org>,
 =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 =?UTF-8?B?Sm9obiBTbm93?= <jsnow@redhat.com>,
 =?UTF-8?B?UUVNVSBEZXZlbG9wZXJz?= <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFya3VzDQogQXJtYnJ1c3Rlcg==?= <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_0_266055108.1607744113187
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_266055108.1607744113187
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBQYW9sbyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlllcywgeW91IGFyZSByaWdo
dC4gSSByZWFkIHRoZSBsb2dpYyBvZiB0aGUgY29kZSBhZ2FpbiwgSWYgbGJhPS0xIGlzIHJlc3Ry
aWN0ZWQsIHRoaXMgcGF0aCB3aWxsIG5vdCBiZSB0cmlnZ2VyZWQuQW5kIEkgdGhpbmsgdGhhdCB5
b3VyIGZpeCBpcyB0aGUgYmVzdCBzb2x1dGlvbiB0byB0aGlzIGlzc3VlLjxicj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2PldlbnhpYW5nIFFpYW48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjwhLS1lbXB0eXNpZ24tLT48L2Rpdj48ZGl2PjxkaXYgc3R5
bGU9ImZvbnQtc2l6ZToxMnB4O3BhZGRpbmc6MnB4IDA7Ij4tLS1PcmlnaW5hbC0tLTwvZGl2Pjxk
aXYgc3R5bGU9ImZvbnQtc2l6ZToxMnB4O2JhY2tncm91bmQ6I2YwZjBmMDtjb2xvcjojMjEyMTIx
O3BhZGRpbmc6OHB4IWltcG9ydGFudDtib3JkZXItcmFkaXVzOjRweDtsaW5lLWhlaWdodDoxLjU7
Ij48ZGl2PjxiPkZyb206PC9iPiAiUGFvbG8gQm9uemluaSImbHQ7cGJvbnppbmlAcmVkaGF0LmNv
bSZndDs8L2Rpdj48ZGl2PjxiPkRhdGU6PC9iPiBGcmksIERlYyAxMSwgMjAyMCAxOTo0NiBQTTwv
ZGl2PjxkaXY+PGI+VG86PC9iPiAiV2VueGlhbmcgUWlhbiImbHQ7bGVvbnd4cWlhbkBnbWFpbC5j
b20mZ3Q7OyJQIEogUCImbHQ7cHBhbmRpdEByZWRoYXQuY29tJmd0Ozs8L2Rpdj48ZGl2PjxiPkNj
OjwvYj4gIkpvaG4gU25vdyImbHQ7anNub3dAcmVkaGF0LmNvbSZndDs7IlFFTVUgRGV2ZWxvcGVy
cyImbHQ7cWVtdS1kZXZlbEBub25nbnUub3JnJmd0OzsiTWFya3VzCiBBcm1icnVzdGVyIiZsdDth
cm1icnVAcmVkaGF0LmNvbSZndDs7IlBldGVyIE1heWRlbGwiJmx0O3BldGVyLm1heWRlbGxAbGlu
YXJvLm9yZyZndDs7IlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiZsdDtwaGlsbWRAcmVkaGF0LmNv
bSZndDs7PC9kaXY+PGRpdj48Yj5TdWJqZWN0OjwvYj4gUmU6IFtQQVRDSF0gaWRlOmF0YXBpOiBj
aGVjayBpb19idWZmZXJfaW5kZXggaW4gaWRlX2F0YXBpX2NtZF9yZXBseV9lbmQ8L2Rpdj48L2Rp
dj48YnI+T24mbmJzcDsxMS8xMi8yMCZuYnNwOzA5OjMyLCZuYnNwO1dlbnhpYW5nJm5ic3A7UWlh
biZuYnNwO3dyb3RlOjxicj4mZ3Q7Jm5ic3A7KyZuYnNwO1RoZSZuYnNwO2xiYSZuYnNwO2lzJm5i
c3A7c2V0Jm5ic3A7dG8mbmJzcDstMSZuYnNwO3RvJm5ic3A7YXZvaWQmbmJzcDtzb21lJm5ic3A7
Y29kZSZuYnNwO3BhdGhzLCZuYnNwO3RvJm5ic3A7bWFrZSZuYnNwO1BvQyZuYnNwO3NpbXBsZXIu
PGJyPiZndDsmbmJzcDs8YnI+Jmd0OyZuYnNwO3ZvaWQmbmJzcDtpZGVfYXRhcGlfY21kX3JlcGx5
X2VuZChJREVTdGF0ZSZuYnNwOypzKTxicj4mZ3Q7Jm5ic3A7ezxicj4mZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7aW50Jm5ic3A7Ynl0ZV9jb3VudF9saW1pdCwmbmJzcDtz
aXplLCZuYnNwO3JldDs8YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
O3doaWxlJm5ic3A7KHMtJmd0O3BhY2tldF90cmFuc2Zlcl9zaXplJm5ic3A7Jmd0OyZuYnNwOzAp
Jm5ic3A7ezxicj4mZ3Q7Jm5ic3A7Li4uLi48YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2lmJm5ic3A7KHMtJmd0O2xiYSZu
YnNwOyE9Jm5ic3A7LTEmbmJzcDsmYW1wOyZhbXA7Jm5ic3A7cy0mZ3Q7aW9fYnVmZmVyX2luZGV4
Jm5ic3A7Jmd0Oz0mbmJzcDtzLSZndDtjZF9zZWN0b3Jfc2l6ZSkmbmJzcDt7Jm5ic3A7PGJyPiZn
dDsmbmJzcDsmbHQ7LS0tLS0mbmJzcDtzZXQmbmJzcDtsYmEmbmJzcDt0byZuYnNwOy0xJm5ic3A7
dG8mbmJzcDthdm9pZCZuYnNwO3RoaXMmbmJzcDtwYXJ0PGJyPiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsuLi4uLjxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7fTxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7aWYmbmJzcDsocy0mZ3Q7ZWxlbWVudGFyeV90
cmFuc2Zlcl9zaXplJm5ic3A7Jmd0OyZuYnNwOzApJm5ic3A7ezxicj4mZ3Q7Jm5ic3A7Li4uLi4u
PGJyPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDt9Jm5ic3A7ZWxzZSZuYnNwO3s8YnI+Jmd0OyZuYnNwOy4uLi4uLi48YnI+Jmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2lmJm5ic3A7KHMtJmd0O2xiYSZuYnNwOyE9Jm5i
c3A7LTEpJm5ic3A7eyZuYnNwOyZsdDstLS0tLTxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7aWYmbmJzcDsoc2l6ZSZuYnNwOyZndDsmbmJz
cDsocy0mZ3Q7Y2Rfc2VjdG9yX3NpemUmbmJzcDstJm5ic3A7cy0mZ3Q7aW9fYnVmZmVyX2luZGV4
KSk8YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3NpemUmbmJzcDs9Jm5ic3A7KHMtJmd0O2NkX3Nl
Y3Rvcl9zaXplJm5ic3A7LSZuYnNwO3MtJmd0O2lvX2J1ZmZlcl9pbmRleCk7Jm5ic3A7Jm5ic3A7
PGJyPiZndDsmbmJzcDsmbHQ7LS0tLS08YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
O308YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwO308YnI+Jmd0OyZuYnNwOzxicj48YnI+SWYmbmJzcDt0aGUmbmJzcDtsYmEm
bmJzcDtpcyZuYnNwO25vdCZuYnNwOy0xLCZuYnNwO0kmbmJzcDtkb24ndCZuYnNwO3RoaW5rJm5i
c3A7YmFkJm5ic3A7dGhpbmdzJm5ic3A7Y2FuJm5ic3A7aGFwcGVuJm5ic3A7b24mbmJzcDt0aGlz
Jm5ic3A7cGF0aC4mbmJzcDs8YnI+Jm5ic3A7Jm5ic3A7QW0mbmJzcDtJJm5ic3A7d3Jvbmc/PGJy
Pjxicj5QYW9sbzxicj48YnI+KTxicj4qJm5ic3A7MTI1NCZuYnNwO0VYUFVOR0U8YnI+KiZuYnNw
OzEyNTMmbmJzcDtFWElTVDxicj48L2Rpdj4=
------=_Part_0_266055108.1607744113187--

