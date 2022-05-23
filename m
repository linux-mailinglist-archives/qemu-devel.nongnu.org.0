Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B5530C76
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:58:34 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4pd-0001gj-Tr
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt4lC-0006Lj-5n
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:53:59 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt4lA-0001pd-HP
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:53:57 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i187so22194172ybg.6
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YCSE82z/wK1eCcX7YBl5CEXo+ma1OJyBWdDUPID9pIo=;
 b=hasF+3X/ZzWec2Zp4i9DLyH8DyRfn1f3Upn9a79NLvs2Rv+yuIiD5vLyRAvZsVJPYd
 dSbWro5n3yAT07CCSWPfx7NBA2JV5kOPuLxvj7/ZmJ1q+0M2bB2Pk0PjI6xjAHqKkH7U
 IiPLKQ5MxwuJW+5RiEqRz5KSnPf8PTyiUjPC62mO7/OqCLdYdObrEM4kkJqNGjhxATwD
 AD7bFl4ehWU2CrZGW9pBoK43Ch8YX70Wij1OVSyoM/ELACGV/FgG1BeXBf/az3fK1Q3W
 iYynBD6YunEMqyjJtklzMszECU5MjK1CBM7vdKFeE9+rnKcX1Hev5iYNhKXf22bkTRHu
 BeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YCSE82z/wK1eCcX7YBl5CEXo+ma1OJyBWdDUPID9pIo=;
 b=gcjbgZF1OJabUL7dVhe1TO+npli1eMCi2ldmr1AT3r5LfV+NDqGk/pbOTpjKEcFGXC
 uNBFRJDzZNR/aV6Dmgr14VSEbW4kjNaFfwFa2NM5R9uptJ6ieCpdiG6lYJujZdvL+3B0
 maqgu+7j9CenmujasGbt50InTDACT56PK3jwBJPzrCR0jLVxf1TdfphavBNDtyUCrgzs
 Dw750gGwXU0TgVB/ggHlgOnukSKJQaEfIG0NfRG960bNputJbH62afgcu+lMKzf74+8k
 lnMCi2PpxX4Uvi8mH5JlCEWyH4wV9gmDpU3eIYgEVvR9c+pSPeUhA5b5dntdbwYtwb3/
 cUKQ==
X-Gm-Message-State: AOAM531iT+kSYhasaOu0mwmJwCj1ZDpWX7rYOsaCAU94llmer5PLf32a
 ozTRp2Yq5drXleWtRM2BQYTKANYhSD21cVqROhT4JyVoMgl1Yw==
X-Google-Smtp-Source: ABdhPJyIfleL7QmomhRpdxXqCxAoig6eYA88XCDdgpkejldTzj+766GVRuVO7QxqCgZsZaV0OKXBdGzkmC2Llz9Pp/8=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr20290594ybc.193.1653299635121; Mon, 23
 May 2022 02:53:55 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 10:53:44 +0100
Message-ID: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
Subject: proposed 7.1 release schedule
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

I just put some proposed dates into the 7.1 schedule page:
https://wiki.qemu.org/Planning/7.1#Release_Schedule

* 2022-07-12  Softfreeze
* 2022-07-19  Hardfreeze. Tag rc0
* 2022-07-26  Tag rc1
* 2022-08-02  Tag rc2
* 2022-08-09  Tag rc3
* 2022-08-16  Release; or tag rc4 if needed
* 2022-08-23  Release if we needed an rc4

Does this work for people? I just worked backwards
from a final release date about 4 months after 7.0; easy
enough to shift it forward or back by a week or so if
that works better for some reason.

thanks
-- PMM

