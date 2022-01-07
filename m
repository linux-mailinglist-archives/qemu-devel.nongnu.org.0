Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB29487B0A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:09:53 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5skS-0000uu-1C
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sgv-0005sG-E6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:06:13 -0500
Received: from [2a00:1450:4864:20::430] (port=38539
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sgs-0004fU-Pq
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:06:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id a5so8302554wrh.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zwh5KDXzLWAINVccTw2By6IXGN4pWPKTNWlFH6mmFzQ=;
 b=fJnmgBNLd5/czEZMJ9vl0FZOD0C1+eZzHfnNEbw/hVHmUcjehntZIULSr0NwYoGxtT
 mY2o3G4yi6kym1uWK2gQ379Ca+1gOBTEFVmgoSyWIGSiGtyXpYF+AzCI60jfJvks1Wj4
 q6a2W7eHtYlDJg1SIaRjq4b8L2Vgr0g782Ym5OzAF4RXosXXsQpxPDzrlNXkbxJ+9SiQ
 HFeIJqp93vplkWXcq2skH6rw000qVg54+/UGXCNlaIZydLsCpnsD1XG4kVdL3+hfLoLb
 6lWIqNsUkSuEP5OkIpY79uJqPyy2g+lXuTGbeb+di3m1yuvJxrgiu5P3XljRonPvmMc3
 sWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zwh5KDXzLWAINVccTw2By6IXGN4pWPKTNWlFH6mmFzQ=;
 b=aJ6oH9w4Fqez8DN5heavXve1RYQtJvOMdH7syACX7HOXSWwZrvDV6OMVYfqXtqc5Fh
 Zk4WKiWRSA1zzkat2EeyBlwkKVuzKr2M0KHPstP7JyC7cAcT/Ui4OFFSgDtQHBs+TP74
 06h+hUX2FazSBt6yZQMsIqRHxVDc3C4ay0EQRqugvyfIYaTu9cflFdaVX/QMKa7OKXKO
 ntIxdEJRVUeC+Y0foBtI+992E3UZdWD1oNkdRykuL3lFJ6YDyWbILYF2sJ+lkQ9CfeCb
 gC2wEXHcFOk+MG0CGm7UkLS2XORJIiOCykA/4nmu/diptcdK0QwVFEwKZ3UyD8LVsKrH
 wruQ==
X-Gm-Message-State: AOAM530x1D4pb6rLiaIAKxz7m3OVTXYrp7IT5+cZZOT8HlK6KZAJv1Oc
 dQa6iHDbxyQ+3Sw5f++jx4U51yQAvd5mFHEwCuyiSQ==
X-Google-Smtp-Source: ABdhPJzI5XOh4R0dX3R764ptNds8HAXlqofgmqln6CKRm4Et+j94E4fMUYElBkhX+F8barS2H3bqogTYXBeeMPs7YNM=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr54025607wri.295.1641575145088; 
 Fri, 07 Jan 2022 09:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 17:05:34 +0000
Message-ID: <CAFEAcA-r2+_hJOn7KHCtcippCnpm=guJahCMK-d0yQvRNU1cBg@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm: Add more devices to kudo-bmc
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 Jan 2022 at 21:58, Patrick Venture <venture@google.com> wrote:
>
> This series of patches adds various devices that are defined in the device-tree for this board.
>
> Chris Rauer (1):
>   hw/arm: Add kudo i2c eeproms.
>
> Patrick Venture (2):
>   hw/arm: add i2c muxes to kudo-bmc
>   hw/arm: kudo add lm75s on bus 13
>
> Shengtan Mao (1):
>   hw/arm: attach MMC to kudo-bmc
>
>  hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

