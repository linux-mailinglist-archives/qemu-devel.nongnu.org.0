Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2162E042
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:47:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovh5c-00036T-W8; Thu, 17 Nov 2022 10:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ovh5U-00032F-Cw
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:46:00 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ovh5N-00023C-KL
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:46:00 -0500
Received: by mail-vs1-xe35.google.com with SMTP id a6so1927625vsc.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fIVKn8yAWXAuTkN5/m0swrtZdbgsn8Kd74zL0PgV/F4=;
 b=kqcdU/YnMC+4hYcbRp8Fdu04rxRjMxGjDpSFL51x3cEFtU4K8SINxuTrL3XSkJYHfG
 nVS/DVsVW+AO32w1GaOeQON+y1lkKURG/ismJTTP7Uq2r+wGppPLy5kWYirxDRay4sz5
 en+/KdJ2o3mRFbzVGYzTai/mhKhMEI5Kojxly51urlJCnxyLTjwuOCnKSwEuVTJfl0eo
 O9onxUKYDq0vgHnhx34ZId9Y0F24oF28Jozm6Oeq/FAecTqsDNLCtx7XAvq1WIqD8Udw
 nv8qWhHoTC7Gmgm/DBxj2Q9/u2TJ3L5ZPI/8jIs9FfO8BdaMtzWZUCGXctagTZb3ajw6
 9y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIVKn8yAWXAuTkN5/m0swrtZdbgsn8Kd74zL0PgV/F4=;
 b=IJHVFA+C039HfFwJWyzUB23YBn+t5uW2z2Y7m1IEgXWurQD4+uxfuOQ2bgfPTTuWxj
 iT5gImL+sT7VC8hbmypPwhwN2cGmoloymAFYj5Qdp80nHOHlzwUx/xSDjZcKBGzogY/B
 q7FbtOh6QFHwYn7xCFph7AOR1fhtC4NBDfG4Y87U5iq2Om1ORg8eXY6RMPPyTtsQG9It
 7CrzY2aeddIYjeP+L23aX42gxJ4gOdsGsHKecCZeCtAMg7dIBNJ6zVQerdC7yemVMVZy
 YsgVPeO0JmmoLCLcaGT+ukGcDFMuij5il1I0rUSlp0crQckBpjRqat827s7e+T1aznXY
 f0LQ==
X-Gm-Message-State: ANoB5pl3EOXiCTpqOYK665FnuckkpM2ZWbnIyQLZca5o1M94OysYmPSg
 i09Nh9Ii10OK2aKUDAR8+yTuIg1VyLFsAUUE3d+WGyWjfBw=
X-Google-Smtp-Source: AA0mqf6r71SU9cKEgsIz0bt75zGJm0xiIFqWCXJaFGi+q86Z6qjfRIw2iQ0zTWQQT9LkHFw3RAMNzYKwJ9TcFCTd/YU=
X-Received: by 2002:a05:6102:2757:b0:3ad:7f2:a01b with SMTP id
 p23-20020a056102275700b003ad07f2a01bmr1689935vsu.57.1668699950634; Thu, 17
 Nov 2022 07:45:50 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Nov 2022 07:45:39 -0800
Message-ID: <CAO=notxWn2jhG=S8tzGzB7RF89H3suYZj315XZsM+9rz+FA5CA@mail.gmail.com>
Subject: qtest failure mode
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>, Stephen Longfield <slongfield@google.com>
Content-Type: multipart/alternative; boundary="000000000000cbb01905edac7b69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=venture@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000cbb01905edac7b69
Content-Type: text/plain; charset="UTF-8"

Hi;

Recently I was debugging why a patch broke all my qtests, and the issue it
turns out was that qemu was dying in runtime.  The qtests complaint was
that the assertion failure on not having valid sockets.

I was curious if anyone else has experienced this, and if there's a plan
(or a different target) that would have the qtest detect qemu crash and
report that failure somewhere?

Patrick

--000000000000cbb01905edac7b69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi;<div><br></div><div>Recently I was debugging why a patc=
h broke all my qtests, and the issue it turns out was that qemu was dying i=
n runtime.=C2=A0 The qtests complaint was that the assertion failure on not=
 having valid sockets.</div><div><br></div><div>I was curious if anyone els=
e has experienced this, and if there&#39;s a plan (or a different target) t=
hat would have the qtest detect qemu crash and report that failure somewher=
e?</div><div><br></div><div>Patrick</div></div>

--000000000000cbb01905edac7b69--

