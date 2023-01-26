Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFE67D6DF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9G6-0008TM-T1; Thu, 26 Jan 2023 15:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL9G4-0008T9-TM
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:54:08 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL9G3-0008PP-8f
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:54:08 -0500
Received: by mail-yb1-xb34.google.com with SMTP id d132so3603586ybb.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 12:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9vuSn1ak8P3LKaVethpM9sTiQSR7GI6u0lAp6Gi2hBc=;
 b=DbcAqD8LbTkV5RvdnT6AuvteKTZADMPcOpQWJuREUJGR9E5r+nQo+H6OTH4U6IZnC9
 SvxC06jReaogN6g8xf++eS4QholaUPJWGcE0pFSEVPVgwWSFlfVq4gXMz7IWMzL4bhWk
 uwm00wG0w8606CcMVT4E6s4Kn4WNytvGK70a934j7KqzVWG8ZLiMCP0e0J1wjB67dyXg
 8I8TGywO5Alm768d2/AFahh7mkYYCGoiWfxghth4JM0B2CJ7rZCF0FL2exs9CqmM8QMm
 azFcRTMobCsnYfB51G95QnUlOIr9EfT6lx6jOHRr0dkn3t7KswV18NAzCRS2UK+3IjL9
 5q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9vuSn1ak8P3LKaVethpM9sTiQSR7GI6u0lAp6Gi2hBc=;
 b=r1Io6+XOrzNXW+e89tn37bXHQNt3VbBU0BdocMS/Nskfz5Dk0Kw/h/BaIpsg26aOB0
 ioORZLW/w5INB0tNKEYgyo+/+e/+baRiLdzUfznebApGAsnALZfiRrVECEGaaLnYirWp
 GKU1ZFZ63hhZ/DuG2LY9ICrIEMR1NLj+UQMND8Qj1oqt11aG1XwC9C1+/yvCQO5wtYnM
 WT1jtxAU5FG1Bt8eAvey09DPvlTyXH7SD0NRCs5IpsaaMKuiYL9yXw42VWWyYmAJd0IF
 xBS3+wrSHpmavVZmV5PT/nltQto5owlcVCtc4JBJ8oGrnav2+b0gtVGdJzuQbmYFEzEn
 pu5A==
X-Gm-Message-State: AFqh2kqauvIkMMv/+izcE+LWmWK3R6qqUFbMeMx1vrq6kC78B/+VXJtg
 nBh64s/Lh8JchvYJdmraRzyjuZtY1fgGY5CMauo=
X-Google-Smtp-Source: AMrXdXvMwGhWE3LaThP2wOsLXsbetwBbnXga24FccUupLpSoNaVnbZp+DP2Moh5O3CDJcOGNN1zVuMRrrPJMp0rqj7o=
X-Received: by 2002:a25:9d85:0:b0:6f7:6238:3c62 with SMTP id
 v5-20020a259d85000000b006f762383c62mr3836268ybp.209.1674766445930; Thu, 26
 Jan 2023 12:54:05 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 26 Jan 2023 15:53:54 -0500
Message-ID: <CAJSP0QUfT78Zm5Yi5=anLkoZJpm3eJFiqioc8b_jwHF1VhYdUQ@mail.gmail.com>
Subject: Outdated QEMU microvm documentation
To: Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
I noticed there is documentation for the microvm machine type:
https://www.qemu.org/docs/master/system/i386/microvm.html

Someone on IRC asked how to increase the number of VIRTIO devices and
I noticed the docs appear to be outdated.

It says there is no PCI or ACPI, but I believe the pcie=on and acpi=on
options are available.

Do you have time to update the docs?

Thanks,
Stefan

