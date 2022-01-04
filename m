Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C14840B7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:21:52 +0100 (CET)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ht1-0004uM-7g
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4hrM-00043J-Kt
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:20:08 -0500
Received: from mail-yb1-f170.google.com ([209.85.219.170]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4hrL-0000Ao-57
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:20:08 -0500
Received: by mail-yb1-f170.google.com with SMTP id p15so56737751ybk.10
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 03:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oCPuPDcc/DOVf1hCaikkmH4trv9c6z34pWuRb/3NuYU=;
 b=ogQiLuggR0CcIAmr600Q/EBfjgwOF3MFFqbfhCXHQc+ECfCcyHn4p/0fH+JXaatbZB
 eYjt5e5ot/9F/sHL0kNMuVnLvSvqD0VKxAwPVhSUv3Ew0J1yfyDqvxdPcZWmxfYWWVBv
 glcTvzbqsq8x2pj/3iOwxXrlka1rFqBEg5IF4FV7WfMKWcgETiTP052qlPd6KGmmLU67
 qtdZKFe6jO/zZ9xVS5fAs8is575nQigixZCvGosI3+/i7z1jKFiJ7QN6ptpxwc8Dff88
 CcH+noU5TSucVt+u8lj5Vmha93a5VYIf7cqpxksY80G5wwmyUfphiHGowLRTGkMxqeXg
 yDUA==
X-Gm-Message-State: AOAM5307lotaJL+KbdIO7562cuv608d/62aQt2WBmHzkJNnsSEdcme3n
 NALCplIPx4teN+Qz6XKVj8QnZ7TDuOLGZS+AaI4=
X-Google-Smtp-Source: ABdhPJyC91evcU58jV/W17mrMBrAPDvS5xhaVUGwOaRBSJufybxUQUNVH8idN3uzMRAQycNEbkFsYzIiCNOjjkGWD54=
X-Received: by 2002:a25:d806:: with SMTP id p6mr42319108ybg.742.1641295206268; 
 Tue, 04 Jan 2022 03:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20220104091240.160867-1-thuth@redhat.com>
In-Reply-To: <20220104091240.160867-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 12:19:55 +0100
Message-ID: <CAAdtpL60Q=e_nfKp7xF5iGxT7nW5wtGMxy4-9S0+vQBnbd-_nw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Enable docs in the centos job
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.170;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f170.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 10:12 AM Thomas Huth <thuth@redhat.com> wrote:
>
> We just ran into a problem that the docs don't build on RHEL8 / CentOS 8
> anymore. Seems like these distros are using one of the oldest Sphinx
> versions that we still have to support. Thus enable the docs build in
> the CI on CentOS so that such bugs don't slip in so easily again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
>
>  .gitlab-ci.d/buildtest.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

