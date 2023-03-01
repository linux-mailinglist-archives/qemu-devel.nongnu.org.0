Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9E6A716C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPYR-0003o7-Gj; Wed, 01 Mar 2023 11:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suda.kyoto@gmail.com>)
 id 1pXPYN-0003ni-MO
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:43:43 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suda.kyoto@gmail.com>)
 id 1pXPYL-0004bB-TP
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:43:43 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-536bbef1c5eso374260597b3.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 08:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677689019;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r7oMJe393CMnJrCA8B66Sm/zqRQ36f+TUcGK9JcqXKk=;
 b=I2slUSsQUdcTxOK6PqxiKerpfYEtAJkPAUcPgb5J1j2iVR0hj3RCdS0XcaGfAPiokt
 AadK8SdkRL3IfLcZoRvitlmi2gGdN8+MBlBQ5JI9NEvWQFZiECroPnldDuz9XC8m3rbx
 u23v36qec4QyeIzb/HMboCpO9VErteS0GPKmDKRsrW6Rerl1DpApXmtsRHyG5oywjKQD
 pt/XkMOa237TQyBwCHDYQjVBn4xVyrLdVpReqHBjJTnLUpjSZADexpNOORzF+kSmEeyP
 Z7kSFcHUfAi2twO5q/m4p1fwZtWWjrvpHWLbqamRYxhC+wIwI1zDuTfzYJlMeZKf1F1I
 wtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677689019;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r7oMJe393CMnJrCA8B66Sm/zqRQ36f+TUcGK9JcqXKk=;
 b=F2bOWF4v3jN/KLKMe4eBRMejUSCbyPmWKSCB34yORvu7Z00bYdtGarNFcSJCTSr7+F
 aERiQYaHqjCp0qn583briJVraNUA4k9VAxqsuoucJ6K5CRDG4mJAF0aNFm/WgpmZ4JiH
 kaHOTmh29UWfAlJLmh6CS7dR3oMkCWLOjP/fWCTpwvw4UKDvPG6+aYvvrsgs/D3Hukau
 n/IK0yjqppDkviqdCLH+d9XvAXFqeHyaoR8j/PBKs/PemuRGu5LEcnSa659g3fJaEyQA
 vBnVRZAQwWRVXPkb9v4k29O44HrtrgLcWS+qrg70J310Am5UseRFuJQh8aFPlBuNC/4i
 CZLg==
X-Gm-Message-State: AO0yUKVsbp6P3zSM+7J3hPp8P/KUtUK01E1O62zecFfqXwhqlbm7u3Xq
 EIOnx2MgWGCwSl8N38wc4YOG2uMqru/J7C9bnvY=
X-Google-Smtp-Source: AK7set/RUYhK+klyTwMzNsaxxrhNIDxW7ISkD+BR5i2TI6WKHnHkhjE6BQtJphMFmonvXJsl4vTSYZeGSfd8ngpaXIo=
X-Received: by 2002:a81:ae61:0:b0:53c:7095:595a with SMTP id
 g33-20020a81ae61000000b0053c7095595amr1427261ywk.7.1677689019252; Wed, 01 Mar
 2023 08:43:39 -0800 (PST)
MIME-Version: 1.0
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Thu, 2 Mar 2023 01:43:28 +0900
Message-ID: <CAG8fp8S4AErtJ5YjpmW5d7+sRSyqQp+Th6NrJRm248gohNwCiw@mail.gmail.com>
Subject: [PULL v2 20/24] tests/docker: use direct RUNC call to build containers
To: alex.bennee@linaro.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000009445405f5d96abc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=suda.kyoto@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000009445405f5d96abc
Content-Type: text/plain; charset="UTF-8"

> +               $(RUNC) build                           \

There is no `runc build` command.
Perhaps you meant `$(DOCKER) build`?

Regards,
Akihiro Suda

--00000000000009445405f5d96abc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(=
RUNC) build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br><br>There is no `runc build` command.<br>P=
erhaps you meant `$(DOCKER) build`?<br><div><br></div><div>Regards,</div><d=
iv>Akihiro Suda</div><div><br></div></div>

--00000000000009445405f5d96abc--

