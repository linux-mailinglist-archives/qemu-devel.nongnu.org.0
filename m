Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE95F19B4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:50:59 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTWk-0001PK-Cf
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTVD-0007QZ-Qf
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:49:23 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTVC-0001Cp-A9
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:49:23 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l76so4466447ybl.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=VZsJih2cJ2pR+/MdOZm3ElJveI1wsDVuEP5l3lQoExs=;
 b=I8gx45r9TK07nirRmkNDA0RhyLL/hY4XEekRMGLPmedlsyLKffLaOoPCR9P9vmaeoz
 0ZZeX7nNSQaDzIG1WLin/4LPDbLcCrwv2ujWUPKuDk1a3qVg3l8+fue3wEbJGY2nxu+r
 Tvz7iuBhBlwAJ5hPjRjc9Bj7MW+xsnJzdGy9NbGjGgYH7lDa9mzVkGivEldVVL2Oc9lL
 KaLFqKjpqhGj1/hqivyu+BtSHbxXSoTeF9dYQOpCiYdepqSpbiLnL3cikV9ApYRkCwEf
 kkZpqqDbvkJAf3SBFI9DySVR/B1MwlefBcVfp7AG2h6qxsH2O/WXdaVfI2UNWmf99ege
 Bk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VZsJih2cJ2pR+/MdOZm3ElJveI1wsDVuEP5l3lQoExs=;
 b=gT//ZjGlrQHHneDcD8Si/HIzEou66dIObCyTVYxXK9VnYA6yMTbK3EHcYAgPOybUKx
 JuUBos6lp+cRpYlv7xuZYw8NIkM6zuaUPEvlBCkpfEjd1lmiS61KQkFCYbAfqAU1Fh4Z
 y6uYgoOAnnTqqrE1Mm7Bie9YLNXHe+Xa0X+HBNu314hJeoDSupr0wSYarrVWOf+IvUlA
 rZw9TQvkq7abz6/ytvtb0+lcgZnrKQH+B79pmGsP6cxjs95mf7M4Wl2AfAL3g6F6YoqN
 lNvuLKkv7zI+q+jvY6kbhneTWfWCuj8kPhjlh0M5iivXqLX9cn4qMUZkMDSIqnnl9nes
 e2og==
X-Gm-Message-State: ACrzQf0Z1StdkJoh9cmOb1ou+6cmvLkkQ0P7KTS4HZBeidJ81TrkTuSe
 mhgddDOclOBM3dd8r6Q26QSNXSuoSAtcoyhO9DaGfyQv
X-Google-Smtp-Source: AMsMyM6yBiaXNSCJM+r7F/6DfnJNfTQoBrWzP++vHt9w5Qoi7LyG809OL6G/BU7H0+ScaR9CsshGl1nboIxq9wLcJGY=
X-Received: by 2002:a05:6902:105:b0:6bc:fb54:f4da with SMTP id
 o5-20020a056902010500b006bcfb54f4damr4635997ybh.284.1664596161153; Fri, 30
 Sep 2022 20:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-28-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-28-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:49:10 +0800
Message-ID: <CAEUhbmUsW6t4d0Rj7DfJ-duBDL1j4PTXEFksvgC4WNYnar-enA@mail.gmail.com>
Subject: Re: [PATCH v4 27/54] hw/usb: dev-mtp: Use g_mkdir()
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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

Hi Gerd,

On Tue, Sep 27, 2022 at 7:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_mkdir() to create a directory on all platforms.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Change to use g_mkdir()
>
>  hw/usb/dev-mtp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Would you pick up this patch in your queue?

Regards,
Bin

