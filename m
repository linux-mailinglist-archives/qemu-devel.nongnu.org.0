Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12B6A3992
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 04:30:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWUCf-0000g9-Gy; Sun, 26 Feb 2023 22:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWUCe-0000g0-1N
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:29:28 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pWUCc-0001QW-1R
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 22:29:27 -0500
Received: by mail-ed1-x532.google.com with SMTP id eg37so20088871edb.12
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 19:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KScNLqVDeP81ABS2AdN/MqfRn+xwi/2mxOhc0+4AdQk=;
 b=TpZmSij5j+GJ/gyTDYJMi7Hgq13KVLm3leZcSec8zWIETJ8KkqEyHFN9QKac5516A8
 iYIKtVs+JLoL0Nh2sKPspG5Xz55XhDWo31VoFGd9/dksctfBevbSyXJUwHkGWqQGp1yy
 BG74VaGJsMuVLmmWYEn6dQZ8TY65hsA8wdZ4CMrL+emDjWkPd9Zwarn9YWez56iFt7J4
 Xq0o0116bHMqM94x7m9n5+Rhvx+VQprmpT81Gg+vmE4M3C93de9jWEa7sv1rrgF4Pqky
 OHq/f5gMdv32niOAObPrmftWDAntFUUpRFGF0iKX6qk5o0k3jnvyqrQLcCqX41Cczavg
 pYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KScNLqVDeP81ABS2AdN/MqfRn+xwi/2mxOhc0+4AdQk=;
 b=Tke/K4LfCykyPPi4uLcAhM56BO7h1AFDoFPU2e/o5LYFo6dzEk+8xpoGr/Vx1grGnF
 MooRdviNpg7iD2amjKZ2egzvb5HsUyx1I+0DNt1UAFrdKKzfNznn5Bs4GRNzrSRxEUWS
 TZUYEpTbL0T2M0Lwui76/7JGXHsz1BlRIKUMhTg41OL6dW/Qk6t/+0SGSWMwMVfseViU
 5IwrobKDlomZqzg2iltxvz90m+WfWnWygClpDmM6H5PQwMSezngsAKUItXFA+VsTQO3N
 0gvmXQM/pZcp/jvAsHkelrA/AzR72OHx1+oLrNNMzzCk4GWEi1AxI9KQ1PZEjR4uZiTp
 6M4w==
X-Gm-Message-State: AO0yUKUx5voy7EZSLIPlG+tj+Pg9plufrVE7lqgmejdGz+sMiEgpTqoy
 QE8XYtmBRau8pnFiHe6CaeUoXoU91k+GoE1nRZ4tmkQ0B24=
X-Google-Smtp-Source: AK7set8FAcm3Jm9Pwyni9YZ8jEFbOj6KWDJBwiq7woIviWxjUbJpIyDb+vAr+nz7MhLDUoJfTj8OFKTR2k0nZNz8SII=
X-Received: by 2002:a50:9f05:0:b0:4ad:72b2:cf53 with SMTP id
 b5-20020a509f05000000b004ad72b2cf53mr10894893edf.2.1677468563043; Sun, 26 Feb
 2023 19:29:23 -0800 (PST)
MIME-Version: 1.0
From: Dinah B <dinahbaum123@gmail.com>
Date: Sun, 26 Feb 2023 22:29:11 -0500
Message-ID: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
Subject: Adopting abandoned patch?
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d2791d05f5a6159e"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--000000000000d2791d05f5a6159e
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm looking to get more involved in contributing to QEMU. I noticed that
there are some issues in the tracker where a sample patch has been
contributed but never got merged, like a proposal to add multiboot2
support: https://gitlab.com/qemu-project/qemu/-/issues/389

Is another dev allowed to "adopt" the patch as-is, with proper attribution
to the original dev and drive it to completion/merging (there are some
features missing)? Or is "starting from scratch" required for legal reasons?

Thanks,
-Dinah

--000000000000d2791d05f5a6159e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m looking to get m=
ore involved in contributing to QEMU. I noticed that there are some issues =
in the tracker where a sample patch has been contributed but never got merg=
ed, like a proposal to add multiboot2 support: <a href=3D"https://gitlab.co=
m/qemu-project/qemu/-/issues/389">https://gitlab.com/qemu-project/qemu/-/is=
sues/389</a></div><div><br></div><div>Is another dev allowed to &quot;adopt=
&quot; the patch as-is, with proper attribution to the original dev and dri=
ve it to completion/merging (there are some features missing)? Or is &quot;=
starting from scratch&quot; required for legal reasons?<br></div><div><br><=
/div><div>Thanks,</div><div>-Dinah<br></div></div>

--000000000000d2791d05f5a6159e--

