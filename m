Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3246534C7C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:27:44 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9mR-0007L5-UJ
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nu9Dw-0002hj-3Z
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:52:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nu9Du-0005Tw-6O
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:52:03 -0400
Received: by mail-ed1-x533.google.com with SMTP id p26so999855eds.5
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JGJTHfDz4hrIsMU/HrOWLMhiAI8S6aeF8FVebg2goXg=;
 b=7GogCDeyx4G4YrMgPbJP3jpSwrHfifu4stCeuN+FIiUcVJk1/ci/JAbIZ8tmW1tPhU
 f94FtQnpZBDmOn3mJhN0ZxzXrLwTOFFcEQqQaSQua/utGdI7xzclpegsek6bIXnyLoLw
 bg8D9ReY7p4g46xWxDHT0McnpmBxmj4OMP5OQHzsaCCdsmx4+dtrq0KYjpMnd/4iUXLm
 8iKC2G1oahAa/derA/zxiC2aZ/AeBPuhsm08zA6dkvZ/mmkQ4Gm3SaGucyeC/D7uadVX
 Zn+ag80FVtwn6nH92eWcm9EYQScs8IFbDATSscwEnuWDjd5A97xcJ0XFYsHa8YT4GqzW
 B1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JGJTHfDz4hrIsMU/HrOWLMhiAI8S6aeF8FVebg2goXg=;
 b=GcpVKp5FVMX+gC6owmF68dDcdS7IE1gBuPstWQs+1f2uoEqCU68wqDvp8ffGmhVNkf
 EyePUzhhEOaUc+f65+RC9QsMgMs/+VhvcE9VCjeksuqSwmi/EVIr4uAsu1wwiEgKA+Tq
 n6R8AE9BGGF8xnh/fyw6YlhWevSdMdyMgsObr3sxd55+/0dqKhgbYzZYaXfYpd4jqnk2
 h+67jjU1sHTl1SUKqAt4ZX2O5qDdh2fPQdKJ0Ey5Xiwq0305PVGJ4XGBpFH5VusOEaQp
 oETmpilFlUc6yH+fAZO7Z9EpeCrD7SIYEptpDnMC0LMEK+c20NT8+0ais9rxUahnH6W3
 XHnA==
X-Gm-Message-State: AOAM530haRE3idiqRpTihVmrmkmBpXevtsm1U3EUtC9Pn7pPZqe1fq+/
 aiBfB3uW6UjXavFdpHi6z7w+3Q==
X-Google-Smtp-Source: ABdhPJwSqeVDs2OFeLYMllSsh+2x3lJx2ib5O62ycWJX2txiqFDkkFHGoIwqMj7IhyMtqrnRE/4QTw==
X-Received: by 2002:a05:6402:292b:b0:42b:dbc5:c553 with SMTP id
 ee43-20020a056402292b00b0042bdbc5c553mr1772039edb.297.1653555120681; 
 Thu, 26 May 2022 01:52:00 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a1709064ac500b006fe8b456672sm326448ejt.3.2022.05.26.01.51.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 May 2022 01:52:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: AArch64 semihosting?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
Date: Thu, 26 May 2022 11:51:59 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <877D60FE-4219-4071-A1E2-76EF4E732A59@livius.net>
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ilg@livius.net; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 26 May 2022, at 11:20, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> QEMU also shares code for those two architectures' semihosting
> implementation.

Then it seems to be a difference between Arm 64-bit and Arm 32-bit =
(which is fine).

After fixing the AArch64 tests I'll get to RISC-V, which should run the =
same tests.


Liviu





