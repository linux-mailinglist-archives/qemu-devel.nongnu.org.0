Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55D375064
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:51:00 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYmh-0000Fr-3I
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leYlc-0008GU-62
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:49:52 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1leYla-0005Vj-KW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:49:51 -0400
Received: by mail-qt1-x832.google.com with SMTP id o1so3354594qta.1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aGo7mteAsPFuWV9ufpWGvJIMbwVIL3CfxVBGSOqyxJg=;
 b=ub7lQYbhwpuAttbiA10hGIfKrOEILjiV42PY3wLiFiPIVWo/3K38cP5rJlqHQTWIqx
 S5bwaGut8iWlrD9sWRUIqvaKZFwlSnSHA1OiNHcrHlXdlfI05fEbou+jwxo0cz6eXY+0
 yW9pHO5D9D4CXGfAcW0XEPGYMwOCbgEI6QEBUGPInAqWId3knBuft1VNbcX3HFFmegi3
 AF8v0CaPLJGcAiFPiSx6Z/b3eJxIle1eD1iJ26xcOwVzFiP5HGXCULeHRqp1JT8WGeZ/
 dIemOAMt9F1VvopemJOLKIcoGVbkl4xZQZMV9XQX4P9APxvG619Jmcb7uHnkf33F9Px4
 Jegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aGo7mteAsPFuWV9ufpWGvJIMbwVIL3CfxVBGSOqyxJg=;
 b=Bxjcp6rTqT7hBXQFmf6K6U+sD411Xgubw0qqpqrI9TKN7prPhijipQ4kFg1uu2xhEh
 Nyslb3QPW0hA6HnkSsVYAIVBhj9t7FFJltGNFGUwfZ+eHzgGHc5OuNtXqpu7QE9N3p1/
 nOdsw0J447qJflJGTAtX2z2VFtouLe7XMoYJUwhh8fFM2/muxNXkk4VmcmqsAHM5aL0E
 D0Wq77Djm0FZiqdmPK5rkc3wgjpmjHKPejngxtdxpbqCiZQXM9k5v/6tWqfR5RlRAmQo
 XyLSSHynKW0BlN2rcXxyad1EqL1Fxj43+LMrBJwGlz3tZsidD7zCLEXYU9sFn2fzEBMk
 lrpA==
X-Gm-Message-State: AOAM531IiznHXu6wIedpYY734krkXS0h6YhzG1MRUKsWeVSNHtekHYYH
 9So1rNT4h+oeVLUWcsQ/DEp3ZlDDV/k0tvihfDA=
X-Google-Smtp-Source: ABdhPJx4RRbJpp7UWOw+0f/rTvziE9EJCvTqeUOIrr/4MzLI6n6QqdWvn7G8m5L/eB08LhIjZX5vrS7AfWdUu1witP4=
X-Received: by 2002:ac8:543:: with SMTP id c3mr2825162qth.241.1620287389255;
 Thu, 06 May 2021 00:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-2-liq3ea@163.com>
 <8o22o26q-9342-o822-2758-372s9s59r2qn@erqung.pbz>
 <CAKXe6SK_gwLad2khA9iJda2DJi2BDXSg=ZGpPUFqPQdb+V6tRw@mail.gmail.com>
 <1970r4n-9opn-q43n-r510-s85so96648op@erqung.pbz>
In-Reply-To: <1970r4n-9opn-q43n-r510-s85so96648op@erqung.pbz>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 6 May 2021 15:49:13 +0800
Message-ID: <CAKXe6S+sce2CQq3f2oT-fbB0Z8dKZ6aReYHkg2K+TDfiAaCkyg@mail.gmail.com>
Subject: Re: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=liq3ea@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: marcandre lureau <marcandre.lureau@redhat.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=886=E6=97=A5=E5=91=
=A8=E5=9B=9B =E4=B8=8B=E5=8D=881:53=E5=86=99=E9=81=93=EF=BC=9A
>
> +-- On Wed, 5 May 2021, Li Qiang wrote --+
> | P J P <ppandit@redhat.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=885=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:24=E5=86=99=E9=81=93=EF=BC=9A
> | > -   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> | > +   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp.hdr));
> | >
> | > * While memset(3) is okay, should it also send header(hdr) size as 'r=
esp_len'?
> |
> | I don't think so. This function also set fields other than header such
> | as 'resp.capset_id', 'resp.capset_max_version' and so on.
>
> But it is passing 'resp.hdr' reference as parameter and size of 'resp' as
> length.
>
>   sizeof(struct virtio_gpu_ctrl_hdr): 24
>   sizeof(struct virtio_gpu_resp_capset_info): 40
>
> It may cause OOB access.

Where is the OOB access? I don't see this.
vg_ctrl_response is a general function so it accepts 'struct
virtio_gpu_ctrl_hdr' pointer and will
just set the 'hdr' field. The 'resp_len' is just used in
'iov_from_buf' to copy data to the vring.
The 'hdr' is the first field of 'virtio_gpu_resp_capset_info'.

struct virtio_gpu_resp_capset_info {
    struct virtio_gpu_ctrl_hdr hdr;
    uint32_t capset_id;
    uint32_t capset_max_version;
    uint32_t capset_max_size;
    uint32_t padding;
};

So here:
vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
&resp.hdr is the same as &resp.


Thanks,
Li Qiang


>
> Thank you.
> --
>  - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D

