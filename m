Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81943BBB5E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:39:48 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M0x-00041b-Q5
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0LzF-0002vZ-SJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:38:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0LzE-0001kA-Am
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:38:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so445052wmq.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7rhnXOG0xSqYlyBEc3/oHYp2pbDk3qz/iIy3D8zqNbA=;
 b=OMw07UOkfGLr20p7mtiH1QBTze9Ygo6mEa9spS4iGT++ule/+qyiBAZzLS4mYB2pWb
 gqL4TsmFTOpdUK2suEACpzQHvu5z3eatfLkdHNIm6MUAJXJhB5RLCH8BRuJiFHaylPH+
 oZGlas4ffwg19RXx028TFfsqu3lebIxMj0H1zbM4VYctgyeAQ+PacNpPIM3GWp18zwj/
 C/AMEpMv4S1ejw/BIouirPlSH3hoWZyKHVSjVDVZpodKyAOnvSYQd49dIXEBykSAY+nZ
 WovxfcOUwOVgciDPRibUQ4SYcFKaDuo2sJzZ84TYac2QQuINZX9fvVmkVQKXukGWzIiO
 lX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7rhnXOG0xSqYlyBEc3/oHYp2pbDk3qz/iIy3D8zqNbA=;
 b=qz0TdUeZ2dA0woAw5oBxhy6PnKYcXKNaq+HfwbUiywfZyLnPGMIpcpm1QCxec6SGPm
 SXni93rViXc5uoyRsu20tcarvvI5XmaN5yhtMea6vUT/kSCTqw2wh9EzdSEfP7Vies/+
 WKLaPB8g4CuEWAjDEB93ZP9QlCJzMeMG+LNreb0ZIkBH0FM4eAVcvgJZcHyF75ksuuDq
 85zMOQlxS66XKEfydhoZkcl/EBCSMRnHNKeur1nj5q0z7dQeMbTMyuIUjK38BdVj3X05
 76HI4EhlBKFpgQqd4rpblK1GFZXCD5gPjp2mEgUhQKdaa1G/Db6Ps0ts7U2VJCyQDnnq
 4HOw==
X-Gm-Message-State: AOAM531+1TnRymhVQ5xTh3MIF/yMRAUaSL2UD3H6Y8vF0Kr9Rq3PN5vk
 CR2Zkizzxt5+e4h0mjrq0b+1vw==
X-Google-Smtp-Source: ABdhPJx+59Lc8d/1pebTVZvNvoQDAUzfli6i84pb5bRDmk5fxIxpW3fzmG3CM2000n8r23IMus4Jag==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr13622388wmj.127.1625481479016; 
 Mon, 05 Jul 2021 03:37:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v2sm12227806wru.16.2021.07.05.03.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 03:37:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75EB51FF7E;
 Mon,  5 Jul 2021 11:37:57 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-2-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 01/22] hw/usb/ccid: remove references to NSS
Date: Mon, 05 Jul 2021 11:37:52 +0100
In-reply-to: <20210623142245.307776-2-berrange@redhat.com>
Message-ID: <87a6n159mi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The NSS package was previously pre-requisite for building CCID related
> features, however, this became obsolete when the libcacard library was
> spun off to a separate project:
>
>     commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
>     Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     Date:   Sun Aug 30 11:48:40 2015 +0200
>
>         libcacard: use the standalone project
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

