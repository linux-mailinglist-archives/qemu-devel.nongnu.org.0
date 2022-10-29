Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBC6124EA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 20:32:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooqcK-0004DO-VK; Sat, 29 Oct 2022 14:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josephrvishal@gmail.com>)
 id 1oonhK-0004wu-Km
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 11:24:34 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josephrvishal@gmail.com>)
 id 1oonhJ-0007iE-4l
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 11:24:34 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-12c8312131fso9409721fac.4
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nP4Icpre89JUs8o5sb1UxZDa1EamBmS8vlqYF9bpsdA=;
 b=W2wPbjL83Tt16apt5xJbTcBvD2zVm7tG481QqbkpakLPiWR6LlbFdHyMbox9mpxxIL
 wgYgGHI4ds4b4poPj6RO80glMchSJbUXvQsMPHyu+msUmsm3zrZFVlVRpzjdJSDsUfD6
 accGo2xLE0XdLeOJZOBHXfATnfHEnlKZrMoOpn0hyYL2ksDF//mbu8HMNWTEof/H8l9E
 SX9mFQs+D4T3nPS3ViC1yDpgkJcqRAqoOh4exKY7NwSJ+8a/lfzfoz8pPHaUtcF7/imQ
 iy77LXghb1jtwbKsxXzCbTiBuA+oaL1RnAPXNH7/RPnKbIwcv46wEXC+RXjpAWt+NlPr
 EBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nP4Icpre89JUs8o5sb1UxZDa1EamBmS8vlqYF9bpsdA=;
 b=aB7wYsz7m+dXLs95Yf67/ED+TfnhBPM5/iBJ0Qh4+xSKrlutINw604IIZN6Welrxqj
 OZ+Sw0N9zhoXFmIFk3/lVnam6H2Dp9f7YePsuw4zkU8cKRV0AR1mLzmQTbr1c1sruiwE
 D8qXN39wNWpmLvRpdIM5sD1vKO3BtZ0bw5H/CFNw9mbzajqB5R4yj1CKq9G3M3bcOnbT
 tISviCn5NjNfQPjawVuBmyeLGxwUkpvwW1n5ERYI67v8OVmthu3XpGKpVqoppMQ/iLYI
 /W/SPnw/joysRJRbzwyq9EeNpFOBO/6yWnkyDwKNQOetZyQXdXJXTsPbI3+aEHZHxxBg
 lNEw==
X-Gm-Message-State: ACrzQf0QeOlZHNT26DEPBy/Ws7LD2U6IR/CL6XwBm9ZhUBEEWFrRddZ8
 UAB2ZvT9fPp/VGGnBCPVAhKqHY7JpkxEeygbdW4JAXxU74XFne2U
X-Google-Smtp-Source: AMsMyM7boGAIEB0erN0MG0I92s+64L8fkNyt+J5t5+FBkIB3NafKArSu/n+y4QFfSK/UTxexxuh52tNcpD+Nnc2khoI=
X-Received: by 2002:a05:6871:414:b0:13c:cde9:ffd5 with SMTP id
 d20-20020a056871041400b0013ccde9ffd5mr48352oag.1.1667057070956; Sat, 29 Oct
 2022 08:24:30 -0700 (PDT)
MIME-Version: 1.0
From: 1DS20CS093 Joseph Raj Vishal <josephrvishal@gmail.com>
Date: Sat, 29 Oct 2022 20:54:18 +0530
Message-ID: <CABZi2SXzu_58UFfhBNjF0zWQfZZRwqQ+Cb5rEnouTqjtETYRzQ@mail.gmail.com>
Subject: How to get Started with Contributions
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000088e70705ec2df825"
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=josephrvishal@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Oct 2022 14:31:29 -0400
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

--00000000000088e70705ec2df825
Content-Type: text/plain; charset="UTF-8"

 Respected Sir/Madam
I am Joseph Raj Vishal, a Computer Science undergrad. I have just entered
third year at Dayananda Sagar College of Engineering in Bengaluru. I am new
to open source contributions but I am well aware of Python, Java, Django,
PHP, SQL, Javascript,Kotlin and Android. I would love to contribute to your
organisation but I would need your help getting started.
Hoping to hear from you soon

Regards
Joseph Raj Vishal

--00000000000088e70705ec2df825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>Respected Sir/Madam</div><div>I am Joseph Raj Vishal, a Computer=20
Science undergrad. I have just entered third year at Dayananda Sagar=20
College of Engineering in Bengaluru. I am new to open source=20
contributions but I am well aware of Python, Java, Django, PHP, SQL,=20
Javascript,Kotlin and Android. I would love to contribute to your=20
organisation but I would need your help getting=C2=A0started.<br>Hoping to =
hear from you soon</div><div><br></div><div>Regards<font color=3D"#888888">=
<font color=3D"#888888"><br></font></font></div><font color=3D"#888888"><fo=
nt color=3D"#888888">Joseph Raj Vishal</font>

</font>

</div>

--00000000000088e70705ec2df825--

