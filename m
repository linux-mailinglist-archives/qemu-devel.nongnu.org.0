Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E6357ECE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:11:24 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQh9-00032z-U8
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQdQ-0000Mo-M0
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:07:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQdO-00032u-7D
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:07:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s7so1155626wru.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vX+CMhnvtg39eBTvLPWNrDCYV5Sxkp2296AuKDBbyjI=;
 b=FzBYc6RetbfjYOEGqapIosWEsQ+z1x9O//pbOCLb5/nvbbrLnQ04rYxeU4+qAVfkk2
 7oCU+BE4XKuUvtS07/2P0j7OFqNYarGDAo8vUa1o7c/P8ZcHJzeqALNcUEwm0d4Ddymz
 4g8wp6ulAKudg63sggftrYzt8pi/8aH3u4PNbbsIHhI2JnEw9Q3veYjmRDWfvS0Ynt7S
 6SBKX8W4O9CF846ECEgSujWUr+fGobfcIBSHP9dtVFH5N1PI0VjZryJCgevkpZL0EQrq
 3vkn+BG1wRFFfVv0KLrfXiw8XmH7g6BXh0vsYOS3yNC2R8KMTK03IhCJGnY6e4/FIpiI
 EJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vX+CMhnvtg39eBTvLPWNrDCYV5Sxkp2296AuKDBbyjI=;
 b=kYkfjvUCig7wKckpZU61VXqnrnCGK7CP4wfk2gV6zre9neBtpxw9Msx9hnsClQdaGc
 91ieEUwMf8VrylFP6yDEDaDjRBcBljCODnB3x3U9CsJF1JaJ2AWa5iTkWeJI+/kEooFy
 7h/IA5v9DJaHDm5ydgiEY7b5XVGvgvcQpBVlIdlHij+YFROF4lU0N3OfWHTsvPPD4EkJ
 x6KSqxsDr5VyCn7GzUzj/XeBJU3rwHdMtNOPj7tEvleCW8reKX+eTByqd9vFP2UD2tXV
 Tb95W8UqLlZ2kfqtZGPk7SskUvv/Ve8BJXPZjBYTxDxStcGpc/WAH4L6Du/zMniVfvno
 1gqg==
X-Gm-Message-State: AOAM531auna56M0oudUzl08ETlAw4UkIa2IY4UjEFhScyk09NtqH2V57
 yvFE1PzwrG+bKiSgXG3ExXQtuQ==
X-Google-Smtp-Source: ABdhPJyk9XLah7R40SidceG0UBaoUVQObZmjH0vCtz3/oleAT5P4KNKOf3ejIsb9/XFYCsxUxUa98w==
X-Received: by 2002:adf:f88a:: with SMTP id u10mr9953996wrp.162.1617872848683; 
 Thu, 08 Apr 2021 02:07:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g189sm11109934wmf.14.2021.04.08.02.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:07:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F4201FF7E;
 Thu,  8 Apr 2021 10:07:27 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 06/12] test/tcg/aarch64: Add mte-5
Date: Thu, 08 Apr 2021 10:07:22 +0100
In-reply-to: <20210406174031.64299-7-richard.henderson@linaro.org>
Message-ID: <87pmz5ta9c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

