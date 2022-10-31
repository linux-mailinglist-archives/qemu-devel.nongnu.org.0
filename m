Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658461339B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opS1L-0003CD-Dr; Mon, 31 Oct 2022 06:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opS1I-0003Bj-6S
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:27:53 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opS1F-0000Nr-KD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:27:51 -0400
Received: by mail-yb1-xb34.google.com with SMTP id f205so13183382yba.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=trwerqx+OgGo+BcFPpJjU9YSAvx0U6PiY0jWbg8t7Qk=;
 b=jSPK5bdUOP8VnDTP1UqH51TTA4JtnplL+pM6P5u/T/OLXfEbls7gwAu7zl7HzqflAr
 B4JC+VbUy4b0eAmGNjtae4KgarwTV4WqZQuEH83atE86UBDGrN1mHmyUfdXJUbDMT1s4
 ndi5yLmj/83VQczf3262kGGsjRYlWEuIpjBzEFCTglrJswY+AHhL8EyRZUdlZrCPPCfi
 mXTHkn/uS/bW/wDYQP8BXSSZOVjc5oBbH/4FNq0c+DvVBZFlxtQIdWPZK8/CX7/DrjTa
 GCuJzwBW61kLeX6Vj0VmmIgkGFULifrN5uj1sQrUzPVhZSLG7+Ki3i4YRqGM5EY0+zys
 BbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trwerqx+OgGo+BcFPpJjU9YSAvx0U6PiY0jWbg8t7Qk=;
 b=cFy/FuQxt5ixe8456/8l4fpSfmHgc5eYpP6AP7mPm2B5BwdBIs7sbJb9hnI1Xo3K5m
 7a4jopnjEh3nfZC2vji8pCSC0L+tyXYLA243z+68GQz5QFgU3crzXGSPG+h36deIfM2B
 4hXiSqkbkQG8yUUqZeJkvpl01zf4nDG+57iMZq71aCCOyC1FvAlTKpXnqL/s2rlktPph
 yT9vDPsBo0Kbk3C8cfUGV1K2sfprA0pBhbuvsDHiDGINfyRa0EgRsC0EDSRz57FwtZG4
 UI8nPrLQdrtck3tpK1g0iuCE6acgcy9DtluHa8StqEmVrXD82e06tX4ezWbivy1R3QUl
 KM9w==
X-Gm-Message-State: ACrzQf3vj2rSu5o8jjOSzMlznwJLXSY+lnJowO50pvceX0ISdWyBpe6f
 89A+rm8ZdFAr4cknmLgkgLtLwhxQLLlooF/HIkE=
X-Google-Smtp-Source: AMsMyM5eEOwQ/bgxSvtCNOsEcveAjDiH88z6qR6H8f8yOMl3qwRoLyLFcmIY1E8TkRqAspnAW5FBIw2HBeIrmmdcR+k=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr13121758ybt.118.1667212056549; Mon, 31
 Oct 2022 03:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221028132304.829103-1-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 06:27:24 -0400
Message-ID: <CAJSP0QXRog0z8hdNQTz7OabYCxQbAH1BOXnPuxBbyt-ONjOL5w@mail.gmail.com>
Subject: Re: [PULL 00/21] s390x and qtest patches
To: Brad Smith <brad@comstyle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 at 09:24, Thomas Huth <thuth@redhat.com> wrote:
> Brad Smith (2):
>       tests/vm: update openbsd to release 7.2
>       tests: Add sndio to the FreeBSD CI containers / VM

The lcitool submodule was updated in this commit without an
explanation. I looked through the libvirt-ci.git commits and found
commit 94a63b504e8e ("mappings: add sndio package mappings").

Please document the reason for submodule updates in the future. That
helps me differentiate between intentional changes to submodules and
accidental ones. Thanks!

Stefan

