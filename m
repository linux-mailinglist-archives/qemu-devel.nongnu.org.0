Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98503454B5E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:49:59 +0100 (CET)
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnO8E-0001UB-Fk
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:49:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNwX-0003Uf-1W
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:37:53 -0500
Received: from [2a00:1450:4864:20::431] (port=35380
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNwV-0000Jd-9d
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:37:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id i5so5888332wrb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lsENNgJfI1/vdwL8ZzrQhewfLKYLxjOc+zylP966m/M=;
 b=smZqyhuRpeVfEwUumWppOxenVQehw+hBek7zp61IgUhjJxwvtoymCb6HkGymripRq6
 B7gcwZKu0JGp2UYRXMuJxGU8JFaBWUCvZnth96K1kk0vwJv+gA/oZas0JqY4AS6YoqKM
 cfG+xTuHbpaRQYb5tvdJtH8vxeO4J39F74qJeftvcqXGADgikKm5vKAfd8Lu8MyxAtut
 gB0Z+2R/eJk4afkIvPpp/5Fdo3vTxL3wo51yNZy2yHvjfpI7dGujhU3B27ps1xIXvHFW
 Jv8y8Trh+E/89if9RLZPbpwq45SAXBUqMJCjpLgrYiSUDGzW0qd5aMmXKBfckvoTSY6Z
 cBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lsENNgJfI1/vdwL8ZzrQhewfLKYLxjOc+zylP966m/M=;
 b=OsMcprYcc3mX33JM3LvF9CIpoXsGdoq7Yi+5NQgV9wf9GYyXCdBQ2k5unVnVgkROQb
 2hWc/EGfRxdnHfXj6qtY5UTjhvynxxZtXWGntibcu2oEagllDeHfzogMl/MWkEe45vxq
 +3gRTjCx/FAYLh3wxLgddLRk9KEP2Adof0DK37sv7tNW7SK/EQlyfwqIMMb1yJOHJKAV
 JEVoDcFI1jqaW2BvkMl0iNabpCkQ6uLjecjNjhH6lKhkL0ykwWzfucDCOvDU+xRnYorK
 e8RmdjPEB3weWB9q0qdnnztPd4Dp0sV4TnZc2tJJrJejt4rVVCgQgEgOTOs5zQxdZpWD
 zyHA==
X-Gm-Message-State: AOAM531UuUo/URzkLe9zjcdDjGnxT7hr/4hvtU63mBNP7rMbXqujxqM6
 YEX/NgmFd1YN4kFr5vPVINaB9A==
X-Google-Smtp-Source: ABdhPJyKYAu3bwv4W2rGPL493tKmjl6yKbT3xNOLXpvADkp+0NjCWUjFvMlCsnXQ1kKignaj26rTog==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr21688343wrw.319.1637167069917; 
 Wed, 17 Nov 2021 08:37:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p62sm198451wmp.10.2021.11.17.08.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:37:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CB021FF96;
 Wed, 17 Nov 2021 16:37:48 +0000 (GMT)
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 02/17] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Wed, 17 Nov 2021 16:37:43 +0000
In-reply-to: <20211117160412.71563-3-richard.henderson@linaro.org>
Message-ID: <87v90qviub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, imp@bsdimp.com,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> From: Warner Losh <imp@bsdimp.com>
>
> All instances of rewind_if_in_safe_syscall are the same, differing only
> in how the instruction point is fetched from the ucontext and the size
> of the registers. Use host_signal_pc and new host_signal_set_pc
> interfaces to fetch the pointer to the PC and adjust if needed. Delete
> all the old copies of rewind_if_in_safe_syscall.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20211113045603.60391-3-imp@bsdimp.com>
> [rth: include safe-syscall.h, simplify ifdefs]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

