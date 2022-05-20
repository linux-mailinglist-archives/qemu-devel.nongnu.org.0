Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028B52E8DB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:32:18 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryzX-0003Gd-2f
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryv0-0001R3-C1
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:27:34 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryuy-0007Ra-L2
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:27:33 -0400
Received: by mail-yb1-xb31.google.com with SMTP id j2so13331620ybu.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOCcSu5Hqn4y5qLPTDF/1b/PNgcRmh/qpbSd1Kdj9XA=;
 b=oC+BnuWvmFSYR4tGJQE0DrtOzh+cnC6P3M2EwTIt+LQF9GKH+SG3v+x+/g0+QL57h6
 ibKz9ayvuBUM1r5EQDHYmZP+8LJsNbaqEcaFlrgdJtFrVQXAR0dNd44ChPFmbgho/E4+
 Hw/GcCiryterUF1fSchalHAZ5TvbVTdDgu4JxVSg72MAitr1ryKbS+u6Spr+xckYqS6R
 J8kt2PrQescFMTyJ/UkRr7cYYx79KHENGUvXnemt5ch880PJ1yLHpcMyrON0qKoulBMO
 dAvPh+9HvxguA25W/Pv9zBT4IufodZttoZ4G5j2Ev8e5ijTZUwv6YaOJ9OaTetx6UINx
 507A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOCcSu5Hqn4y5qLPTDF/1b/PNgcRmh/qpbSd1Kdj9XA=;
 b=uI1JCRVII2yXmwAXoA3S2NHL5T1YrUjyQAJVdSVp4q1SKepOP2PKBPIQxvtFGQv6jG
 0HOuC2UkybBLnsPTtEZ6N2X9zcxxpOYPIW6uuMeYeQ92M9dtMJoM0tYJScmOkgsPflqL
 UoewAodgPf/1o2QNLbLSvu7uRWbqHgof6zghla13d3QMoCuajdBPOI9kr++2QrGqZTG/
 ZlXcoIEqzV20VMZVYcWZJMC93QDTQGR2nR7tjZSWtYQkGYSYGm6/0G1/o7DACFK6wd90
 fjQ+LCdpmlaxVAy407YztDjfBTorL5ZgWHUZyZMOEOQIZhUKLOMoRmlLlnVVXcEKpj5t
 FATA==
X-Gm-Message-State: AOAM531Dfj4inav5Cq/7yaECL6WN6vLNABiOL8kuT9JqO6YkS0j9zAOh
 U0mC9WfV6kO+p4QIUJFqr0Htt6alT8l6hDPx2HXPwg==
X-Google-Smtp-Source: ABdhPJwudQJrIsswaB3+6fw0xluYaE+rFjEMC/ZbBXkiXfCraVtLRaluvkTw3naVZoLlXjGXNtCDrFKUFwQH6mcykOc=
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr6151420ybt.288.1653038851821; Fri, 20
 May 2022 02:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
 <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
 <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
 <CANW9uytx_ocywwRVBLbze32-Vp1qR8FGMWx1691_ji_J8Ngfhw@mail.gmail.com>
In-Reply-To: <CANW9uytx_ocywwRVBLbze32-Vp1qR8FGMWx1691_ji_J8Ngfhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 May 2022 10:27:20 +0100
Message-ID: <CAFEAcA_4oqeQTLqi=KE3vgCH-BeSRDLsBxSLCanvQX0s6irc=Q@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Fri, 20 May 2022 at 10:02, Itaru Kitayama <itaru.kitayama@gmail.com> wro=
te:
>
> By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I ca=
n bring up
> the sbsa-ref board with the latest kernel.

I'm not sure exactly what you're doing, but this sounds like
a workaround for something -- we should find out exactly
what is going wrong and why.

-- PMM

