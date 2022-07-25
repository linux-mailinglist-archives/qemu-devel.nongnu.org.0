Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E854657FF1E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:40:32 +0200 (CEST)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxNv-0006k2-N4
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFx9W-0008VB-AP
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:25:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFx9S-0006m7-4o
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:25:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so9272820wmb.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1Qz/0Hwo7F+17ejvBJoDIZ6PLh+zWdZUQBvTCCP5Fw8=;
 b=vK+p4CIVTvpEnIZn0NuJPE+Hk3WExZTnyEPtyhSvlFwxsMIzsPs00p0OLdHylwyQtc
 c4YzCnuvwpxFcDNWOPqF+4QAmLqeG1QOxHpJ6vTNHzVEIThAKx1XDsyH82XI940JiKEA
 /FGSrotinSQBUG9U54KQGdJEFdcGBC1dbxKxgaLj2th/gPE272Mf4QZ0SiAlwJsi1D5q
 BH/pj05N+j40XFIBp/vUEJO6/hhCDX9biUQnyqLgkLNY7G5QSlhOKAgMUYP33Kf0DdkF
 D5LwajuBz7ToT83HwqkP8IoLGt3Dmfcz0wUVS1gS6i4djQ47dUy2thJvDujklVWqpEOR
 VcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1Qz/0Hwo7F+17ejvBJoDIZ6PLh+zWdZUQBvTCCP5Fw8=;
 b=WQTDylyN3AAPzvyCUdKADbgukKgjQBBhS+VpM7XWwAsJsfzo1GSJKutgbtztfqMiyy
 RFwK6hZnT34a97X9vdTfKOWsD2NJl+h4pmPxXtLjuU9dk608xcP/305AaN06qroDCDCW
 ncwZXTtfVEJ3ULe5Issc1vQxWz/P7Pfpz6827ZyC8otH9A1uQWeldvobnYd8yN+S3pik
 BLs7wdzCBFVjOahjQc1D83oy9n4R2zaqXhzGdruFYuObMKRBna/jk+/QNxe8FXNJy85V
 YwMN7gUToeh6TrU0LE4dkWrcwdXcFDC+J89o/NsN/JCsMWGGB5oAD3N9xyx5jF8DtXBQ
 OxWQ==
X-Gm-Message-State: AJIora8IWEX3adogwT2TuZXPT5SX5RHDY3SDeiscCix0TIBjnfTxaUVi
 HGy/eHvzClsFO3Pqtdf9u1kRQQ==
X-Google-Smtp-Source: AGRyM1tDIomGKs61y+Q4fuYegMCjsj88mjAsHxRH/UawWIp9uiygxrmCNLXKXtInxb1kOo7UmQjw5w==
X-Received: by 2002:a7b:ce11:0:b0:3a3:e75:fe87 with SMTP id
 m17-20020a7bce11000000b003a30e75fe87mr21246357wmc.35.1658751930999; 
 Mon, 25 Jul 2022 05:25:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600011cd00b0021d6924b777sm11640661wrx.115.2022.07.25.05.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:25:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7CC81FFB7;
 Mon, 25 Jul 2022 13:25:28 +0100 (BST)
References: <20220719161230.766063-1-bmeng.cn@gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH] .cirrus.yml: Change winsymlinks to 'native'
Date: Mon, 25 Jul 2022 13:25:19 +0100
In-reply-to: <20220719161230.766063-1-bmeng.cn@gmail.com>
Message-ID: <87pmhtidl3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present winsymlinks is set to 'nativestrict', and its behavior is:
>
>   a) if native symlinks are enabled and <target> exists, creates
>      <destination> as a native Windows symlink;
>   b) else if native symlinks are not enabled or if <target> does
>      not exist, 'ln -s' fails.
>
> This causes the following error message was seen during the configure:
>
>   "ln: failed to create symbolic link
>   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
>
> Change winsymlinks to 'native' whose behavior is most similar to the
> behavior of 'ln -s' on *nix, that is:
>
>   a) if native symlinks are enabled, and whether <target> exists
>      or not, creates <destination> as a native Windows symlink;
>   b) else if native symlinks are not enabled, and whether <target>
>      exists or not, 'ln -s' creates as a Windows shortcut file.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

