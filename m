Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F435A195
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:58:16 +0200 (CEST)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsaN-0008Nk-3W
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUsZ0-0007WW-3W
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:56:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUsYy-0007Z8-9r
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:56:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id w4so2187198wrt.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YvHq1wtiylmBZ/fLtqU0SAhkEqotrOTWBp6a4PlVVEI=;
 b=ObVEs6d9T0josJav3mJPdMJ8B/u+UFLMv+McnTsDYXEEnPKpCu2mzmbGHqz6FQv0Ta
 HN9p05N6lzqAyPpqANse1zfO6/S4PomjdEzZqDJUP6Ym4xNaWmh+d38dGBsZeuqOyBiL
 E0yTBhPJac9ckwReMj1AEAf9pODs/SAwwI1C6DM3lS3x2KvhY62IDYK8AT2eQj8aU5I2
 jitd76cz554Gi9aoEUftINa1gy72jT5SK9XR+qbUoVVN9gRCoAxYWoPN4Uc9Bgk4/jcd
 iiFGaMomyJoXeC1a1Rxm9F3SHK9KY8ohuq9M8XFYcpdjzbdD5cgo7iGltz8XwjelILOC
 MFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YvHq1wtiylmBZ/fLtqU0SAhkEqotrOTWBp6a4PlVVEI=;
 b=smPzVb4rXuWTtsxVcStw+O4p0zmHyVVSfWH+ku/ENX+6miUw+Qv266Sml4rzDXjdmh
 Mkn0AsnVCRlRyqSFwdLYhY8MUPsf01MolemwU6YTdma8r3FRqncmmrZS4oyIYY2ItF/1
 RYkMHGxEQqCjnrIi6/sWqqE1Ak7i5qu8svT0qE2Ys9yiCVSS9sViDTOAqR4ppCukXwLI
 iIFI8e+2/LADqK9G4xe4Z6AhYEmFmcjcYZvVr5Z8Bx0c+Z+pqAfNQ/L9Qm5PsVk1ONdi
 NK/eIXUIjGUIHFrxQiTDjSqFUx2pqOvEKPxdlu9kr6dmwcEeNe9Loxx4NsBJr91f43NA
 Fsvg==
X-Gm-Message-State: AOAM531zsTrczTuOsmz+hiNGOIKtxZ2m0xGEAB8Jirmpz82dzT9OvAGK
 DPUJc++AvIy3qD/R3QV81Ojy+w==
X-Google-Smtp-Source: ABdhPJy5zw5oKbES2jaodnTI83Pjw/4Ctb2ISP4yQ0oegkZ4tuRp6Wb0m3x/TjZou0Sz6/ojDndgpQ==
X-Received: by 2002:adf:fbcc:: with SMTP id d12mr17913652wrs.151.1617980205692; 
 Fri, 09 Apr 2021 07:56:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm3970515wmq.6.2021.04.09.07.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 07:56:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10DA61FF7E;
 Fri,  9 Apr 2021 15:56:44 +0100 (BST)
References: <20210409100627.451573-1-groug@kaod.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Fix side-effect in assert()
Date: Fri, 09 Apr 2021 15:56:36 +0100
In-reply-to: <20210409100627.451573-1-groug@kaod.org>
Message-ID: <87im4vsdzn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, misono.tomohiro@jp.fujitsu.com,
 Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Greg Kurz <groug@kaod.org> writes:

> It is bad practice to put an expression with a side-effect in
> assert() because the side-effect won't happen if the code is
> compiled with -DNDEBUG.
>
> Use an intermediate variable. Consolidate this in an macro to
> have proper line numbers when the assertion is hit.
>
> virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
>  Assertion `fchdir_res =3D=3D 0' failed.
> Aborted
>
>   2796          /* fchdir should not fail here */
> =3D>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
>   2798          ret =3D getxattr(procname, name, value, size);
>   2799          FCHDIR_NOFAIL(lo->root.fd);
>
> Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
> Cc: misono.tomohiro@jp.fujitsu.com
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

