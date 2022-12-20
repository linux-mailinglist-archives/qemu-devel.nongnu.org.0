Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D758E651B7C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Wxo-0005zS-61; Tue, 20 Dec 2022 02:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1p7Wxh-0005yU-NM; Tue, 20 Dec 2022 02:22:53 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1p7Wxf-0005b8-Mq; Tue, 20 Dec 2022 02:22:52 -0500
Received: by mail-yb1-xb31.google.com with SMTP id e141so12026096ybh.3;
 Mon, 19 Dec 2022 23:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTl/c7jd147RrMZ+SpyWCWHk88Cx9RugkP7Mui/M280=;
 b=fcod5+qGNkyv/TBfu6q7x8bKrlXpU/85Zxs+G8qZapmF9bwaEzmlHvwPmNLrjqgxtF
 pd9Uyk4uWYO4cNNyDgLgheSV+3LJA77fwnco0OLw8EYzBwhxOxYO7DZkE+8d26fU2tln
 d9hoSSVgJ08KXDvOUclxkdxgZwQEL17boC1cs0oilUcA/Q1L+Ox+7CQ5KN2wIhcjRn2R
 gZ9iwRTyFn2ese7XzYQAhgXPjcKxWV7eNqlsn53D+gT4jGbonyIx2s+9UEzxiENz8smf
 2TLpsdl4C0xsPyAf5QFKIzfm1YP+ZgK7m9y+HpuBFdg+sKL4vDxAWVWRFsstCxdE2dN7
 YsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTl/c7jd147RrMZ+SpyWCWHk88Cx9RugkP7Mui/M280=;
 b=F/gn0WSK9W5w+OGhtTCGkj1s5cyfuvLgas6pTnsKpvB0IeZKhTd3SbDrY99oVNxaX3
 5VATGw391EHY7wzgkkUNuydi7OvP/cRtXoVki1d8gV6o//NHxGjUP070Kfj0sMaMcE/Y
 XUW5nMjT+899HS/xzMWM3Di/5zpl6Z+5NEkZQpy0/6XzmUvWLPfZ1nyajZTsCcJty5Ur
 vxMIaNpVqBamCoueyNAoQKWFgY/PuddmY0872a7VjCKMIS6Wb96XmskICvyrb/CL+5QU
 4e9kb6sfnDxNETGhxxTzEVRTNrLrq+TYJQou8W/l/ieiXl+K6y/lWRxCdfBgVVFXZYOl
 T+3A==
X-Gm-Message-State: ANoB5pnWRJnZNKFkFsJF0mgItsIcgA+t7rfwmUoGMV6fZ1kS0xFCMNoM
 qBBmg1ZJrqIOimVVoSttOhroR+0RBVLCGMrruLg=
X-Google-Smtp-Source: AA0mqf6wLM3pB/HWQDMB5lHzGuhQ7IQKDNgVKphT/RwTNwM3ObkSX8Y5YS/y2CbYIZYbCnW80xMXa4PDgZKjtWuWNLY=
X-Received: by 2002:a5b:8cf:0:b0:6f8:92de:92e3 with SMTP id
 w15-20020a5b08cf000000b006f892de92e3mr44395217ybq.105.1671520966559; Mon, 19
 Dec 2022 23:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-3-fcagnin@quarkslab.com>
 <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
In-Reply-To: <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Tue, 20 Dec 2022 08:22:35 +0100
Message-ID: <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi,
indeed, the patch doesn't keep separate copies of debug registers and
just directly sets cp15.* values, as I was not aware of the issue=E2=80=94t=
hanks
for the detailed explanation.

I remain available to implement the required fixes, but I'd need
some guidance on how to proceed. Thanks,
--=20
Francesco

