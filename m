Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F167E650CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GS3-0000GF-7m; Mon, 19 Dec 2022 08:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7GRz-0000Fx-Jz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:45:03 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7GRx-0008G0-0Y
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:45:02 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a14so6272660pfa.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 05:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6pn4hn7RybxaMdIlXd2IOYQ/VoqXI7Q6iW1o/fU2tLE=;
 b=qjI0UmhMVxQWXg9f3nP0HZqLvfe4nQSgMeWb6KUjxknglXUrVEml5NgFIoZ22SVney
 9cvARfAMS23deUkfVTlCA3kN6wuoDXWqw71Uyvrx2LY7T/k53umWPQ64fLlrqefE8W3j
 P7XtLxHCDSlObcyQ1232aZoNnT17WKAc5yF8V4I6T5NJrH/F/r8STKvWVzdv4LLFbTy2
 Bj2hQAe8i7Nr8pIJMiatayew74Cqq7InjuwLIZjP5e8z6ktleX1i9EnWHDJRgzjakGJF
 gMedT5+e6YFy7Ce27pu0eB1TDkfPkbglaXa1GaHVRUVduzsgp2ej0vXKok5b9klyHMVU
 XMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6pn4hn7RybxaMdIlXd2IOYQ/VoqXI7Q6iW1o/fU2tLE=;
 b=v95jg1dUdWfT4MHKev5u5dWv7u9c5hX9f+Nw0NzH5APru4W9da95VT+cUByYNqQUmA
 EiiwU+o4G0c6ZCbRQS7Sw/vR7N62bWjrQiccFWzEDnpxCWfScpPSXyASSDKS+cALX1NH
 YlH5srowXZFZ4hEA48JLRImFYYJalTjR8Nun6Sx2e2uMUmYdX7bodM1ftY65jw4sEE8r
 yIVnCXGLN7N4FOnqfgWPknEMu4WinBO7zvMTNF0niNiIT1Be8BdgUaImg+QkzskBcp6X
 QW9LYwXru1HKlanqlJcJm5e85Y8ky87no85pFC6lrxvw19S/z9At5AIRV6Okwr92Gcvc
 EQeA==
X-Gm-Message-State: AFqh2kpjET5IjN+0gDI/GxXUgOpkUAyrwfL0VDzeViAPm0krgRmSor6W
 Sz3/3QQNRreWiX1F/weSJHw=
X-Google-Smtp-Source: AMrXdXtYZZO0406fUqJGeca6ZCjYYcWWUO4WtvlqREQwr5P6vtVgrHN2DE9HSlO1NKjw03oIw5htzg==
X-Received: by 2002:a05:6a00:3254:b0:579:6402:64ce with SMTP id
 bn20-20020a056a00325400b00579640264cemr9129277pfb.8.1671457499357; 
 Mon, 19 Dec 2022 05:44:59 -0800 (PST)
Received: from arch.localdomain ([49.206.0.157])
 by smtp.gmail.com with ESMTPSA id
 v15-20020aa799cf000000b00575448ab0fdsm6601058pfi.114.2022.12.19.05.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 05:44:58 -0800 (PST)
Date: Mon, 19 Dec 2022 19:14:54 +0530
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, andrew@daynix.com,
 yuri.benditovich@daynix.com
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Message-ID: <Y6Bq1nQwu6DitPLY@arch.localdomain>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <Y6BDeYCy309Ug4G5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6BDeYCy309Ug4G5@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=16567adigashreesh@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

On Mon, Dec 19, 2022 at 10:56:57AM +0000, Daniel P. Berrangé wrote:
> On Sun, Dec 18, 2022 at 08:09:27PM +0530, Shreesh Adiga wrote:
> > The current implementation fails to load on a system with
> > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > section are not supported by libbpf v1.0+. This commit updates
> > the Makefile to add BTF (-g flag) and appropriately updates
> > the maps in rss.bpf.c and update the skeleton file in repo.
>
> Can you split this into two pieces - one updating the build
> system for new compiler usage, and one updating the program
> to remove the legacy map defs.
>
If I just update the Makefile first, rss.bpf.c doesn't compile
and throws error:
rss.bpf.c:80:1: error: variable has incomplete type 'struct bpf_map_def'

Similarly if first rss.bpf.c only is updated, then error is thrown:
libbpf: BTF is required, but is missing or corrupted
Hence, it would seem logical to update both of them together in same
commit.

Do you mean first commit should update the Makefile and rss.bpf.c
together and second commit should be updating the rss.bpf.skeleton.h
file? I was under the impression that every commit should result in
compilable sources, hence wanted to clarify this.

Thanks,
Shreesh

