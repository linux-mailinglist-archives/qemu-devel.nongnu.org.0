Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B9581457
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:42:11 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKp8-0000uE-7c
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGKnL-0007rO-Dg
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:40:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGKnJ-00066W-Ng
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:40:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h8so20190363wrw.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xwk4jzrJDudSLDalAoln1wz47Qban0xkNF+PvkWl0HE=;
 b=H7L0tyV41P/0FxvP6ndPFRq83oQWqsbJsJ8PEeYSAL854kqfIw+xievGYutIflU4Jx
 /w2LEjLPt+M5pBOo4SQmWSAVaYrlAVakjOpOAoVPXOiIF90XOBheQ3xmUDLpGC4UJ6zb
 NWy0qylRDrnV6oJW/zqT+kjtT1Y4ULJZwXb347scFlFc5iCbaAJF5CNWZlKg5k9S8DQM
 eg0QOsvLF8PuKJjCRzuGxxcqdW4EeDJO0QrUnpIwXKLjnMW0B+mkJ5dnqKrKnfVNVFe/
 7yqYHlIYMDFjlefBbdsfH5tqbQpnY4C9KqsJl134h7GLRBhTYe7v1xtttq/joqFySiZt
 VS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Xwk4jzrJDudSLDalAoln1wz47Qban0xkNF+PvkWl0HE=;
 b=jkw8fmVZWPFrd6bTiuGhVTCvZEmaHUFRIR3R1So0e0vvBfG6RGmjUXvv8YS8p3Ih1M
 BlXnqgtUGdtY8Uzwv4MTLknO+AtKKmQlnLafU6ViSZYNg3WwWGuJ/yYve2SkpmGh1FfP
 UxKpNxVgqwxd/ZSn2DC88YcDd6RGOSt7eKm9uKPFUHzj2Y6XL5tI1hr35aHy9Dv0pYGa
 n5U0bminJAFH53N7lZrzjPbRfBGTewB+7JvvmcJG8b2/tICzzjTnPI7dXa6+2IbzYmF4
 z4Hi9JGTh6UGJlNz3KehqllTj0y9/pHj4KA6ALlpSGViO43PZ/CvKbz6PYtV6/5Ebr58
 J9PQ==
X-Gm-Message-State: AJIora/kmZ9yYvSo6kixB21a/+AzeljIm7anw+eqBaP/vBRbPG+xT51c
 039/zRpkh5Hbhg7TOU81Lp37faiYyWADzu9EaCA=
X-Google-Smtp-Source: AGRyM1uP85O4uu7fzESdExKm0+eeA909pZ5ltv1bYU51C7YNNqqr3VROh6zGdImy4Cu67B2lgpyzdw==
X-Received: by 2002:a5d:59a6:0:b0:21d:bc0b:d762 with SMTP id
 p6-20020a5d59a6000000b0021dbc0bd762mr10926429wrr.637.1658842812925; 
 Tue, 26 Jul 2022 06:40:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay35-20020a05600c1e2300b003a2e42ae9a4sm21240424wmb.14.2022.07.26.06.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:40:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AA661FFB7;
 Tue, 26 Jul 2022 14:40:10 +0100 (BST)
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: QEMU Developer Survey for KVM Forum 2022
Date: Tue, 26 Jul 2022 14:27:16 +0100
Message-ID: <87v8rkgfgl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

For the QEMU keynote at KVM Forum I'd like to repeat the developer
survey this year. It's only short (7 questions) and reprises some of the
questions from last year as well as a couple of new ones. It should only
take a few minutes to complete.

You can find the survey at:

  https://forms.gle/Y1niFJLbBHmA5Pgk9

I'll be presenting the data along with all the other interesting stats
in our QEMU keynote session at this years KVM Forum (Sep 12th-14th).

Thanks in advance for your time.

--=20
Alex Benn=C3=A9e

