Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3B344BD2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:39:22 +0100 (CET)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONaL-0000c4-T3
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONTp-0003PI-1s
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONTm-0000Il-IH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:32:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a7so22318581ejs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=oJntCw1vHeZii/gZtL3ZRxhJnB8fENKMJY3LsMvSgvYqW1aFh5QI+ynR+9MU0gXTjX
 /xa4YsChqOLmBxXWAQZNWyQH261Low1GhpXOjAM5a+AvFgaCl97eGbPXjMp25nOTL4aY
 6x1abjL8golqLPlNIX0lanKdt9QQoioNI2kgE1eRX8cvV+Ioma+o0K7AF0NLHMK5EMU0
 87CQmZdPgS5XaRbINXY5GyMQvBkshMdklwMk4Gzjv39goKqe7zOXFDrcqv7kk99Kjbsl
 kZQqOgFyy9Mji3SN2IO1k8cTikJ0+s6XgIv44piyPbLxh9iETagp3A/yrb+qfavT8Oh/
 1q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=mq+0gqxOmKvE+xrf/HShkj/l46fgvLoMVFiRIPRHbQYmf8q+Gltu47gIyzWZ/QHvnU
 3KOHLbf/ibDI+aSdlYvEROKmFXO1Z3il10cYuMRg70lGBEbvHqgmnuhiBRvf0r+cZojJ
 NUwouzsAahA5qbjTGz+XFiik1Lpzu7eXzesiZIsQw0fnM8zOTMHXT0KhCvHdD9ZzdAXo
 yZpXBDmjZTLwfsR3Z65vLM3X/wosNXdy20NsS0mT3hDfoX6pvt9dJNpFnMad/24urBGd
 O/idQqpUM+slrT8onKWeAYhafFoKlMrIrFA5M5PDUqjpPTTR6ErPSN/xahP6f+f9vGW3
 dKUg==
X-Gm-Message-State: AOAM5324/MQZie7X33RridCHXG74eAhvTtLFXqc2kBN5+W0vXLkwSskg
 8al+4IiRMdnBJ0q/q2pXUXknkw==
X-Google-Smtp-Source: ABdhPJyfdzgJr9oK9vLgwUDzIhQn0pMl1ZFAGfxnx1BnvFn+jGqi2BDCH4U7YlNiQVHuxd5E10gghA==
X-Received: by 2002:a17:906:2b46:: with SMTP id
 b6mr591539ejg.521.1616430752392; 
 Mon, 22 Mar 2021 09:32:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o20sm11624615eds.65.2021.03.22.09.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:32:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 848941FF7E;
 Mon, 22 Mar 2021 16:32:30 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-4-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 03/49] arm: tcg: only build under CONFIG_TCG
Date: Mon, 22 Mar 2021 16:32:25 +0000
In-reply-to: <20210322140206.9513-4-cfontana@suse.de>
Message-ID: <87im5jjgip.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

