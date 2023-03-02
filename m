Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DF6A83F2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjW2-0000nG-LF; Thu, 02 Mar 2023 09:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXjVj-0000gz-7f
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:02:19 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXjVh-0006aN-Kh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:02:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p20so16402567plw.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677765735;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HaR4KqtE9eskpD8Iff8q2KqW8PPwd0axapBQYTat/TY=;
 b=dF+3R4h9DBEZL3SUOFIoxrkau9fb8u9nwRk0huma1i6U4cOkqhfx5AWhToyntzr3v5
 QVHXOWSZrecalSMXbWou3atjINXnkbfjLriNId81s9uiM9tuynZItOA2Ov7e9/Ht6pS2
 3ie7BevXA1bIfpV3+/kr+jbtpDZs2Jar6o3/rVny/KywE4GibaCR1C2quZ8zs76EGtgk
 msQDY8/qUAOKUh+2quXMo5RGJoALdN+Uii04tjuHUfOScbIWfgL1iKPdZdeeOPMWEPxX
 TQCU1yCv7bTZK2Nv4q2whx2ij/RwSXu0ro5Ds/CuCr1C72Zutl7WTeqGUV8GZ/OY5MKR
 uesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677765735;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HaR4KqtE9eskpD8Iff8q2KqW8PPwd0axapBQYTat/TY=;
 b=g/5+uusolx3aDeeNkHtrY9yzLb7Mm25GFx2lfTWUiyHGd5DzjlklofURHqpQmDEG1H
 CiTCPf2LB1gK69FSIGabpmENsiRhdMmB/9vgP61e391z/CnhdCA/YBWHycZotRyiHQ/3
 1nbFZN3L14OuXDiTpljVA3CaFwRhcBlhGa2+N5UwfuZE89J86XdwL251pk8I0AjAhEr5
 Nje3lAOKgDmGJdcxo/HQu15UVhtywPJA5pDKQoNUxeUiCwrPZztK2TcY7coYyUjBhtni
 9c8qzURbZuA/FDNWre5zssPBgSwtMNqNo1yD71mZVSiebd587RbC9BdP1CqHokRKm2vP
 rlDg==
X-Gm-Message-State: AO0yUKUu7XW1RbJoAXv0iazrcDXt5d5Ks52gdrUw/ukbgQSDwYSKoQId
 l6/27JXYIO2L3QEuGhl3iKjwRqDHlHZIjFUmU3gtLpVQ+MOmoUe+
X-Google-Smtp-Source: AK7set/nnzJOoTLunMNu9U018eSLhchlYjigA2jRmBjEi2030YPdJvH1znZN9kaXaQSicfeltZR3qg+51oYQjGCe6A8=
X-Received: by 2002:a17:90a:4316:b0:234:a62e:bc10 with SMTP id
 q22-20020a17090a431600b00234a62ebc10mr3984989pjg.0.1677765735355; Thu, 02 Mar
 2023 06:02:15 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 14:02:04 +0000
Message-ID: <CAFEAcA-iHy8=N-ryOZg_MHQHUHUimTc3ki+zAFgy_5=5yeA24g@mail.gmail.com>
Subject: got an older qemu checkout? please run 'git submodule sync'
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; if you have an QEMU checkout that you created more than a couple
of years ago and are still using, you should run:
   git submodule sync
in it to refresh git's idea of where all our submodules live.

This is necessary because git submodules are (as usual) broken;
in particular, when git first checks out the submodule it stores
the URL it used to do that inside the .git directory in your checkout.
Even if we update .gitmodules later to point somewhere else, git
doesn't automatically update the .git metadata. This means that if
that older URL is no longer working and the submodule needs to be
updated, then git will produce an error, for example:

Fetching submodule tests/fp/berkeley-testfloat-3
fatal: unable to connect to github.com:
github.com[0: 140.82.121.3]: errno=Connection timed out

One such change is about to land in upstream QEMU. If you run
'git submodule sync' now then this will preemptively avoid the
problem where you find that trying to 'git pull' or
'git submodule update' doesn't work.

thanks
-- PMM

