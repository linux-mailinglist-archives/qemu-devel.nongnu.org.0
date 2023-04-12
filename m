Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E466DE964
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 04:23:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmQ8Q-0006aW-2y; Tue, 11 Apr 2023 22:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikestramba@gmail.com>)
 id 1pmQ8O-0006aK-88
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 22:22:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mikestramba@gmail.com>)
 id 1pmQ8L-00060L-Qf
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 22:22:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id q2so14770239pll.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 19:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681266171; x=1683858171;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3K+9IvXB2mtIuJBZPHda5ikU2/0WyEgAuc2+hzc/yC8=;
 b=K+w976FVjz9rGvn/qQt7mk7bGJeSTeIi0nhmzR3i2GdHe9SmYGOmlJpqh2DPUdmNN/
 l24mn5qp9McoaGYxDtbYESDts87mU8eY6mgZx9e/esPRsmtONYjv0A5k1e5iwOaou1dm
 /2C1iLZUKSXslfCzToagBABNpVCMe03vIZnZ4d6+pctYNH3yGs/R+/Z3h1/NGQyXhOiE
 3wdLyDVTyF9IIul/UeSjnRMbRDqHmV1U17CMgacBcTdr5kPD8g8YddoNTJKGouP8yU5s
 k5gU58ZRCTyMDorTqLD0iHJOzDIiIHxZHrAM3IjAKKzC19cnidUO0YEFLvBZADNDMff+
 VAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681266171; x=1683858171;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3K+9IvXB2mtIuJBZPHda5ikU2/0WyEgAuc2+hzc/yC8=;
 b=R0kRETMiNwvfz4016UDCgkCbgUwV5UKhkC6xFQxAFqI6bXcgQAjT6WODB8PqfHU+ad
 11Pzbvfn3OH9gbWs4r+9nzOTDvJzYBhVBtq30J7rC4BkidTllhVlpeXYZi7H+IhC+LRT
 bumVlDdM6Xkw76CiQUgJwKa1HoDWCjwcKYr8avqa7uEAGfTFKJwEKb2nrJndJqt/feEi
 nJHULYiLMtURvRuWUDQzn6HEZD2uXGrVzKRmTnFshE3/Ts9/xM0dDCYsmL/jmCjyUE8h
 oJm3fyt+Uei/r8RlznfJX8hlPLsmAEex0OvmMYsBSZGmh5XVTwGRMS+PnN0+9UAskmwd
 dtQQ==
X-Gm-Message-State: AAQBX9dXbv+yzKcKIX2BhVG8bGC+puUahMU9xoF0Is/G0t3PlzLvQNk8
 Gh8iSpYr6IaHJaAgb6GPhf4+JdLwyJ17Y4GLwE3TcQR3ZgKFaQ==
X-Google-Smtp-Source: AKy350aeEmtQHZ8I2qFQeXVCdziGd+nj0uz8uv+jVvFlnRhTN1fLPVDuWeB6KnKyGr2et8vRA9spOpi7DjAK73nWfuk=
X-Received: by 2002:a17:90a:c2:b0:240:c13d:1325 with SMTP id
 v2-20020a17090a00c200b00240c13d1325mr178685pjd.5.1681266170965; Tue, 11 Apr
 2023 19:22:50 -0700 (PDT)
MIME-Version: 1.0
From: Mike Stramba <mikestramba@gmail.com>
Date: Tue, 11 Apr 2023 22:22:39 -0400
Message-ID: <CAA5vqSbgTTeF-tiUtK7pCYkyQXJEV3WuZuXEK=4GjigPLf=X7A@mail.gmail.com>
Subject: How to write a zIPL section in IPL2 record on a raw disk
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e4bcd205f91a48f2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=mikestramba@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: mikestramba@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e4bcd205f91a48f2
Content-Type: text/plain; charset="UTF-8"

I have a CKD file, created with the Hercules dasdinit program.
It's a  (hercules) 3350 uncompressed file.
I've put a small "hello world" IPL program on it, and it works fine with
Hercules

When I try to run it with qemu-system-s390x I get :

LOADPARM=[        ]
Using virtio-blk.
Using guessed DASD geometry.
Using ECKD scheme (block size  4096), CDL
No zIPL section in IPL2 record.   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
zIPL load failed.
Could not find a suitable boot device (none specified)
Failed to load OS from hard disk

The qemu script is :
qemu-system-s390x -m 16 -drive format=raw,file=test-ipl.3350.un,if=virtio
-nographic

I found this link re:  the zipl command.
https://www.ibm.com/docs/en/linux-on-systems?topic=u-modes-syntax-overview

Where is that command   and  / or its source ?

Mike

--000000000000e4bcd205f91a48f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a CKD file, created with the Hercules dasdinit prog=
ram.<div>It&#39;s a=C2=A0 (hercules) 3350 uncompressed=C2=A0file.<br></div>=
<div>I&#39;ve put a small &quot;hello world&quot; IPL program on it, and it=
 works fine with Hercules<br></div><div><br></div><div>When I try to run it=
 with=C2=A0qemu-system-s390x I get :</div><div><br></div><div>LOADPARM=3D[ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>Using virtio-blk.<br>Using guessed DASD geo=
metry.<br>Using ECKD scheme (block size =C2=A04096), CDL<br>No zIPL section=
 in IPL2 record.=C2=A0 =C2=A0&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<br>zIPL load failed.<br>Cou=
ld not find a suitable boot device (none specified)<br>Failed to load OS fr=
om hard disk<br></div><div><br></div><div>The qemu script is :</div><div>qe=
mu-system-s390x -m 16 -drive format=3Draw,file=3Dtest-ipl.3350.un,if=3Dvirt=
io -nographic<br></div><div><br></div><div>I found this link re:=C2=A0 the =
zipl command.</div><div><a href=3D"https://www.ibm.com/docs/en/linux-on-sys=
tems?topic=3Du-modes-syntax-overview">https://www.ibm.com/docs/en/linux-on-=
systems?topic=3Du-modes-syntax-overview</a><br></div><div><br></div><div>Wh=
ere is that command=C2=A0 =C2=A0and=C2=A0 / or its source ?</div><div><br><=
/div><div>Mike</div><div><br></div><div><br></div></div>

--000000000000e4bcd205f91a48f2--

