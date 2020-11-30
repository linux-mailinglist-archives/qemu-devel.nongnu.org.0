Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F032C817D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:55:49 +0100 (CET)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfuO-0005iH-1o
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfsj-0004BU-JU
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:54:05 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfsi-00012e-3B
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:54:05 -0500
Received: by mail-ej1-x62a.google.com with SMTP id x16so13402784ejj.7
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIl7HfgK03WQBaLkUmH4Q+5vmXV2xjFE51tPjoviiAc=;
 b=MVZ+clf19vCvPiLcSiEnfTjoS8dgyITeU8OENzK1HTPpQZlGUmE8xsNOyMG0F8eV6D
 laPi+rDX6QmZlbBtT0Kw+iAHHUA72Dnc65FthAy374t0t+o+BAo07uQtrZFcDpyz5KOi
 nRpaV4ljHasvrqHp639iJQf0CzEVy4ivG6RMJoWEicE6RNU260ZLJluyqiddyoVyIqpL
 yUVZlPCA7731Ya+Su0gcXuT6XYRDlcRiKT92O5krlWCfvbcdS5/ew+Goa3U28wDbK6FB
 fPR9vRa6fxsHkLiBHoMtWy5o0NYR6Rt14NL171OrkZrl+sCFB696ht/Z1bC0CCGzJsuT
 Nbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIl7HfgK03WQBaLkUmH4Q+5vmXV2xjFE51tPjoviiAc=;
 b=uVbeO9F3DO7GaZTT14zOv9+Uk/fYqeQ1tk1tT11BRUsAHqyX3+D7BhW4zOL24+jl01
 THOTrwiUJrheTGiuSQ173UXIL1+2bNE+G5gApvWGSEbmycikXPJcUA/+F/wZj0FHlwHM
 ev4bOxA1MYzFU5B/Yc46GbGD+moVSdceSjmv3X0lE3Ml0b+EcDTOfGVh1zHjk9iV8/JS
 h11siM1BIpeQ28jRLofb4X93133GBIW6r5SHJrkXYVjwajjZLuWwaZJKFdYV/6BVtAma
 9rh4jy6Rl84FfvzfKD9Q/6BmuVwcvCoXYmw9PtZc5/D+2DIB9Ma/6VVLC2eP+LZyq3i7
 Ui9A==
X-Gm-Message-State: AOAM533jaobDHevQHxlZc8nMCARrbmzg+2WRsDgATa8MBW+y1VhSWglf
 AxQLgV7XUa4wNkDIt4CZDea9W1JlTEKk78n+whQLag==
X-Google-Smtp-Source: ABdhPJwFVGzcgSRj6j7mdNgwt7pnD57zfNgeO0Ow7nRYfO7N8xMh3V4NdIbGMBHqZLy9NDJAe0b5dh+/GVIfX++THW0=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2921407ejf.407.1606730042494; 
 Mon, 30 Nov 2020 01:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-2-peter.maydell@linaro.org>
 <DM6PR11MB4316328210E97BA3BB8B9F9C8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4316328210E97BA3BB8B9F9C8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 09:53:51 +0000
Message-ID: <CAFEAcA8R5UqdHh6PijxH5_KOEomLo2KPY1Mm4a3kZkoArFZeZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
To: "Wu, Wentong" <wentong.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Nov 2020 at 05:41, Wu, Wentong <wentong.wu@intel.com> wrote:
> Reviewed and tested.

Thanks! Can I put that in as Reviewed-by/Tested-by lines?

-- PMM

