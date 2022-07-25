Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE295803AB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 19:54:25 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2Hf-0004JO-WB
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 13:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG2F6-0001m4-6s
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:51:46 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG2F3-0002Kw-HY
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:51:42 -0400
Received: by mail-ej1-x632.google.com with SMTP id mf4so22026094ejc.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=z7j51j0XgFgUVQE0EA7bl21BHmBo6/ck6E7VGAH3oDM=;
 b=BctJot2oQejO+k0U9ZdJ/mT3qTcvgz0bGoXziTvqsPcEq52WFQx5t9M1e8wM5S2Ch/
 EzQqzRagQVOe67yi5oFhGkzIgXGMNv7WQVZOXG2BgU+GH74R3QPvI4mVF+ePngnrMPu0
 0LXwNIMan9p05dtkcXz4cwRoB7tAyO2wQ3JJWRMmeTbxm/YA3+Xj91aukXbYDbeCC3i/
 T9d61/DqK20QH2bYjc0l5oMFlPjfuexG1yLCIbLGnvqZ0gSOPRL1nVubWsNkZ+8EOCHP
 vx/iQ1vMsk/xw/zvtd1NrCElZ5rEq5hshcLl9+nqSSIp+sMZ05hXvVJ0S7SI33Nzy6jO
 rPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=z7j51j0XgFgUVQE0EA7bl21BHmBo6/ck6E7VGAH3oDM=;
 b=B+7GtUt9dHRjxh0WcA+7ziNEdQLQJtqZh+11AdvQDX25Y6WEacmrYld0Fg1T/MyQgi
 15VkSQidNlKhxQ/5N1VHsNEx2GE5Uis/1LZN7NxDj5jjsrF7M3nSrfE74wuq51kY1Zix
 egNq+0aILcEnuREhGN3sjxAgUNF6Gtvk+AdG3KR2jKSzjwRO1kUxRcS8WFYOVu8XtC3B
 QY8PRZVyEjONaM+4KioP8xQjEA8SU7ZcV5u8NIG0an+A/id9JGJjU3Mu4NxrPgLSbgeF
 LDICYaUEQcWVxhIIcj+rEVHlHYZmI2mTCMtQweE/7S4IxTsZ7XyYCF3bGRvA5c+2lwpK
 Jr+Q==
X-Gm-Message-State: AJIora8l35+KBveVbMntKZNd7p8LmRvzv5hI9vMbzdF6MVn+vuauErAV
 /aq6j6e3C6x68TslDldmL/Up3g==
X-Google-Smtp-Source: AGRyM1sf/RfVR6sJ+034f2NZeuMJaUaPK7AYzddw9mBwVyhKPKqpf1Nz4Dpsvzx1ig1bmd5AR7pEJA==
X-Received: by 2002:a17:907:9483:b0:72f:6e4f:f54c with SMTP id
 dm3-20020a170907948300b0072f6e4ff54cmr11040840ejc.471.1658771499772; 
 Mon, 25 Jul 2022 10:51:39 -0700 (PDT)
Received: from smtpclient.apple (5-12-52-36.residential.rdsnet.ro.
 [5.12.52.36]) by smtp.gmail.com with ESMTPSA id
 r1-20020a1709061ba100b0072ecef772a7sm5496872ejg.160.2022.07.25.10.51.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jul 2022 10:51:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA8=iDh+QBKnRg2FH6niXo+i0uXi0M_5o8c7Gm33xi3t3g@mail.gmail.com>
Date: Mon, 25 Jul 2022 20:51:36 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4538DC6B-457B-4ECD-A4AE-D21B5480EE1A@livius.net>
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
 <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
 <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
 <CAFEAcA8=iDh+QBKnRg2FH6niXo+i0uXi0M_5o8c7Gm33xi3t3g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ilg@livius.net; helo=mail-ej1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 25 Jul 2022, at 20:33, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... I'll try a setup with code in flash and
> data in RAM, that sounds like it might be a way to cause the
> problem if there's not much code and a lot of data (because
> then the remaining space in the flash is larger than the
> remaining space in the RAM.)

My tests use several hundred KB of text (the C++ runtime) and a few tens =
of KB of bss+data; I don't know how to compute the remaining space, =
since I don't know the default sizes of flash & ram.

I do have some experience with linker scripts for Cortex-M devices, and =
I can tweak the projects generated by my template to allocate text in =
flash, but I have no experience with Cortex-A devices; if you tell me =
exactly at what address you want the program started, I can try to =
provide you a binary.


Liviu


