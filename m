Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34231DB41
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:14:29 +0100 (CET)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCNb2-000734-4R
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCNaG-0006cj-Uy
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:13:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCNaE-0007Xo-Aq
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:13:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id v62so3758291wmg.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G6vEF4upB+n7agzVoHiCg05zG3RTXQ3K7DFSMhxS31s=;
 b=Nv3f5CleWleVlAZezSwE3SXsCCDeWuJvGK0yNM2K4Lu1llOSh/YRAaOM9rPuYj6h+l
 ND8y8lI0G/lXdUWxU9IaMds6IOo/lnN6qpg4wf5RbpsKOTlGz+KIeLRe6ACX/u5X+FZj
 0VNCjzgCYm/LgJMEs8kc5HVmDUqU51TUKw5BqeFVnSILwONJIDXYxtSpjHuvMH7x4txA
 TliJr26BeruGlVkNzgcnyTlj5ztfXLyRpCV+1s/7YQ5VoVdWxGG6j/0G9Z2vxOGPYZdg
 4WbPU7TrZDQF01BmQ+BZpGnERlMbRlvIgfUwtrhEKRJFJUP8/6fibe9GT7LsU0EfEWbP
 Cjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=G6vEF4upB+n7agzVoHiCg05zG3RTXQ3K7DFSMhxS31s=;
 b=mwp7nsqVzZiKQyXuqRTeKfA4rSaXlQgmgwlXGJxhTSJutZn8IHOS3C1mge3bUW41h5
 Zlj6oaMfgqYQ8WEG21cmnkzTt5p5ZMZAwRYqWS7ZUAohePuczCGeS8Rqp8GXdiZ38xzh
 gPkr0sslwZREVwkTrtDvnnfeREK7zf/xpf8VLD/S5voaajWApS3pGvWDmmWck/YZftZF
 EYQMZW+kWhGPnZ0su4A/qtAlq0R1gYkZLGez8uCJJALdZPjlyPaC/VgxQcHmj8yqj2mx
 810qK8MZeiBeE+t4IPOO9cXepcYLXbXE2bhW45UdmGRoaEtWzF+SIBvDBij/+Py1Z+z4
 ykeQ==
X-Gm-Message-State: AOAM533ZS8fVRmkq+HaOjCeHmyqQ5xpxu2s+BLqw52y/3C6uvH924L2e
 UF3uo7cpNYwi7knUrNCqSrRjVg==
X-Google-Smtp-Source: ABdhPJzGC6ymr/e5eLq14HP3aptllKwz6AcXZz19FcAzQJ+YTcTy8mORxfSVTG7d/nDRdO51W8ixlg==
X-Received: by 2002:a05:600c:21d2:: with SMTP id
 x18mr7338664wmj.186.1613571213725; 
 Wed, 17 Feb 2021 06:13:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm3294927wmh.9.2021.02.17.06.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 06:13:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 985C81FF7E;
 Wed, 17 Feb 2021 14:13:31 +0000 (GMT)
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Measuring the impact of buffer copy for virtio-gpu guests
Date: Wed, 17 Feb 2021 13:46:28 +0000
Message-ID: <87y2fmsrxw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Francois Ozog <francois.ozog@linaro.org>,
 Mikhail Golubev <Mikhail.Golubev@opensynergy.com>,
 Vasyl Vavrychuk <Vasyl.Vavrychuk@opensynergy.com>,
 "Zhao Jiancong \(Jerry =?utf-8?B?6LaZ?=
 =?utf-8?B?IOWBpea3mQ==?=\)" <chou.kensou@jp.panasonic.com>,
 qemu-devel@nongnu.org, Peter Griffin <peter.griffin@linaro.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

I was in a discussion with the AGL folks today talking about approaches
to achieving zero-copy when running VirGL virtio guests. AIUI (which is
probably not very much) the reasons for copy can be due to a number of
reasons:

  - the GPA not being mapped to a HPA that is accessible to the final HW
  - the guest allocation of a buffer not meeting stride/alignment requireme=
nts
  - data needing to be transformed for consumption by the real hardware?

any others? Is there an impedance between different buffer resource
allocators in the guest and the guest? Is that just a problem for
non-FLOSS blob drivers in the kernel?

I'm curious if it's possible to measure the effect of these extra copies
and where do they occur? Do all resources get copied from the guest buffer =
to
host or does this only occur when there is a mismatch in the buffer
requirements?

Are there any functions where I could add trace points to measure this?
If this occurs in the kernel I wonder if I could use an eBPF probe to
count the number of bytes copied?

Apologies for the wall of questions I'm still very new to the 3D side of
things ;-)

--=20
Alex Benn=C3=A9e

