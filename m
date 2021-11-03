Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C844470B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:27:56 +0100 (CET)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK3G-00053Q-SM
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJxl-0003Lu-LI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:22:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJxi-0008PQ-Qx
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:22:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id 71so2558008wma.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wY7ROPm/0nKszLAq8JAntqsmY6hPkoPopF3is3t0IJ8=;
 b=al+65eEPB2S0SJM8NGNfTvFZQeMpcujNk81lIw/bnEpCTn5RedyIwrttzBshJN7hu2
 jfk5WWYAXwZtIHnku5ytP2sxkDdnUiV6V13Kmk/1sLW9c0avgUGG+PPgIcc7mM2Zwt3A
 Y6okUvbDDz8fzoC8wGYyEcZmKRCxZv8h9+akdgUQDhCgI+GqJY36J/kpOFbDHgm/Ct5n
 pEoUH77Wzi2u1ggdWX35YfwNbXJzDDxMXuOHZYU9sONuVl+G6/JFzXKJow5nNnxX/7Xv
 +OhrLYTGU5EUuIlmOgYITm9NiXELI9gcUGpjCZL6VbXqmJffAY2ANVAQCnO7wZuLzLGH
 R6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wY7ROPm/0nKszLAq8JAntqsmY6hPkoPopF3is3t0IJ8=;
 b=VlDiEqFb3HlDAR4GpTV6tkkGUzo5OLfJgbMLpce3kMQe/qZtqoZ8N+ensHXrRU/4lL
 Mef3UudYYAt42wIz9eX+t4AIzvqf9vpmo+qW9+hwrjt7WOoUyoRRfL0nx7giDbS6k9P0
 HADmTYh4Iv1ebUieC5Wgv0orukBE62wktIWZl/KdJLBe4GsLbk9NjacCv9EzQo36ySNn
 eNb5lk1q4iVaLf+NP3OCfbqCqiu+JI/jrSB5Fvovaq6iUJywDM83YrQe+zD28JflB/gz
 PeFUOWfDvmgWbqim2pl5GP+crg556btXDHj7qULX9apG6hsqYj4EUoT/bK2TnjHZH4lt
 Xhdw==
X-Gm-Message-State: AOAM530Lb0hXr5jrtUPAimkcyzrcikymBgOb/m0l0JUDjAi78oZF/fgb
 +aGMnvpb3LWmEiekU83KP1Befg==
X-Google-Smtp-Source: ABdhPJxJg2do8CPBWv8/AYXLNdcCQuSNf+09ttD4A+ZoAtmoeEi0qGDn1oR7riVXa5ELO6cnOhm8RA==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr17762954wmx.54.1635960128666; 
 Wed, 03 Nov 2021 10:22:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g4sm2523968wro.12.2021.11.03.10.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:22:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BC851FF96;
 Wed,  3 Nov 2021 17:22:06 +0000 (GMT)
References: <20211103170558.717981-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL for 6.2 00/21] testing, plugin and gdbstub updates
Date: Wed, 03 Nov 2021 17:20:42 +0000
In-reply-to: <20211103170558.717981-1-alex.bennee@linaro.org>
Message-ID: <87a6iljgsh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alex =?utf-8?Q?Be?= =?utf-8?Q?nn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The following changes since commit e86e00a2493254d072581960b48461eb96481e=
45:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/hmp-x-qmp-620-pull-=
request' into staging (2021-11-03 08:04:32 -0400)
>
<snip>
>       tests/docker: Update debian-hexagon-cross to a newer toolchain

Hmm it seems like we can blame the toolchain:

  Subject: Hexagon toolchain update vs linux-user signals
  From: Richard Henderson <richard.henderson@linaro.org>
  Message-ID: <4f65337b-b9ed-dc4c-ac09-025bef5eaa4c@linaro.org>
  Date: Wed, 3 Nov 2021 11:22:03 -0400

NACK this PR and I'll roll v2 tomorrow....

--=20
Alex Benn=C3=A9e

