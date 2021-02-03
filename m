Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64430E099
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:11:58 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Lh6-0001DE-W5
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LSN-0005KH-4y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:56:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LSL-00083h-Dp
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:56:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c127so302721wmf.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fcvyX83A2g6RnVBDWvE71mh6+wQmYqQ4poaWo1jIqu8=;
 b=uhludbSldOoHa0SjkVxjEMFWoLvHYjY7maTifpsnIUkat7NmlnepaiAbYaf6Tzqy9q
 muH7S2TXcKXgIzhbs6Xlis9RkQIPkY8gQo6UeybgHHQe5fEYrdSg7sSC6UadFj2OvKTr
 rgptvHisc28VeB1J9r05KwfQ0SUl8TcaFrXm7cFaHFuvk0VH8DvXaRCTiibMozUnzQgd
 mIS7jIs2pAB0ecB/rtrIWHpbNe7JiLZ8Cx1nx5N7S58pP4i/CYPVUqa9IICCzj7jUcGd
 uwUqHeU+vKc2tqz2Kozqz6TiAFmhhLsMQKckXHtQO5gI3Q7v6hmrsBwQyPY4NxWucW+o
 AafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fcvyX83A2g6RnVBDWvE71mh6+wQmYqQ4poaWo1jIqu8=;
 b=SUBLx1jAob9zvY9Y15aui0KEQXb1E8sCd5A+AHM7qEb08HFu89m90Ng8eWA8YeiTu+
 xJu9yLSi+FN8c/ZtlfMJAGqY4tDl2LpDyeFQ6PkDX31zNfQwZVMZtan/os43pPNxuinp
 xQZS1EMX0fGF99UocaZkrjVvCbuPfeRc4IBgT/Enw5auRaHraQj1kTj6AeOjw6XG+cU1
 LKd4pwzWBSaA0kLyDwZ1NAkaCqE7CQryUCedddlrhTEpwcLTIuZ4qAPQT4XjYIHOXYa5
 YW/16g9vpb3+N67ho/ECM5R4smBNLNLTGsDEGNa26Hz3c6QHRjEBI5mcRzzMS7r+PXa5
 13og==
X-Gm-Message-State: AOAM532/bi0u1WpsP7EicirJdTEu891XWykrmVoQi8pleRsxZuA8g9R/
 V7v1OPLEp6AX2cStphlKMFc+Lg==
X-Google-Smtp-Source: ABdhPJzdDSSTrUpF6xQBQaYz0rPgDFi2qBVZIypszLBUfNojoFs72od9AW6xU9KvGf1Qqz5BkXpvAg==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr3709333wmh.22.1612371399713; 
 Wed, 03 Feb 2021 08:56:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d13sm4335222wrx.93.2021.02.03.08.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 08:56:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C79C61FF7E;
 Wed,  3 Feb 2021 16:56:37 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-24-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 23/23] accel-cpu: make cpu_realizefn return a bool
Date: Wed, 03 Feb 2021 16:56:32 +0000
In-reply-to: <20210201100903.17309-24-cfontana@suse.de>
Message-ID: <87y2g5qed6.fsf@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> overall, all devices' realize functions take an Error **errp, but return =
void.
>
> hw/core/qdev.c code, which realizes devices, therefore does:
>
> local_err =3D NULL;
> dc->realize(dev, &local_err);
> if (local_err !=3D NULL) {
>     goto fail;
> }
>
> However, we can improve at least accel_cpu to return a meaningful bool va=
lue.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

