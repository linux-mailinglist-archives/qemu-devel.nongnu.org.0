Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E393E2334
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:24:00 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtGx-0007n8-Ps
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mBrUZ-0000vr-Rn
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:29:55 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:42758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mBrUY-0001Sv-7E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:29:55 -0400
Received: by mail-il1-x12f.google.com with SMTP id i9so7508883ilk.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3aC6VIcXeArFMne8NX4Zuq1+o2lSSOvhdUMbfOCviEM=;
 b=kfnz5SFWDAdmqYuQqzTVARW3XdmxCmnTdswUb7kzgAm1NPAjNp5vYyOaxAkzACNCdd
 C+Ns5nJ7vli6weXpTZUJ4g8lzXyiB5i408qI2BhSht+BvHJgxY4N8Jsp9m8OMxULTvMu
 Zce2RnY1OEy20GWKaF4YQxpXyWhL8ViRVWn50Johvu/WGPUc+jDkKahYujzqqco5tlvN
 O6kaesyUVvSNqpEJvfsLHgIH/AgG9m/0dy8lR/FXgiPOHgQeLQJlwielBhngb4cOeyek
 70nHsQrpfylwQfc2WSYIcvLHhVe9Xpr48R/F0GQR4hHGsotV6mZP7Gis3tdGJAWiVqAV
 8Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3aC6VIcXeArFMne8NX4Zuq1+o2lSSOvhdUMbfOCviEM=;
 b=QmaA0KSJ98z+xqToq5oqGBVLSNqQlSEi0+6EgW5bqicYW4Drgxc/BDsMg2dccA/by2
 xfZHz57RE6w9nEs6N5Ja5wwXpuzAUoCOcR/qtlw3DqabRZ/rRtoUJGbdrGLmoK053tH4
 oUaRuIoG/U8skys6jYSaCH0d2pf9ib/YQRhF/d/OBx2B5xxZb14fY/ywxktH0p2aoGUZ
 zjpF0jIsMWH4uqzxR0XerGsFnOWV8PVgxQhzmdjF1jna/xZEEIqO7aFs1n8nsRM/H4hZ
 8BBOY7ely/u5pOESoiJiHZ4dYbLYado4l/oJ4HO27KMnQlZvq6gbR2L+A3hWBxKKIaad
 tXqQ==
X-Gm-Message-State: AOAM531XJqo7hxqU6z6SM3BeT1klQRYNXGOQ66Xmczf/IX0JyETabNd8
 CNsb/m5urfTkZYOSv5YZOyZqRWQ6VSncltlBIuvbIfKsfQz4zg==
X-Google-Smtp-Source: ABdhPJzYbkjZS0sUB2EV182wKETGXnQUPeq/j5QY8fSrdr3ugzyfQRQDX20BgtG5VpU2gUwMay0Izl56/fPrzb6m1iM=
X-Received: by 2002:a92:c946:: with SMTP id i6mr134073ilq.228.1628224192264;
 Thu, 05 Aug 2021 21:29:52 -0700 (PDT)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Fri, 6 Aug 2021 12:29:41 +0800
Message-ID: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
Subject: =?UTF-8?Q?How_does_qemu_detect_the_completion_of_interrupt_exe?=
 =?UTF-8?Q?cution=EF=BC=9F?=
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Aug 2021 02:23:04 -0400
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

I am simulating a device. When an interrupt occurs, another interrupt
comes, and the second interrupt will not be triggered because the
first interrupt has not yet finished.

I want to know whether qemu can detect whether the interrupt has been
executed, will there be a callback here?
Or how can I deal with this situation?

thanks

