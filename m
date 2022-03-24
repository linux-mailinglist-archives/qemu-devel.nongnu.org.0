Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D574E6A38
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:27:12 +0100 (CET)
Received: from localhost ([::1]:43444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUz9-0006DA-CH
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:27:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXUxX-0005Qy-Ga
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:25:31 -0400
Received: from [2607:f8b0:4864:20::1129] (port=43956
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXUxW-0005TD-10
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:25:31 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e5e31c34bfso64783977b3.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZtEU/O+vNZH6paWpI6vm1B3u+2Zz5VH5xF/54Jc03eA=;
 b=PNCBFVnEHQnGfeHR+TMmMJwVU+EdfJj/QQrb44TgC4+4Im5ipzMTHPwzg/LlwurIBt
 4ZBs6k6uZuYkra7J1YYHVoyqB31xdM1g+tGhKc/LkaDWaE3Q4WVJivzoP/wpBGIGbLGB
 0wKRm+D25LMQ0zOk8DODTv1a64snM5BGaQ1VSL7q0cOvd+pQWus8gL+stZSS7Cbp9M7r
 pps/iwHh+eSU1jCHVgT1fVBN3jJ71h4whOO0+6Am+DWB4pt3ewZDzQ0BleY9aeqcUzRd
 YTZDe6YUwdHQbfcXQW1x3oke2NMQ5ZT+gVGXAzRlAOl+DWG30CeIjiB9hRMyE5YxUiiZ
 TgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZtEU/O+vNZH6paWpI6vm1B3u+2Zz5VH5xF/54Jc03eA=;
 b=v2q6rgHpql9BTn4uFAJTxb2qXKrj1dYaX/GMF2ZmxwmdFSNNYU9ADr2QgDjTiyDrzz
 ug7yMXyfN7DWACNtbwm3mDFd6k/TRO1dyT+YZdFAmUzUr9unlLhA5g7RUgJC1VVk7Er3
 JjJARLgqXeDsAIIS5kfXMt++LG03uyc8aD6rRYtWjjfQOC6HGQ0ozraIfg0L3izbvJK+
 lxCsB6T+40hRqD0TSPfDdOQ+uo8xeWBrKNO0SpkAp4WnHStPgzl68xPm9tlsfO5Av1ub
 gWc9UYw5jDU/EF4LXLfE/uU4XIyBnUfDTbGRE7e5WrIgIcFbC7IufbNJ5yGzNw+fxnAt
 K9GQ==
X-Gm-Message-State: AOAM531fD5D3DWqJnyP+iibeFjaaXZRrCohTaPSLj0Ca70GQ0JB/pmi8
 DCqg3Jx4fpkjQrY3BKAPCnZffcJD8DzCYAMwGL2EzA==
X-Google-Smtp-Source: ABdhPJweTDTkAi0YnLrZmexXO4PgsjGsL9yJfiqvfpn/Lxwzuyg33YC8EW4nHpSDXPWXPQREkXmY+TTxK4xrxA0RKQc=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr7217970ywb.257.1648157128978; Thu, 24 Mar
 2022 14:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAEekfLZ2iJKTZoqDCusrn+Hvcdxxe9TpyshkU9VvrLAVREBWdA@mail.gmail.com>
 <87fsn72hx9.fsf@linaro.org>
In-Reply-To: <87fsn72hx9.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 21:25:16 +0000
Message-ID: <CAFEAcA9hfT8CD+2-6rjzPskwbFd6wUabxp-VdNVPSyJEMDjdbg@mail.gmail.com>
Subject: Re: Device driver api
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Sam Price <thesamprice@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 20:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The upstream community isn't really motivated to maintain an API for
> external device models because ultimately we believe they are best
> placed in the QEMU code, if not upstream in a fork. There are some forks
> of QEMU which support things like SystemC models but so far none of that
> has been submitted for upstream.

The SystemC stuff wasn't submitted upstream because we (upstream) decided
we didn't want it, incidentally.

-- PMM

