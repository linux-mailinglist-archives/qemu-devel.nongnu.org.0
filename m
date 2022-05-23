Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65CD53151F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBMl-0008FA-25
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntBKQ-0007D9-OT
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:54:46 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntBKP-0000wS-4H
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:54:46 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v71so26483880ybi.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XnMUsnPzHQMEumQhLdBoX+j0ImsbGJhqTvFZswYMfBQ=;
 b=p69s1Ug0tAqzKgAzHPWcK+f5y2NTbEH5tTmNT2qfHJLx5Z5+Q+f6QvlpfKKJbLOjI0
 7hXML6mGvdCJSzKUWmGDuA4PFcba8CCKEmUTZCscA3lLrn/bMGJEPzqzsvIrrwEPephW
 UgLBvp9OXaRuM09NgHl1H74p3REBg1ov164tg8mTMIhCet0IMJMJo57KuXvW4d33ckgI
 SAgJRwEJPignHwS6TUbdu0eR4nUHd9KKa6yiJLqEx1KVewrc4F1VZpAUbgF7KY3zQRMj
 GPMQbww5X++73e8nWQNLtDu76V/Y0DsxZ3NQ17zTAoBD/enqAfCJWi8mMJmPERShucRR
 vp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XnMUsnPzHQMEumQhLdBoX+j0ImsbGJhqTvFZswYMfBQ=;
 b=tgvzaWKgfgUMBnTM200fhIXZv8BttNEHhnZKjRnA+recfBpCssW+ogDIzKNIYUtNvw
 6wJBWJW2EUwCqIV+IoZ210Kv/LlIXraZJoMgpEPyDHm140T99EsQePOoK5jTQtDLFCcV
 jt4jX9I9VZ0oD4qIjM1xQ3X29T4CShHiSZ/APbaeQBAOReDFdIsTnRpTmdemJ3tW1uV4
 pR4A/wiQpMSd1VNiXsaevovMjPmYKGXsNpcMO5b2wu5u464JRYoDRWjSkRyhDxm5mJ/C
 4DKgDYtXd4LgBbrXcNmbiPu0L0sLAyGcwEbVzEa/+WmiXwSQtHJ54rARs0rRRdkhrLDS
 tD1Q==
X-Gm-Message-State: AOAM530X3Vdp/sqgul53ExgtRaRAJZ+dcWuU02eSGfXZ/H46VUEJWL5U
 OLPySugTR8KDUM0kazcQhdxS+eFucT65NLje8283ig==
X-Google-Smtp-Source: ABdhPJzIe8EDPSG46pHTTSpYjbwtP4aJW0RX8xz2unbA+s4ClBo2VSHpD8Mb9jBJrm0SwJElMFFmtrvYVHZx06evAWM=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr22027171ybc.193.1653324883947; Mon, 23
 May 2022 09:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-24-richard.henderson@linaro.org>
 <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
 <520b25a5-1270-6ccd-cf88-281a077cecb2@linaro.org>
In-Reply-To: <520b25a5-1270-6ccd-cf88-281a077cecb2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 17:54:32 +0100
Message-ID: <CAFEAcA-4HToZFUaH4LpptA10hEOLK-ZJbHivgCxDfTiFm_CDoQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/49] semihosting: Split out semihost_sys_open
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 May 2022 at 16:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Also, I think I mentioned this in the v2 cover but not here, that having done the errno
> conversion here for arm semihosting, it worked less well for mips and xtensa, which have a
> rather better defined set of errnos.
>
> My question from v2 was: should we in fact convert back from gdb's errno to host errno in
> gdbstub.c handle_file_io(), and then let each semihosting backend convert from host to guest?

That sounds like it's probably a better idea (though I'm not sure
what host errno we use for the gdb "unknown errno" case)...

-- PMM

