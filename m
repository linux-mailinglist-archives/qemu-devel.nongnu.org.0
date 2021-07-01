Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DE3B9641
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 20:52:29 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz1nX-0002I2-1X
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 14:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lz1lk-0001Jq-B3
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 14:50:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lz1lh-0006cU-UD
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 14:50:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so9457898wrf.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=b16vVgsieVbHtBfNj9Z2iW/CJWdoztgtKhpCMm08ZvQ=;
 b=XqB4BwwbOGcJMpzZzjwme5QoDkY3Fm+/CWO7hlTVG12C1GgXf33ntKzAjhU3dXBnGp
 qIJipLR/Gt2z+/nhb66CIgutCWHE1sc7TtEdEldm30nlhF/06WyWHUE/VRdUAAFH6an1
 m2DDzeqDz8kecapUuFt0ajiOe8bEUYqRwrRMSwFUorx6Q9h4Tv4WTv2I3SGr1fgahNxe
 B07KHftaDWVnTJMUD3djeL10uMvYAfgqqPbciMGuBjsujlgmt8ylQL+YKe34Zbr+fBXx
 7vx435DkuwsvKKq22YLTtNtBSkJTb0i6SA13Na4eZYZXyhHTc3n+gzmL0Tqgeq2ae2Xg
 1F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=b16vVgsieVbHtBfNj9Z2iW/CJWdoztgtKhpCMm08ZvQ=;
 b=iOgxdKmKScCuKQrRr/8lQJNe5mA2z9f7HkEGhrFF6vZTKjhXTNTk6lVgybcNkaukAi
 lB2kx7GfTncaqiSu0JC8mnx6V/LcS/1BMR3/V3pqz3xOVvIyc4reFbYSr04Z7DnoHvCX
 k6xLWecF4yl+R7nZe7bx2UVsoLXPinUJnxajdqRD6xueyOj/9xd128KcA9gaZURrNXxU
 j1lMcyrSCUOnUQ73PQ9P+JWKR1k13zhzO4hmh29KV2AORbBALNDPmixeXtNTLaY/UmDH
 7xGHNrVTfuiS7ZgZLQzNWfmjS9Pu2vJbfN9DVjiYxG//WBwVMdmc5Mj7wlMH+na3/Ds2
 huMQ==
X-Gm-Message-State: AOAM530WBa+yWZYhxRtyy7nOvAt9Ddl6xhCNjXa+604i1KuUSGQjYezI
 ejg++RuqcEYsL9RASDd/92CO3Q==
X-Google-Smtp-Source: ABdhPJzbRlaPKOmYCC+aG4tI63SGl0BfRW5T2j8WEMv67A907xdrQWkKoK5I/t5558HHLTv5MwIQQA==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr1305258wrv.209.1625165432172; 
 Thu, 01 Jul 2021 11:50:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm789112wmm.17.2021.07.01.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 11:50:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98B661FF7E;
 Thu,  1 Jul 2021 19:50:30 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
Date: Thu, 01 Jul 2021 19:49:58 +0100
In-reply-to: <20210618091101.2802534-1-erdnaxe@crans.org>
Message-ID: <87bl7lq361.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre Iooss <erdnaxe@crans.org> writes:

> execlog is a plugin that logs executed instructions with some useful
> metadata including memory access.
>
> The output of the plugin is designed to be usable with other tools. For
> example it could be used with a side-channel leakage model to create
> side-channel traces from QEMU for security evaluation.
>
> Changes since v1:
>  - The output is now easier to parse.
>  - Use QEMU logging API rather than FILE* to write output.
>  - Don't reject memory information in user mode.
>  - Merge memory information with instruction execution. Now one line
>    means one instruction.
>  - Add documentation.

Where you planning on posting v3? I'm just seeing if we can get this
merged before code freeze in a weeks time.

--=20
Alex Benn=C3=A9e

