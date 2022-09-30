Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DD5F0773
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:21:18 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCCr-0007J9-Ql
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3e-00061g-Gd
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:46 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3d-0003uN-0p
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:11:46 -0400
Received: by mail-qt1-x832.google.com with SMTP id cj27so2283003qtb.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vt800HVFZ2EUM0ENOfNIqBnivHW/clmiTdxxdUw/uLQ=;
 b=GNHXSrfU2ZmNXpKdX6Oc2lhciv5TJuDoiUPoB5hczKjt0kddct/Rpc8OqL23wQtfge
 Vx9DQIAisI6vn13ENUcEcNLr9mKh9AWHAlqS41e5ds/p22QPPtNWYhU2kHcLAqLqeLGX
 vfkeRRuS+OxemvdTnO+JARrfrZjZ1R5uz4XP3bIcGshjMCfD3pjy/LxftwfPnGat3TTU
 I0V71yab0gy4x+RkCIARB9zhYq6XzI81uwuDw73LQ3i7rh2bkwK23BxMk2jJz/6A9gXB
 mSe/u+w6wDXmYMic73QFL9Fgj7/Fe2/sJMLSqhk19z80K9RNyDyXUnHT5eafeKqrI4/Q
 DbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vt800HVFZ2EUM0ENOfNIqBnivHW/clmiTdxxdUw/uLQ=;
 b=b5ZkBI99mLKZLKB2ei+PmRlz8DXrIDr+Jv7fk6bwiNWYGSD5jArG70N6tMClBwAHoa
 Pz5JUhFu0Y3wCZJy7MRFQjFFi3k/cJJJ6VJs24OFzldcUby2IQgGNWY6ODoIK/azTcg7
 GsW6Yr28WkycdTVv/0cHXeNvYrEPOWsRT4WnPMuxhzymq3EjxWzFAgbmfQxk2zh72i+5
 waFFrvSUvxNQm2jqQdI/NAW+8nRBC2UEQkQTiW4hHvSgy7K8O+AdvYjD4uyyE0z4MlDO
 SG/htBAEypxJUK77ZRLLXv76vHTDacIFR3wUBX0AHavc2FeuUuNn219ZZ4Nkhz3lzb1J
 EaXg==
X-Gm-Message-State: ACrzQf3vVFqUGz23iuF8I5WpJwkbMN0w06DZ7brhpDqSDYlWiBWKJh/x
 jkpH7XrVe6XCo6TioQHqsgyoKcC7OPGjXMaaQcc=
X-Google-Smtp-Source: AMsMyM5uEa6rwHumrP/pLSR/i6JZe3+AN3KCHAaKdvE+P7P5e84c8/6Xnk9GBKTWyozZWMlytT2QYUJJ9JeDf7+C3mA=
X-Received: by 2002:a05:622a:46:b0:35d:51c1:ee70 with SMTP id
 y6-20020a05622a004600b0035d51c1ee70mr5819087qtw.365.1664529103848; Fri, 30
 Sep 2022 02:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-5-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-5-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 17:11:31 +0800
Message-ID: <CAEUhbmWtfxo0UWjgtdWEW=QTArYpCyxH9AnwdEgjTbo90a4avg@mail.gmail.com>
Subject: Re: [PATCH 5/6] rx: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 7:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/rx/rx-gdbsim.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

