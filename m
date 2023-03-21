Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031766C2E39
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peYdG-0001j5-4k; Tue, 21 Mar 2023 05:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1peYdC-0001ci-0O
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:50:14 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ayushdevel1325@gmail.com>)
 id 1peYdA-00054T-6g
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:50:13 -0400
Received: by mail-lj1-x22e.google.com with SMTP id f16so14838883ljq.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679392209;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1aaZH204BEwrgBF5ozoNYfAvIavSfheRkWomA5Tt2Ik=;
 b=FYA8wEwFQw93pf7NxPDUfBhSos9ddzuzriLWtsWeeGeowgsOkjv/IBivEzPg0ymUrj
 SyA7gag48RmfuSFDHnoT19A9ec8s101ZExJ3Xdjh9GBm/o9dogUEt0+uNxOvn4RgUPCP
 J0asW+fIpD691Dnon6Q6tp7eo3GudQnf3Rj+reD2PHG3j97+9MO2Dt+vj9hTYY50cvtB
 W6n8XbWO+I2fpF/qUuHbai3D7xJ91vKoe9xQsQN+sFsgWlQHhJJ661WZa9Bw+pd6KjV6
 lHNvPa+iUaxaOxcG3951mcYCOvVliD/M+l531WqXj+lFNBVOqjk346T4F81odjiUVCJt
 Weew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679392209;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1aaZH204BEwrgBF5ozoNYfAvIavSfheRkWomA5Tt2Ik=;
 b=fATkdFiNLFbPs4xDs6kE4pzo44YzOl5ufHRzSZh36je/3e03ksduAvhN7KjNWoaQfD
 FkZg3Y2Md6yuDrdddOdYLMvFWT74FMnyzc7d+wJIiDlQH5K6b1v5LME31R7Af6jl37OD
 X0vBz+TdKMi5zC/d6lt4qE4uXaaBqXIgKF30zzGxpIS/xFG9ePCE+4UwBc/GUj3o+LP3
 SeJ+zXK7XN3WHuxKYTIYusSQl8xw0VYemvrWyavjoSQiTIuGsqisPSHDyv9VCEyF/XEH
 DFRPrZpG4YM+FxeN71GQtUsH2v6P69sL5vktXDjQG/Foqj2n4YU4MG3eWxGAtcaiVgPV
 PnCg==
X-Gm-Message-State: AO0yUKUd4GMg5TsxP/88cn8BmKj7GRu0HMml7N545Rxzmh6N14mZ+yqa
 TNxr0y8/E5DW/yNtO/PPyPwwKjAOQcEhyr4g0BYEPsGSnRvppQ==
X-Google-Smtp-Source: AK7set85I8+nXjGbjjPRSrgX+voCm7PGcpdDlUpJEe2Q4OMe6UPmzsjSooRG5zHRoBwa+gxmN9hgaik+m46di8eTt0g=
X-Received: by 2002:a2e:7801:0:b0:299:aa73:c7c8 with SMTP id
 t1-20020a2e7801000000b00299aa73c7c8mr671356ljc.4.1679392209063; Tue, 21 Mar
 2023 02:50:09 -0700 (PDT)
MIME-Version: 1.0
From: Ayush Singh <ayushdevel1325@gmail.com>
Date: Tue, 21 Mar 2023 15:19:18 +0530
Message-ID: <CA+Yfj7sxaon6u+NgWV7SBW=3ohxsqE+jdjuh8pA5Oc5voJXKqg@mail.gmail.com>
Subject: Applying for GSoC 2023: RDP Server
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f50ae05f765f823"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=ayushdevel1325@gmail.com; helo=mail-lj1-x22e.google.com
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

--0000000000000f50ae05f765f823
Content-Type: text/plain; charset="UTF-8"

Hello everyone, I am a Third-Year University Student from India. I am
interested in implementing the RDP server for Qemu in Rust [1]. I have
already introduced myself to the mailing list earlier.

In short, the project will involve the following:
1. Improve and implement missing portions required for the RDB server into
IronRDB.
2. Implement the Qemu RDB server in the qemu-display [2] repo.

I have submitted an initial version of the proposal. I will be happy to
receive feedback and/or questions from anyone interested in the project.

Yours Sincerely
Ayush Singh

[1]: https://wiki.qemu.org/Google_Summer_of_Code_2023#RDP_server
[2]: https://gitlab.com/marcandre.lureau/qemu-display

--0000000000000f50ae05f765f823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone, I am a Third-Year University Student =
from India. I am interested in implementing the RDP server for Qemu in Rust=
 [1]. I have already introduced myself to the mailing list earlier.</div><d=
iv><br></div><div>In short, the project will involve the following:</div><d=
iv>1. Improve and implement missing portions required for the RDB server in=
to IronRDB.<br>2. Implement the Qemu RDB server in the qemu-display [2] rep=
o.</div><div><br></div><div>I have submitted an initial version of the prop=
osal. I will be happy to receive feedback and/or questions from anyone inte=
rested in the project.</div><div><br></div><div>Yours Sincerely</div><div>A=
yush Singh</div><div><br></div><div>[1]: <a href=3D"https://wiki.qemu.org/G=
oogle_Summer_of_Code_2023#RDP_server">https://wiki.qemu.org/Google_Summer_o=
f_Code_2023#RDP_server</a></div><div>[2]: <a href=3D"https://gitlab.com/mar=
candre.lureau/qemu-display">https://gitlab.com/marcandre.lureau/qemu-displa=
y</a></div></div>

--0000000000000f50ae05f765f823--

