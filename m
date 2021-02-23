Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A627D322F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:54:42 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaxN-0000Dk-5W
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <whensungoes@gmail.com>)
 id 1lEajs-0002Q6-PK
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:40:45 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <whensungoes@gmail.com>)
 id 1lEajr-0003Ap-6Z
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:40:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id q20so9113093pfu.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dbocFgUAooLEKYVNS8NaMRt5Bduhg+SJ6stcQGF0bqM=;
 b=T7qCDHukFsovnoKEug8Zcr8nfqgoYCo02KQ7jJKqURyvZO7NqFdPBQG268qANQi3HP
 cZWj4PQLpu87NZXb4RgSwreKaeS8KSTyWfslQDb7h5B+z481T2HNmZ9sPvcsvAFSv/Zl
 nHIQ/o9NZaCvPpvCJykyxo5H2i70MyR6gb2Lub33SM+OBD9uaEC3VsdyERCV5iA6FziB
 CoPEKiJCp+607l9dYFh5dGu6YhrnQedAT9T/Jr6HSvchZQL7/oV/hU8n2zI25yC8leSS
 y4KnrQaXRUOplZqO3s5O28mbyyESCEK14QCmgpWqlGtkvQa0EWQ+wBs3a2e8Ru94EGZW
 KVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dbocFgUAooLEKYVNS8NaMRt5Bduhg+SJ6stcQGF0bqM=;
 b=std3RBq+7v225t21qvf9TEx4zTu1MGJkfa9FJf/0HaOV0S9WVU0puHnIG6gSrzvpGM
 P3qVklYa6WGi7QfCsC+c3VrMshxG9OtITAQw6bUuL41EdEcf8URN5xafohTithTwTgKw
 tVB0sDXgAx58NLpK+7g8NKtGL354dS6kp2qKneeeDDVvzdEyCMD6fuk4XOgArVkkbdew
 zio2zaVXZiUXgRsH1QUdmS+kqd1HkHsGJbavyLIeDTLTivm5k/BJg5BCR7BJ5fn4qqpn
 o4fFGH6NulHg0+fmtSEn1cPPA45L7BTbpBoXhjjkU77+aQIgSNBL/qsLvmX12GR3LkJz
 ERZw==
X-Gm-Message-State: AOAM531DFJS0prCdSvV8kxgWE4mf8KlJkgKsR2neuPjTn5aq+elYVVUC
 y9Dx6pYJ12maooQ1AX8HBIGx9AhAGNq7kwecf8FoR5y5Nlw=
X-Google-Smtp-Source: ABdhPJzVSmdOkH23T2AETC4ug0PSYz4jHqXFRBz8SZQ0R7PLfoZtcxmRjye38g+DHRUvNnariD4Za9B8sEm3ccUW13w=
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr3933438pgh.405.1614098439050; 
 Tue, 23 Feb 2021 08:40:39 -0800 (PST)
MIME-Version: 1.0
From: uty uaty <whensungoes@gmail.com>
Date: Tue, 23 Feb 2021 11:39:57 -0500
Message-ID: <CANrjN1V+yjLCq6iYYM21yGPqdW0ztL7ESFgtrg1yXRWWFOPfMA@mail.gmail.com>
Subject: Install Win10 x64 on QEMU TCG failed
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000179b8c05bc039430"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=whensungoes@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Feb 2021 11:52:20 -0500
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

--000000000000179b8c05bc039430
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to install Windows 10 on QEMU using TCG. I understand it would
be slow, but I am trying to intercept some of the events in the system.

It works for Win7. However, when I install Win10, it takes a long time
to finish most parts and eventually shows me "Why did my pc restart" screen.

The version I'm using is Qemu-5.2.0.
qemu-system-x86_64 -m 4G \
        -cpu qemu64 \
        -vga cirrus \
        -cdrom ~/iso/Win10_x64.iso \
        -boot d \
        win10.hd

Is it something because of Win10's hypervisor?
Any suggestions?

Best Regards,
uty

--000000000000179b8c05bc039430
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to install Windows 10 o=
n QEMU using TCG. I understand it would be slow, but I am trying to interce=
pt some of the events in the system.</div><div><br></div><div>It works for =
Win7. However,=C2=A0when I install Win10, it takes a long time to=C2=A0fini=
sh most parts and eventually shows me &quot;Why did my pc restart&quot; scr=
een.</div><div><br></div><div>The version I&#39;m using is Qemu-5.2.0.=C2=
=A0</div><div>qemu-system-x86_64 -m 4G \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -cpu qemu64 \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -vga cirrus \</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cdrom ~/iso/Win10_x64.iso \</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -boot d \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 wi=
n10.hd</div><div><br></div><div>Is it something because of Win10&#39;s hype=
rvisor?</div><div>Any suggestions?=C2=A0</div><div><br></div><div>Best Rega=
rds,</div><div>uty</div></div>

--000000000000179b8c05bc039430--

