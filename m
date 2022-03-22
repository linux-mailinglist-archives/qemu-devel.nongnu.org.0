Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238404E463E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:47:37 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjXa-0001El-Pg
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:47:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWjSo-0006CH-L8
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 14:42:38 -0400
Received: from [2607:f8b0:4864:20::b34] (port=33315
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWjSm-0007Fa-Ru
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 14:42:38 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so35405166ybu.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=esY5IhM4H4Nj8UY5RrMzrzWNPSWmorJPYwQ0ifhJuS0=;
 b=eIKmpOCR0o7P5rmQYADtcDU1K+gO8PCfkcdzvzkcj7iHCgv2eR987edH6ipV/fiCgj
 RuzLhTRsNQ3EIkPYNjhbcOZtKEuHD7oIXaJ1mWgC+3vV45DtiYU0AOHkt9MRbj2/GDoa
 t4tjfSu8fJayD4GQ8KKdXcCdmWCgeAFh9Y38zKNV12suitNmDJ5Ry7SKVdbQdAN7yEhA
 UUFDLzCRdOYoEChM91wqlBQ3XKNrWtHsJSXqmP41WmqTl971rMe4GWh2fkmEm3bQ8Wwy
 7Zd0p37IAjl6PJDysTQExn9CGAqehDbXHipOOG3fqeBy9ljYuuqEH6Fk1K5/sAAp+P50
 oIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=esY5IhM4H4Nj8UY5RrMzrzWNPSWmorJPYwQ0ifhJuS0=;
 b=Gn4OwUJH49TJnhvdDCFOKj6QLmYkDeA4QnJOihJi8GSPEq+c0f0CRoMTXjNm+pqjAa
 UUD5FoLb2UIzYjjpwx4xwF6JSQssekuJETakwenHFFYNtcFTtv1SVambj4ZL8oJZMT/6
 kngMA1h2Q1UHT0OVnzb0d4zn+Q0Yo1fNErlmG6PI7K9dpjqqnbPL6unw3wDjBs6vzgTJ
 GX6lV0WSXSMG+fw2NuhNUY0CEX599JesfeRFGXjWuCFFG0nmjpQM+4bbGvgWbUKJR4lH
 6yX+fq71D6+GsFInpuy0SBC/SEq2Xqdltieq0jctpwKq4O8JF5TezlTTrTIp9IdYPt3N
 p9ew==
X-Gm-Message-State: AOAM532skWr6jyrEC7jHSZ/uvtkFgrIdJb70uWrFKg/9yz9GUkyk5C8I
 rl/cW22YsG3A3cbmlCNQXZLF/pocJnXm56Pn3XKiIg==
X-Google-Smtp-Source: ABdhPJxCII2jkSLXxqHUcZv1QMtTHV6vhj6bOsjDlZI4undiR9153mHVtn+3nFoPEoA0zzvlooxeaJ3hq2iVT9WbFaM=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr28832890ybk.85.1647974555782; Tue, 22
 Mar 2022 11:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220321161151.3654386-1-alex.bennee@linaro.org>
In-Reply-To: <20220321161151.3654386-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 18:42:22 +0000
Message-ID: <CAFEAcA9fM8Bt0CxPRpBSJv-qqE9-WTbbwjOwGipxuRyysc74Cg@mail.gmail.com>
Subject: Re: [PATCH v2] gitlab: disable accelerated zlib for s390x
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 16:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There appears to be a bug in the s390 hardware-accelerated version of
> zlib distributed with Ubuntu 20.04, which makes our test
> /i386/migration/multifd/tcp/zlib hit an assertion perhaps one time in
> 10. Fortunately zlib provides an escape hatch where we can disable the
> hardware-acceleration entirely by setting the environment variable
> DFLTCC to 0. Do this on all our CI which runs on s390 hosts, both our
> custom gitlab runner and also the Travis hosts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>

Applied to master, thanks.

-- PMM

