Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBB2D75BB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:38:22 +0100 (CET)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhgj-0006WO-S2
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1knheg-0005GR-9E
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:36:15 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1knhed-0004Cz-Tx
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:36:14 -0500
Received: by mail-pf1-x444.google.com with SMTP id 131so6915975pfb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eiFzWhiuHptlwqsI6z9p7UC7SSiJTSwAvHZbrDwBeUk=;
 b=REKCH8tKZjnrKHAbEum+VRqGVdNCv1OF5deX1e3SEVfnvNUy3ngFKOY4u5XZiWw5IS
 H6zODsTNW/lXjNmWnTr/9L4ukwhtCgMgp1tjP6HBPTfRMY/CU3A5b8hwux86OrepwxFV
 aIpQLB4DfmRfqgQqwZ5jZfBM6HdC0PA1iHArySV7NFpzt7bWAH3RrNs2PD98VXIC34Ik
 HwbZ6jsXESrIynsTPkiZpCdU+2ta5gnoyZhsyBATsRcvu7lHGYk+gHZ4mZkUdLzsm4uC
 tuyHDzJMiLtkNN9dEhoP/9m6ghkmmecuqfUnFD+5IEI1waCHFes79B/hKXSDGVy69vLV
 Cakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eiFzWhiuHptlwqsI6z9p7UC7SSiJTSwAvHZbrDwBeUk=;
 b=EUajbbSiGYNQOnSvJtA4Ql7HuU583u+BlazPgxOkEw0NR/tuJcqbeeDl0HKh/gQLoU
 Mk5p1rWca0AkJ/FPULraufyIH1azHB9Pd9WMxpkDqdzOvkCH1e9VpzaAA1A3AYHMB+cR
 TodQHtH4Ww8TZ3gpEJauTzK2j3oSrBwK0Wazil8wT3R5dyfhmRGquzmH6orPIhsC3v3c
 Er/VrHuz/lvKCUE66Y6j450Q//8Hl/6E/SjMd5+eU3vRdfMBSbw7Xt0XM8Z6wLm0sv93
 BmeMJX/KSTAv9YzRPp0JKGLggUs9yqjo7akgCTNVRdSQ4y5WqiMdUcgZxDprp4b9w5mG
 sOBg==
X-Gm-Message-State: AOAM530q9X5ZyB8g0QlpnECzaOVBC74bB/p+qmOzgWqUzp/4/mAN+5lq
 dhtGbp3pQFA3q301AnpdPCiTYdcQaO5ajQsUgGk=
X-Google-Smtp-Source: ABdhPJxlvT8I7Z80co5FDLt16k8FL2fsYCP7HTD/GgeLKyhUBT4mLggZZSmGH1lN5jNWcIIJyo8NsmlkximSPGeRqao=
X-Received: by 2002:a65:48cb:: with SMTP id o11mr11270914pgs.121.1607690169177; 
 Fri, 11 Dec 2020 04:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
 <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
 <781d6412-ff8a-ae33-3b00-d27e9fc9cd0a@csgraf.de>
 <CA+E+eSBf957VZ56HAOmK8dYJRrySjEJkNVCrzHZxUF81M4Gycg@mail.gmail.com>
 <37faedcb-5431-5f4c-b8b5-5dbe94510ae2@csgraf.de>
In-Reply-To: <37faedcb-5431-5f4c-b8b5-5dbe94510ae2@csgraf.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 11 Dec 2020 12:35:58 +0000
Message-ID: <CAJSP0QVz4bA4uN0m0Qsv_x4vJdDeTQgmtVJSAPsV8Laqg2tEqQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 10:54 AM Alexander Graf <agraf@csgraf.de> wrote:
> On 25.11.20 03:08, Joelle van Dyne wrote:
> > A lot of users of UTM are on iOS 13 (a large number of devices only
> > have jailbreak for iOS 13 and below), but if the QEMU community thinks
> > it's better that way, we are willing to compromise.
>
>
> I think it would make merging much more straight forward if we could
> keep RWX toggling to the publicly released API. So yes, please adapt it.
> In UTM, you can still carry a tiny downstream patch that implements the
> API through your reverse engineered code for iOS 13, no?

Alex, you're awesome! Thanks for finding a way to avoid the
reverse-engineered code. With that change we don't need to go through
a legal review and it makes merging this much simpler.

Stefan

