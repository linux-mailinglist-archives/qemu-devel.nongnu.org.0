Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039EA6AAAE5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:42:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYU0a-0003RB-0U; Sat, 04 Mar 2023 10:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYU0X-0003QY-HS
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:41:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYU0V-000226-Sw
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:41:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5044695pja.5
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677944470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jMv6378ayb5VHkz49cB8meBDF+PnJpxZqMc5BDAhjGg=;
 b=NbgQ+mM4ROnKVj5HvTL1RPus0s/zP0MQjSwlBJ/d9Sm+gzwWgSs8r6ftqiJ2DO0y33
 g8bZoUzIoHKjSndClUHk69W1CFuoPDY8W4yAnES8X4Sll3S2fJHbmGeE4p/5oLd1qhRg
 bG2OKj9UN/qn0E1w/T0pKT3bBqQsJU80iTgZvrKF+xS4NbWwyGd/OgUmuyMJB28TenW0
 19uVoeFnQqGmntWjXf7ljHJ58+216xw95+n4lJptGQydFurRxjyILXALNa9DKqjoKu+Y
 +bl8naPJnJmYiYlwjnpvC5Bc2258StZ+/GrniAhfi/NvDKxxuwjbnIlE5UiE7aYhF5UV
 pBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677944470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jMv6378ayb5VHkz49cB8meBDF+PnJpxZqMc5BDAhjGg=;
 b=LIVl3h2wJOptntxxtO3evnaEd90V5PhFXteMoVDVj+o5Sa3RMbPJ2zzWBPQQJsDmXs
 2CGTdBOI2GuTdSch0Uv6UVf1fvCPXSISX7TF0D1iBwQrOp97JB3siJt9J8hLNWfWzb9g
 wVmscQD83NzGTpJlD6/HuYmGA1x+6eMkMCcViCR8MgJu6rG2jS1iVuabxk9hXXvHwrSU
 GKUUzUCC2HajSwFPryiasPqirtpHURdZ3+WVg0NQ0RFDLSCtrIGDmN1L7XZDpxJRhk/U
 1E9HQpQAxJ6GWpgcFygmZGsynbKgnoOuobFJF30vj5C+asYqdqKBg31bwJDfv/Ox7PRh
 lc+Q==
X-Gm-Message-State: AO0yUKXA6Tc9eCK69fINncVm5l92TiseM5d6VSZ/WvoiH/7QcQvnu/bJ
 icXpN883NBdM4Iotv4hR8+Qu+g3CcX9xCtZBZJABuQ==
X-Google-Smtp-Source: AK7set9ffPz5nvR5fh5BUxBJK/vFXsIelO430Ggc09/AKZPfsRK8j9p3mA2CMC0TX5Mgau5d9JcN1qun340fJZPsotw=
X-Received: by 2002:a17:90a:9512:b0:237:50b6:9a09 with SMTP id
 t18-20020a17090a951200b0023750b69a09mr1955554pjo.0.1677944470298; Sat, 04 Mar
 2023 07:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20230303212831.830278-1-danielhb413@gmail.com>
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 15:40:59 +0000
Message-ID: <CAFEAcA_sbvmqDBt=t=YmNE+=Jihw3DGri91hj0KEKssHXwrDJw@mail.gmail.com>
Subject: Re: [PULL 0/5] ppc queue
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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

On Fri, 3 Mar 2023 at 21:28, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The following changes since commit 66577e9e1caee48c6ebc1a2161b5d9857fcde8b3:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-03-03 13:35:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20230303
>
> for you to fetch changes up to ddf0676f1ade90026483a91823d86db4096a40ef:
>
>   pnv_phb4_pec: Simplify/align code to parent user-created PHBs (2023-03-03 16:50:17 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2023-03-03:
>
> This queue includes a stub implementation for the dcblc instruction to
> avoid an illegal instrunction exception when using u-boot with mpc85xx.
> It also includes a PHB fix with user-created pnv-phb devices and
> Skiboot.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

