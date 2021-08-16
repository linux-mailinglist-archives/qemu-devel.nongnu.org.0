Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A13EDEE4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:01:02 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjj7-0005i1-RC
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mFjeF-0008Tq-2M
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:55:58 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:34567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mFjeD-0005yZ-EG
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:55:54 -0400
Received: by mail-qk1-x72f.google.com with SMTP id n11so15779056qkk.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gmUYNt9WNUOTi0FKv8qs4ISCicfQhKzTvOSTZEfsm5s=;
 b=REH+fdHEFkCcCrW+QihUiViWhfV38lkljFsl2cZu9o+s5BgCW3HCr3AJ4XyzZzWBO8
 Hr+UXfU3m3I3sGOExkdkAIRKsfPqS9p82Cv1jbG8mYXtC9G0KXEH9Qdly2Xh5id60V6E
 hdgIdaN30WRBwaR65yi1ARCw6W26wzy8S/1eo2/f2XkW2TelDoKmlryqF44ll65nzF/Q
 97ELv10eQQl7vsUgi+4DWu7RGpsRtIfXllDhwiawZRDEBMGr96H6y3TkpILJ12VTrCQc
 qeqdJ07rLx9x++zxw0tGmY0xLKS3e6kwfWAcQaN9TrB1CptfQrTFmg6lJwIUbsgkSoEA
 Zpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gmUYNt9WNUOTi0FKv8qs4ISCicfQhKzTvOSTZEfsm5s=;
 b=Z73CTJGyjirqNRPKJ4aDFDavwdHqtGPottQPBCLAjMVn9wJ+uicJwIg0PpIK+1t2gO
 k5r6DAaODlaYq0VbWaJhsJOZ5Y2K6MzQu5GVnqoMG0Wcl+xX7k1wMcnzJle3jOfIS2e1
 2V105Z5AlUK/YyMqz+mwEPEnDZTD5Nr99IfPE4HPdoUJdnbscbEDugmoQYILyyKM0neN
 EWBdSV3vBOCKPdf38eH+KCi00U4QupKENAnfZ2DllI8gRBu2vPuzqUCdZW6erBCvtBDm
 1bPy/z+lAKD9m2QTwfWpXC1IuKhKBnQblvdJbBXImag4KQl03MuiJHvGDOZOMEz/T0Fd
 ndWw==
X-Gm-Message-State: AOAM530GASomaubgpDOaxr7mTpzbXAIDb+WnOGL1xrjqQtbZ5MvQzxtg
 GwvZ/f2LrKeMNY9rRHtDy3E=
X-Google-Smtp-Source: ABdhPJy2WILRMY+x8gLDnl9gFMdrzogCMo0xyp71xCyDBTpnGD0OHRT8ka10Lox1YIzJoErYRtA9HA==
X-Received: by 2002:a37:65c3:: with SMTP id z186mr239357qkb.313.1629147351840; 
 Mon, 16 Aug 2021 13:55:51 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id h9sm27815qkk.6.2021.08.16.13.55.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Aug 2021 13:55:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Picture missing in About dialog on cocoa ui
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <247B2DB8-1076-4617-AE63-8791571A12D4@gmail.com>
Date: Mon, 16 Aug 2021 16:55:49 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CAC5464E-0E9B-4B0B-A844-2F4F3AADCCF5@gmail.com>
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
 <247B2DB8-1076-4617-AE63-8791571A12D4@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 8, 2021, at 2:38 PM, Programmingkid <programmingkidx@gmail.com> =
wrote:
>=20
>=20
>=20
>> On Jul 8, 2021, at 1:50 PM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>=20
>> On Thu, 8 Jul 2021 at 17:28, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it =
requires a
>>> picture file to be found in a certain path. My original code used =
QEMU's
>>> icon to obtain a picture. The reason why the picture in the About =
dialog
>>> stopped appearing was because of the move to the meson build system.
>>> A new patch has just been committed that fixes the missing icon =
issue.
>>> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes =
the
>>> missing picture issue in the About dialog.


Hi Peter, I was wondering if you had made a decision on whether you plan =
on reverting the patch that breaks the About dialog for the Cocoa UI.

Thank you.


