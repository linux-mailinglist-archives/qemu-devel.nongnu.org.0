Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A75F0E90
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:14:41 +0200 (CEST)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHiq-00009b-G6
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHfF-0005Cw-NZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:10:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHfD-0006CN-JR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:10:57 -0400
Received: by mail-ej1-x62a.google.com with SMTP id nb11so9677314ejc.5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=+UXzsQ4mxQEbYY/YKVDWD3zpEclhcCN53dbIzlORkmY=;
 b=HJ7VyEj0++HeUEu9mEtmVBNLGW0lvalLqBl2/NthwjsZ95M+VgiuaQ1+LdA4Ezth7I
 i4d/U+B01+9G2ODwyZmxDDTWMUfr3+0e+7Qsn/3lwKnipua+Wjx1Pax5XXgklGJOAbuq
 f6+bsa1wH6o8kZ6k4f3WmuodNAFqu/BdbJrCs1U9yaZKeuTO6auWgSFq+IvAbyoHe72M
 IgFothI6F32qeUchW1KbW2ard8c7SDsTv4gjxc4sLZJX/SETfWLJBUdHaWvOiqNZGom3
 9D1fWx6K9XkEHiZBu5Wv44cvDEEqJ7AN45qTdAoE0hUSZLHqG7k9/5rZ4yHVKMw7fiCd
 mgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+UXzsQ4mxQEbYY/YKVDWD3zpEclhcCN53dbIzlORkmY=;
 b=7G4eP2CQMK9cy99ZqkjiDQaRWNMrUd4SMnT8a7m34PDpaDx5DubS7x+tUVDaS0ivZn
 e9SAwaPubLZ1vVFtdI3bU55khD9IHBTLCVl8EpTn1uG3rHd30aC087UTq7bOT6w+RkNH
 lfI1t6aFF0OBnAvjzM4xCnMQoluE1oUnyaXNQTAqyevUm1CDd5RJHXD2slRBsU8SMceo
 gAiRjUEXY+r+7kA2BRQ8RWj90qEWsQl3AiILcYjd56mu8tnTpxBsrmkJWJIwDofe/9Dm
 cYMI1K6LaUZY68Y3vQnKg17ttPirkNZo3LoBoM+/B+rMHdW6nJuAeS67yuECRfR4Szck
 FB3w==
X-Gm-Message-State: ACrzQf0RImvYg0gIgti/DxuR5Iyp1whT7SRnBrN/+n84n+iaySQlp4Y+
 07az1UXs3W5+1beLXtNoVNE6Kt0M3qJs//BzOmuuww==
X-Google-Smtp-Source: AMsMyM6PHA0SZXE5cLa5xyrHtYyT8gPh65MXh+sLwoq6qriCFWtgbItXvwki57gQq4brVQDawayOL/caR9BON2Jhr6E=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr7060872ejc.659.1664550654130; Fri, 30
 Sep 2022 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
 <229f555d-5f69-1c40-c65d-552a0ed8a39d@kaod.org>
In-Reply-To: <229f555d-5f69-1c40-c65d-552a0ed8a39d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 16:10:42 +0100
Message-ID: <CAFEAcA9qJjMQyMDYFjTRTZ5uXK5NxzVu-ySqcqjTji5z8cRm-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 30 Sept 2022 at 15:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/29/22 13:44, Peter Maydell wrote:
> > If you want to be able to turn off D32 and restrict to 16
> > registers, I think you need to add a separate property to
> > control that.
>
> Something like "vfp-d16" ?

That ends up being a sort of negative-polarity feature.
Maybe "vfp-d32" for "have 32 dregs", with 'no' meaning "only 16" ?

thanks
-- PMM

