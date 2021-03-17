Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9F33E7D6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:45:07 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMN7K-0000qq-LU
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMN6T-0000NH-5i
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:44:13 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:44709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMN6R-00064X-Lk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:44:12 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso504705oti.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3yKH2zJ/PTflSGyf1i1Gg/5S89Ss7t+j8BN1GPvyZqE=;
 b=ljY3SXM/PH/25X2GkmhoE0Y/hVevBHVWV/EC+fNE6Z/DQOfFCLm1Giiij4EqExkn4c
 30Lk90ovBoIY1KMKbobROaBtV/IYhNr+IXfNo8IsgoNlvtnD+sLUOXSOOh0Cw5PhKebF
 9kR7mPxGs96L/lqjJKuPN9zRspnia8l2e0a+ecajFhe9KunZC208kgKpMc18Cdec4B14
 oJ6dULCRO99zSuJdv6xpBntgdrqxQMWzA71x5V/7QJVtnGfrJxIi8RT63146oP7XaY+j
 N7blC3N6imsi2z0PFTqlptizAhe4tLZgh1mug32HuquAYCv3rFAWrfmyPcZBFh+bEvg+
 pwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3yKH2zJ/PTflSGyf1i1Gg/5S89Ss7t+j8BN1GPvyZqE=;
 b=GXZrCrrFOKC5XlAs++/YfYghOi6+nue68QYz4VYxebtKqehIBz/ysJUVeF/zFla5rS
 XAf0tQMMr843sYT5G6OV6+yjllAcgvixEpMpgaxBGl9o6PNI5cikOA4pEeZfX0UFTsTw
 fjSUjmCunWIFEDhJ6Gf4pvLk1NTFQj5xtPG2ll8aYfqaryU3uQ1ZaVXWY07ZgAE5X/It
 ERCF2/EgLOpZeCNJwwN6vo43YuMSsTUFJMj9S9grTtd3aapeaIbY25PGpuKNPKUkkzCz
 /vFAACetWZ0ir73YsAKz3uPR7D1GfBwUhRgGOoorqy6bGKCgtZxLRVkSDMyTNrqkXijj
 iN2A==
X-Gm-Message-State: AOAM532vIkEn9ldT7yNBvxglhXrbzJDlET/PfpiJ2+UfNjbbYoEz1hd9
 PfA1aWAJl5Tnv0qYa04MSxEKOm5nCD8YulJSuTY/iTyfxYU=
X-Google-Smtp-Source: ABdhPJy9f4SVnBBbeOBgitjzqyjSUl8yNXORlF61Sd9J1pGJhVpJ2/hlapHYH8n3KOmrd/aVMiRfy0fK/gNF4eMcrHc=
X-Received: by 2002:a9d:340b:: with SMTP id v11mr1673428otb.284.1615952650271; 
 Tue, 16 Mar 2021 20:44:10 -0700 (PDT)
MIME-Version: 1.0
From: zhao xiaojun <xiaojun.zhao141@gmail.com>
Date: Wed, 17 Mar 2021 11:43:59 +0800
Message-ID: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
Subject: Can not use hmp block_resize command with -blockdev option
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b17ef205bdb34b82"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=xiaojun.zhao141@gmail.com; helo=mail-ot1-x331.google.com
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

--000000000000b17ef205bdb34b82
Content-Type: text/plain; charset="UTF-8"

Hi,
I use -blockdev option to specify a drive when qemu boot and i want to
resize it with hmp block_resize command. The hmp block_resize comand's
arguments: block_resize device new_size.
So I query the device by qmp query_block command, but the device filed of
the result output is NULL string.

result output:
{
  "return": [
    {
      "io-status": "ok",
      "device": "",
        ...
}

I noticed that the qmp block_resize command supports device or node-name as
argument.

If i can continue use the the hmp block_resize command with the device
argument?

Regards.

--000000000000b17ef205bdb34b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0</div><div>I use -blockdev option to specify=
 a drive when qemu boot and i want to resize it with hmp block_resize comma=
nd. The hmp block_resize comand&#39;s arguments: block_resize device new_si=
ze.</div><div>So I query the device by qmp query_block command, but the dev=
ice filed of the result output is NULL string.</div><div><br></div><div>res=
ult output:</div><div>{<br>=C2=A0 &quot;return&quot;: [<br>=C2=A0 =C2=A0 {<=
br>=C2=A0 =C2=A0 =C2=A0 &quot;io-status&quot;: &quot;ok&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 &quot;device&quot;: &quot;&quot;,<br></div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ...</div><div>}</div><div><br></div><div>I noticed that the =
qmp block_resize command supports device or node-name as argument.</div><di=
v><br></div><div>If i can continue use the the hmp block_resize command wit=
h the device argument?</div><div><br></div><div><span class=3D"gmail-op_dic=
t3_font24 gmail-op_dict3_marginRight gmail-c-gap-right">Regards.</span><br>=
</div></div>

--000000000000b17ef205bdb34b82--

