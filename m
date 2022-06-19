Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B4155096B
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 10:56:25 +0200 (CEST)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2qjI-0000zO-Bi
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 04:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1o2qhR-0008VT-JP
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 04:54:29 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1o2qhQ-0004KO-22
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 04:54:29 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o7so15897802eja.1
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=se9n1XvD3nxLIAvQwcZHpgobXSqKDY6QnKjo7nBWZ2I=;
 b=HnU2bXLpOx0gsiPUXjoRyqq1xiu7olOiEypwYt1PlUXVXZJf9BaNI/6Br1tpk2+15y
 YN1UNrou+tKOsF3YUpSiqLxSMjjKFQ1YIpy5t2nm8cg2G/gCxaRVCaJWMOw0Tq6ow5Xf
 wsK8jFXrfRIjcGF567ASu+1zMfPgU9vrcrlGr2uljVjqoiDa4BupIZp3XoRYrGosHMcB
 FFARB6XnzZ57GWvdlkNhlEky51Z/Ftl/IacSiJ0oklEBFErhJ5sAFibOUpPPyZSPXI39
 SZs/uZUWZuW1weDT3TnVWJ76Szyfv/bGJA0eSNtjRUgTJNlHIKYkqnymH2WuXlPI6ZdT
 +EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=se9n1XvD3nxLIAvQwcZHpgobXSqKDY6QnKjo7nBWZ2I=;
 b=LJO1FUYAI5KIezAA5Q3uy6KyO86ctLxjyNi0OuwzwpxM7X3mbuQHNC6SW6cXbRdIMA
 VqTkd9+XJJPhQKTBBwHTghWkdMagYiBvXEq5CwpLMfdPGPmVwYuxTfBv+5UZUtjJWpez
 muMNnaty03tqmZDSXsgvWZhTnHSrCGJ/OvHq4Xop67F4jXhYZ7RqERNH1fM+ZTJxtonN
 tyKVlb2501wJd51uUL0AfRA9DXoR3ULlpJYWZ3dWREfp8KWircEOmoE5X3SWbtrjL/tS
 t4783xBByO1jssmdQzKuZO8wVckpmFfusawKrF33rdlOHq+RROsn2A5kpIzZgeRW+t41
 LtRw==
X-Gm-Message-State: AJIora+sIl7xwqxR4+ND54T9ViEwYr2YsRSduJ88cO8/4bDKVOCQ2XZ6
 VAN2nZlVqWyE2wtWMi7o9YNXk3t9FMr169i0S5M=
X-Google-Smtp-Source: AGRyM1tCSjbkEtQN2Avscq5rRnJw0/jEz9erncYmI0iB8OGN9ljhDOZUPZLW/touTQUzPLKsZ6mB9JYZDATj2glCW+I=
X-Received: by 2002:a17:907:6e90:b0:711:cb3c:8c1a with SMTP id
 sh16-20020a1709076e9000b00711cb3c8c1amr16777440ejc.516.1655628865852; Sun, 19
 Jun 2022 01:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220114004358.299534-1-idan.horowitz@gmail.com>
 <20220114004358.299534-2-idan.horowitz@gmail.com>
 <79582bec-0591-8114-2479-7d5d79321698@linaro.org>
In-Reply-To: <79582bec-0591-8114-2479-7d5d79321698@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Sun, 19 Jun 2022 11:54:14 +0300
Message-ID: <CA+4MfEJdjQ4ZMm-=nfJtLtNPz3=hLMqtk7yLznXRy=rHaS+3Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] qemu-timer: Skip empty timer lists before locking in
 qemu_clock_deadline_ns_all
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 23:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~

Hey, I believe this patch might have accidentally been missed?

Thanks,
Idan Horowitz

