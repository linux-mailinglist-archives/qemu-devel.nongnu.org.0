Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63D4027BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:27:59 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZGg-0005j0-50
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mNZFW-00054Q-C7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:26:46 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mNZFU-0002H3-WA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:26:46 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b10so12224375ioq.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=OEWruaq3Ry+rktsp8xR2ol0M8XsGtzUdeTacvUYhZss=;
 b=ARM6M4d0MXzsJ8Gnv6AvuH1ijFltt/cgLbgKUOcL5MZaf5wXV1bmht5yQqI/GeS1/o
 s8AcsvUeUcqaesvyC+LyzAvZk94M9dmCz4taTsZotg89X1cMF78MiB3RJBZqIPP7crZg
 rjeDgJir56Blk5D1dabeUl6hPuV7FTU1ZftHWvvgV2uqYUkY8albpArdmqOha7SronSi
 6llq7OsEXO7E1J7BOW0hoeXy+RJRsIp5o/0TrIWc43Qs6KLpGeO8YsAGNLhmr9sG4EbF
 Kq0Ap0O6ZfCD7JlqVI7fqqnHmO3Yv5+6oslqEWowUtmJs63L1xyRM6kuSD7NKQu25xwC
 a11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OEWruaq3Ry+rktsp8xR2ol0M8XsGtzUdeTacvUYhZss=;
 b=p65hUi7pZ+zuxab6RiA4kue7MtvEI1XRApHkGtYc8n9x9pg/l/o1vHl/vgCDmSAgEJ
 Rinp8U4X77oy4WsTbKs3qhe5xldeUOYiVQnZNAA588plBw7pSWoaM0xErfGzw4bxbkFW
 /5kiFbFyoGZ9YVi8yEmpB47YP9cyG0PYLQ+td8srj/sz97bg5E9ugAITiiwJ00miWTMA
 MyZu7nYcSTh0BiWc8/VjT98pwbRnIyhGyzcIH44X12fPrz7p36bVbajZ1Iywt6OL8nlG
 R6VpXci/T7U+gJCwF+eo5vbcz/PjfJshsR/02Q/Ei2jeZhp4cdxSrbryvZNdp8Dbn94L
 Pj/g==
X-Gm-Message-State: AOAM533QTt9wFMw319g5F6P0RRJunHTLaYeH+FqZZQ4VB4rPzERnT0Qr
 1tl2sJ+fs8wHAtSgqivzlLltJlfXWa70VdMUEbFuw6l/008=
X-Google-Smtp-Source: ABdhPJwaX88wdnXhFjVK31FTzgLDbDWyQSipzmvS44fmzf608NhfkgGVApyxafuvupZ8B3eUtTzn+syyShrIiIrYUpE=
X-Received: by 2002:a5e:8711:: with SMTP id y17mr13302941ioj.16.1631014002691; 
 Tue, 07 Sep 2021 04:26:42 -0700 (PDT)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Tue, 7 Sep 2021 19:26:31 +0800
Message-ID: <CALUzjTbw0m-n0wmqYPw9C_SFVrCYvqOde6qUsB40FMM9BVPHZg@mail.gmail.com>
Subject: Application of QEMUTimer in short timing.
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004112ac05cb660ade"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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

--0000000000004112ac05cb660ade
Content-Type: text/plain; charset="UTF-8"

In the controller, QEMUTimer will be used in the implementation of timer
simulation.

I wrote an auto-loading timer with a period of 1ms and the clock source
used is QEMU_CLOCK_VIRTUAL. But it doesn't seem to be very accurate,
because the actual time after I accumulated it to 500 times took about
700ms.

I think qemu's code will consume some time, is it true?


thank you ~

--0000000000004112ac05cb660ade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the controller, QEMUTimer will be used in the implement=
ation of timer simulation.<br><br>I wrote an auto-loading timer with a peri=
od of 1ms and the clock source used is QEMU_CLOCK_VIRTUAL. But it doesn&#39=
;t seem to be very accurate, because the actual time after I accumulated it=
 to 500 times took about 700ms.<br><br>I think qemu&#39;s code will consume=
 some time, is it true?<div><br></div><div><br></div><div>thank you ~</div>=
</div>

--0000000000004112ac05cb660ade--

