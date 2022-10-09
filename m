Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616885F88D4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 04:20:33 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohLvb-0003IB-Ud
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 22:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohLuJ-0001fG-Ee; Sat, 08 Oct 2022 22:19:11 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohLuH-0004sS-Mo; Sat, 08 Oct 2022 22:19:10 -0400
Received: by mail-qk1-x731.google.com with SMTP id s7so1067798qkj.1;
 Sat, 08 Oct 2022 19:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SjkVJtx1zMG4ukF+LaYVeryDklvJ+Qo8HRqyMPyyyik=;
 b=KlilnJw6v93nakGDgcSn3/iQumWAJcTz0Y85OSSsmh3igLfdqiT2c8n5tfhOXbBYzq
 zRNbwT2lldN4CbC/VHHUiLAJYuziUSWcbsSezhXuCICYCxwdzvLNulqO2WYTyATvmwGe
 x7R/nFBVc55GuO/AVgwdVyWArjjYYxAsP2zl37AxUmUF3PeX3MO9d3G+SSmilbIc2x/w
 4sm2+ofPgJx0MbqLKgZ1y+NrOTiLf4g63p42vFB4iR4I4C5XqtGnN/fvXeuU7LGuylzn
 jACLnr8jWry3alUnW+xfhvKpsHRWwT4jUBjIaWrQ+pqb9lbJaw49IYvdMBPVDlQc7H41
 qmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SjkVJtx1zMG4ukF+LaYVeryDklvJ+Qo8HRqyMPyyyik=;
 b=a/sv7AbM1mPue+FZMvqkTiLBCJI/eMgKilfogozH4cM+/DEMPesKqygv0kbBRQJqMv
 AHMR1Kbt7Mx7D5WwFXkZZ6htia+ZBhQwdpG66wsS7HNPDEEEcPxMJcb8nYjwDXFrLoph
 K1+4rpS2+CovqC1LNelxVmhYFrr3LLoYMrms5eN8RSIId3yYXnfGJFbZ9zYAnvJx5DgQ
 cmR8MlDuxxH+T0NzK4A8g46saKfetjbc1SbU/R8u0oUwDWaGsvlHNccPfuCO0o0PITKU
 F92H17MfJJnA+thjWWW/6AqdpwDF8Ss9RZQ7pXUXMXo/nofN8Hl8DNetiK9WgkYKfiJq
 fqSw==
X-Gm-Message-State: ACrzQf28khD8bpBYQUYE74QPd/jsZnpOHXFoMeXLfdM1etaEspgjUXH7
 7ateSP/zcR8Y+GViyJEXmKHvsvkmV6YJSXlRTeM=
X-Google-Smtp-Source: AMsMyM61f4Z5d0UIDlekVw1JFIGaIBf1dPU8VbOkn2RX3lhQMiH+GD1hwPUpOwmL0Vd8QjhHZS94BX8kzp2K3AmCFEE=
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr8572732qkp.389.1665281947588; Sat, 08
 Oct 2022 19:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-5-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-5-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 10:18:56 +0800
Message-ID: <CAEUhbmUGhTLmd2uocnGGXSCgkqxSuFJyhrg-v+OWH8r8Nh4VqQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] hw/ppc/e500: Reduce usage of sysbus API
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x731.google.com
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

On Tue, Oct 4, 2022 at 5:24 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> PlatformBusDevice has an mmio attribute which gets aliased to
> SysBusDevice::mmio[0]. So PlatformbusDevice::mmio can be used directly,
> avoiding the sysbus API.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ppc/e500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

