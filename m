Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2F212134
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 12:27:36 +0200 (CEST)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqwRL-00043P-QL
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 06:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqwQH-0003G8-0h
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:26:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqwQF-0002Up-3A
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 06:26:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id z15so16244851wrl.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=t4Nrem5qOLtin4HxB+Iu40biBZ7Tt93Ar3DJpgbiMGU=;
 b=UB4YDwmF6tQftf8JzTTbdG2yFtzFEjrlIgKzQ56Cy7UMD0BG3zPzdrdGQKXpHXYUHt
 mzq2oYJ7IhUTNfiIq4xPj/zyAf9BkUe0+HPvcRvnrSq38gwz0Es0ZgNpI7RfQ6BPEt5M
 IqbIyt24fLY50HYQbhv/BVCWVXyIJG+rLZ/W8Fo/e+p/EPmat49i8QXaCzpavwWS2n/I
 ma3DZsnqKhwBSJzXaPYVL/eFXIM6GnFneQwDRQ2FrvbQ2HVnOEgdgsfd3K0MqJ6fky6J
 WaT8ja6lekCQ+ESVyRrKAPXidHGEwsP2en276Bm9mybSOP9cQrepfVLW9RPyc8YNgiin
 RmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=t4Nrem5qOLtin4HxB+Iu40biBZ7Tt93Ar3DJpgbiMGU=;
 b=qlfIkSDSHMuvl3LDwD2+MJ4InHP5RQL30jdjeCX9uYOAiywzskAcLMYqEBeLF39Sg+
 0GB/fs11wOmbBdIeMxTwvPoaz7qh75XCuv3H4yz3pfuNvlpklJflaDfC2vbPo5AiF7vi
 L2hTKirobpoJeEW8ppUWMSxmhSJm8Aj0V9FbyQPn82DXBnlJVVElxHqjiSEvD8OEhj9H
 k93Tr3jbX9NizfxcpeLeGMD/3g+bLJX+mixHImIzNZ0pkYkALN5y6jWKk7MaUuyaNLtZ
 Oe+S91LO2u2CElhdDR5jYo0LZmNxL6KZk/ypUN/PskJLfWTN+ZaruHIkgJ2dmUU7WYOm
 I/Ww==
X-Gm-Message-State: AOAM532aVBfqh32LbWWPJD294+PUodXvIgo8nux5q/gN2ImLmJK8mrso
 YCvQskVgWj83cOCoIQhyTkyX27SBy3c=
X-Google-Smtp-Source: ABdhPJxJwC5R89CdjaDUEhk+/ilipizgnu9NW9q5LvD2iGgFcH2E4ArKV2bNo1bdBApSAdmMLmoYZw==
X-Received: by 2002:adf:82a1:: with SMTP id 30mr33045858wrc.210.1593685584775; 
 Thu, 02 Jul 2020 03:26:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j6sm10438855wma.25.2020.07.02.03.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:26:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B0281FF7E;
 Thu,  2 Jul 2020 11:26:23 +0100 (BST)
References: <20200701175432.18892-1-philmd@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] cpus: Move CPU code from exec.c to cpus.c
In-reply-to: <20200701175432.18892-1-philmd@redhat.com>
Date: Thu, 02 Jul 2020 11:26:23 +0100
Message-ID: <87zh8ip60g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> This code was introduced with SMP support in commit 6a00d60127,
> later commit 296af7c952 moved CPU parts to cpus.c but forgot this
> code. Move now and simplify ifdef'ry.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

