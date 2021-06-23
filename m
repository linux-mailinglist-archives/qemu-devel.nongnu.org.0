Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636713B1F08
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:52:31 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw673-0002iF-Vh
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lw653-0000cR-IR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:50:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lw651-0007K1-Rb
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:50:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id bu12so5133172ejb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwh0103wUwMWqnMCL+72rqouNEWDjGDch1QNLDIocp0=;
 b=BFFACoSkmlFZYwKs3K43wbdir456RL0g/0H+tBZOTz00+gIxVAg1KjJ+f/xY/eObx+
 YCL3klNe18BUgroWP2HHyWK/knVrYuai3gZbJGUQ3xsWgK+EPQDs/5TgbUuw39wOXMUN
 pW9z+t0diJm+AZAK4Yn1mlJdaSX0IY9mg8VEsKW49n8VcqJz2VzXUFgi53UzAiSbxSvM
 N15GhgVV1+JICkqRm9R8ZsJTpeeYfJ//kutEETNKvjnRQXPwGekPHHVGxi3cudVeh1RL
 I4R4Vxv6WlL9FUjd7kLFRmtPGwuCe9nPSsJ3b2SmFDqBw0k/UktLD3h1kf9Lj+impXTh
 et8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwh0103wUwMWqnMCL+72rqouNEWDjGDch1QNLDIocp0=;
 b=qaH1+8sLP5WcuN9ybdYt8O1cnImXpQKx65qEEjWMbKXfRtmd+Ue3+holcRNINL6pxy
 5Aa5OSgadqkqQOBMgZcRRDFbzzyYaviU1CKPZy2uOG16ENUA9d0fUuS+wIY7ycTkomCA
 xNfEUf78ljonqToNfw1Uh63UGWNgJ2WmyM5wnu42SIzSQ+Xva7qv9l+xKLadDG3cUNsw
 zaM7XBL4JqBRcupkn417YI6MMF7il7FigzKJS6MNklessdVj4vRlJoqIeUNnHrou0cdD
 uCnwbE1c4XxtMfmZKTqhPoCDRWNNwFdYP0+L5lyyyktaERN5E85FeVF3j2I12w9mm0sg
 gYkw==
X-Gm-Message-State: AOAM530KHycx3CgZQWeyyC6LtGZN/1He0/0eKqRNL3s3MTboebKCJmgG
 f2aCPUrZokw59MMyIlLju2G84+IY3ow+nCuURpDU+Q==
X-Google-Smtp-Source: ABdhPJxqGVGjQWCr38HT9cALcx63IimfrdQHLQf9OXMuMXrRcJDybpFAzWizvW9z0ZwOdQgE7tfSLE8l4nNJy89ZpGs=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr1014522ejc.482.1624467021004; 
 Wed, 23 Jun 2021 09:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
 <BYAPR02MB488608E16AA66341B3D9E972DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB488608E16AA66341B3D9E972DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jun 2021 17:50:09 +0100
Message-ID: <CAFEAcA-0gDMzKQ8nf3PK_h4n_Teg6u+GXfKTBnZLkMPgACR3_Q@mail.gmail.com>
Subject: Re: [PULL 0/4] Hexagon (target/hexagon) bug fixes
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>, "philmd@redhat.com" <philmd@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 at 15:31, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Adding Peter to the CC list ...

This is on my to-process list (I catch pull requests by
looking for particular text in the email), but it's from
a git repository I haven't dealt with before, so it went
onto my "deal with when I have some time spare" list.

-- PMM

