Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEDD31524B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:03:21 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UXw-00082U-K1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9UTs-0004Ih-C6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:59:08 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9UTq-0008Li-2y
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:59:08 -0500
Received: by mail-ed1-x52d.google.com with SMTP id z22so24039224edb.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=No3SHSgBhFtzxfn0z3rRHxe0U7egsCFlOsCer0po0FA=;
 b=AS4b1sUwFrvrInYUWiz/ODhXo7Tgukw+Mtc9S3gfqn3HMjpBZzOgRAVk8xTIN94vzs
 h2+usetTgsVEfs/Gn6M4fVLjWTlP4XNTizOUcTnaNnOFhY9VDIHX6B0jm0Y4VL1u+gfX
 bRUKKg1eQzAePxfGwEHcR+aeJAE74PgD/VcMjaexkLwqRGO4m4HrmuBUlxfY9xuxV+Sy
 RXen3jxYk9AEB4mxRenl1+rTfCEzMKUUszhGeAXnqkjvZVGElxQkABmeFko84HNYjnvO
 jqOHrs/mgmmhOXt7ws0ypwJwb46fi9I/OCG0Q7j87XbW+OlAqRKQg2u7AVgRpHqTx2Zb
 tuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=No3SHSgBhFtzxfn0z3rRHxe0U7egsCFlOsCer0po0FA=;
 b=T31xZSuq+lHeolQba8o2/313qjZh117jCpBYF2xfGzz4bW8DhYzaWdSskrpBsp5Okf
 R587gPJ2QyBVhmmLlCcfeGRXuzHFv2sOuFmtOhMOcWqGtLqRnCX9IGOo9AOuSVIzmiAI
 pZCF1FAraroDe9Kd2Aa2URMK2uevQGeDZnkSRe+pJN4IgfEUaa2Khhq4zNhKBJWDZ2/B
 sud2At/IeBpJGWDqlESzsASSqO++TsV/idW8+ah0by5cj8P1menMAa/le0VbvNee6R1F
 /LenZhQs6LqmrfCLE+VtMbn0jr/veo4y3UWlWxJmmJX2Qdx9ZJAPq/QE4tmE9ASOa4+5
 W22A==
X-Gm-Message-State: AOAM532JfW5bzvyD05A0n6YzIPXLSTHTe+gN3iFVwKXvUoOshGZKsxoK
 7AgRg8Nw+DrHYp62vQTnVYJ/ZqMHdB2KwLh/eHuc5w==
X-Google-Smtp-Source: ABdhPJxBI8cXYtqQNNBbnlAEjT6Vp9zXhkzbtn7w64FkaPPY9SQWrSAmju6iZOETrsEjEGJgIDb0jc4M+hu+8/7utJc=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr23200270edd.52.1612882744503; 
 Tue, 09 Feb 2021 06:59:04 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
In-Reply-To: <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 14:58:53 +0000
Message-ID: <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> Yes, virtio_scsi_parse_req() returns ENOTSUP because it
> fails the "if (out_size && in_size)" test.
>
> I am becoming somewhat suspicious that the s390-ccw BIOS's
> implementation of virtio is not putting in sufficient barriers,
> and so if you get unlucky then the QEMU thread sees an inconsistent
> view of the in-memory virtio data structures.

As a test of this theory, I tried adding some barrier insns
(with the definition of the barrier insn borrowed from s390x Linux):

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index ab49840db85..0af901264b6 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -17,6 +17,12 @@
 #include "helper.h"
 #include "s390-time.h"

+#define membarrier() do { asm volatile("bcr 15,0\n" :: : "memory"); } while (0)
+
+#define __ASM_BARRIER "bcr 15,0\n"
+
+
+
 #define VRING_WAIT_REPLY_TIMEOUT 30

 static VRing block[VIRTIO_MAX_VQS];
@@ -154,12 +160,15 @@ void vring_send_buf(VRing *vr, void *p, int len,
int flags)

     /* Chains only have a single ID */
     if (!(flags & VRING_DESC_F_NEXT)) {
+        membarrier();
         vr->avail->idx++;
+        membarrier();
     }
 }

 int vr_poll(VRing *vr)
 {
+    membarrier();
     if (vr->used->idx == vr->used_idx) {
         vring_notify(vr);
         yield();
@@ -169,7 +178,9 @@ int vr_poll(VRing *vr)
     vr->used_idx = vr->used->idx;
     vr->next_idx = 0;
     vr->desc[0].len = 0;
+    membarrier();
     vr->desc[0].flags = 0;
+    membarrier();
     return 1; /* vr has been updated */
 }

This change significantly reduces the frequency with which I see
the hang; but it doesn't get rid of it altogether. Also I couldn't
really figure out from the virtio spec exactly where barriers
were required: I think I would need to read the whole thing in
more detail rather than trying to fish out the information by
just reading small pieces of it. But some of the ordering of
operations the spec describes doesn't match how the s390-ccw
BIOS code is doing it at all (eg the spec says that when feeding
a batch of descriptors to the device the driver isn't supposed to
update the flags on the first descriptor until it's finished
writing all of the descriptors, but the code doesn't seem to
try to do that). So I think the code could use an overhaul from
somebody with a better understanding of virtio than me...

thanks
-- PMM

