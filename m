Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5595AAD1C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:08:50 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4XX-0002xm-2N
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4Ot-0007KP-P2; Fri, 02 Sep 2022 06:59:51 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:43771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4Os-0000Tk-7O; Fri, 02 Sep 2022 06:59:51 -0400
Received: by mail-qv1-xf35.google.com with SMTP id j6so1106314qvu.10;
 Fri, 02 Sep 2022 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fXgAxK4XMZKB1vR+qUaCoRROBPQFY5UK09ox/MVWMWc=;
 b=BvCh+Mk0kD6aK1oV1TDBzvtDdBDMRFFgxdkDZoDy7xGK1LbIeG+J4Q8uPo5E9LWtqY
 05J+0fNUISIwuhqjbtG8aGgykcOSzKNM1q8qHl+1T30T9gUg06gL228ttyEMLWtpu/oW
 VNhN1J7mewTtotaA4hHnmT17E3cd6Si+HaYezXA1PEmQu6zH+69wpHTrz0vh5sA83Ey6
 GfdsrYMYYmopuko9MtSkrPyOj+84XjCr+2ozLmbySIhG74EscQlKkM7D0MPifbw5gHr1
 p0sosVZDKIqOjzZWQDJuocXgE5hxBat26sbnTH42NqF/4h4+HVIMAcIEqqShmLBlYH+k
 Czvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fXgAxK4XMZKB1vR+qUaCoRROBPQFY5UK09ox/MVWMWc=;
 b=eLikAt0c5QRrogPCy2Vvn2jDdt1LMo4kKXjHP94IFS3hJ11PuloCvJY2avKbVyBtlC
 vBU1/Xwq+XgPjyFKfaEyJDn/SK74kBdLbhio4D059MEAd4x97Jwpw/7WevSclY1w0Ffb
 7mgUPcB5N2TabABj2LZe6Y94E7FU5ySMONGduKIeGmPgNV8XAgC0xZax7DIePo3wphG7
 20YTsNzkZ1mQmRh8TGpHk6fDmcAfS5zv9LgG5Qlv+Y7IXsjCw8BnHHEpoeANfdCh/qx2
 DIvWBO5PZrGnQx9Ibo4FdEQf0Grguzk+skxXO8KdPEukrpmnKMxcAUtyrsjiJqrO4C7U
 W3VQ==
X-Gm-Message-State: ACgBeo11Hil+FFjYSa0r9IH3DXKPBg0+jS+ozL96NWe3jpP9LsalQlP1
 4Ye6Axuf8VY6AJZdR6VtttYw0QnTqWaJRZiE9jiUcNOWDdY=
X-Google-Smtp-Source: AA6agR5J2s3V8H5jtths3JRR7A5HB6SSh7V2uaftD+R+oRDXTAqnVhdsJb1HI9+L8tvSkhwJXeqar1838pjGaU23PsE=
X-Received: by 2002:a05:6214:4115:b0:499:3520:1ee7 with SMTP id
 kc21-20020a056214411500b0049935201ee7mr4932763qvb.122.1662116389019; Fri, 02
 Sep 2022 03:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-33-bmeng.cn@gmail.com>
 <b4085443-80a7-e660-ebd8-badc031281fc@redhat.com>
In-Reply-To: <b4085443-80a7-e660-ebd8-badc031281fc@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 18:59:37 +0800
Message-ID: <CAEUhbmWL38hsL_e3VorH2tcMW0mtd5uUFZkonrEtRLGxFVWaRw@mail.gmail.com>
Subject: Re: [PATCH 32/51] tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 25, 2022 at 8:06 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/08/2022 11.40, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > On Windows, the MinGW provided mkstemp() API opens the file with
> > exclusive access, denying other processes to read/write the file.
> > Such behavior prevents the QEMU executable from opening the file,
> > (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
> >
> > This can be fixed by closing the file and reopening it.
>
> Would it work to use the glib functions instead (like g_file_open_tmp() ?)
>

Yep, I've switched to using g_file_open_tmp() in patch #7 "tests:
Avoid using hardcoded /tmp in test cases", and testing shows that it
does not have such an issue.

So this patch can be dropped.

Regards,
Bin

