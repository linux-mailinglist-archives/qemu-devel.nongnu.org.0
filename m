Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750F6C4F49
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:19:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0F1-00081f-T7; Wed, 22 Mar 2023 11:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf0F0-00081R-Fy
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:19:06 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf0Ey-0007rG-LO
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:19:06 -0400
Received: by mail-ed1-x52e.google.com with SMTP id cy23so74302625edb.12
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679498342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cIOxRaY6wppLO9ETcvDxNm6ROwHKDxRV1Pkp7+WNG4s=;
 b=Le77Fob5vxhxrpPRMY/kFangCl26VBhehvtMPJ42iYhcUBNBXm6dblaBcUhDdabUJo
 PjN5m8yqQA1knp5yvkN5vCepnql/hIU+L6AAJmGJP0eQNxkcapEUMknHsWJVEE8ZrVgw
 1L4eQam43CVVRFyFuECsdQtG4nO8sogW6rpF/lm1kYjguxsAlqaHTwoyM/1w5PMESt3l
 TI+BJs7ELPhQk5P5K095y1z6Y04TRWRq3CiotEnBmZHkomkA0BWkch5SwsUMR2YYyieV
 9bhiksAUC/6oyb62vwhZHhRwul3XFqCwtIX3xy4367+Lm1eiZSCmzLmFYvZKAcRqvndS
 Klzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679498342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cIOxRaY6wppLO9ETcvDxNm6ROwHKDxRV1Pkp7+WNG4s=;
 b=dHwAQWOEhKhTDepwxgdw0KKAVY3O6vxKVaIwJftk7PkS1yBWZZTCy7KLeMDKpqlLvW
 y/ox3SzMjZeU6iq4h3WdgwgkOwsVqKmUgbtTOMW1j8aJ7Yc8NTIQhVGiPs2o4UiD031R
 /nN4yzuP/s8bc8eGUezN7ofG4HmDituvD65FuVuVzKt7MWpPE9QteDuSd9heXJnhISFl
 OE/weD2Z84qhnDHyA2ooKNEG0RbF1uiuXJsprwIP3sS+PZZSDbDp5dNnlIkRYSI0Q3Kd
 zcF7FG5FklIckpw5NpjuU+qFXiH1qbIKnK0orvjA7OYJFBRZaab08m5w4ik8EoQ5toEu
 jORQ==
X-Gm-Message-State: AO0yUKVonkPZW3kOpl20vVeLxw8rA//szY1gfWu98Rn6CiOmLVFdh5Jh
 5XQWiYzuOH+OSOibRXsBEK+pAXQnyqjC1dufHG0ASA==
X-Google-Smtp-Source: AK7set/Gk7gMiAB7p+62Kqw4foNL0iWuItmL9W+uade/0WAQZF9egDf/Y6VLlCKI0fYhGBE+ugt/YzIkEdvR2CHqSlw=
X-Received: by 2002:a17:907:98d0:b0:920:da8c:f7b0 with SMTP id
 kd16-20020a17090798d000b00920da8cf7b0mr3371652ejc.6.1679498342206; Wed, 22
 Mar 2023 08:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230322151529.1020525-1-pbonzini@redhat.com>
In-Reply-To: <20230322151529.1020525-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Mar 2023 15:18:51 +0000
Message-ID: <CAFEAcA8U0bW72SWMK7k0tiFOMMZbk5Cd6kX=SwKFxqiLe0+YEw@mail.gmail.com>
Subject: Re: [qemu-web PATCH] add post about plans for Python venvs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Mar 2023 at 15:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> +Some of these tools are run through the `python3` executable, while others
> +are invoked directly as `sphinx-build` or `meson`, and this can create
> +inconsistencies.  For example, QEMU's `configure` script checks for a
> +minimum version of Python and rejects too-old interpreters.  What would
> +happen if code run via Sphinx or Meson used a different version?

...this is why configure also separately checks that when you run sphinx
it is executing with a new enough Python version.

-- PMM

