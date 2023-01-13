Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8C6668912
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 02:23:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG8le-000090-II; Thu, 12 Jan 2023 20:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG8lc-00008l-OS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 20:22:00 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG8lb-0000kc-0t
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 20:22:00 -0500
Received: by mail-ed1-x52d.google.com with SMTP id x10so26374444edd.10
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyyHjXsf+4xzhXArHMQnvBrvSyATQBG2vH9H2r4laqs=;
 b=nWuCnCvlfkLhpNV/0BDxWld72X705/X/EO1B2jJa34Tiq7R6zYJTm1Z5Woq9+mbU47
 pA2j9Imi36DqrmKxZYJrXMbKpQIqz3OMj9kgNMmlNaO5DJzBYINqYdx+r6lNd60Ivbm7
 meVE4Q55D7MQASVOdO/O+pgEnsOBFKc4goDnjVdBj1IY4QdGX3FWEEjhUiW+7tj7mgMY
 pcjjGw8eOzEzZddLgBKqkxBZFAWOcvEGnplNBXetAPOJ4gE5l5yT2a0z38ISgGHxGlqd
 aD7lb3qyVSOlqOiS2CQ+f+aRCvFOR/c5F/SjiNejPEYx8WL0TOCHHAGa0tN3OoX+y3fH
 UOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyyHjXsf+4xzhXArHMQnvBrvSyATQBG2vH9H2r4laqs=;
 b=2hb0ylguPiNhqwD23dItEdhlTxWDmRRSLV4uD2ZqvW8Kd6/r3+N0m53fG0a9ZqeNa1
 Ipfd9o2Mj/5S6YJlpgUAVwIFrna40Capp5IOULa51Us8oig7jOuKnqXIMTc8uxfokfjZ
 1KJWb+BeXoeg/ovhAuUAPZ7zTUXs+AnfUpE3NlWAPw+XF9mAedjXBiF2pRLoX723ObgM
 KeLFSPpZKwOODy0clmBE9Q2tjvQsufpbYDtQ9XrYXL61xm1uqs3u40pITwic2LKcV64b
 9tE//v6coza50F5Jws3kr/UF3rItFR+RgYjS16ESlq6cnFhIWmLEM2Rtr1JqWDo118q4
 9woA==
X-Gm-Message-State: AFqh2krj26NVqqE8Ne9CQORg3mwATYFmisXdB4nnVbtlqtu8n1Be3xhN
 awTtULrPke/FV4lwtVdpmLqypD1t0tBck7Jctro=
X-Google-Smtp-Source: AMrXdXvtzwzuCoHP2cQvJvtP3i7/lgrn5E/OxHldZJ2/sIitBK/MGXLfIJzXnqhzZpOnQ+lZ6Up3ygsZmkbjYo6+mvM=
X-Received: by 2002:a05:6402:3c1:b0:49b:7cb3:5a5a with SMTP id
 t1-20020a05640203c100b0049b7cb35a5amr238025edw.152.1673572917541; Thu, 12 Jan
 2023 17:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20230111172133.334735-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230111172133.334735-1-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 09:21:46 +0800
Message-ID: <CAEUhbmX6igykWoaVzhM+Ye_Wf7hWPE62Op99O+=9-P3PWNk8pg@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/boston.c: rename MachineState 'mc' pointer to 'ms'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 1:27 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Follow the QEMU convention of naming MachineState pointers as 'ms' by
> renaming the instance in create_fdt() where we're calling it 'mc'.
>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/mips/boston.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

