Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0516F833C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:46:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuoZ-0002ks-JU; Fri, 05 May 2023 08:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoH-0002jv-PZ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoG-0000je-Ab
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so3297461a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=vpLytoj2TCNHz8id3LF61ZPuGXm/ymlzp0eBzjf1Irh3m5gm/mtxcpzsbj9PrrGY4l
 iQnb8TW0U9NGPdV3PmKGJUD/R47K3JfT7OPbLjpkoBlkJrCoxwYxof9IU9QEZ5Oe0v9W
 fSTWvKb2xlxPCzhuPAOggMjnVCvDUZJJO66Klyfopvz+WPGnq6hLnN9/jZGEcuMAkTKA
 L/aOQtd/YtkmNdmjrsGGPoeRD5e2rvyqpW5Vep8JGm2nq8NA/nDncZAuZ9Rb4pvNlUxD
 mxVEu+DS21WS0k83JIfnbuQVkR3W6E1A56z42htiZOv8MIfGUAftNhcgBelBarWGle7V
 jfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=fhwTstVrP0rZd9JjxyVXxVKc8c2nEzNfyWf7kBvkONafEkso30G/qG1KjFwQv3v6kH
 xxvZa38zxIbkb1Qm1Da9FKa+9giUXcFE+j0Fzzp/Hcn95rcBwxargcXjXz7MFVxHL5Bg
 nVc2pMqi8OaKb87fqeI23XfazUXl5hAcdXJhEx7eQhJqzIT+AxSad/nY3UkIFVeo4drS
 RGD58HWoSDk/jWcYEpz0g9ffbDj0SYwBSv76kaLVjW37uKiBrBTa80Hcd9gdyVICIUF2
 zu0qBqpLTTifnWDSPAQcWBqa/0qzThAEVpIKBrIIMrCsiLb/CqwDFUTrHJ1jprYFUYel
 zGNw==
X-Gm-Message-State: AC+VfDyLim5M//KSgLi1A2ZrYjUPPeTuoi0bboxS3MOWQ2s1oWZsZrMc
 L3TatrEJJutqpnzirQtZgMc1VlwaWANWKfPcJ48M1A==
X-Google-Smtp-Source: ACHHUZ6gkmigcgDPUc7dnh6HZzs9cO8b5iYhmiBh9G4ulHj5/qQC86q6D2GQZkNJW0OH/eKAdWRUVvgMoZyGrtwqWEk=
X-Received: by 2002:aa7:d686:0:b0:50b:f9d8:ff72 with SMTP id
 d6-20020aa7d686000000b0050bf9d8ff72mr1235617edr.31.1683290714506; Fri, 05 May
 2023 05:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-41-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:45:03 +0100
Message-ID: <CAFEAcA9yr-7zDWJkbxEJVBO+FtRcK=TAOw+PMjsK_pYg06zRww@mail.gmail.com>
Subject: Re: [PATCH v4 40/57] tcg: Add INDEX_op_qemu_{ld,st}_i128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add opcodes for backend support for 128-bit memory operations.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

