Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57638414A50
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:14:44 +0200 (CEST)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT25D-0003CT-EN
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT22F-0000cQ-BN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:11:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT22D-00038O-90
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:11:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so6767731wri.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlwiCK4DHVzvpSglfXg0vTqSDkLCdTZPyJoUKJr36Z0=;
 b=CVVGYPFBnlLeKGF6/F2BziarmV15/moqGh7qaNQtcX6G7d2Dize1BICKId2U8zlrcs
 zecERmUMsmGIqIRyoC3JWR+Ariwzap1sAjQBBS6j0pXqwQcvaCd7Kd0DCnItjeZhER+7
 T+oOrrbLkFBt1Q7v59XPiHHxQ0qIN52rO3IFcpHZGGmPXxzxeOHRsYQqrbwfuO0YSxDt
 TpkDE2Pj5X5dZ9Fd+98A1auwYXHl8NJooD422TNS8OvydWPraq1AtwnVmaoAbtd9mirX
 AMJupmYqgC0ab9+fGk450v0t74KgXNNhlbyAS7+XUx+ov1eKKCOceSvQyz0nCqR5pIIT
 FiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlwiCK4DHVzvpSglfXg0vTqSDkLCdTZPyJoUKJr36Z0=;
 b=fnkvm8W2XP7NPpqfR1RSaYSUnjvMDk0uHJ+cNIKwS/J+R74QN4BOW8HP0t9l0dNtCq
 6mwymSzUPCsWeIAuPh7Nfo4RRlRIBtDxgqRqCuSSheksFZdzwKSUKhqQZe5QYDP199eR
 p69Z5aMmJHBhaRirHkv+e2Uv6idrAyizGYn5DMYm/ssphP3w4xFV3SlJZgDTzF/2iNF0
 4xFnunofJl/1JVx0N0gERRJpLaMJGqwfhb7memRhiaGjVfBU6xL5qf0EFoqV9rh1dhFj
 2XdLxS1uDrXvu0LMaLWppKp4gK2uX3l0Y46zII52BTYGO/mFFksQkvBqkbTD5Lzt0+4D
 PpiA==
X-Gm-Message-State: AOAM5325CWLpI5Hc1/zPrbGkNC5BQK+vgq/7bg5hNNjSkF8As5lp0HmR
 HXBXdMfMxzo3ZJn88c8DxiWV/mEdz5qNE6X3mtl9rg==
X-Google-Smtp-Source: ABdhPJw8BnKWQq1szdzItA3GeLWWMpNX6nfAj7gCGpZ5oOWF6o4O1gsIWgb2AYBTDpCwgElrBVj68Lzz8ahCkGemoEc=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr4990649wro.263.1632316295562; 
 Wed, 22 Sep 2021 06:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <20210922121054.1458051-2-kchamart@redhat.com>
In-Reply-To: <20210922121054.1458051-2-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 14:10:43 +0100
Message-ID: <CAFEAcA8gZxk_F_0MhSShDU5EUet6UZM483Y8R54PXvVCVwUEMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: rSTify the "SpellCheck" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 13:11, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> The original wiki is here[1].  I converted by copying the wiki source[2]
> into a .wiki file and convert to rST using `pandoc`:
>
>     $ pandoc -f Mediawiki -t rst spell-check.wiki -o spell-check.rst
>
> [1] https://wiki.qemu.org/Contribute/SpellCheck
> [2] https://web.archive.org/web/20170721031029/http://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&action=edit
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/spell-check.rst | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 docs/devel/spell-check.rst
>
> diff --git a/docs/devel/spell-check.rst b/docs/devel/spell-check.rst
> new file mode 100644
> index 0000000000..998cd7ef51
> --- /dev/null
> +++ b/docs/devel/spell-check.rst
> @@ -0,0 +1,29 @@
> +===========
> +Spell Check
> +===========
> +
> +QEMU uses British or American English in code and documentation. There
> +are some typical spelling bugs which can be easily avoided by using
> +tools like codespell.
> +
> +codespell is a python script which detects (and optionally fixes) the
> +most common spelling bugs.
> +
> +If you installed codespell in your HOME directory, it can be called from
> +the QEMU source directory like this::
> +
> +    ~/bin/codespell.py -d -r -s -x scripts/codespell.exclude -q 2 ~/share/codespell/dictionary.txt
> +
> +``-x scripts/codespell.exclude`` excludes some known lines from the check
> +and needs a file which is not yet committed.

This command doesn't actually work, because there is no
scripts/codespell.exclude in the source tree. It also
assumes you have a ~/share/codespell/dictionary.txt in your
home directory.

I think Stefan proposed a patch adding the excludelist file to
the source repository back when he wrote this wiki page a decade
ago, but it did not get through code review.

thanks
-- PMM

