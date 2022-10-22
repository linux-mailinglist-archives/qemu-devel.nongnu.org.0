Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33A6098A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:19:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omikV-00068v-Lj
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsengiyumvawilberforce@gmail.com>)
 id 1omIl2-0003W7-W6
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:58:05 -0400
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nsengiyumvawilberforce@gmail.com>)
 id 1omIl1-0005an-Kx
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 13:58:04 -0400
Received: by mail-yw1-x1143.google.com with SMTP id
 00721157ae682-36a4b86a0abso35643907b3.7
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rkfqHZ26MRrvf1EJH12hlN9RWSM+HsF90hhs0644ZoQ=;
 b=lVkSZYMd54VnfzK3GlJqt3vS9Uim8AvhWlGz8oatrtYiwNhO/fs0dIGgdBCkKxnl4Y
 gIRwiJw3KosfY8dPuvh3vh2SL1GcM0PJULZMbk95RpO671Adc0I4nDVmMP8WfNBsantH
 71bHMXQQ6bxhbchPGkt7Kz5Tpd54s/DZWSlHWFnYrLZdPkvXPTKFA+PH0izXpi49Za3Q
 NTWd54tmy14cULvihn0JdkGIRP+cM+Sphgl8jnYHWP+k7YGQhZDHxrgK92jmxuGN+cub
 SSbz1EodJx8vaHF0OenOu6r0DYSgwvTagpA1wTdJEk05ss3bMGZZYJ5MV6OaiH35I5Ln
 933Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rkfqHZ26MRrvf1EJH12hlN9RWSM+HsF90hhs0644ZoQ=;
 b=cYrQPsRYfLh+mwPl2yaotRbtFp5EmMYBsBgbMMUNjIY5VCi/xUcBB0lsb7XOCU1YRJ
 WJyNJ9cUsp7sLSK3ANh9FKRmxrRmOj0byBrMg0YNC2Q0JNjhjMC0YkhzAoRQPb2YE7U2
 BADHYnnfiv0d/G7JGf+Wc2r8lExlCGa40A2M3I8nC6VDFspE0iK98W/u+JUb+JHtWkMn
 uEbpyuERhIt77zfK1vgWmfZOlYfFwj4OYaADIFWjAZ+W+Aa3TT1EIF5lkclfN4huKl8X
 wacbi1MEM7tw2whDtHFciQq9TRk6qEtYCQpwmk/+N7OPqhzTwfYoIjf8ESR75jm85Dz0
 ebVQ==
X-Gm-Message-State: ACrzQf3dPDWFCTvApmhg4r+OG0PXlnijSvtBPKh/CHhpcncOTPzA4NnM
 cmy7GYU3txGD4dZjDK++Q4zGjdhiLRvQ+7zg+aM=
X-Google-Smtp-Source: AMsMyM6E+rlw4yPcVrVMqln/w6KIR8KR+KRHOWEg1YOFSrak8tUxxJuN2aLE0S3bqu46lXEBWRt38nFdsWB6k2HL+Ws=
X-Received: by 2002:a81:a116:0:b0:36a:de9d:824c with SMTP id
 y22-20020a81a116000000b0036ade9d824cmr4493338ywg.449.1666461481863; Sat, 22
 Oct 2022 10:58:01 -0700 (PDT)
MIME-Version: 1.0
From: NSENGIYUMVA WILBERFORCE <nsengiyumvawilberforce@gmail.com>
Date: Sat, 22 Oct 2022 13:57:50 -0400
Message-ID: <CA+PPyiEvbs0-Pn0ndthWL=Q5Q4ArN7P4Lu-26UHWf+7O3KG5eA@mail.gmail.com>
Subject: [OUTREACHY] Asking about contribution ideas
To: ming.lei@redhat.com, sgarzare@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1143;
 envelope-from=nsengiyumvawilberforce@gmail.com; helo=mail-yw1-x1143.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Oct 2022 16:16:28 -0400
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

Hi team,
I am an outreachy applicant and I would like to know how I can make my
first contribution and what the contribution should be.


Best Regards,
Wilberforce

