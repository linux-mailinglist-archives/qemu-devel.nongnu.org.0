Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4376AC73E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:06:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDLF-00049v-9Y; Mon, 06 Mar 2023 11:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZDLD-00049g-L0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:05:35 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZDLC-00087o-3i
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:05:35 -0500
Received: by mail-pg1-x534.google.com with SMTP id d10so5836800pgt.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678118732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8ocJVL7pwTLNew5IKppVW9JnDOV/TbAg4XeQxP1hqM=;
 b=XFcYIdBTeTKXU+kU6a+sHGUiPZBopf1YaS7+c8zjutMbBTzZlqGV+in4NhRRTF93bB
 li9BKbH6FnMCrlGd+jzeT5aguzFdp6fwY+mJv6DL8YfZv3nI+QJsJPzGTp1BPkmw8cr6
 oHjmd6NxezCrKFzVvx0JmvxVv3ZNCMeY3qwmawUDh2p4/Sxm3ivhd4cFR+WRJdhxtmHT
 Y0yEK3PDF2vT5EA430+ii7ZrPKxN5M7n40Gmp+5YvHo1ygzoAKvBHQocaODGcVwqNCjR
 Uwo8PGUmvr93j/29ye1NuuTloV606EfHc8FPJT4Y/UqFTMux2zvW0BBfrGYQ+BmtbH2k
 x3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8ocJVL7pwTLNew5IKppVW9JnDOV/TbAg4XeQxP1hqM=;
 b=QCB5ZEI/RVhJPnQE5osITGJG0Yu23jQvy2mBv4Uqhm66y0r2jQo6rjtVFCLj5NwVMQ
 +UkKvixwjK/cBOyqad0XnnDNY37VngeMlFAwtFB4z/jyEcYJRIprFyj8uLqkaTJFzAQa
 sDoBa7E8V+239JQ0qR+oOsMeyUMxkyVoYJB80WnZvKHmt2AhuNDpPaFkwTYL0g9I7jNP
 AX5XyzdZzrUwd61DHc7GJKcqyLt0z8+OT6fJtu4ykJbRfKMaR1qLdjgKoUDy24FjPACP
 zdImBakFuD4t0u/wGneXtFtYCaVLUeHakRJiItdWlp15a7cv1cEqyuq6625pU1x0CHwA
 tB+g==
X-Gm-Message-State: AO0yUKWXnHbVEoAaHZndMRQJNOPXtOPdQ3nGb1jK9PJp53AOiufWqd2D
 QGC19TrD1E9zLE6Fn2uH86MgaRyziTUt5+lOKOaQLw==
X-Google-Smtp-Source: AK7set8flKhMxyeuFRFCe1LsiCIRBZ3LTLb6Z4Iv4X2/R9IDKctZgUa0Wm9VqXweng0xaFL4whkJpL5bWjw6YBL2rWs=
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr4957663pfg.5.1678118732648; Mon, 06 Mar
 2023 08:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230306122751.2355515-8-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 16:05:21 +0000
Message-ID: <CAFEAcA9eFm6oT6SzDS6wCgVcCfyZb4kk4zBeqm8AE7ovGMW+1g@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] qapi/gen: run C code through clang-format,
 if possible
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Mon, 6 Mar 2023 at 12:33, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Make the resulting code even prettier, if possible.

This seems to be a bit short on rationale. This is generated
code, so in general nobody is going to be reading it, and
running clang-format on it every time we generate code feels
like it would be a bit of a waste of cycles...

thanks
-- PMM

