Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9E2723DE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 14:27:18 +0200 (CEST)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKub-0004zO-32
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 08:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKKsL-0003Sl-Fc
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:24:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKKsJ-0008Co-Mj
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:24:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id p9so17429978ejf.6
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9ILPTnTd3evgExyihJg5et0y5smLpdZbD6ijZcbpjw=;
 b=blBdo5E7Z6bhf75xK3/xgi3CROtwjNuwTtkURDh0U/7lJFVuyWV4bfTlZWqRzR/ywW
 HLDRE/+L6IbSIzIdeb2s+wD7a2EIM9+D1a1ynWHG4TBVytx11omlQr94mc6e+LZe3Kfs
 wZV7kNIXLZ/z7UNM5sVDoW5upZjxpi3ltFbkZlszDe+Dh+OkZe6cQD1NJYyO+7m0gXr+
 K/zWmpA7kkseVAzI+f3LHBQtqh2Kxpr6UDUC4S9bBSHN+ty1mwnuHP/Vd4cjy6ZUGLUh
 A2+ovqknwP2x/Z8b8bpW1qBYdirpauZtB/tOwmKrVvH/CgtqS1PLVQGfaGC/JnmWfSyN
 ZNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9ILPTnTd3evgExyihJg5et0y5smLpdZbD6ijZcbpjw=;
 b=L37GNg9YuOM2Y32eFbSPCvLcY131VpkQ4BFyjaKV0uwklmZvt3dDNRq6XW/5UWB6bF
 Hzx3zgylmg/dRQ3qXTcu5sE/xlZVJTZrSgxVXwjuOl5ugv8CWQB3D+yNxN72kZGRWbCa
 Ngm17octmw45JhkiI97lyU2DH7pZZyPdXe9Yy0JGsWdAMQ60VViVQiR/iP/XqSq9HF3O
 3Px1J25mDodBssg2ETwVa9Cmku2o8FPZbn2HokaYz0M6+OZr1O0enhNxHQCmxeU9BAvW
 8XYbvFt3Bwz6ME8RROHU0Z6WT+GLctKSv5B30yoLB4gON0IZm2/9g4A8Cpxr2qKGcP+K
 +smw==
X-Gm-Message-State: AOAM533SRpxsQuplQs7fyXGFpdloXNJ3jFbPe9oqmDfjUJ3GeZk0DjcM
 8xMt+FoKw1QMPGJc1iDsy258GLYIRoUBqOkB2C+WJg==
X-Google-Smtp-Source: ABdhPJxGEL4lTmPNz6qcYwXsLLF7/GYkEzX1gmO7Pr+OSORZBNM9avv0HV+upoljS0eZpkQDAUA9fUBnk2t7Ktnk6pQ=
X-Received: by 2002:a17:906:4a53:: with SMTP id
 a19mr52020223ejv.56.1600691093894; 
 Mon, 21 Sep 2020 05:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200918180451.1121055-1-ehabkost@redhat.com>
In-Reply-To: <20200918180451.1121055-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Sep 2020 13:24:42 +0100
Message-ID: <CAFEAcA_mm2rDwQcb4TGp9uws3=r5RwR21pvM63CrUzd7yGfW7w@mail.gmail.com>
Subject: Re: [PULL 0/2] Python queue, 2020-09-18
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Sep 2020 at 19:04, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Leftovers from pre-5.1.0 days.
>
> The following changes since commit 053a4177817db307ec854356e95b5b350800a216:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/fw_cfg-20200918' into staging (2020-09-18 16:34:26 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/python-next-pull-request
>
> for you to fetch changes up to 14f9cec7132bc60f9839048b0a0f8ef7ae9ed64c:
>
>   analyze-migration.py: fix read_migration_debug_json() return type (2020-09-18 14:00:32 -0400)
>
> ----------------------------------------------------------------
> Python queue, 2020-09-18
>
> Alexey Kirillov (1):
>       analyze-migration.py: fix read_migration_debug_json() return type
>
> Andrey Shinkevich (1):
>       scripts/simplebench: compare write request performance


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

